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

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        SqlDataReader read = db.ExceRead("select *from Admin where ID='" + this.TextBox1.Text + "'");
        read.Read();
        if (read.HasRows)
        {
            if (this.TextBox1.Text == read["ID"].ToString())
            {
                Response.Write("<script>alert('该用户已存在！')</script>");
                Response.Write("<script>window.location.href='AddAdmin.aspx'</script>");

            }
        }
        else if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox3.Text == "")
        {
            Response.Write("<script>alert('请填写完整信息！')</script>");
            Response.Write("<script>window.location.href='AddAdmin.aspx'</script>");
        }
        else
        {
            db.eccom("insert into Admin(ID,Name,PWD,JoinTime) values ('" + this.TextBox1.Text + "','" + this.TextBox2.Text + "','" + this.TextBox3.Text + "' ,'" + DateTime.Now.ToString() + "')");

            Response.Write("<script>alert('添加成功！')</script>");
            Response.Write("<script>window.location.href='ManageAdmin.aspx'</script>");
        }
        read.Close();   
    }
}