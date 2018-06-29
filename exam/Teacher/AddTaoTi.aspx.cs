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
            db.ecDropDownList(ddlCourse, "select * from Course where teacher_id='" + Session["ID"] + "'", "c_name", "c_id");
        }
            ImageButton2.Visible = false;

            Rscore();
            double num = Convert.ToDouble(Label21.Text);

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        double num = Convert.ToDouble(Label21.Text);
        if (num <= 100)
        {
            string GridView1Str = "select top " + int.Parse(SingleNum.Text.Trim()) + " * from SingleProblem where c_id='" + ddlCourse.SelectedValue + " ' order by newid()";//根据参数设置查询单选题Sql语句
            DataSet ds1 = db.GetDataSetSql(GridView1Str);//调用DataBase类方法GetDataSetSql方法查询数据
            GridView1.DataSource = ds1.Tables[0].DefaultView;//为单选题GridView控件指名数据源
            GridView1.DataBind();//绑定数据
            string GridView2Str = "select top " + int.Parse(MultiNum.Text.Trim()) + " * from MultiProblem where c_id='" + ddlCourse.SelectedValue + " ' order by newid()";//根据参数设置查询多选题Sql语句
            DataSet ds2 = db.GetDataSetSql(GridView2Str);//调用DataBase类方法GetDataSetSql方法查询数据
            GridView2.DataSource = ds2.Tables[0].DefaultView;//为多选题GridView控件指名数据源
            GridView2.DataBind();//绑定数据
            string GridView3Str = "select top " + int.Parse(JudgeNum.Text.Trim()) + " * from JudgeProblem  where c_id='" + ddlCourse.SelectedValue + " ' order by newid()";//根据参数设置查询判断题Sql语句
            DataSet ds3 = db.GetDataSetSql(GridView3Str);//调用DataBase类方法GetDataSetSql方法查询数据
            GridView3.DataSource = ds3.Tables[0].DefaultView;//为判断题GridView控件指名数据源
            GridView3.DataBind();//绑定数据
            ImageButton2.Visible = true;
        }
        else
        {
            Response.Write("<script>alert('分数大于了100分,请重新选择！')</script>");
        }
   
       
    }
    public void Rscore()
    {
    
        double a = Convert.ToDouble(SingleNum.Text);//定义一个变量a，把TextBox1中的值赋给它
        double b = Convert.ToDouble(MultiNum.Text);
        double c = Convert.ToDouble(JudgeNum.Text);
        double a_f = Convert.ToDouble(SingleFen.Text);//定义一个变量a，把TextBox1中的值赋给它
        double b_f = Convert.ToDouble(MultiFen.Text);
        double c_f = Convert.ToDouble(JudgeFen.Text);
        Label21.Text = Convert.ToString(a * a_f + b * b_f + c * c_f);

    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Datacon db = new Datacon();
        string insertpaper = "insert into TaoTi(c_id,PaperName,PaperState,JoinTime,AnswerTime,Score,teacher_id) values(" + int.Parse(ddlCourse.SelectedValue) + ",'" + txtPaperName.Text + "','" + DropDownList2.SelectedValue + "','" + DateTime.Now.ToString() + "','" + DropDownList1.SelectedValue + "', '" + Label21.Text + "','" + Session["ID"] + "')";
        int afterID = db.GetIDInsert(insertpaper);//保存试卷，并返回自动生成的试卷编号
        if (afterID > 0)
        {
            foreach (GridViewRow dr in GridView1.Rows)//保存试卷单选题信息
            {
                string single = "insert into TaoTiDetail(PaperID,Type,TitleID,Mark) values(" + afterID + ",'单选题'," + int.Parse(((Label)dr.FindControl("Label3")).Text) + "," + int.Parse(SingleFen.Text) + ")";
                db.Insert(single);
            }
            foreach (GridViewRow dr in GridView2.Rows)//保存试卷多选题信息
            {
                string multi = "insert into TaoTiDetail(PaperID,Type,TitleID,Mark) values(" + afterID + ",'多选题'," + int.Parse(((Label)dr.FindControl("Label6")).Text) + "," + int.Parse(MultiFen.Text) + ")";
                db.Insert(multi);
            }
            foreach (GridViewRow dr in GridView3.Rows)//保存试卷判断题信息
            {
                string judge = "insert into TaoTiDetail(PaperID,Type,TitleID,Mark) values(" + afterID + ",'判断题'," + int.Parse(((Label)dr.FindControl("Label7")).Text) + "," + int.Parse(JudgeFen.Text) + ")";
                db.Insert(judge);
            }

        }
        Response.Write("<script>alert('添加成功！')</script>");
        Response.Write("<script>window.location.href='AddTaoTi.aspx'</script>");
    }
}