<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCourse.aspx.cs" Inherits="Admin1_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <link href="../css/Common.css" rel="stylesheet" type="text/css" />
     <link href="../css/admin.css" rel="stylesheet" type="text/css" />
     <style type="text/css">
     .c_1{width:400px;margin:0px auto;height:100px;margin-top:10px;}
     .c_1 ul li{height:25px;line-height:25px;text-align:center;margin-top:10px;}
     .btn{width:400px;margin:0px auto;height:30px;line-height:30px;text-align:center;}
     </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="m_box">
     <div class="m_head">添加课程</div>
       <div class="c_1">
        <ul>
        <li>
            </li>
        <li>
            课程名称<asp:TextBox ID="TextBox2" runat="server" Width="130px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox2" ErrorMessage="*请填写"></asp:RequiredFieldValidator>
            </li>
  
        </ul>   
      </div>
    <div class="btn">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton1" runat="server" 
            onclick="ImageButton1_Click" Height="23px" ImageUrl="~/image/que.gif" 
            Width="80px" />
        </div>
   </div>
    </form>
</body>
</html>
