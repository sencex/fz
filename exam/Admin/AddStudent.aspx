<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddStudent.aspx.cs" Inherits="Admin_AddStudent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <link href="../css/Common.css" rel="stylesheet" type="text/css" />
     <link href="../css/admin.css" rel="stylesheet" type="text/css" />
     <style type="text/css">
         .content
        {
            width: 700px;
            height: 420px;
            margin: 0px auto;
            margin-top: 10px;
           
        }
        .ct_c
        {
            width: 500px;
            margin: 0px auto;
            height: 410px;
        }
        .ct_c_1
        {
            height: 25px;
            margin-top: 3px;
        }
        .c_1_left
        {
            width: 130px;
            float: left;
            text-align: right;
            height: 26px;
            line-height: 26px;
            color: #666666;
        }
        .c_1_right
        {
            width: 330px;
            float: left;
            height: 26px;
            line-height: 26px;
        }
     .btn{width:400px;margin:0px auto;height:30px;line-height:30px;text-align:center;}
     </style>
        <script type="text/javascript" language="javascript">
            function CustomValidator(source, arguments) {
                if (arguments.Value > 999999999 && arguments.Value < 9999999999)
                    arguments.IsValid = true;
                else
                    arguments.IsValid = false;

            }
     </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="m_box">
     <div class="m_head">添加学生</div>
    <div class="content">
        <div class="ct_c">
            <div class="ct_c_1">
                <div class="c_1_left">
                </div>
                <div class="c_1_right">
                </div>
            </div>
            <div class="ct_c_1">
                <div class="c_1_left">
                    学 号</div>
                <div class="c_1_right">
                    <asp:TextBox ID="txtStuID" runat="server"></asp:TextBox>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" 
                        ErrorMessage="*请输入10位数字帐号" ClientValidationFunction="CustomValidator" 
                        ControlToValidate="txtStuID"></asp:CustomValidator>
                </div>
            </div>
            <div class="ct_c_1">
                <div class="c_1_left">
                    姓 名</div>
                <div class="c_1_right">
                    <asp:TextBox ID="txtStuName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtStuName" ErrorMessage="*请输入"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="ct_c_1">
                <div class="c_1_left">
                    密 码</div>
                <div class="c_1_right">
                    <asp:TextBox ID="txtStuPwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtStuPwd" ErrorMessage="*请输入"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="ct_c_1">
                <div class="c_1_left">
                    重复密码</div>
                <div class="c_1_right">
                    <asp:TextBox ID="txtStuPwdR" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtStuPwd"
                        ControlToValidate="txtStuPwdR" ErrorMessage="*密码不一致"></asp:CompareValidator>
                </div>
            </div>
            <div class="ct_c_1">
                <div class="c_1_left">
                    密码问题</div>
                <div class="c_1_right">
                    <asp:DropDownList ID="DropDownList3" runat="server" Width="120px">
                        <asp:ListItem>您的生日是？</asp:ListItem>
                        <asp:ListItem>您的高中班主任是？</asp:ListItem>
                        <asp:ListItem>您是什么星座？</asp:ListItem>
                        <asp:ListItem>您是哪一天入学？</asp:ListItem>
                        <asp:ListItem>您的爱好是？</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="ct_c_1">
                <div class="c_1_left">
                    答 案</div>
                <div class="c_1_right">
                    <asp:TextBox ID="txtAnsPwd" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtAnsPwd" ErrorMessage="*请输入"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="ct_c_1">
                <div class="c_1_left">
                    性 别</div>
                <div class="c_1_right">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="40px">
                        <asp:ListItem>男</asp:ListItem>
                        <asp:ListItem Value="女"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="ct_c_1">
                <div class="c_1_left">
                    专 业</div>
                <div class="c_1_right">
                    <asp:DropDownList ID="ddlProfession" runat="server" Width="150px">
                        <asp:ListItem>信息管理与信息系统</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="ct_c_1">
                <div class="c_1_left">
                </div>
                <div class="c_1_right">
                </div>
            </div>
            <div class="ct_c_1">
                <div class="c_1_left">
                </div>
                <div class="c_1_right">
                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image/Submit.GIF" OnClick="ImageButton1_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/image/RESET.GIF" OnClick="ImageButton2_Click" />
                </div>
            </div>
        </div>
    </div>
   
   </div>
    </form>
</body>
</html>
