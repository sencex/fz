<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagePanDuan.aspx.cs" Inherits="Admin1_Default3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title></title>
     <link href="../css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="m_box">
      <div class="m_head">判断题列表</div>
      <div class="m_middle">
          <div class="m_m_c"><span>查询条件</span></div>
          <div class="m_m_c">
              <asp:DropDownList ID="DropDownList1" runat="server" Width="100px" Height="23px">
                  <asp:ListItem Value="c_id">课程号</asp:ListItem>
                  <asp:ListItem Value="Title">题目</asp:ListItem>
              </asp:DropDownList>
          </div>   
          <div class="m_m_c">
              <asp:TextBox ID="TextBox1" runat="server" Width="92px" Height="16px"></asp:TextBox>
          </div>
          <div class="m_m_c">
              <asp:ImageButton ID="ImageButton1" runat="server" 
                  ImageUrl="~/image/search.gif" onclick="ImageButton1_Click" />
          </div> 
      </div>
      <div class="m_content">
          <asp:GridView ID="gvQueInfo" runat="server" AutoGenerateColumns="False" 
              BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
              CellPadding="4" EnableModelValidation="True" ForeColor="Black" 
              GridLines="Horizontal" Height="16px" Width="1175px" 
              AllowPaging="True" onpageindexchanging="gvQueInfo_PageIndexChanging" 
              onrowdeleting="gvQueInfo_RowDeleting" onrowediting="gvQueInfo_RowEditing">
              <Columns>
                  <asp:TemplateField HeaderText="选择">
                      <ItemTemplate>
                          <asp:CheckBox ID="CheckBox1" runat="server" />
                      </ItemTemplate>
                      <ItemStyle Width="100px" />
                  </asp:TemplateField>
                  <asp:BoundField DataField="c_id" HeaderText="课程号" >
                  <ItemStyle Width="100px" />
                  </asp:BoundField>
                  <asp:BoundField DataField="Title" HeaderText="题目" />
                  <asp:HyperLinkField HeaderText="编辑" Text="编辑" DataNavigateUrlFields="ID" 
                      DataNavigateUrlFormatString="ChangePanDuan.aspx?ID={0}" >
                  <ItemStyle Width="100px" />
                  </asp:HyperLinkField>
                  <asp:TemplateField HeaderText="删除" ShowHeader="False">
                      <ItemTemplate>
                          <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                              CommandName="Delete" Text="删除" OnClientClick="return confirm('您确认删除该记录吗?')"/>
                      </ItemTemplate>
                      <ItemStyle Width="100px" />
                  </asp:TemplateField>
              </Columns>
              <RowStyle HorizontalAlign="Center" /> 
              <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
              <HeaderStyle BackColor="#3a9cff" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
              <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
          </asp:GridView>
        </div>

    </div>
    </form>
</body>
</html>
