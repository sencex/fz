using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin1_Default : System.Web.UI.Page
{
    Datacon db = new Datacon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            db.ecDropDownList(DropDownList2, "select * from Course where teacher_id='" + Session["ID"] + "'", "c_name", "c_id");          //初始化考试科目下拉列表框          

        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
       
            db.eccom("insert into SingleProblem(c_id,Title,AnswerA,AnswerB,AnswerC,AnswerD,Answer) values('" + Request["DropDownList2"] + "','" + this.TextBox1.Text + "','" + this.TextBox2.Text + "','" + this.TextBox3.Text + "','" + this.TextBox4.Text + "','" + this.TextBox5.Text + "','" + Request["DropDownList1"] + "')");
            Response.Write("<script>alert('添加成功！')</script>");

    }
}