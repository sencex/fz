$(function () {

    //指定make路径
    make.Default.path = 'make/';

    //取得显示编辑器的容器jquery对象
    var parentView = $('.main');
    var show = true;

    //make.Default.copy('twaver.idc.aisle300.top', 'twaver.idc.aisle.top', {aisleDepth:300}, {name:'通道300'});
    //make.Default.copy('twaver.idc.aisle300', 'twaver.idc.aisle', {aisleDepth:300});

    //实例化doodle.SceneEditor
    var sceneEditor = window.sceneEditor = new doodle.SceneEditor(parentView);
    var edit2d = sceneEditor.edit2d;
    var edit3d = sceneEditor.edit3d;
    var jsonBox = sceneEditor.jsonBox;

    $("#repeat").buttonset();

    //对齐方式,调用align(type)方法，实现选中元素的对齐。type取值范围:up、down、left、right、center、middle
    $('.alignBox').on('click', 'span', function (e) {
        var type = $(this).data('type');
        sceneEditor.align(type);
    });

    //拖拽模式（默认）／框选模式  true-拖拽模式 false-框选模式
    $('#panModel').on('click', function () {
        $(this).toggleClass('panModel');
        if ($(this).hasClass('panModel')) {
            sceneEditor.edit2d.network2d.setDragToPan(false);
            $(this).removeClass('mn-multi-select');
            $(this).addClass('mn-drag');
            $(this).attr('title','拖拽模式');
        } else {
            sceneEditor.edit2d.network2d.setDragToPan(true);
            $(this).removeClass('mn-drag');
            $(this).addClass('mn-multi-select');
            $(this).attr('title','框选模式');
        }
    })

    //分布方式,调用flow(type, padding),实现选中元素的均匀分布. type取值范围:hor、ver
    $('#flowBox').on('click', 'span', function (e) {

        var type = $(this).data('type');
        var data = sceneEditor.getSelectedData();
        if (data.length == 1) {
            var count = prompt('请输入复制次数', 9);
            count = parseFloat(count);
            if (isNaN(count)) {
                return;
            }
            sceneEditor.flowAndCopy(type, count);
        } else if (data.length > 1) {
            var padding = prompt('请输入间距', 100);
            padding = parseFloat(padding);
            if (isNaN(padding)) {
                return;
            }
            sceneEditor.flow(type, padding);
        }

    });

    $("#2d").click(function () {
        sceneEditor.show2D();
        sceneEditor.hide3D();
    });
    $("#3d").click(function () {
        sceneEditor.show3D();
        sceneEditor.hide2D();
    });

    var show = doodle.utils.queryString(window.location.search, "show") === "false" ? false : true;
    if (show) {
        doodle.utils.addMask();
        document.getElementById('nav').style.display = 'block';
        doodle.utils.setDialogRect('nav');
    }

    sceneEditor.doubleClickHandler3D = function (element, box) {
        if (!element || element.getClient('type') != 'rack') {
            return;
        }
        if (element.isLoadServer) {
            return;
        }
        element.isLoadServer = true;
        var objectId = element.getId();
        proxy.queryFirst({name: objectId}, 'RackDevice', function (info) {

            if (!info || !info.data || info.data.length == 0) {
                console.log('no rack device data - ' + objectId);
                return;
            }
            doodle.utils.loadDeviceData(box, element, info.data);
        })
    }

    sceneEditor.doubleClickHandler2D = function (element, box) {
        if (!element) return;
        if ('rack' == element.getClient('type') && doodle.consts.REDIRECT_RACK_EDITOR) {
            //打开新的界面
            var objectId = element.getId();
            var id = element.getClient('id');
            window.open('rackEditor.html?objectId=' + objectId + '&modelClass=' + id);
            return;
        }
    }

    //load dxf file
    //var data = localStorage.getItem(doodle.utils.defaultSceneKey);
    //if (data) {
    //    sceneEditor.setData(data);
    //    setTimeout(function () {
    //        sceneEditor.zoomOverview();
    //    }, 500);
    //} else {
    //    doodle.utils.loadFile('./dxf/room.dxf', function (text) {
    //        sceneEditor.loadFile(text);
    //    });
    //}

    //import dxf
    var importDxfDialog = doodle.utils.createImportDialog('Import DXF', 'dxf', function (text) {
        sceneEditor.clear();
        sceneEditor.loadDxfFile(text);
    });


    $("#importDxf").click(function () {
        importDxfDialog.show();
    });

    //import json
    var importDialog = doodle.utils.createImportDialog('Import JSON', 'json', function (text) {
        sceneEditor.clear();
        var data = JSON.parse(text);
        sceneEditor.setData(data);
    });

    $("#importJson").click(function () {
        importDialog.show();
    });

    //export json
    $('#export').click(function () {
        var data = sceneEditor.getData();
        if (!data || data.length == 0) {
            alert("没有数据");
            return;
        }
        var text = JSON.stringify(data);
        doodle.utils.createExportDialog(text);
    });

    //全局视图
    $("#overview").click(function () {
        sceneEditor.zoomOverview();
    });

    $('#clear').click(function () {
        sceneEditor.clear();
    });

    $("#exportscene").click(function () {
        //var data = sceneEditor.getData();
        //localStorage.setItem(doodle.utils.defaultSceneKey, data);
        //alert("保存成功！");

        //弹框,输入面板名称
        var name = $('.sceneSelect').val();
        if (!name || name.length == 0) {
            name = 'scene-new'
        }
        var name = prompt('请输入场景名称', name);
        if (name) {
            var data = sceneEditor.getData();
            tools.updateOrInsertModel('Scene', name, data, function () {
                refreshSceneSelect()
            })
        }
    });

    sceneEditor.setUndoManagerEnabled(true);
    $('#undo').click(function () {
        sceneEditor.undo();
    });

    $('#redo').click(function () {
        sceneEditor.redo();
    });

    //sceneEditor.setAccordionVisible(true)  //显示左侧工具栏
    sceneEditor.setAccordionVisible(false) //隐藏左侧工具栏

    //初始化加载场景
    function loadScene(name) {
        sceneEditor.clear();
        //加载json
        /*
        doodle.utils.loadFile('json/rack.json',function (text) {
            var data=JSON.parse(text);
            sceneEditor.setData(data);
        })*/
        //加载dxf
        doodle.utils.loadFile('dxf/rack.dxf', function (text) { sceneEditor.loadDxfFile(text);});
       /* proxy.queryFirst({name: name}, 'Scene', function (info) {
            if (info && info.data) {
                var data = info.data;
                sceneEditor.setData(data);
                setTimeout(function () {
                    sceneEditor.zoomOverview();
                }, 500);
            } else {
                doodle.utils.loadFile('./dxf/room.dxf', function (text) {
                    sceneEditor.loadDxfFile(text);
                });
            }
        })*/
    }

    refreshSceneSelect(function () {
        var name = $('.sceneSelect').val()
        loadScene(name);
    });

    function refreshSceneSelect(callback) {
        var select = $('.sceneSelect');
        select.empty();
        proxy.query({}, 'Scene', function (list) {
            list.forEach(function (info) {
                var name = info.name;
                select.append('<option value="' + name + '">' + name + '</option>');
            })
            callback && callback();
        })
    }

    $('.sceneSelect').change(function () {
        var name = $('.sceneSelect').val()
        loadScene(name);
    });

    $(parentView).on('keyup', function (e) {
        //console.log(e, e.keyCode);
        if (e.keyCode == 46) {//delete node
            var data = sceneEditor.getSelectedData();
            sceneEditor.removeData(data)

        }
    });

    $(parentView).on('keydown', function (e) {
        if (doodle.utils.isCtrlDown(e)) {
            //ctrl+c
            if (e.keyCode === 67) {
                copySelection();
            }
            //ctrl+v
            if (e.keyCode === 86) {
                pasteSelection();
            }
        }
    });

    function copySelection() {
        sceneEditor.copySelection();
    }

    function pasteSelection() {

        sceneEditor.pasteSelection();
    }


    var categories = ["机柜模型", "设备", "板卡"];
    categories.forEach(function (category) {
        loadModel(category);

        function loadModel(category) {
            proxy.query({}, category, function (result) {

                if (result && result.length > 0) {
                    result.forEach(function (info) {
                        tools.registerModel(category, info.name, info.data, info.icon);
                    })
                }
                sceneEditor.refreshAccordion();
            })
        }
    })

})