using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class Admin1_Default : System.Web.UI.Page
{
    Datacon dataconn = new Datacon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           if (Session["ID"] == null)
            {
                Response.Write("<script>alert('非法登录！');location='../Index.aspx'</script>");
            }
            else
            {
                SqlConnection cn = dataconn.getcon();
                cn.Open();
                string sqlstr1 = "select Name from Admin where name='" + Session["ID"] + "'";
                SqlCommand cmd1 = new SqlCommand(sqlstr1, cn);
                Label3.Text = cmd1.ExecuteScalar().ToString();
               
            }
        }
      
    }
   
}