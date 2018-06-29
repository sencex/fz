<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPage.master" AutoEventWireup="true" CodeFile="getpwd1.aspx.cs" Inherits="User_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
#content{width:600px;height:400px;margin:0px auto;}
.ct_head{height:30px;line-height:30px;color:#1e7ace;border-bottom:1px solid black;}
.ct_ct{height:30px;margin-top:30px;text-align:center;color:#999999;}
.ct_notice{height:30px;margin-top:5px;color:#999999;}
.btn{height:70px;text-align:center;border-bottom:1px dashed #ddd;line-height:80px;padding-top:30px;padding-left:100px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="content">
 <div class="ct_head">填写以下资料找回密码</div>
 <div class="ct_notice">请输入您在注册时使用的用户名</div>
 <div class="ct_ct">工号：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
 </div>
 <div class="btn">
     <asp:ImageButton ID="ImageButton2" runat="server" Height="28px" 
         ImageUrl="~/image/next.gif" Width="89px" onclick="ImageButton2_Click" />
    </div>


</div>
</asp:Content>

