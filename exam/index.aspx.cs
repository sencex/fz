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


public partial class Default2 : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
     
    }
   
    Datacon dataconn = new Datacon();
    private void getcom(int i)
    {
        SqlConnection cn = dataconn.getcon();
        cn.Open();
        SqlCommand com = cn.CreateCommand();
        switch (i)
        {
            case 1:
                com.CommandText = "select count(*) from Student where ID='" + this.TextBox5.Text + "'and PWD='" + this.TextBox6.Text + "'";
                int count1 = Convert.ToInt32(com.ExecuteScalar());
                if (count1 > 0)
                {
                    Session["ID"] = TextBox5.Text;
                    Session["PWD"] = TextBox6.Text;
                    Response.Redirect("User/or.aspx");
                }
                else
                {
                    Response.Write("<script language=javascript>alert('用户名或密码错误！')</script>");
                    

                }
                break;
            case 2:
                com.CommandText = "select count(*) from Admin where name='" + TextBox5.Text + "'and PWD='" + TextBox6.Text + "'";
                int count2 = Convert.ToInt32(com.ExecuteScalar());
                if (count2 > 0)
                {
                    Session["ID"] = TextBox5.Text;
                    Session["PWD"] = TextBox6.Text;
                    Page.Response.Redirect("Admin/admin.aspx");
                }
                else
                {
                    Response.Write("<script>alert('用户名或密码错误！')</script>");
                    Response.Write("<script language=javascript>window.location.href='Index.aspx'</script>");

                }
                break;
            case 3:
                com.CommandText = "select count(*) from Teacher where id='" + this.TextBox5.Text + "'and pwd='" + this.TextBox6.Text + "'";
                int count3 = Convert.ToInt32(com.ExecuteScalar());
                if (count3 > 0)
                {
                    Session["ID"] = TextBox5.Text;
                    Session["PWD"] = TextBox6.Text;
                    Response.Redirect("Teacher/teacher.aspx");
                }
                else
                {
                    Response.Write("<script language=javascript>alert('用户名或密码错误！')</script>");
                    Response.Write("<script language=javascript>window.location.href='Index.aspx'</script>");

                }
                break;
        }
    }
  
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        HttpCookieCollection checkCode = Request.Cookies;
        //string a = TextBox7.Text;
        //string b = checkCode["CheckCode"].Value;
        if (TextBox5.Text == "" || TextBox6.Text == "" )
        {
            Response.Write("<script>alert('请输入完整！')</script>");
            Response.Write("<script language=javascript>window.location.href='Index.aspx'</script>");

        }
        //else if (!a.Equals(b, StringComparison.OrdinalIgnoreCase))
        //{
        //    Response.Write("<script>alert('验证码有误！')</script>");
        //    Response.Write("<script language=javascript>window.location.href='Index.aspx'</script>");

        //}
        else
        {
            if (DropDownList1.SelectedValue == "1")
            {
                getcom(1);
            }
            else if(DropDownList1.SelectedValue == "2")
            {
                getcom(2);
            }
            else
           {
                getcom(3);
           }

        }
    

    }
  
}