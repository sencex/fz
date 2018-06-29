/**
 * Created by sence on 2016/9/6.
 */
var setmenu=function (url) {
    document.getElementById("disp").src=url;
}

var jsonData = {
    menus:[
    {"id":"0","url":"menu/index.html","pid":"0","uid":"1","nid":"1","sid":"1"},
    {"id":"1","url":"menu/1.html","pid":"0","uid":"7","nid":"2","sid":"null"},
    {"id":"2","url":"menu/2.html","pid":"1","uid":"1","nid":"3","sid":"21"},
        {"id":"21","url":"menu/2_1.html","pid":"2","uid":"24","nid":"22","sid":"null"},
        {"id":"22","url":"menu/2_2.html","pid":"2","uid":"21","nid":"23","sid":"null"},
        {"id":"23","url":"menu/2_3.html","pid":"2","uid":"22","nid":"24","sid":"null"},
        {"id":"24","url":"menu/2_4.html","pid":"2","uid":"23","nid":"21","sid":"null"},
    {"id":"3","url":"menu/3.html","pid":"1","uid":"2","nid":"4","sid":"31"},
        {"id":"31","url":"menu/3_1.html","pid":"3","uid":"34","nid":"32","sid":"null"},
        {"id":"32","url":"menu/3_2.html","pid":"3","uid":"31","nid":"33","sid":"null"},
        {"id":"33","url":"menu/3_3.html","pid":"3","uid":"32","nid":"34","sid":"null"},
        {"id":"34","url":"menu/3_4.html","pid":"3","uid":"33","nid":"31","sid":"null"},
    {"id":"4","url":"menu/4.html","pid":"1","uid":"3","nid":"5","sid":"41"},
        {"id":"41","url":"menu/4_1.html","pid":"4","uid":"43","nid":"42","sid":"null"},
        {"id":"42","url":"menu/4_2.html","pid":"4","uid":"41","nid":"43","sid":"null"},
        {"id":"43","url":"menu/4_3.html","pid":"4","uid":"42","nid":"41","sid":"null"},
    {"id":"5","url":"menu/5.html","pid":"1","uid":"4","nid":"6","sid":"51"},
        {"id":"51","url":"menu/5_1.html","pid":"5","uid":"54","nid":"52","sid":"null"},
        {"id":"52","url":"menu/5_2.html","pid":"5","uid":"51","nid":"53","sid":"null"},
        {"id":"53","url":"menu/5_3.html","pid":"5","uid":"52","nid":"54","sid":"null"},
        {"id":"54","url":"menu/5_4.html","pid":"5","uid":"53","nid":"51","sid":"null"},
    {"id":"6","url":"menu/6.html","pid":"1","uid":"5","nid":"7","sid":"61"},
        {"id":"61","url":"menu/6_1.html","pid":"6","uid":"63","nid":"62","sid":"null"},
        {"id":"62","url":"menu/6_2.html","pid":"6","uid":"61","nid":"63","sid":"null"},
        {"id":"63","url":"menu/6_3.html","pid":"6","uid":"62","nid":"61","sid":"null"},
    {"id":"7","url":"menu/7.html","pid":"1","uid":"6","nid":"1","sid":"71"},
        {"id":"71","url":"menu/7_1.html","pid":"7","uid":"76","nid":"72","sid":"null"},
        {"id":"72","url":"menu/7_2.html","pid":"7","uid":"71","nid":"73","sid":"null"},
        {"id":"73","url":"menu/7_3.html","pid":"7","uid":"72","nid":"74","sid":"null"},
        {"id":"74","url":"menu/7_4.html","pid":"7","uid":"73","nid":"75","sid":"null"},
        {"id":"75","url":"menu/7_5.html","pid":"7","uid":"74","nid":"76","sid":"null"},
        {"id":"76","url":"menu/7_6.html","pid":"7","uid":"75","nid":"71","sid":"null"},

] };
var id;
var nid;
var uid;
var sid;
var pid;
var url;
var selcetId=function (m_id) {
    var objs=jsonData.menus;

    for(var i=0;i<objs.length;i++)
    {
        if(objs[i].id==m_id){
            id=objs[i].id;
            pid=objs[i].pid;
            nid=objs[i].nid;
            uid=objs[i].uid;
            sid=objs[i].sid;
            url=objs[i].url;
        }

    }
}

var init=function () {
    selcetId("0");
    setmenu(url);
}
var cmd_up=function () {
    selcetId(id);
    if(uid!="null")
    {
        selcetId(uid);
        setmenu(url);
    }
}
var cmd_down=function () {
    selcetId(id);
    if(nid!="null")
    {
        selcetId(nid);
        setmenu(url);
    }
}
var cmd_clr=function () {
    selcetId(id);
    if(pid!="null")
    {
        selcetId(pid);
        setmenu(url);
    }

}
var cmd_ent=function () {
    selcetId(id);
    if(sid!="null")
    {
        selcetId(sid);
        setmenu(url);
    }

}