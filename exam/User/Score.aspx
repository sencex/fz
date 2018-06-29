<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Score.aspx.cs" Inherits="User_Score" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/Common.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .footer
        {
            width: 1000px;
            margin: 0px auto;
            height: 50px;
            margin-top: 10px;
            text-align: center;
        }
        #head_1
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
            height: 22px;
            line-height: 40px;
        }
        #middle
        {
            width: 1000px;
            height: 60px;
            margin: 0px auto;
            border-bottom: 1px solid #eeeeee;
            line-height: 60px;
            margin-top: 10px;
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
        #s_c
        {
            margin: 0px auto;
            height: 247px;
            width: 1000px;
            margin-top: 10px;
        }
        #bottom
        {
            margin: 0px auto;
            height: 78px;
            background: url(../image/footer.png);
            border-top: 1px solid #c0c1c1;
            margin-top: 20px;
        }
        .m_middle
        {
            width: 1000px;
            height: 25px;
            margin: 0px auto;
            line-height: 25px;
            margin-top: 10px;
            text-align: center;
            border-bottom: 2px solid #3a9cff;
            padding-bottom: 5px;
        }
        .m_m_c
        {
            width: 100px;
            float: left;
        }
        .c_img
        {
            margin: 0px auto;
            height: 130px;
            width: 1000px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="head_1">
            <div id="head_content">
                  <a href="or.aspx" style="color:#d8730d;font-weight:bold;"><img src="../image/home1.gif" alt=""/> 返 回 </a>
        </div>
        </div>
        <div class="clear">
        </div>
        <div id="middle">
            <div class="middle-left">
                <span style="font-size: 18pt; font-family: 黑体; font-weight: bold;">成绩查询</span></div>
            <div class="middle-right">
            </div>
        </div>
        <div class="m_middle">
            <div class="m_m_c">
                <span>查询条件</span></div>
            <div class="m_m_c">
                <asp:DropDownList ID="DropDownList1" runat="server" Width="100px" Height="23px">
                    <asp:ListItem Value="c_name">课程名</asp:ListItem>
                    <asp:ListItem Value="PaperName">试卷名</asp:ListItem>
                    <asp:ListItem Value="Score">考试总分</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="m_m_c">
                <asp:TextBox ID="TextBox1" runat="server" Width="92px" Height="16px"></asp:TextBox>
            </div>
            <div class="m_m_c">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/image/search.gif" OnClick="ImageButton1_Click" />
            </div>
        </div>
        <div id="s_c">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                EnableModelValidation="True" ForeColor="Black" GridLines="Horizontal" Height="35px"
                HorizontalAlign="Center" Width="994px" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging"
                PageSize="15" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                <Columns>
                    <asp:BoundField HeaderText="课程名称" DataField="c_name" />
                    <asp:BoundField DataField="PaperName" HeaderText="试卷名称" />
                    <asp:BoundField DataField="ExamTime" HeaderText="考试时间" />
                    <asp:BoundField DataField="Score" HeaderText="考试总分" />
                    <asp:BoundField DataField="sscore" HeaderText="单选题得分" />
                    <asp:BoundField DataField="mscore" HeaderText="多选题得分" />
                    <asp:BoundField DataField="jscore" HeaderText="判断题得分" />
                </Columns>
                <RowStyle HorizontalAlign="Center" />
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#3a9cff" Font-Bold="True" ForeColor="White" Height="26px" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </div>
        <div class="c_img">
            </div>
        <div id="bottom">
            <div class="footer">
                <p style="font-size: 12px; color: #575757">
                    Copyright @2016 江苏卫星地球站版权所有</p>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
