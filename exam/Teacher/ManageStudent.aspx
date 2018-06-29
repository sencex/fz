<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageStudent.aspx.cs" Inherits="Admin1_Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="m_box">
      <div class="m_head">考生信息</div>
      <div class="m_middle">
        <div class="m_m_c"><span>查询条件</span></div>
        <div class="m_m_c">
            <asp:DropDownList ID="DropDownList1" runat="server" Height="23px" Width="82px">
                <asp:ListItem Value="Name">姓名</asp:ListItem>
                <asp:ListItem Value="ID">工号</asp:ListItem>
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
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
              CellPadding="4" EnableModelValidation="True" GridLines="Horizontal" 
              Height="23px" Width="1178px" ForeColor="Black" 
              onpageindexchanging="GridView1_PageIndexChanging" BackColor="White" 
              BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
              AllowPaging="True" PageSize="20">
              <Columns>
                  <asp:BoundField DataField="ID" HeaderText="工号" >
                  <ItemStyle/>            
                  </asp:BoundField>
                  <asp:BoundField DataField="Name" HeaderText="姓名" >              
                  <ItemStyle/>              
                  </asp:BoundField>
                  <asp:BoundField DataField="PWD" HeaderText="密码" >                
                  <ItemStyle/>
                  </asp:BoundField>
                  <asp:BoundField DataField="Sex" HeaderText="性别" >
                  <ItemStyle/>
                  </asp:BoundField>
                  <asp:BoundField DataField="JoinTime" HeaderText="加入时间" >
                  <ItemStyle/>
                  </asp:BoundField>
                  <asp:BoundField DataField="Question" HeaderText="密码问题" >
                  <ItemStyle/>
                  </asp:BoundField>
                  <asp:BoundField DataField="Answer" HeaderText="密码答案" >
                  <ItemStyle/>
                  </asp:BoundField>
                  <asp:BoundField DataField="profession" HeaderText="部门" >
                  <ItemStyle/>
                  </asp:BoundField>
              </Columns>
              <RowStyle HorizontalAlign="Center" /> 
              <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
              <HeaderStyle BackColor="#3a9cff" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
              <RowStyle BackColor="White" ForeColor="#333333" />
              <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
          </asp:GridView>
      </div>
    </div>
    </form>
</body>
</html>
