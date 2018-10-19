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
    public partial class change_passspx : System.Web.UI.Page
    {
        public string connectionstring = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\Siddharth\Documents\Database1.accdb";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void save_btn_Click(object sender, EventArgs e)
        {
            try
          {
                OleDbConnection con = new OleDbConnection();
                con.ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\Siddharth\Documents\Database1.accdb";
                con.Open();
                if (Session["userlogin"] != null)
                  {
                   // string userid = "1001";
                 string userid=Session["userlogin"].ToString();
                 // Label1.Text =Session["userlogin"].ToString();
                 string oldpass= current_pass.Text;
                  string newpass= new_pass.Text;
                  string conpass= confrm_pass.Text;
                  string q = "select * from emp_details where emp_id='" + userid + "' and password='" + oldpass + "'";



                  //OleDbDataAdapter da = new OleDbDataAdapter(q, con);// create data adapter
                  //DataTable dt = new DataTable();//declare data table
                  //DataSet ds = new DataSet();// declare a data set
                  //da.Fill(ds);//

                  OleDbCommand cmd = new OleDbCommand(q, con);
                  cmd.Parameters.AddWithValue("@userid", Session["userlogin"].ToString());
                  cmd.Parameters.AddWithValue("@newpass", new_pass.Text);
                  cmd.Parameters.AddWithValue("@oldpass", current_pass.Text);
                  cmd.Parameters.AddWithValue("@conpass", confrm_pass.Text);

                  OleDbDataReader re = cmd.ExecuteReader();
                  re.Read();
                    //if (dt.Rows.Count > 0)
                        if (re["emp_id"].ToString() != String.Empty && re["password"].ToString() != String.Empty)
                    {
                        if(newpass.Trim() != conpass.Trim())
                        {
                           Response.Write("<script>alert('New Password & old password does not match');</script>");                      
                        }
                        else
                        {
                            string q1 ="update emp_details set [password]='" + newpass + "' where [emp_id]='" + userid + "'";

                            //OleDbDataAdapter da1 = new OleDbDataAdapter(q1, con);// create data adapter
                            //DataTable dt1 = new DataTable();//declare data table
                            //DataSet ds1 = new DataSet();// declare a data set
                            //da1.Fill(ds1);
                          // OleDbCommand cmd1 = new OleDbCommand(q1, con);
                            cmd = new OleDbCommand(q1, con);
                            cmd.Parameters.AddWithValue("@userid", Session["userlogin"].ToString());
                            cmd.Parameters.AddWithValue("@newpass", new_pass.Text);
                            cmd.Parameters.AddWithValue("@oldpass", current_pass.Text);
                            cmd.Parameters.AddWithValue("@conpass", confrm_pass.Text);
                            int count = cmd.ExecuteNonQuery();

                            if (count > 0)
                             {
                                 Response.Write("<script>alert('Password changed successfully..!!');</script>");
                             }
                             else
                             {
                                 Response.Write("<script>alert('Password is not changed');</script>");
                             }
                        }
                    }                                                                
                }
                con.Close();
            }
            catch(Exception ex)
           {
            throw ex;
           }
        }

        protected void logOut_btn_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("logIn.aspx");
        }

        protected void home_btn_Click(object sender, EventArgs e)
        {
            if (Session["userlogin"] != null)
            {
                string userid = Session["userlogin"].ToString();
                DataTable _objdt1 = new DataTable();
                string querystring1 = "select * from emp_details where admin= TRUE and emp_id='" + userid + "'";
                OleDbConnection _objcon1 = new OleDbConnection(connectionstring);
                OleDbDataAdapter _objda1 = new OleDbDataAdapter(querystring1, _objcon1);
                _objcon1.Open();
                _objda1.Fill(_objdt1);
                if (_objdt1.Rows.Count > 0)
                {
                    Session["userlogin"] = userid;
                    Response.Redirect("home_admin.aspx");
                }
                else
                {
                    Session["userlogin"] = userid;
                    Response.Redirect("home_user.aspx");
                }
            }
        }
    }
}