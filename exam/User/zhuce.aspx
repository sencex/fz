<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zhuce.aspx.cs" Inherits="User_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>注册</title>
    <link href="../css/Common.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .footer
        {
            width: 1000px;
            margin: 0px auto;
            height: 50px;
            border-top: 1px solid #c0c1c1;
            margin-top: 10px;
            text-align: center;
        }
        #head
        {
            margin: 0px auto;
            background: url(../image/1.png);
            height: 40px;
            border-bottom: 1px solid #e3e3e3;
        }
        #head_content
        {
            width: 1000px;
            margin: 0px auto;
            height: 40px;
            line-height: 40px;
        }
        #middle
        {
            width: 1000px;
            height: 75px;
            margin: 0px auto;
            border-bottom: 1px solid #eeeeee;
            line-height: 80px;
            margin-top: 20px;
        }
        .middle-left
        {
            float: left;
        }
        .middle-right
        {
            float: right;
        }
        .middle-right a
        {
            color: #278aed;
        }
        .content
        {
            width: 1000px;
            height: 420px;
            margin: 0px auto;
            margin-top: 10px;
            background: #f8f8f8;
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
    </style>
       </style>
        <script type="text/javascript" language="javascript">
            function CustomValidator(source, arguments) {
                if (arguments.Value > 999 && arguments.Value < 99999)
                    arguments.IsValid = true;
                else
                    arguments.IsValid = false;

            }
     </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="head">
        <div id="head_content">
           <a href="../index.aspx" style="color:#d8730d;font-weight:bold;"><img src="../image/home1.gif" alt=""/> 返 回 </a>
    </div>
    <div class="clear">
    </div>
    <div id="middle">
        <div class="middle-left">
            <span style="font-size: 18pt; font-family: 黑体; font-weight: bold;">注册</span></div>
        <div class="middle-right">
            <span style="color: #d5d5d5;">已经拥有账户？</span><a href="../index.aspx">立即登录</a></div>
    </div>
    <div class="clear">
    </div>
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
                    工 号</div>
                <div class="c_1_right">
                    <asp:TextBox ID="txtStuID" runat="server"></asp:TextBox>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" 
                        ClientValidationFunction="CustomValidator" ControlToValidate="txtStuID" 
                        ErrorMessage="*请输入5位数工号"></asp:CustomValidator>
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
                    部  门</div>
                <div class="c_1_right">
                    <asp:DropDownList ID="ddlProfession" runat="server" Width="150px">
                        <asp:ListItem>江苏卫星地球站</asp:ListItem>
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
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/image/Submit.GIF" OnClick="ImageButton1_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image/RESET.GIF" OnClick="ImageButton2_Click" />
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <p style="font-size: 12px; color: #575757">
            Copyright @2016 卫星地球站版权所有</p>
    </div>
    </form>
</body>
</html>
