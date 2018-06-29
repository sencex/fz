using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class Admin1_Default2 : System.Web.UI.Page
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
                dataconn.bindinfostring(GridView1, "select * from Course where teacher_id='" + Session["ID"] + "'", "c_name" );
            }
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox1.Text == "")
        {
            dataconn.bindinfostring(GridView1, "select * from Course where teacher_id='" + Session["ID"] + "'", "c_name");
        }
        else
        {
            dataconn.bind(GridView1, "select * from  Course  where  teacher_id='" + Session["ID"] + "'and " + DropDownList1.SelectedValue + " Like '%" + TextBox1.Text + "%'");
        }

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        dataconn.bindinfostring(GridView1, "select * from Course where teacher_id='" + Session["ID"] + "'", "c_name");

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        dataconn.eccom("delete from Course where c_name='" + GridView1.DataKeys[e.RowIndex].Value + "'");
        Response.Redirect("ManageCourse.aspx");
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        dataconn.bind(GridView1, "select * from Course where teacher_id='" + Session["ID"] + "' order by c_id DESC");
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection cn = dataconn.getcon();
        cn.Open();
        int id = int.Parse(((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString());
        string c_name = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString();
        string c_date = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString();
        SqlDataReader dr;
        string sql = "Update Course Set c_name='" + c_name + "',c_date='" + c_date + "'  Where c_id=" + id + "";
        SqlCommand myCommand = new SqlCommand(sql, cn);
        dr = myCommand.ExecuteReader();
        GridView1.EditIndex = -1;
        cn.Close();
        dataconn.bind(GridView1, "select * from Course where teacher_id='" + Session["ID"] + "' order by c_id DESC");
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        dataconn.bind(GridView1, "select * from Course where teacher_id='" + Session["ID"] + "' order by c_id DESC");
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
                dataconn.eccom("delete from Course where c_id='" + GridView1.DataKeys[gr.RowIndex].Value + "'");

            }

        }
        Response.Write("<script>alert('删除成功');</script>");
        Response.Redirect("ManageStudent.aspx");
    }
  
}