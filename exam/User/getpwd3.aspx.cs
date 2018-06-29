using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class User_Default4 : System.Web.UI.Page
{
    Datacon dataconn = new Datacon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlConnection con = dataconn.getcon();
            con.Open();
            SqlCommand mycom1 = new SqlCommand("select ID,PWD from Student where ID='" + Convert.ToString(Session["ID"]) + "'", con);
            SqlCommand mycom2 = new SqlCommand("select PWD from Student where ID='" + Convert.ToString(Session["ID"]) + "'", con);
            this.Label1.Text = Convert.ToString(mycom1.ExecuteScalar());
            this.Label2.Text = Convert.ToString(mycom2.ExecuteScalar());
            con.Close();


        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("../index.aspx");
    }
}