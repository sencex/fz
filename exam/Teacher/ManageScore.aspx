<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageScore.aspx.cs" Inherits="Admin1_ManageScore" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="../css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="m_box">
      <div class="m_head">成绩管理</div>
      <div class="m_middle">
        <div class="m_m_c"><span>查询条件</span></div>
        <div class="m_m_c">
            <asp:DropDownList ID="DropDownList1" runat="server" Height="23px" Width="65px">
                <asp:ListItem Value="Name">姓名</asp:ListItem>
                <asp:ListItem Value="ID">工号</asp:ListItem>
                <asp:ListItem>总分</asp:ListItem>
            </asp:DropDownList>
          </div>  
        <div class="m_m_c">
            <asp:TextBox ID="TextBox1" runat="server" Width="88px" Height="16px"></asp:TextBox>
          </div>  
        <div class="m_m_c">
            <asp:ImageButton ID="ImageButton1" runat="server" 
                ImageUrl="~/image/search.gif" onclick="ImageButton1_Click" />
          </div>  
      </div>
      <div class="m_content">
          <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
              AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" BorderWidth="1px" CellPadding="4" 
              EnableModelValidation="True" ForeColor="Black" GridLines="Horizontal" 
              Height="35px" 
              onpageindexchanging="GridView1_PageIndexChanging" 
              Width="1179px" onrowdeleting="GridView1_RowDeleting" PageSize="20">
              <Columns>
                  <asp:BoundField DataField="ID" HeaderText="工号" />
                  <asp:BoundField DataField="Name" HeaderText="姓名" />
                  <asp:BoundField DataField="c_name" HeaderText="课程名称" />
                  <asp:BoundField DataField="PaperName" HeaderText="试卷名称" />
                  <asp:BoundField DataField="ExamTime" HeaderText="考试时间" />
                  <asp:BoundField DataField="Score" HeaderText="考试总分" />
                  <asp:BoundField DataField="sscore" HeaderText="单选题得分" />
                  <asp:BoundField DataField="mscore" HeaderText="多选题得分" />
                  <asp:BoundField DataField="jscore" HeaderText="判断题得分" />
                  <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
              </Columns>
              <RowStyle HorizontalAlign="Center" />
              <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
              <HeaderStyle BackColor="#3a9cff" Font-Bold="True" ForeColor="White" 
                  Height="26px" />
              <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
              
              <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
          </asp:GridView>
      </div>
    </div>
    </form>
</body>
</html>
