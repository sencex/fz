using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin1_Default2 : System.Web.UI.Page
{
    Datacon dataconn = new Datacon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["ID"] == null)
            {
                Response.Write("<script>alert('非法登录！');location='../Index.aspx'</script>");
            }
            else
            {
                dataconn.bindinfostring(gvQueInfo, "select * from SingleProblem where c_id in(select c_id from Course where teacher_id='"+Session["ID"]+"')  order by ID DESC", "ID");
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
            dataconn.bindinfostring(gvQueInfo, "select * from SingleProblem where c_id in(select c_id from Course where teacher_id='" + Session["ID"] + "')  order by ID DESC", "ID");

        }
        else
        {
            dataconn.bind(gvQueInfo, "select * from SingleProblem where c_id in(select c_id from Course where teacher_id='" + Session["ID"] + "') and " + DropDownList1.SelectedValue + " Like'%" + TextBox1.Text + "%'");
        }
    }
    protected void gvQueInfo_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Session["Name"] = DropDownList1.SelectedValue;
        Response.Redirect("ChangeDanXuan.aspx");
    }
    protected void gvQueInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        dataconn.eccom("delete from SingleProblem where ID='" + gvQueInfo.DataKeys[e.RowIndex].Value + "'");
        Response.Redirect("ManageDanXuan.aspx");
    }
    protected void gvQueInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvQueInfo.PageIndex = e.NewPageIndex;
        if (TextBox1.Text == "")
        {
            dataconn.bindinfostring(gvQueInfo, "select * from SingleProblem where c_id in(select c_id from Course where teacher_id='" + Session["ID"] + "')  order by ID DESC", "ID");

        }
        else
        {
            dataconn.bind(gvQueInfo, "select * from SingleProblem where c_id in(select c_id from Course where teacher_id='" + Session["ID"] + "') and " + DropDownList1.SelectedValue + " Like'%" + TextBox1.Text + "%'");
        }
    }
}