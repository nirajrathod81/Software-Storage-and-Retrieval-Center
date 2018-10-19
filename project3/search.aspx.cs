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
using System.Globalization;


namespace project3
{
    public partial class search_user : System.Web.UI.Page
    {
        public string connectionstring = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\Siddharth\Documents\Database1.accdb";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkDownload_Click(object sender, EventArgs e)
        {
            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\Siddharth\Documents\Database1.accdb";
            con.Open();//Open connection

            if (Session["userlogin"] != null)
            {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            //string per = gvr.Cells[4].Text;
            
                string pname = gvr.Cells[0].Text;
                string fname = gvr.Cells[1].Text;
                string eid = Session["userlogin"].ToString();
                string cid = gvr.Cells[5].Text;
                //string dt1 = gvr.Cells[3].Text;
               // date.Text = DateTime.Now.ToString();
                //string dt1 = DateTime.Now.ToString();

                string q = "select file_ID,path From project_details where project_name='" + pname + "' and file_name='" + fname + "'";

                OleDbDataAdapter da = new OleDbDataAdapter(q, con);// create data adapter
                DataTable dt = new DataTable();//declare data table
                DataSet ds = new DataSet();// declare a data set
                da.Fill(ds,"project_details");
                dt = ds.Tables["project_details"];

                if (dt.Rows.Count == 1)//search data is present or not
                {
                    string fileid = dt.Rows[0]["file_ID"].ToString();
                    Session["fileid"] = fileid;
                    string per = dt.Rows[0]["path"].ToString();
                    //string fid = Session["fileid"].ToString();
                    //and emp_id='" + eid + "'
                    // file_ID='" + fileid + 
                    //int i= per_check(fileid,eid);
                    //if (i == 1)
                    //DataTable obdt1 = new DataTable();

                    string q1 = "select file_ID from permission where emp_id='" + eid + "'";
                   
                     OleDbDataAdapter da1 = new OleDbDataAdapter(q1, con);// create data adapter
                DataTable odt1 = new DataTable();//declare data table
                DataSet ds1 = new DataSet();// declare a data set
                da1.Fill(ds1,"permission");
                odt1 = ds1.Tables["permission"];
                    int j= odt1.Rows.Count;
                    int i=0;
                    while(i<j && fileid != odt1.Rows[i]["file_ID"].ToString())
                        {
                        i++;
                        }
                                                        
                    if (fileid == odt1.Rows[i]["file_ID"].ToString())
                    {

                        q = "INSERT INTO log(emp_id,file_ID,creator,dt1) VALUES('" + eid + "','" + fileid + "','" + cid + "','" + DateTime.Now + "')";
                        OleDbCommand cmd = new OleDbCommand(q, con);
                        cmd.ExecuteNonQuery();

                        Response.ContentType = ContentType;
                        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(per));
                        Response.WriteFile(per);
                        Response.End();
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Correct", "alert('You are not authorised to download this file!!!')", true);
                    }
                } con.Close();
            }
        }

       protected void search_Click(object sender, EventArgs e)
        {

            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\Siddharth\Documents\Database1.accdb";
            con.Open();//Open connection
            if (Session["userlogin"] != null)
            {
                string strserch = "Select project_name,file_name,version,dt,description,creator From project_details Where project_name='" + project_name.Text + "'";

                OleDbDataAdapter da = new OleDbDataAdapter(strserch, con);// create data adapter
                DataTable dt = new DataTable();//declare data table
                DataSet ds = new DataSet();// declare a data set
                da.Fill(ds, "project_details");//
                dt = ds.Tables["project_details"];

                if (dt.Rows.Count > 0)//search data is present or not
                {
                    project_name.Text = dt.Rows[0]["project_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Data not found..!!');</script>");
                }
            }
            con.Close();
            project_name.Text = "";
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
                   // Session["userlogin"] = userid;
                    Response.Redirect("home_admin.aspx");
                }
                else
                {
                    //Session["userlogin"] = userid;
                    Response.Redirect("home_user.aspx");
                }
            }
        }

        protected void search_view_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}