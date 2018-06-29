using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Score : System.Web.UI.Page
{
    Datacon dataconn = new Datacon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dataconn.bindinfostring(GridView1, "select * from student_score where ID='" + Session["ID"] + "' ", "ID");

        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox1.Text == "")
        {
            dataconn.bindinfostring(GridView1, "select * from student_score  where ID='" + Session["ID"] + "'", "ID");
        }
        else
        {
            dataconn.bind(GridView1, "select * from student_score  where ID='" + Session["ID"] + "'and " + DropDownList1.SelectedValue + "  Like'%" + TextBox1.Text + "%'");
        }
    }
 
 
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        dataconn.bindinfostring(GridView1, "select * from student_score where ID='" + Session["ID"] + "' ", "ID");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}