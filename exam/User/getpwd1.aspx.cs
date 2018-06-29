using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class User_Default2 : System.Web.UI.Page
{
    Datacon dataconn = new Datacon();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection cn = dataconn.getcon();
        cn.Open();
        SqlCommand com = new SqlCommand("select count(*) from Student where ID='" + TextBox1.Text + "'", cn);
        int count = Convert.ToInt32(com.ExecuteScalar());
        if (TextBox1.Text == "")
        {
            Response.Write("<script>alert('用户名不能为空');</script>");
        }


        else if (count > 0)
        {
            Session["ID"] = TextBox1.Text;
            Response.Redirect("getpwd2.aspx");
        }
        else
        {
            Response.Write("<script>alert('该用户名不存在');</script>");
            return;
        }
        cn.Close();

    }
}