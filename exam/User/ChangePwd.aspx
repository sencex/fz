<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePwd.aspx.cs" Inherits="User_ChangePwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <link href="../css/Common.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
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
            height: 400px;
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
            height: 22px;
            margin: 0px auto;
            background: url(../image/answer.png);
        }
        .top_content
        {
            height: 22px;
            margin: 0px auto;
            width: 900px;
            margin-top: 6px;
        }
        .c_left
        {
            width: 200px;
            height: 100%;
            float: left;
        }
        .c_right
        {
            width: 190px;
            height: 100%;
            float: left;
        }
        .c_center
        {
            width: 500px;
            height: 100%;
            float: left;
        }
        .c_c_head
        {
            width: 500px;
            height: 20px;
            border-bottom: 3px solid #369aff;
            line-height: 20px;
            text-align: left;
            color: #d8730d;
            font-weight: bold;
        }
        .c_head_left{width: 200px;height: 20px;float:left;}
        .c_head_right{width: 300px;height: 20px;text-align:right;float:left;}
        .c_c_text
        {
            width: 500px;
            height: 265px;
            text-align: center;
            border-bottom: 1px dashed #bbb;
            line-height: 265px;
        }
        .c_c_text p
        {
            color: #35496a;
        }
        .ct_b
        {
            width: 500px;
            height: 27px;
            text-align: center;
            margin-top: 5px;
            line-height: 27px;
            margin-top: 20px;
        }
        .c_c_btn
        {
            width: 500px;
            height: 27px;
            text-align: right;
            margin-top: 5px;
            line-height: 27px;
            
        }
        #bottom
        {
            margin: 0px auto;
            height: 78px;
            background: url(../image/footer.png);
            border-top: 1px solid #c0c1c1;
            margin-top: 25px;
        }
        .image
        {
            margin-top: 200px;
            float: right;
        }
         .c_1{width:400px;margin:0px auto;height:120px;}
     .c_1 ul li{height:25px;line-height:25px;text-align:center;margin-top:10px;}
     .btn{width:400px;margin:0px auto;height:30px;line-height:30px;text-align:center;}
     .c_1_right{width:160px;float:left;}
     .c_1_left{width:120px;float:left;text-align:right;}
     .c_1_y{width:100px;float:left;text-align:left;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="top">
        <div class="top_content">
         <a href="../index.aspx" style="color:#d8730d;font-weight:bold;"><img src="../image/home1.gif" alt=""/> 返 回 </a>
        </div>
    </div>
    <div class="head">
    </div>
    <div class="content">
        <div class="c_left">
        </div>
        <div class="c_center">
            <div class="c_c_head">
                <div class="c_head_left">修改密码</div>
                <div class="c_head_right"></div>
           </div>
            <div class="c_c_text">
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
        <a href="or.aspx"><img src="../image/back.gif" alt=""/></a>

        </div>
            </div>
       
        </div>
        <div class="c_right">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/image/b.jpg" CssClass="image" Height="137px"
                Width="154px" />
        </div>
    </div>
    <div id="bottom">
        <div class="footer">
            <p style="font-size: 12px; color: #575757">
            Copyright @2016 江苏卫星地球站版权所有</div>
    </div>
    </form>
</body>
</html>
