<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddTaoTi.aspx.cs" Inherits="Admin1_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/Common.css" rel="stylesheet" type="text/css" />
     <link href="../css/admin.css" rel="stylesheet" type="text/css" />
     <style type="text/css">
     .m_t{width:1141px;height:25px;border-top:2px dotted #ddd;line-height:25px;color:#369aff;font-size:13px;font-weight:bold;}
     .m_t_h{width:505px;height:25px;line-height:25px;float:left;}
     #notice{width:1141px;height:25px;text-align:center;color:#1e7ace;font-weight:bold;line-height:25px;}
     .view{width:1141px;height:auto;}
     .view_1{width:1141px;height:auto;}
     .baocun{width:1141px;height:25px;text-align:center;border-top:2px solid #ddd;padding-top:5px;}
     </style>
     
</head>
<body STYLE='OVERFLOW:SCROLL;OVERFLOW-X:HIDDEN'>
    <form id="form1" runat="server">
    <div class="m_box">
      <div class="m_head">试卷制定 
          <asp:Label ID="Label23" runat="server" Text="（总分"></asp:Label>
          <asp:Label ID="Label21" runat="server" Font-Bold="True" ForeColor="#FF3300" 
              Text="Label"></asp:Label>
          <asp:Label ID="Label22" runat="server" Text="分）"></asp:Label>
&nbsp;
          </div>
      <br />
      <div class="m_t">
      <div class="m_t_h">
          考试科目：<asp:DropDownList ID="ddlCourse" runat="server" 
              Width="130px">
          </asp:DropDownList>
          </div>
          <div class="m_t_h">试卷名称：<asp:TextBox ID="txtPaperName" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                  ErrorMessage="*必填" ControlToValidate="txtPaperName"></asp:RequiredFieldValidator>
          </div>
      </div>
       <div class="m_t"> <div class="m_t_h">考试时间：<asp:DropDownList ID="DropDownList1" 
               runat="server" Height="19px" Width="70px">
           <asp:ListItem Value="30">30分钟</asp:ListItem>
           <asp:ListItem Value="60">60分钟</asp:ListItem>
           <asp:ListItem Value="90">90分钟</asp:ListItem>
           <asp:ListItem Value="120">120分钟</asp:ListItem>
           </asp:DropDownList>
           </div>
           <div class="m_t_h">
           试卷状态：<asp:DropDownList ID="DropDownList2" 
                   runat="server" Height="19px">
                   <asp:ListItem Value="1">可用</asp:ListItem>
                   <asp:ListItem Value="0">不可用</asp:ListItem>
               </asp:DropDownList>
           </div>
        </div>
 
      <div class="m_t"> 单选题</div>
      <div class="m_t">
          <div class="m_t_h">题目数目：<asp:DropDownList ID="SingleNum" 
              runat="server" Width="50px" AutoPostBack="True">
              <asp:ListItem>1</asp:ListItem>
              <asp:ListItem>2</asp:ListItem>
              <asp:ListItem>3</asp:ListItem>
              <asp:ListItem>4</asp:ListItem>
              <asp:ListItem>5</asp:ListItem>
              <asp:ListItem>6</asp:ListItem>
              <asp:ListItem>7</asp:ListItem>
              <asp:ListItem>8</asp:ListItem>
              <asp:ListItem>9</asp:ListItem>
              <asp:ListItem>10</asp:ListItem>
          </asp:DropDownList>
          </div>
          <div class="m_t_h">每题分数：<asp:DropDownList ID="SingleFen" runat="server" 
                  Width="50px" AutoPostBack="True">
              <asp:ListItem Value="1">1分</asp:ListItem>
              <asp:ListItem Value="2">2分</asp:ListItem>
              <asp:ListItem Value="3">3分</asp:ListItem>
              <asp:ListItem Value="4">4分</asp:ListItem>
              <asp:ListItem Value="5">5分</asp:ListItem>
              <asp:ListItem Value="6">6分</asp:ListItem>
              <asp:ListItem Value="7">7分</asp:ListItem>
              <asp:ListItem Value="8">8分</asp:ListItem>
              <asp:ListItem Value="9">9分</asp:ListItem>
              <asp:ListItem Value="10">10分</asp:ListItem>
              </asp:DropDownList>
          </div>
       </div>
      <div class="m_t"> 多选题</div>
      <div class="m_t">
          <div class="m_t_h">
              题目数目：<asp:DropDownList ID="MultiNum" runat="server" 
                  Width="50px" AutoPostBack="True">
                  <asp:ListItem>1</asp:ListItem>
                  <asp:ListItem>2</asp:ListItem>
                  <asp:ListItem>3</asp:ListItem>
                  <asp:ListItem>4</asp:ListItem>
                  <asp:ListItem>5</asp:ListItem>
                  <asp:ListItem>6</asp:ListItem>
                  <asp:ListItem>7</asp:ListItem>
                  <asp:ListItem>8</asp:ListItem>
                  <asp:ListItem>9</asp:ListItem>
                  <asp:ListItem>10</asp:ListItem>
          </asp:DropDownList>
          </div>
          <div class="m_t_h">
              每题分数：<asp:DropDownList ID="MultiFen" runat="server" 
                  Width="50px" AutoPostBack="True">
                  <asp:ListItem Value="1">1分</asp:ListItem>
                  <asp:ListItem Value="2">2分</asp:ListItem>
                  <asp:ListItem Value="3">3分</asp:ListItem>
                  <asp:ListItem Value="4">4分</asp:ListItem>
                  <asp:ListItem Value="5">5分</asp:ListItem>
                  <asp:ListItem Value="6">6分</asp:ListItem>
                  <asp:ListItem Value="7">7分</asp:ListItem>
                  <asp:ListItem Value="8">8分</asp:ListItem>
                  <asp:ListItem Value="9">9分</asp:ListItem>
                  <asp:ListItem Value="10">10分</asp:ListItem>
              </asp:DropDownList>
          </div></div>
      <div class="m_t"> 判断题</div>
      <div class="m_t">
         <div class="m_t_h">
             题目数目：<asp:DropDownList ID="JudgeNum" runat="server" Width="50px" 
                 AutoPostBack="True">
                 <asp:ListItem>1</asp:ListItem>
                 <asp:ListItem>2</asp:ListItem>
                 <asp:ListItem>3</asp:ListItem>
                 <asp:ListItem>4</asp:ListItem>
                 <asp:ListItem>5</asp:ListItem>
                 <asp:ListItem>6</asp:ListItem>
                 <asp:ListItem>7</asp:ListItem>
                 <asp:ListItem>8</asp:ListItem>
                 <asp:ListItem>9</asp:ListItem>
                 <asp:ListItem>10</asp:ListItem>
          </asp:DropDownList>
          </div>
          <div class="m_t_h">
              每题分数：<asp:DropDownList 
                  ID="JudgeFen" runat="server" 
                  Width="50px" AutoPostBack="True">
                  <asp:ListItem Value="1">1分</asp:ListItem>
                  <asp:ListItem Value="2">2分</asp:ListItem>
                  <asp:ListItem Value="3">3分</asp:ListItem>
                  <asp:ListItem Value="4">4分</asp:ListItem>
                  <asp:ListItem Value="5">5分</asp:ListItem>
                  <asp:ListItem Value="6">6分</asp:ListItem>
                  <asp:ListItem Value="7">7分</asp:ListItem>
                  <asp:ListItem Value="8">8分</asp:ListItem>
                  <asp:ListItem Value="9">9分</asp:ListItem>
                  <asp:ListItem Value="10">10分</asp:ListItem>
              </asp:DropDownList>
          </div >
      </div>
      <div class="baocun">
        
             <asp:ImageButton ID="ImageButton1" runat="server" 
                 onclick="ImageButton1_Click" ImageUrl="~/image/Submit.GIF" />
         
      </div>
      <div id="notice">
          <asp:Label ID="Label25" runat="server" Text="注意：添加试卷总分不能超过100分" Font-Bold="True" 
              Font-Size="Smaller" ForeColor="#1E7ACE"></asp:Label>
        </div>
      <div class="view">
          <asp:GridView ID="GridView1" runat="server" Width=100% 
                                            AutoGenerateColumns="False" 
              HorizontalAlign="Center" EnableModelValidation="True">
                                            <Columns>
								                <asp:TemplateField HeaderText="一、选择题">
									                <ItemTemplate>
										                <TABLE id="Table2" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
											                <TR>
												                <TD colSpan="3">
													                <asp:Label id=Label1 runat="server" Text='<%# Container.DataItemIndex+1 %>'>
													                </asp:Label>
													                <asp:Label id=Label2 runat="server" Text='<%# Eval("Title","、{0}") %>'>
													                </asp:Label>
													                <asp:Label id=Label3 runat="server" Text='<%# Eval("ID") %>' Visible="False">
													                </asp:Label>
													                </TD>
											                </TR>
											                <TR>
												                <TD width="35%">
													                <asp:RadioButton id=RadioButton1 runat="server" Text='<%# Eval("AnswerA") %>' GroupName="Sl">
													                </asp:RadioButton></TD>
												                <TD width="35%">
													                <asp:RadioButton id=RadioButton2 runat="server" Text='<%# Eval("AnswerB") %>' GroupName="Sl">
													                </asp:RadioButton></TD>
												                <TD></TD>
											                </TR>
											                <TR>
												                <TD width="35%">
													                <asp:RadioButton id=RadioButton3 runat="server" Text='<%# Eval("AnswerC") %>' GroupName="Sl">
													                </asp:RadioButton></TD>
												                <TD width="35%">
													                <asp:RadioButton id=RadioButton4 runat="server" Text='<%# Eval("AnswerD") %>' GroupName="Sl">
													                </asp:RadioButton></TD>
												                <TD></TD>
											                </TR>
										                </TABLE>
									                </ItemTemplate>
								                    <HeaderStyle Height="20px" />
								                </asp:TemplateField>
							                </Columns>
                                            <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" />
                                        </asp:GridView>
        </div>
        <div class="clear"></div>

      <div class="view">
          <asp:GridView ID="GridView2" runat="server" Width=100% 
                                            AutoGenerateColumns="False" HorizontalAlign="Center" 
              EnableModelValidation="True">
                                            <Columns>
								                <asp:TemplateField HeaderText="二、多选题">
									                <ItemTemplate>
										                <TABLE id="Table3" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
											                <TR>
												                <TD colSpan="3">
													                <asp:Label id=Label9 runat="server" Text='<%# Container.DataItemIndex+1 %>'>
													                </asp:Label>
													                <asp:Label id=Label10 runat="server" Text='<%# Eval("Title","、{0}") %>'>
													                </asp:Label>
													                <asp:Label id=Label6 runat="server" Text='<%# Eval("ID") %>' Visible="False">
													                </asp:Label>
													                </TD>
											                </TR>
											                <TR>
												                <TD style="HEIGHT: 22px" width="35%">
													                <asp:CheckBox id=CheckBox1 runat="server" Text='<%# Eval("AnswerA") %>'>
													                </asp:CheckBox></TD>
												                <TD style="HEIGHT: 22px" width="35%">
													                <asp:CheckBox id=CheckBox2 runat="server" Text='<%# Eval("AnswerB") %>'>
													                </asp:CheckBox></TD>
												                <TD style="HEIGHT: 22px"></TD>
											                </TR>
											                <TR>
												                <TD width="35%">
													                <asp:CheckBox id=CheckBox3 runat="server" Text='<%# Eval("AnswerC") %>'>
													                </asp:CheckBox></TD>
												                <TD width="350%">
													                <asp:CheckBox id=CheckBox4 runat="server" Text='<%# Eval("AnswerD") %>'>
													                </asp:CheckBox></TD>
												                <TD></TD>
											                </TR>
										                </TABLE>
									                </ItemTemplate>
								                </asp:TemplateField>
							                </Columns>
                                            <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" />
                                        </asp:GridView>
        </div>
       <div class="clear"></div>
      <div class="view_1">
          <asp:GridView ID="GridView3" runat="server" Width=100% 
                                            AutoGenerateColumns="False" HorizontalAlign="Center" 
              EnableModelValidation="True">
                                            <Columns>
								                <asp:TemplateField HeaderText="三、判断题">
									                <ItemTemplate>
										                <TABLE id="Table4" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
											                <TR>
												                <TD width="85%">
													                <asp:Label id=Label19 runat="server" Text='<%# Container.DataItemIndex+1 %>'>
													                </asp:Label>
													                <asp:Label id=Label20 runat="server" Text='<%# Eval("Title","、{0}") %>'>
													                </asp:Label>
													                <asp:Label id=Label7 runat="server" Text='<%# Eval("ID") %>' Visible="False">
													                </asp:Label>
													                </TD>
												                <TD width="15%">
													                <asp:RadioButtonList ID="RadioButtonList1" runat="server" name="RadioButtonList1"
                                                RepeatDirection="Horizontal">
                                                <asp:ListItem Value="true">正确</asp:ListItem>
                                                <asp:ListItem Value="false">错误</asp:ListItem>
                                            </asp:RadioButtonList></TD>
											                </TR>
										                </TABLE>
									                </ItemTemplate>
								                </asp:TemplateField>
							                </Columns>
                                            <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" />
                                        </asp:GridView>
        </div>
        <div class="clear"></div>
        <div class="baocun">
            <asp:ImageButton ID="ImageButton2" runat="server" 
                onclick="ImageButton2_Click" ImageUrl="~/image/Submit.GIF" />
        </div>
    </div>
    </form>
</body>
</html>
