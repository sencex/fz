using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class User_ChangePwd : System.Web.UI.Page
{
    Datacon dataconn = new Datacon();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        String pwd1 = Session["PWD"].ToString();
        if (pwd1 == TextBox1.Text)
        {
            SqlConnection cn = dataconn.getcon();
            cn.Open();
            String pwd = TextBox2.Text;
            SqlDataReader dr;
            string sql = "Update Student Set PWD='" + pwd + "' Where ID=" + Session["ID"] + "";
            SqlCommand myCommand = new SqlCommand(sql, cn);
            dr = myCommand.ExecuteReader();
            cn.Close();
            Response.Write("<script>alert('修改成功！')</script>");
            Response.Write("<script>window.location.href='or.aspx'</script>");

        }

        else
        {

            Response.Write("<script>alert('原密码错误！')</script>");

        }
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Write("<script>window.location.href='or.aspx'</script>");
    }
}