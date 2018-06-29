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
using MyWeb.BusinessLogicLayer;
public partial class User_Exam : System.Web.UI.Page
{

    Datacon dataconn = new Datacon();
    protected void Page_Load(object sender, EventArgs e)
    {

        ImageButton1.Attributes.Add("OnClick", "javascript:return confirm('确实要交卷吗？')");
        ImageButton2.Attributes.Add("OnClick", "javascript:return confirm('确实退出吗？')");
        if (!IsPostBack)
        {

            InitData();
            Label30.Text = Session["PaperName"].ToString();
            Label31.Text = Session["PaperID"].ToString();
            SqlConnection cn = dataconn.getcon();
            cn.Open();
            string sqlstr1 = "select Score from TaoTi where PaperID='" + Session["PaperID"] + "'";
            SqlCommand cmd1 = new SqlCommand(sqlstr1, cn);
            Label34.Text = cmd1.ExecuteScalar().ToString();
            string sqlstr2 = "select JoinTime from TaoTi where PaperID='" + Session["PaperID"] + "'";
            SqlCommand cmd2 = new SqlCommand(sqlstr2, cn);
            Label33.Text = cmd2.ExecuteScalar().ToString();
            string sqlstr3 = "select AnswerTime from TaoTi where PaperID='" + Session["PaperID"] + "'";
            SqlCommand cmd3 = new SqlCommand(sqlstr3, cn);
            Label32.Text = cmd3.ExecuteScalar().ToString();

        }
    }
    protected void InitData()
    {
        SqlParameter[] Params1 = new SqlParameter[2];
        Datacon DB = new Datacon();
        int paperID = int.Parse(Session["PaperID"].ToString());
        Params1[0] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, paperID);               //试卷编号
        Params1[1] = DB.MakeInParam("@Type", SqlDbType.VarChar, 10, "单选题");            //题目类型        
        DataSet ds1 = DB.GetDataSet("Proc_PaperDetail", Params1);
        GridView1.DataSource = ds1;
        GridView1.DataBind();
        if(GridView1.Rows.Count>0)
        ((Label)GridView1.HeaderRow.FindControl("Label27")).Text = ((Label)GridView1.Rows[0].FindControl("Label4")).Text;

        SqlParameter[] Params2 = new SqlParameter[2];
        Params2[0] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, paperID);               //试卷编号
        Params2[1] = DB.MakeInParam("@Type", SqlDbType.VarChar, 10, "多选题");            //题目类型        
        DataSet ds2 = DB.GetDataSet("Proc_PaperDetail", Params2);
        GridView2.DataSource = ds2;
        GridView2.DataBind();
        if (GridView2.Rows.Count > 0)
            ((Label)GridView2.HeaderRow.FindControl("Label28")).Text = ((Label)GridView2.Rows[0].FindControl("Label8")).Text;

        SqlParameter[] Params3 = new SqlParameter[2];
        Params3[0] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, paperID);               //试卷编号
        Params3[1] = DB.MakeInParam("@Type", SqlDbType.VarChar, 10, "判断题");            //题目类型        
        DataSet ds3 = DB.GetDataSet("Proc_PaperDetail", Params3);
        GridView3.DataSource = ds3;
        GridView3.DataBind();
        if (GridView3.Rows.Count > 0)
            ((Label)GridView3.HeaderRow.FindControl("Label29")).Text = ((Label)GridView3.Rows[0].FindControl("Label12")).Text;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {



        int score = 0;
        int tsinglemark = 0;
        int singlemark = int.Parse(((Label)GridView1.Rows[0].FindControl("Label4")).Text);//取出单选题的每题分值
        foreach (GridViewRow dr in GridView1.Rows)//对单选题每题进行判断用户选择答案
        {
            string str = "";
            if (((RadioButton)dr.FindControl("RadioButton1")).Checked)
            {
                str = "A";
            }
            else if (((RadioButton)dr.FindControl("RadioButton2")).Checked)
            {
                str = "B";
            }
            else if (((RadioButton)dr.FindControl("RadioButton3")).Checked)
            {
                str = "C";
            }
            else if (((RadioButton)dr.FindControl("RadioButton4")).Checked)
            {
                str = "D";
            }
            if (((Label)dr.FindControl("Label3")).Text.Trim() == str)//将用户选择结果和答案进行比较
            {
                tsinglemark = tsinglemark + singlemark;
            }

        }
        int tmultimark = 0;
        int multimark = int.Parse(((Label)GridView2.Rows[0].FindControl("Label8")).Text);//取出多选题每题分值
        foreach (GridViewRow dr in GridView2.Rows)//对多选题每题进行判断用户选择答案
        {
            string str = "";
            if (((CheckBox)dr.FindControl("CheckBox1")).Checked)
            {
                str += "A";
            }
            if (((CheckBox)dr.FindControl("CheckBox2")).Checked)
            {
                str += "B";
            }
            if (((CheckBox)dr.FindControl("CheckBox3")).Checked)
            {
                str += "C";
            }
            if (((CheckBox)dr.FindControl("CheckBox4")).Checked)
            {
                str += "D";
            }
            if (((Label)dr.FindControl("Label7")).Text.Trim() == str)//将用户选择结果和答案进行比较
            {
                tmultimark = tmultimark + multimark;
            }

        }
        int tjudgemark = 0;
        int judgemark = int.Parse(((Label)GridView3.Rows[0].FindControl("Label12")).Text);//取出判断题每题分值
        foreach (GridViewRow dr in GridView3.Rows)//对判断题每题进行判断用户选择答案
        {
            RadioButtonList RadioButtonList1 = (RadioButtonList)dr.FindControl("RadioButtonList1");
            bool j;
            if (RadioButtonList1.SelectedValue == "true")
            {
                j = true;
                if (j == bool.Parse(((Label)dr.FindControl("Label11")).Text.Trim()))
                {
                    tjudgemark = tjudgemark + judgemark;
                }
            }
            if (RadioButtonList1.SelectedValue == "false")
            {
                j = false;
                if (j == bool.Parse(((Label)dr.FindControl("Label11")).Text.Trim()))
                {
                    tjudgemark = tjudgemark + judgemark;
                }
            }

        }
        score = tjudgemark + tmultimark + tsinglemark;
        Scores insertScore = new Scores();  //创建Scores类对象
        insertScore.UserID = Session["ID"].ToString();//设置Scores对象的属性
        insertScore.PaperID = int.Parse(Session["PaperID"].ToString());
        insertScore.Score = score;
        insertScore.sscore = tsinglemark;
        insertScore.mscore = tmultimark;
        insertScore.jscore = tjudgemark;
        insertScore.InsertByProc();//调用InsertByProc方法向数据库中插入成绩
        Response.Write("<script>alert('您交卷成功')</script>");
        Response.Redirect("../index.aspx");



    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("../index.aspx");
    }
}