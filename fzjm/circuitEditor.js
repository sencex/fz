$(function () {
    //指定make路径
    make.Default.path = 'make/';

    //取得显示编辑器的容器jquery对象
    var parentView = $('.main');

    //实例化doodle.CircuitEditor
    var circuitEditor = window.circuitEditor = new doodle.CircuitEditor(parentView);
    
    var network2d = circuitEditor.network2d;
    initNetwork2d();
    initNetworkListener();
    initToolBar();
    loadInitData();

    function initNetwork2d(){
      circuitEditor.network2d.setLinkPathFunction(function(linkUI, defaultPoints) {
        var link = linkUI._element;
        if(link.getClient('link.type') === 'HorizontalLine'){
          var f = linkUI.getFromPoint();
          var t = linkUI.getToPoint();

          var factor = link.getClient('factor') || 1;
          var controlPoint = link.getClient('fromControlPoint');
          var points = new twaver.List();
          points.add(f);
          if(controlPoint){
            points.add(controlPoint);
            points.add({x:t.x, y:controlPoint.y});
          }else{
            points.add({x:t.x,y:f.y});
          }
          points.add(t);
          return points;
        }else if(link.getClient('link.type') === 'VerticalLine'){
         var f = linkUI.getFromPoint();
         var t = linkUI.getToPoint();

         var factor = link.getClient('factor') || 1;

         var points = new twaver.List();
         points.add(f);
         points.add({x:f.x,y:t.y});
         points.add(t);
         return points;
       }else{
        return defaultPoints;
      }
    });
    }

    function initNetworkListener(){
      circuitEditor.network2d.addInteractionListener(function(event){
        var element = event.element;
        if(element && (element instanceof twaver.Switch || element instanceof twaver.SwitchV) && event.kind == "clickElement"){
          if(element.getImage().indexOf("Switch")){
            if(element.getStyle("image.state") == "开启"){
              element.setStyle("image.state", "闭合");
            } else {
              element.setStyle("image.state", "开启")
            }
          }
        }});

      circuitEditor.network2d.getElementBox().addDataPropertyChangeListener(function(e){
        if(e.property === 'C:rows' || e.property === 'C:cols'){
          var node = circuitEditor.network2d.getElementBox().getSelectionModel().getLastData();
          var rows = node.getClient('rows') || 0;
          var cols = node.getClient('cols') || 0;
          addRows(node,rows,cols);
        }});

    }

    function initToolBar(){
        //对齐方式,调用align(type)方法，实现选中元素的对齐。type取值范围:up、down、left、right、center、middle
        $('.alignBox').on('click', 'span', function (e) {
          var type = $(this).data('type');
          circuitEditor.align(type);
        });

        //分布方式,调用flow(type, padding),实现选中元素的均匀分布. type取值范围:hor、ver
        $('#flowBox').on('click', 'span', function (e) {
          var type = $(this).data('type');
          var padding = prompt('请输入间距', 5);
          padding = parseFloat(padding);
          if (isNaN(padding)) {
            return;
          }
          circuitEditor.flow(type, padding);
        });

        //全局视图
        $("#overview").click(function () {
          circuitEditor.zoomOverview();
        });

        //拖拽模式（默认）／框选模式  true-拖拽模式 false-框选模式
        $('#panModel').on('click', function () {
          $(this).toggleClass('panModel');
          if ($(this).hasClass('panModel')) {
            circuitEditor.setDragToPan(false);
            $(this).removeClass('mn-multi-select');
            $(this).addClass('mn-drag');
            $(this).attr('title','拖拽模式');
          } else { 
            circuitEditor.setDragToPan(true);
            $(this).removeClass('mn-drag');
            $(this).addClass('mn-multi-select');
            $(this).attr('title','框选模式');
          }
        })

        //开启鼠标编辑（默认）／关闭鼠标编辑 true-开启鼠标编辑 false-关闭鼠标编辑
        $('#editable').on('click', function (e) {
          $(this).toggleClass('editable');
          if ($(this).hasClass('editable')) {
            circuitEditor.setMouseEditable(true)
            $(this).removeClass('mn-disable-edit');
            $(this).addClass('mn-edit');
            $(this).attr('title','禁止鼠标编辑');
          } else {
            circuitEditor.setMouseEditable(false)
            $(this).removeClass('mn-edit');
            $(this).addClass('mn-disable-edit');
            $(this).attr('title','开启鼠标编辑');
          }
        });

        //取得模型的面板名称
        var panelName = doodle.Utils.getUrlParam('panelName');

        //调用 getData方法,取得编辑结果.
        $("#save").click(function () {
          var data = circuitEditor.getData();
          console.log(data);
          data = JSON.stringify(data);
          var mess = 'twaver.idc.equipment.newPanel';
          if (panelName && panelName.length > 0 && panelName != 'undefined') {
            mess = panelName;
          }
          var id = prompt('请输入面板名称', mess);
          localStorage.setItem(id, data);
          alert('save success');
        });

        //export json
        $('#export').click(function () {
          var text = circuitEditor.getData();
          if (!text) {
            alert("没有数据");
            return;
          }
          text = JSON.stringify(text);
          var content = "<div>导出数据：<br><textarea>" + text + "</textarea></div>";
          $(content).dialog({
            "title": "导出json",
            "width": 400,
            "height": 500
          });

        });

        $('.exportImageDialog').find('.name').val(panelName)

        $('#exportImage').click(function () {
          var result = circuitEditor.getBounds();
          $('.exportImageDialog').find('.width').text(result.width);
          $('.exportImageDialog').find('.height').text(result.height);
          $('.exportImageDialog').dialog('open');
        });

        $('.exportImageDialog').dialog({
          title: 'export image',
          height: 250,
          width: 350,
          autoOpen: false,
          show: {
            effect: "fade",
          },
          hide: {
            effect: "fade",
          },
          modal: true,
          buttons: {
            OK: function (e) {
              $('.exportImageDialog').dialog('close');
              var scale = $('.exportImageDialog').find('.scale').val();
              var name = $('.exportImageDialog').find('.name').val();
              scale = parseInt(scale || 1) || 1;
              var data = circuitEditor.toCanvas({scale: scale});
              data.content.toBlob(function (blob) {
                saveAs(blob, name);
              });
            },
            Cancel: function (e) {
              $('.exportImageDialog').dialog('close');
            }
          },
        });
      }

      function loadInitData(){
        //var generator= make.Default.load('com.electric.table.2d.panel');
        //generator.setLocation(100,100);
        //console.log(generator);
        //circuitEditor.network2d.getElementBox().add(generator);

        //取得模型的面板名称
        var panelName = doodle.Utils.getUrlParam('panelName');
        setTimeout(function () {
          var data = null;
          if (panelName) {
            data = localStorage.getItem(panelName);
          }
          if (data) {
            data = JSON.parse(data);
          } else {
            data = [];
          }
          circuitEditor.setData(data);
        // setTimeout(function () {
        //     circuitEditor.network2d.zoomOverview();
        // }, 500);
      }, 800);
      }

    $(parentView).on('keyup', function (e) {
        //console.log(e, e.keyCode);
        if (e.keyCode == 46) {//delete node
            var data = circuitEditor.getSelectedData();
            circuitEditor.removeData(data)

        }
    });

     /**
     * 监听键盘粘帖复制事件
     */
     $(document).on('keydown', function (e) {
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

    /**
     * 复制
     */
     function copySelection() {
      circuitEditor.copySelection();
    }

    /**
     * 粘帖
     */
     function pasteSelection() {
      circuitEditor.pasteSelection();
    }

    function getTable(width, height) {
      var table = document.createElement('table');
      table.cellpadding = "0";
      table.cellspacing = "0";
      table.style.width = width + "px";
      table.style.height = height + "px";
      table.style.borderCollapse = "collapse";
      table.style.borderSpacing = "0";
      table.style.borderWidth = "1px";
      table.style.borderColor = "#d6d6d6";
      table.style.borderStyle = "solid";
      return table;
    }

    function getClickTd(innerText) {
      var td2 = document.createElement("td");
      td2.innerText = innerText;
      td2.style.borderWidth = "1px";
      td2.style.borderColor = "#d6d6d6";
      td2.style.borderStyle = "solid";
      td2.style.width = "80px";
      td2.style.height = "24px";
      td2.style.lineHeight = "24px";
      td2.style.textAlign = "center";
      td2.style.color = "#333";
      td2.style.backgroundColor = "#f2ffff";
      td2.id = "clitd-" + new Date().getTime();
      td2.onclick = function() {
        alert("TODO " + this.id);
      }
      return td2;
    }

    function getCommonTd(innerText) {
      var td3 = document.createElement("td");
      td3.innerText = innerText;
      td3.style.borderWidth = "1px";
      td3.style.borderColor = "#d6d6d6";
      td3.style.borderStyle = "solid";
      td3.style.width = "80px";
      td3.style.height = "24px";
      td3.style.lineHeight = "24px";
      td3.style.textAlign = "center";
      td3.style.backgroundColor = "#FFFFFF";
      td3.id = "comtd-" + new Date().getTime();
      return td3;
    }

    function addRows(element,rows,cols){
     var currentNode=element;
     var rows = rows,cols = cols;
     var width,height;
     if (rows <= 0 || cols <= 0) {
      alert("数据行列异常！");
      return;
    } else {
      height = 30 * rows;
      width = 101 * cols;
    }
    currentNode.setName(null);
    var div = document.createElement('div');
    div.keepDefault = true;
    currentNode.setName(div);

    var table = getTable(width, height);

    for (var i = 0; i < rows; i++) {
      var tr = document.createElement("tr");
      table.appendChild(tr);
      for(var j = 0;j<cols;j++){
        if(i === 0){
          var td = getClickTd("参数" + (j+1));
        }else{
          var td = getClickTd(parseInt(Math.random()*200));
        }
        tr.appendChild(td);
      }
    }
    console.log(table);
    div.appendChild(table);
  }
});