<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddDanXuan.aspx.cs" Inherits="Admin1_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/Common.css" rel="stylesheet" type="text/css" />
     <link href="../css/admin.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    .main{width:1185px;margin:0px auto;height:auto;}
    .add_content{height:295px;background:#f5f5f5;}
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
      <div class="m_head">添加单选题</div>
      <div class="clear"></div>
      <div class="kemu">
          <div class="ac_left">考试课程</div>
          <div class="ac_right">
              <asp:DropDownList ID="DropDownList2" runat="server" Width="99px">
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
              <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="900px" 
                  Height="50px"></asp:TextBox>
              </div>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                  ErrorMessage="*不能为空" ForeColor="#369AFF" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
          </li> 
          <li>
          <div class="ac_left">答案A：</div>
           <div class="ac_right">
               <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="900px" 
                   Height="50px"></asp:TextBox>
              </div>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                  ErrorMessage="*不能为空" ForeColor="#369AFF" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
          </li> 
          <li>
          <div class="ac_left">答案B：</div>
           <div class="ac_right">
               <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" Width="900px" 
                   Height="50px"></asp:TextBox>
              </div>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                  ErrorMessage="*不能为空" ControlToValidate="TextBox3" ForeColor="#369AFF"></asp:RequiredFieldValidator>
          </li> 
          <li>
          <div class="ac_left">答案C：</div>
           <div class="ac_right">
               <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Width="900px" 
                   Height="50px"></asp:TextBox>
              </div>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                  ErrorMessage="*不能为空" ForeColor="#369AFF" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
          </li>
           <li>
          <div class="ac_left">答案D：</div>
           <div class="ac_right">
               <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine" Width="900px" 
                   Height="50px"></asp:TextBox>
              </div>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                   ErrorMessage="*不能为空" ForeColor="#369AFF" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
          </li>        
        </ul>     
      </div>
        <div class="answer">
          <div class="ac_left">正确答案</div>
          <div class="ac_right">
              <asp:DropDownList ID="DropDownList1" runat="server" Width="80px">
                  <asp:ListItem>A</asp:ListItem>
                  <asp:ListItem>B</asp:ListItem>
                  <asp:ListItem>C</asp:ListItem>
                  <asp:ListItem>D</asp:ListItem>
              </asp:DropDownList>
             </div>    
     </div>
    </div>
    </form>
</body>
</html>
