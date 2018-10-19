using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project3
{
    public partial class home_user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void search_button_Click(object sender, EventArgs e)
        {
            if (Session["userlogin"] != null)
            {
                Response.Redirect("search.aspx");
            }
        }

        protected void log_button_Click(object sender, EventArgs e)
        {
            if (Session["userlogin"] != null)
            {
                Response.Redirect("log_user.aspx");
            }
        }

        protected void change_pass_button_Click(object sender, EventArgs e)
        {
            if (Session["userlogin"] != null)
            {
                Response.Redirect("change_pass.aspx");
            }
        }

        protected void logOut_btn_Click(object sender, EventArgs e)
        {
           Session.Abandon();
           Response.Redirect("logIn.aspx");
        }

    }
}