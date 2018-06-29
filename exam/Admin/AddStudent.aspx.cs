using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class Admin_AddStudent : System.Web.UI.Page
{
    Datacon dataconn = new Datacon();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        SqlDataReader read = dataconn.ExceRead("select *from Student where ID='" + this.txtStuID.Text + "'");
        read.Read();
        if (read.HasRows)
        {
            if (this.txtStuID.Text == read["ID"].ToString())
            {
                Response.Write("<script>alert('该用户已存在！')</script>");
                Response.Write("<script>window.location.href='AddStudent.aspx'</script>");

            }
        }
        else
        {
            dataconn.eccom("insert into Student(ID,Name,PWD,Sex,JoinTime,Question,Answer,profession) values ('" + this.txtStuID.Text + "','" + this.txtStuName.Text + "','" + this.txtStuPwd.Text + "' ,'" + Request["DropDownList1"] + "','" + DateTime.Now.ToString() + "','" + Request["DropDownList3"] + "','" + this.txtAnsPwd.Text + "','" + Request["ddlProfession"] + "')");
            Session["ID"] = txtStuID.Text;
            Session["PWD"] = txtStuPwd.Text;
            Response.Write("<script>alert('添加成功！')</script>");
            Response.Write("<script>window.location.href='AddStudent.aspx'</script>");
        }
        read.Close();   
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Write("<script>window.location.href='zhuce.aspx'</script>");
    }
}