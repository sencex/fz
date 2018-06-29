using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class User_Default3 : System.Web.UI.Page
{
    Datacon dataconn = new Datacon();
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection cn = dataconn.getcon();
        cn.Open();
        //string str = "select Question from tb_Student where ID='" + Convert.ToString(Session["ID"]) + "'";


        if (!IsPostBack)
        {

            SqlCommand mycom = new SqlCommand("select question from Student  where ID='"
           + Convert.ToString(Session["ID"]) + "'", cn);
            this.Label2.Text = Convert.ToString(mycom.ExecuteScalar());
            cn.Close();
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection cn = dataconn.getcon();
        cn.Open();
        SqlCommand com = new SqlCommand("select count(*) from Student where answer='"
            + TextBox1.Text + "'and ID='" + Convert.ToString(Session["ID"]) + "'", cn);
        int count = Convert.ToInt32(com.ExecuteScalar());
        if (count > 0)
        {
            Response.Redirect("getpwd3.aspx");
        }
        else
        {
            Response.Write("<script>alert('提示问题答案输入有误！');</script>");
            return;
        }
        cn.Close();
    }
}