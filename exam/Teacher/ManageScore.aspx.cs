using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin1_ManageScore : System.Web.UI.Page
{
    Datacon dataconn = new Datacon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dataconn.bindinfostring(GridView1, "select * from student_score where teacher_id='"+Session["ID"]+"'", "ID");

        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox1.Text == "")
        {
            dataconn.bindinfostring(GridView1, "select * from student_score where teacher_id='" + Session["ID"] + "' ", "ID");
        }
        else
        {
            dataconn.bind(GridView1, "select * from student_score where teacher_id='" + Session["ID"] + "' and " + DropDownList1.SelectedValue + "  Like'%" + TextBox1.Text + "%'");
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        dataconn.bindinfostring(GridView1, "select * from student_score where teacher_id='" + Session["ID"] + "'", "ID");
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        dataconn.eccom("delete from Score where UserID='" + GridView1.DataKeys[e.RowIndex].Value + "'");
        Response.Redirect("ManageScore.aspx");
    }
}