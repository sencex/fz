$(function () {

    //指定make路径
    make.Default.path = 'make/';

    //取得机柜类型
    var modelClass = doodle.utils.getUrlParam('modelClass');
    var objectId = doodle.utils.getUrlParam('objectId');

    //取得显示编辑器的容器jquery对象
    var parentView = $('.main');

    //实例化doodle.RackEditor对象,modelClass如果为空,在设备栏会显示所有机柜.
    var rackEditor = window.rackEditor = new doodle.RackEditor(parentView, modelClass, objectId);

    //全局视图
    $("#overview").click(function () {
        rackEditor.zoomOverview();
    });

    //调用getData取得编辑结果.
    $("#saveDevicePatten").click(function () {

        if (!rackEditor.parentNode) {
            alert('there is no data');
            return;
        }
        var parent = rackEditor.parentNode.getClient('id');
        var name = prompt('请输入设备模板名称', parent + '-new');
        if (name) {
            var data = rackEditor.getData();
            console.log(data);
            var icon = name;
            tools.uploadImage(icon + '.png', 'icons', rackEditor.getIcon(), function () {
                proxy.updateOrInsert({name: name}, {data: data}, '设备模板', function () {
                    tools.registerDevicePatten(name, data);
                    rackEditor.refreshAccordion();
                    alert('save success:' + name);
                })
            })
        }

    });

    //调用getData取得编辑结果.
    $("#saveRackPatten").click(function () {

        if (!rackEditor.parentNode) {
            alert('there is no data');
            return;
        }
        var parent = rackEditor.parentNode.getClient('id');
        var name = prompt('请输入机柜模板名称', parent + '-new');
        if (name) {
            var data = rackEditor.getData();
            console.log(data);
            var icon = name;
            tools.uploadImage(icon + '.png', 'icons', rackEditor.getIcon(), function () {
                proxy.updateOrInsert({name: name}, {data: data, parent: parent}, '机柜模板', function () {
                    rackEditor.refreshAccordion();
                    tools.registerRackPatten(name, data, parent);
                    rackEditor.refreshAccordion();
                    alert('save success:' + name);
                })
            })
        }

    });

    //调用getData取得编辑结果.
    $("#save").click(function () {

        if (!rackEditor.parentNode) {
            alert('there is no data');
            return;
        }
        var parent = rackEditor.parentNode.getId();
        var type = rackEditor.parentNode.getClient('id');
        var data = rackEditor.getData();
        proxy.updateOrInsert({name: parent}, {data: data, type:type}, 'RackDevice', function () {

            alert('save success:' + parent);
        })
    });

    rackEditor.setUndoManagerEnabled(true);
    $('#undo').click(function () {
        rackEditor.undo();
    });

    $('#redo').click(function () {
        rackEditor.redo();
    });

    //import json
    var importDialog = doodle.utils.createImportDialog('Import JSON', 'json', function (text) {
        var data = JSON.parse(text);
        rackEditor.setData(data);
        setTimeout(function () {
            rackEditor.zoomOverview();
        }, 100);
    });

    $("#import").click(function () {
        importDialog.show();
    });

    //export json
    $('#export').click(function () {
        var text = rackEditor.getData();
        if (!text) {
            alert("没有数据");
            return;
        }
        text = JSON.stringify(text);
        doodle.utils.createExportDialog(text);
    });

    //rackEditor.setAccordionVisible(true)  //显示左侧工具栏
    //rackEditor.setAccordionVisible(false) //隐藏左侧工具栏

    var categories = ["机柜", "设备2D", '设备模板', '机柜模板'];
    var index = 0;
    categories.forEach(function (category) {
        loadModel(category);

        function loadModel(category) {
            if (category == '设备模板') {
                proxy.query({}, category, function (result) {

                    if (result && result.length > 0) {
                        result.forEach(function (info) {

                            tools.registerDevicePatten(info.name, info.data);
                        })
                    }
                    rackEditor.refreshAccordion();
                    load();
                })
            } else if (category == '机柜模板') {
                proxy.query({}, category, function (result) {

                    if (result && result.length > 0) {
                        result.forEach(function (info) {

                            tools.registerRackPatten(info.name, info.data, info.parent);
                        })
                    }
                    rackEditor.refreshAccordion();
                    load();
                })
            } else {
                proxy.query({}, category, function (result) {

                    if (result && result.length > 0) {
                        result.forEach(function (info) {

                            tools.registerModel(category, info.name, info.data, info.icon);
                        })
                    }
                    rackEditor.refreshAccordion();
                    load();
                })
            }

        }
    })


    function load() {
        index++;
        if (index < categories.length - 1) {
            return;
        }
        if (objectId) {
            proxy.queryFirst({name: objectId}, 'RackDevice', function (info) {
                if (!info || !info.data || info.data.length == 0) {
                    return;
                }
                rackEditor.loadParent(info.type);
                rackEditor.setData(info.data);
            })
            if(!rackEditor.parentNode && modelClass){
                rackEditor.loadParent(modelClass);
            }
        } else if (modelClass) {

            rackEditor.loadParent(modelClass);
        }
        setTimeout(function () {
            rackEditor.zoomOverview();
        }, 800);
    }

})