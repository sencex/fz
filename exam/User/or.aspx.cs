using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_or : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["ID"] == null)
            {
                Response.Write("<script>alert('非法登录！');location='../Index.aspx'</script>");
            }
           
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("attention.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Score.aspx");
    }
}