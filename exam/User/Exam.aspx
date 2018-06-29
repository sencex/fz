<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Exam.aspx.cs" Inherits="User_Exam" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>江苏卫星地球站在线考试系统</title>
    <link href="../css/Common.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body
        {   
            background-color: #9099ae;
        }
        .head
        {
            width: 900px;
            margin: 0px auto;
            height: 110px;
            background: url(../image/main_03.jpg);
            

           
        }
        .content
        {
            width: 900px;
            margin: 0px auto;
            height: auto;
            background-color: white;
        }
        .footer
        {
            width: 900px;
            margin: 0px auto;
            height: 50px;
            text-align: center;
        }
        .top
        {
            height: 26px;
            text-align:center;
            background: url(../image/answer.png);
           
            margin: 0px auto;
           
        }
        .top_content
        {
            height: 26px;
            margin: 0px auto;
            width: 900px;
            line-height:26px;
     
            
        }
        #bottom
        {
            margin: 0px auto;
            height: 78px;
            margin-top: 100px;
        }
        .image
        {
            margin-top: 200px;
            float: right;
        }
        .s_if
        {
            width: 900px;
            height: 21px;
            margin: 0px auto;
            line-height: 21px;
            background-color: White;
            margin-bottom: 15px;
        }
        .ct
        {
            width: 900px;
            height: auto;
            border-bottom: 1px solid #bbb;
        }
        .button
        {
            width: 900px;
            height: 25px;
            margin: 0px auto;
            text-align: center;
            margin-top: 40px;
        }
        #e_box
        {
            margin: 0px auto;
            height: auto;
        }
        #paper
        {
            width: 900px;
            height: 150px;
            margin: 0px auto;
            background-color: White;
            border-bottom: 1px dotted #ddd;
        }
        #paper ul li
        {
            height: 25px;
            line-height: 25px;
        }
        #paper_head
        {
            width: 900px;
            height: 30px;
            margin: 0px auto;
            background-color: White;
            border-bottom: 1px dotted #ddd;
        }
        .head_img
        {
            margin-top: -7px;
            margin-left: -1px;
        }
        .style1
        { 
            height:21px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="e_box">
        <div class="top">
            <div class="top_content">
            </div>
        </div>
        <div class="head">
        </div>
        <div class="s_if">
            <span id="localtime"></span>
            <script type="text/javascript">
                function showLocale(objD) {
                    var str, colorhead, colorfoot;
                    var yy = objD.getYear();
                    if (yy < 1900) yy = yy + 1900;
                    var MM = objD.getMonth() + 1;
                    if (MM < 10) MM = '0' + MM;
                    var dd = objD.getDate();
                    if (dd < 10) dd = '0' + dd;
                    var hh = objD.getHours();
                    if (hh < 10) hh = '0' + hh;
                    var mm = objD.getMinutes();
                    if (mm < 10) mm = '0' + mm;
                    var ss = objD.getSeconds();
                    if (ss < 10) ss = '0' + ss;
                    var ww = objD.getDay();
                    if (ww == 0) colorhead = "<font color=\"#FF0000\">";
                    if (ww > 0 && ww < 6) colorhead = "<font color=\"#373737\">";
                    if (ww == 6) colorhead = "<font color=\"#008000\">";
                    if (ww == 0) ww = "星期日";
                    if (ww == 1) ww = "星期一";
                    if (ww == 2) ww = "星期二";
                    if (ww == 3) ww = "星期三";
                    if (ww == 4) ww = "星期四";
                    if (ww == 5) ww = "星期五";
                    if (ww == 6) ww = "星期六";
                    colorfoot = "</font>"
                    str = colorhead + yy + "-" + MM + "-" + dd + " " + ww + " " + hh + ":" + mm + ":" + ss + colorfoot;
                    return (str);
                }
                function tick() {
                    var today;
                    today = new Date();
                    document.getElementById("localtime").innerHTML = showLocale(today);
                    window.setTimeout("tick()", 1000);
                }
                tick();
            </script>
            <span id="timer" style="color: #d8730d; float: right;"></span>
        </div>
        <div id="paper_head">
            <img src="../image/exam_head.png" class="head_img" alt="" /></div>
        <div id="paper">
            <ul>
                <li>
                    <asp:Label ID="Label30" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
                </li>
                <li>试卷编号：<asp:Label ID="Label31" runat="server" Text="Label"></asp:Label>
                </li>
                <li>出卷时间：<asp:Label ID="Label33" runat="server" Text="Label"></asp:Label>
                </li>
                <li>答题时间：<asp:Label ID="Label32" runat="server" Text="Label"></asp:Label>
                    <script language="JavaScript" type="text/javascript">
                        var tm = document.getElementById('Label32').innerText;
                        var maxtime = tm * 60 //一个小时，按秒计算，自己调整!   
                        function CountDown() {
                            if (maxtime >= 0) {
                                minutes = Math.floor(maxtime / 60);
                                seconds = Math.floor(maxtime % 60);
                                msg = "距离考试结束还有" + minutes + "分" + seconds + "秒";
                                document.getElementById("timer").innerHTML = msg;
                                if (maxtime == 5 * 60) alert('注意，还有5分钟!');
                                --maxtime;
                            }
                            else {
                                clearInterval(timer);
                                document.getElementById("ImageButton2").click();
                                alert("时间到，结束!");
                            }
                        }
                        timer = setInterval("CountDown()", 1000);
                    </script>
                    分钟</li>
                <li>试卷总分：<asp:Label ID="Label34" runat="server" Text="Label"></asp:Label>
                    分</li>
            </ul>
        </div>
        <div class="clear">
        </div>
        <div class="content">
            <div class="ct">
                <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False"
                    EnableModelValidation="True" GridLines="None">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label ID="Label24" runat="server" Text="一、单选题(每题"></asp:Label>
                                <asp:Label ID="Label27" runat="server">									                </asp:Label>
                                <asp:Label ID="Label25" runat="server" Text="分)">                                            </asp:Label><br />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table id="Table2" cellspacing="1" cellpadding="1" width="100%" align="center" border="0">
                                    <tr>
                                        <td colspan="3" align="left" class="style1">
                                            <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex+1 %>'>									                </asp:Label>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Title","、{0}") %>'>									                </asp:Label>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Answer") %>' Visible="False"></asp:Label>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Mark") %>' Visible="False"
                                                Height="18px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="35%" align="left">
                                            <asp:Label ID="Label35" runat="server" Text="A."></asp:Label>
                                            <asp:RadioButton ID="RadioButton1" runat="server" Text='<%# Eval("AnswerA") %>' GroupName="Sl">
                                            </asp:RadioButton>
                                        </td>
                                        <td width="35%" align="left">
                                            <asp:Label ID="Label37" runat="server" Text="B."></asp:Label>
                                            <asp:RadioButton ID="RadioButton2" runat="server" Text='<%# Eval("AnswerB") %>' GroupName="Sl">
                                            </asp:RadioButton>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="35%" align="left">
                                            <asp:Label ID="Label36" runat="server" Text="C."></asp:Label>
                                            <asp:RadioButton ID="RadioButton3" runat="server" Text='<%# Eval("AnswerC") %>' GroupName="Sl">
                                            </asp:RadioButton>
                                        </td>
                                        <td width="35%" align="left">
                                            <asp:Label ID="Label38" runat="server" Text="D."></asp:Label>
                                            <asp:RadioButton ID="RadioButton4" runat="server" Text='<%# Eval("AnswerD") %>' GroupName="Sl">
                                            </asp:RadioButton>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <ItemStyle Height="30px" />
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" Height="25px" BorderStyle="None" />
                </asp:GridView>
            </div>
            <div class="clear">
            </div>
            <div class="ct">
                <asp:GridView ID="GridView2" runat="server" Width="100%" AutoGenerateColumns="False"
                    EnableModelValidation="True" GridLines="None">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label ID="Label22" runat="server" Text="二、多选题(每题">									                </asp:Label>
                                <asp:Label ID="Label28" runat="server">									                </asp:Label>
                                <asp:Label ID="Label23" runat="server" Text="分)">                                            </asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table id="Table3" cellspacing="1" cellpadding="1" width="100%" align="left" border="0">
                                    <tr>
                                        <td colspan="3" align="left">
                                            <asp:Label ID="Label5" runat="server" Text='<%# Container.DataItemIndex+1 %>'>									                </asp:Label>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Title","、{0}") %>'>									                </asp:Label>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("Answer") %>' Visible="False"></asp:Label>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("Mark") %>' Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 22px" width="35%" align="left">
                                        <asp:Label ID="Label39" runat="server" Text="A."></asp:Label>
                                           <asp:CheckBox ID="CheckBox1" runat="server" Text='<%# Eval("AnswerA") %>'></asp:CheckBox>
                                        </td>
                                        <td style="height: 22px" width="35%" align="left">
                                        <asp:Label ID="Label40" runat="server" Text="B."></asp:Label>
                                            <asp:CheckBox ID="CheckBox2" runat="server" Text='<%# Eval("AnswerB") %>'></asp:CheckBox>
                                        </td>
                                        <td style="height: 22px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="35%" align="left"><asp:Label ID="Label41" runat="server" Text="C."></asp:Label>
                                        
                                            <asp:CheckBox ID="CheckBox3" runat="server" Text='<%# Eval("AnswerC") %>'></asp:CheckBox>
                                        </td>
                                     
                                        <td width="35%" align="left"><asp:Label ID="Label42" runat="server" Text="D."></asp:Label>
                                            <asp:CheckBox ID="CheckBox4" runat="server" Text='<%# Eval("AnswerD") %>'></asp:CheckBox>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <HeaderStyle Height="25px" />
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" Height="25px" />
                </asp:GridView>
            </div>
            <div class="clear">
            </div>
            <div class="ct">
                <asp:GridView ID="GridView3" runat="server" Width="100%" AutoGenerateColumns="False"
                    PageSize="2" EnableModelValidation="True" GridLines="None">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label ID="Label20" runat="server" Text="三、判断题(每题">									                </asp:Label>
                                <asp:Label ID="Label29" runat="server">									                </asp:Label>
                                <asp:Label ID="Label21" runat="server" Text="分)">                                            </asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table id="Table4" cellspacing="1" cellpadding="1" width="100%" align="center" border="0">
                                    <tr>
                                        <td class="style1">
                                            <asp:Label ID="Label9" runat="server" Text='<%# Container.DataItemIndex+1 %>'>									                </asp:Label>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("Title","、{0}") %>'>									                </asp:Label>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("Answer") %>' Visible="False"></asp:Label>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Eval("Mark") %>' Visible="False"></asp:Label>
                                        </td>
                                        <td width="13%">
                                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" name="RadioButtonList1"
                                                RepeatDirection="Horizontal">
                                                <asp:ListItem Value="true">正确</asp:ListItem>
                                                <asp:ListItem Value="false">错误</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                        
                                      
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" Height="25px" />
                </asp:GridView>
            </div>
            <div class="clear">
            </div>
            <div class="button">
                <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" ImageUrl="~/image/Submit.GIF" />
                <asp:ImageButton ID="ImageButton2" runat="server" OnClick="ImageButton2_Click" ImageUrl="~/image/quit.gif" />
            </div>
            <div class="clear">
            </div>
            <div id="bottom">
                <div class="footer">
                    <p style="font-size: 12px; color: #575757">
                        Copyright @2016 江苏卫星地球站版权所有</p>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
