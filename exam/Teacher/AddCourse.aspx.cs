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
public partial class Admin1_Default : System.Web.UI.Page
{
    Datacon db = new Datacon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

        SqlDataReader read = db.ExceRead("select * from Course where c_name='" + this.TextBox2.Text + "'");
        read.Read();
        if (read.HasRows)
        {
            if (this.TextBox2.Text == read["c_name"].ToString())
            {
                Response.Write("<script>alert('该用户已存在！')</script>");
                Response.Write("<script>window.location.href='AddCourse.aspx'</script>");

            }
        }
        else
        {
            db.eccom("insert into Course(c_name,c_date,teacher_id) values ('" + this.TextBox2.Text + "','" + DateTime.Now.ToString() + "','" +Session["ID"].ToString()+ "')");
            Response.Write("<script>alert('添加成功！')</script>");
            Response.Write("<script>window.location.href='AddCourse.aspx'</script>");
        }
        read.Close();   

         
    }
}