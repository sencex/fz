<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddPanDuan.aspx.cs" Inherits="Admin1_Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/Common.css" rel="stylesheet" type="text/css" />
    <link href="../css/admin.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    .main{width:1185px;margin:0px auto;height:auto;}
    .add_content{height:156px;background:#f5f5f5;}
    .add_content ul li{float:left;height:56px;width:100%;line-height:56px;}
    .ac_left{width:80px;float:left;height:100%;text-align:right;}
    .ac_right{width:827px;float:left;height:100%;}
    .kemu{width:1180px;height:23px;line-height:23px;border-bottom:2px solid #bbb;margin-top:10px;}
    .answer{width:1180px;height:25px;line-height:25px;border-top:2px solid #bbb;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="main">
      <div class="m_head">添加判断题</div>
      <div class="kemu">
          <div class="ac_left">考试课程：</div>
          <div class="ac_right">
              <asp:DropDownList ID="ddlCourse" runat="server" Width="99px">
              </asp:DropDownList>
          </div>    
          <asp:ImageButton ID="ImageButton1" runat="server" Height="23px" 
              ImageUrl="~/image/que.gif" onclick="ImageButton1_Click" Width="80px" />
      </div>
      <div class="add_content">
        <ul> 
          <li>
          <div class="ac_left">题目：</div>
          <div class="ac_right">
              <asp:TextBox ID="txtTitle" runat="server" TextMode="MultiLine" Width="900px" 
                  Height="150px"></asp:TextBox>
              </div>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                  ErrorMessage="*不能为空" ForeColor="#369AFF" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>
          </li> 
         
        </ul>     
      </div>
        <div class="answer">
          <div class="ac_left">正确答案：</div>
          <div class="ac_right">
              <asp:RadioButtonList ID="rblAnswer" runat="server" 
                  RepeatDirection="Horizontal" Width="165px">
                  <asp:ListItem Value="true">正确</asp:ListItem>
                  <asp:ListItem Value="false">错误</asp:ListItem>
              </asp:RadioButtonList>
             </div>    
     </div>
    </div>
    </form>
</body>
</html>
