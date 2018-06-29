<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPage.master" AutoEventWireup="true" CodeFile="getpwd2.aspx.cs" Inherits="User_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
#content{width:600px;height:400px;margin:0px auto;}
.ct_head{height:30px;line-height:30px;color:#1e7ace;border-bottom:1px solid black;}
.ct_ct{height:30px;margin-top:20px;text-align:center;color:#999999;}
.ct_notice{height:30px;margin-top:5px;color:#999999;}
.btn{height:70px;text-align:center;border-bottom:1px dashed #ddd;line-height:80px;padding-top:30px;padding-left:100px;}
.ct_left{width:230px;float:left;text-align:right;height:26px;line-height:26px;color:#666666;}
.ct_right{width:230px;float:left;height:26px;line-height:26px;text-align:left;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="content">
 <div class="ct_head">填写以下资料找回密码</div>
 <div class="ct_notice">请输入密码问题</div>
 <div class="ct_ct"><div class="ct_left">密码提示问题：</div><div class="ct_right"><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></div>
 </div>
 <div class="ct_ct"><div class="ct_left">提示问题回答：</div><div class="ct_right"><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></div>
 </div>
 <div class="btn">
     <asp:ImageButton ID="ImageButton2" runat="server" Height="28px" 
         ImageUrl="~/image/next.gif" Width="89px" onclick="ImageButton2_Click" />
  </div>
</div>
</asp:Content>

