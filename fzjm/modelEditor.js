(function () {
    $(window).load(function () {

        //指定make路径
        make.Default.path = './make/';

        //取得显示编辑器的容器jquery对象
        var parentView = $('.main');

        //实例化doodle.ModelEditor对象
        var modelEditor = window.modelEditor = new doodle.ModelEditor(parentView);

        //调用importJsonObject方法导入数据
        $('#import').click(function () {
            console.log('导入内容');
            importDialog.show();
        });

        //import json
        var importDialog = doodle.utils.createImportDialog('Import JSON', 'json', function (text) {
            var object = JSON.parse(text);
            modelEditor.importJsonObject(text);
        });

        //调用getJsonObject方法导出数据
        $('#export').click(function () {
            var data = modelEditor.getJsonObject();
            if (!data) {
                alert("没有数据");
                return;
            }
            console.log(data);
            var text = JSON.stringify(data);
            var content = "<div>导出数据：<br><textarea>" + text + "</textarea></div>";
            $(content).dialog({
                "title": "导出json",
                "width": 400,
                "height": 500
            });
        });

        //调用getJsonObject方法导出数据
        $('#save').click(function () {
            var data = modelEditor.getJsonObject();
            if (!data) {
                alert("没有数据");
                return;
            }
            console.log(data);
            //弹框,输入面板名称
            var name = prompt('请输入模型名称', data.id + '-new');
            if (name && name != 'undefined') {
                var category = make.Default.getOtherParameter(data.id, 'category');
                if(name == data.id){
                    alert('名称相同');
                    return;
                }
                tools.updateOrInsertModel(category, name, data, function () {
                    tools.registerModel(category, name, data);
                    modelEditor.refreshAccordion();
                    if (category == '设备') {
                        tools.updateOrInsertModel('设备2D', name + doodle.consts.MODEL_SUFFIX_SEPARATOR + doodle.consts.RACK_MODEL_SUFFIX, {
                            id: data.id + doodle.consts.MODEL_SUFFIX_SEPARATOR + doodle.consts.RACK_MODEL_SUFFIX,
                        }, function () {
                            modelEditor.refreshAccordion();

                        })
                    }
                })

            }
        });

        //modelEditor.setAccordionVisible(true)  //显示左侧工具栏
        //modelEditor.setAccordionVisible(false) //隐藏左侧工具栏

        var categories = ["基本模型", "机柜模型", "设备", "板卡"];
        categories.forEach(function (category) {
            loadModel(category);

            function loadModel(category) {
                proxy.query({}, category, function (result) {

                    if (result && result.length > 0) {
                        result.forEach(function (info) {
                            tools.registerModel(category, info.name, info.data, info.icon);
                        })
                    }
                    modelEditor.refreshAccordion();
                })
            }
        })
    });
})();