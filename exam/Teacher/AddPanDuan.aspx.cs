using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin1_Default2 : System.Web.UI.Page
{
    Datacon db = new Datacon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            db.ecDropDownList(ddlCourse, "select * from Course where teacher_id='" + Session["ID"] + "'", "c_name", "c_id");          //初始化考试科目下拉列表框          

        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
       
            db.eccom("insert into JudgeProblem(c_id,Title,Answer) values('" + Request["ddlCourse"] + "','" + this.txtTitle.Text + "','" + rblAnswer.SelectedValue + "')");
            Response.Write("<script>alert('添加成功！')</script>");
      
    }
}