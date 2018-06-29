<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePwd.aspx.cs" Inherits="Teacher_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <link href="../css/Common.css" rel="stylesheet" type="text/css" />
     <link href="../css/admin.css" rel="stylesheet" type="text/css" />
     <style type="text/css">
     .c_1{width:400px;margin:0px auto;height:120px;}
     .c_1 ul li{height:25px;line-height:25px;text-align:center;margin-top:10px;}
     .btn{width:400px;margin:0px auto;height:30px;line-height:30px;text-align:center;}
     .c_1_right{width:160px;float:left;}
     .c_1_left{width:120px;float:left;text-align:right;}
     .c_1_y{width:100px;float:left;text-align:left;}
     </style>
     <script type="text/javascript" language="javascript">
         function CustomValidator(source, arguments) {
             if (arguments.Value > 99999 && arguments.Value < 999999)
                 arguments.IsValid = true;
             else
                 arguments.IsValid = false;

         }
     </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="m_box">
     <div class="m_head">修改密码</div>
       <div class="c_1">
        <ul>
        <li>
            <div class="c_1_left">
                请输入旧密码</div>
            <div class="c_1_right"><asp:TextBox ID="TextBox1" runat="server" 
                    TextMode="Password"></asp:TextBox></div>
            <div class="c_1_y">
            </div>
            </li>
        <li>
            <div class="c_1_left"><asp:Label ID="Label2" runat="server" Text="新密码"></asp:Label></div>
            <div class="c_1_right"><asp:TextBox ID="TextBox2" runat="server" 
                    TextMode="Password"></asp:TextBox></div>
            <div class="c_1_y">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="*请输入" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
            </div>
            </li>
        <li>
            <div class="c_1_left"><asp:Label ID="Label3" runat="server" Text="确认新密码"></asp:Label></div>
            <div class="c_1_right"><asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox></div>
            <div class="c_1_y">
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ErrorMessage="*两次密码不一致" ControlToCompare="TextBox2" 
                    ControlToValidate="TextBox3"></asp:CompareValidator>
            </div>
            </li>
            </ul>   
      </div>
    <div class="btn">
        <asp:ImageButton ID="ImageButton1" runat="server" 
            onclick="ImageButton1_Click" Height="23px" ImageUrl="~/image/que.gif" 
            Width="80px" />
        </div>
   </div>
</form>
    </body>
</html>
