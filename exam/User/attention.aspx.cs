using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_attention : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (CheckBox1.Checked)
        {
            Response.Redirect("ChoosePaper.aspx");
        }
        else
        {
            Response.Write("<script>alert('请认真阅读考试规则！')</script>");
            Response.Write("<script>window.location.href='attention.aspx'</script>");
        }
    }
}