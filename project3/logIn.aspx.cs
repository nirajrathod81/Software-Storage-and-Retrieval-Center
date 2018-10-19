using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.Configuration;
using System.Drawing;
using System.IO;
using System.Text;

namespace project3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public string connectionstring = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\Siddharth\Documents\Database1.accdb";
         
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void log_in_Click(object sender, EventArgs e)
        {
           // OleDbConnection con = new OleDbConnection();
         //   public string ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\Siddharth\Documents\Database1.accdb";
          //  con.Open();//Open connection

                    DataTable objdt = new DataTable();
                    objdt = ValidateUserDetail(user_id.Text, pass.Text);
                    if (objdt.Rows.Count > 0)
                    {
                        /*Invoke session value to mantain usee login to other poages
                         For user authentication in secure page
                         */
                       // Session["userlogin"] = user_id.Text;
                        Session["userlogin"] = user_id.Text;
    

                        DataTable _objdt1 = new DataTable();
                        string querystring1 = "select * from emp_details where admin= TRUE and emp_id='" + user_id.Text + "'";
                        OleDbConnection _objcon1 = new OleDbConnection(connectionstring);
                        OleDbDataAdapter _objda1 = new OleDbDataAdapter(querystring1, _objcon1);
                        _objcon1.Open();
                        _objda1.Fill(_objdt1);
                        if(_objdt1.Rows.Count>0)
                         {
                             Session["userlogin"] = user_id.Text;
                             Response.Redirect("home_admin.aspx");
                         }
                         else
                         {
                             Session["userlogin"] = user_id.Text;
                             Response.Redirect("home_user.aspx");
                         }
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Correct", "alert('Wrong user id aand password.')", true);
                    }
                }
                /// <summary>
                /// Function for binding retribing the data from database
                /// </summary>
                /// <returns></returns>
                public DataTable ValidateUserDetail(string userid, string password)
                {
                    DataTable _objdt = new DataTable();
                    string querystring = "select * from emp_details where emp_id='" + userid + "' and password='" + password + "'";
                    OleDbConnection _objcon = new OleDbConnection(connectionstring);
                    OleDbDataAdapter _objda = new OleDbDataAdapter(querystring, _objcon);
                    _objcon.Open();
                    _objda.Fill(_objdt);
                    return _objdt;
        }

                protected void cancel_Click(object sender, EventArgs e)
                {
                    user_id.Text = "";
                    pass.Text = "";
                }

                
    }
}