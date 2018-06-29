<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageTaoTi.aspx.cs" Inherits="Admin1_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="m_box">
    <div class="m_head">试卷信息</div>
    <div class="m_middle">
    <div class="m_m_c"><span>查询条件</span></div>
      <div class="m_m_c">
          <asp:DropDownList ID="DropDownList1" runat="server" Height="23px">
              <asp:ListItem Value="PaperName">套题名称</asp:ListItem>
              <asp:ListItem Value="c_id">课程</asp:ListItem>
          </asp:DropDownList>
        </div>
      <div class="m_m_c">
          <asp:TextBox ID="TextBox1" runat="server" Width="101px" Height="16px"></asp:TextBox>
        </div>
      <div class="m_m_c">
          <asp:ImageButton ID="ImageButton1" runat="server" 
              ImageUrl="~/image/search.gif" onclick="ImageButton1_Click" />
        </div>
        </div>
         <div class="m_content">
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                 BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                 CellPadding="4" EnableModelValidation="True" ForeColor="Black" 
                 GridLines="Horizontal" Height="16px" 
                 onpageindexchanging="GridView1_PageIndexChanging" 
                 onrowdeleting="GridView1_RowDeleting1" onrowediting="GridView1_RowEditing1" 
                 onrowupdating="GridView1_RowUpdating1" Width="1178px" 
                 AllowPaging="True" 
                 onrowcancelingedit="GridView1_RowCancelingEdit">
                 <Columns>
                     <asp:TemplateField HeaderText="选择">
                         <ItemTemplate>
                             <asp:CheckBox ID="CheckBox1" runat="server" />
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="试卷编号">
                         <ItemTemplate>
                             <asp:Label ID="Label4" runat="server" Text='<%# Bind("PaperID") %>'></asp:Label>
                         </ItemTemplate>
                         <EditItemTemplate><asp:TextBox ID="TextBox4" CssClass="tb"  Width="50px" runat="server" Text='<%# Bind("PaperID") %>' BorderStyle="None" ReadOnly="True"></asp:TextBox></EditItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="课程号">
                         <ItemTemplate>
                             <asp:Label ID="Label5" runat="server" Text='<%# Bind("c_id") %>'></asp:Label>
                         </ItemTemplate>
                         <EditItemTemplate><asp:TextBox ID="TextBox5" CssClass="tb" Width="50px" runat="server" Text='<%# Bind("c_id") %>' BorderStyle="None" ReadOnly="True"></asp:TextBox></EditItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="套题名称">
                         <EditItemTemplate><asp:TextBox ID="TextBox1" CssClass="tb"  runat="server" Text='<%# Bind("PaperName") %>'></asp:TextBox></EditItemTemplate>       
                         <ItemTemplate>
                             <asp:Label ID="Label1" runat="server" Text='<%# Bind("PaperName") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="试卷状态">
                         <EditItemTemplate><asp:TextBox ID="TextBox3" CssClass="tb" Width="50px" runat="server" 
                                 Text='<%# Bind("PaperState") %>'></asp:TextBox></EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label3" runat="server" Text='<%# Bind("PaperState") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="教师号">
                         <EditItemTemplate><asp:TextBox ID="TextBox7" CssClass="tb"  runat="server" 
                                 Text='<%# Bind("teacher_id") %>' BorderStyle="None" ReadOnly="True"></asp:TextBox></EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label7" runat="server" Text='<%# Bind("teacher_id") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="答题时间">
                         <ItemTemplate>
                             <asp:Label ID="Label6" runat="server" Text='<%# Bind("AnswerTime") %>'></asp:Label>
                         </ItemTemplate>
                         <EditItemTemplate><asp:TextBox ID="TextBox6" CssClass="tb" runat="server" 
                                 Text='<%# Bind("AnswerTime") %>'></asp:TextBox></EditItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="分数">
                         <ItemTemplate>
                             <asp:Label ID="Label2" runat="server" Text='<%# Bind("Score") %>'></asp:Label>
                         </ItemTemplate>
                         <EditItemTemplate><asp:TextBox ID="TextBox2"  CssClass="tb" Width="50px" runat="server" Text='<%# Bind("Score") %>' ReadOnly="True" BorderStyle="None"></asp:TextBox></EditItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="详细信息">
                         <ItemTemplate>
                             <asp:HyperLink ID="HyperLink1" runat="server" 
                                 NavigateUrl='<%# Eval("PaperID", "TaoTiDetail.aspx?PaperID={0}") %>' 
                                 Text="详细信息"></asp:HyperLink>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="编辑 删除  " ShowHeader="False">
                         <ItemTemplate>
                             <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                 CommandName="Edit" Text="编辑" />
                             &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                 CommandName="Delete" Text="删除" OnClientClick="return confirm('您确认删除该记录吗?')"/>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                                 CommandName="Update" Text="更新" />
                             &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                 CommandName="Cancel" Text="取消" />
                         </EditItemTemplate>
                     </asp:TemplateField>
                 </Columns>
                   <RowStyle HorizontalAlign="Center" /> 
                 <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                 <HeaderStyle BackColor="#3a9cff" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                 <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
             </asp:GridView>
         </div>
         <div class="t_button">
          <asp:ImageButton ID="ImageButton3" runat="server" 
              ImageUrl="~/image/allselect.gif" onclick="ImageButton3_Click" />
          <asp:ImageButton ID="ImageButton2" runat="server" 
              ImageUrl="~/image/cselect.gif" onclick="ImageButton2_Click" />
          <asp:ImageButton ID="ImageButton4" runat="server" 
              ImageUrl="~/image/adelete.gif" onclick="ImageButton4_Click" />
        </div>
    </div>
    </form>
</body>
</html>
