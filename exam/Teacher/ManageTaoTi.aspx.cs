using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using MyWeb.BusinessLogicLayer;


public partial class Admin1_Default : System.Web.UI.Page
{
    Datacon dataconn = new Datacon();
    protected void Page_Load(object sender, EventArgs e)
    {
        ImageButton4.Attributes.Add("onclick", "javascript:return window.confirm('您确定要删除选中项吗?')");
        if (!IsPostBack)
        {
            if (Session["ID"] == null)
            {
                Response.Write("<script>alert('非法登录！');location='../Index.aspx'</script>");
            }
            else
            {
                dataconn.bindinfostring(GridView1, "select * from TaoTi where teacher_id='" + Session["ID"] + "' order by PaperID DESC", "PaperID");
            }
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox1.Text == "")
        {
            dataconn.bindinfostring(GridView1, "select * from TaoTi where teacher_id='" + Session["ID"] + "' order by PaperID DESC", "PaperID");
        }
        else
        {
            dataconn.bind(GridView1, "select * from TaoTi where teacher_id='" + Session["ID"] + "'and " + DropDownList1.SelectedValue + "   Like'%" + TextBox1.Text + "%'");
        }
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        foreach (GridViewRow gr in GridView1.Rows)
        {

            CheckBox ch = (CheckBox)gr.FindControl("CheckBox1");
            if (ch.Checked == true)
            {

                ch.Checked = false;

            }
            else
            {

                ch.Checked = true;

            }

        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        foreach (GridViewRow gr in GridView1.Rows)
        {

            CheckBox ch = (CheckBox)gr.FindControl("CheckBox1");
            ch.Checked = false;

        }
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        foreach (GridViewRow gr in GridView1.Rows)
        {
            CheckBox ch = (CheckBox)gr.FindControl("CheckBox1");
            if (ch.Checked == true)
            {
                dataconn.eccom("delete from TaoTi where PaperID='" + GridView1.DataKeys[gr.RowIndex].Value + "'");

            }

        }
        Response.Write("<script>alert('删除成功');</script>");
        Response.Redirect("ManageTaoTi.aspx");
    }
    protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        dataconn.eccom("delete from TaoTi where PaperID='" + GridView1.DataKeys[e.RowIndex].Value + "'");
        Response.Redirect("ManageTaoTi.aspx");
    }
    protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        dataconn.bind(GridView1, "select * from TaoTi where teacher_id='" + Session["ID"] + "' order by PaperID DESC");
    }
    protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection cn = dataconn.getcon();
        cn.Open();
        int id = int.Parse(GridView1.DataKeys[e.RowIndex].Values[0].ToString());
        string PaperName = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString();
        string PaperState = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString();
        string AnswerTime = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[6].Controls[0])).Text.ToString();
        SqlDataReader dr;
        string sql = "Update TaoTi Set PaperName='" + PaperName + "',PaperState='" + PaperState + "',AnswerTime='" + AnswerTime + "' Where PaperID=" + id + "";
        SqlCommand myCommand = new SqlCommand(sql, cn);
        dr = myCommand.ExecuteReader();
        GridView1.EditIndex = -1;
        cn.Close();
        dataconn.bind(GridView1, "select * from TaoTi where teacher_id='" + Session["ID"] + "' order by PaperID DESC");
    }
   
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        dataconn.bind(GridView1, "select *from TaoTi where "+ DropDownList1.SelectedValue + " Like'%" + TextBox1.Text + "%'");
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        dataconn.bind(GridView1, "select * from TaoTi where teacher_id='" + Session["ID"] + "' order by PaperID DESC");
    }
}