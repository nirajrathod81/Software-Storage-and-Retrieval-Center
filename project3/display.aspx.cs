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
    public partial class display : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["userlogin"]!=null)
            {
                addRecord();
            }
            
        }

        private void addRecord()
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.TableName = "project_details";
            dt.Columns.Add(new DataColumn("project_name", typeof(String)));
            dt.Columns.Add(new DataColumn("file_name", typeof(String)));
            dt.Columns.Add(new DataColumn("version", typeof(String)));
            dt.Columns.Add(new DataColumn("dt", typeof(String)));
            dt.Columns.Add(new DataColumn("path", typeof(String)));
            dt.Columns.Add(new DataColumn("description", typeof(String)));

            dr = dt.NewRow();
            dt.Rows.Add(dr);
            ViewState["project_details"] = dt;
            //display_view.DataSource = dt;
            display_view.DataBind();

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
                Response.Redirect("home_admin.aspx");
            }
        }

        protected void authenticate_Click(object sender, EventArgs e)
        {
            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\Siddharth\Documents\Database1.accdb";
            //OleDbCommand cmd = new OleDbCommand();
            if (Session["userlogin"] != null)
            {
                Button btn = (Button)sender;
                GridViewRow gvr = (GridViewRow)btn.NamingContainer;
                string pname = gvr.Cells[0].Text;
                string fname = gvr.Cells[1].Text;
                string ver = gvr.Cells[2].Text;
                string q = "select file_ID from project_details where project_name='" + pname + "' and file_name='" + fname + "' and version='" + ver + "'";
                con.Open();
                OleDbDataAdapter da = new OleDbDataAdapter(q, con);// create data adapter
                DataTable dt = new DataTable();//declare data table
                DataSet ds = new DataSet();// declare a data set
                da.Fill(ds, "project_details");
                dt = ds.Tables["project_details"];

                if (dt.Rows.Count == 1)//search data is present or not
                {
                    string fileid = dt.Rows[0]["file_ID"].ToString();
                    Session["fileid"] = fileid;
                }

                if (Session["fileid"] != null)
                {
                    //string file_id = Session["fileid"].ToString();
                    Response.Redirect("update_permission.aspx");
                }
            }
            con.Close();
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\Siddharth\Documents\Database1.accdb";
            //OleDbCommand cmd = new OleDbCommand();
            if (Session["userlogin"] != null)
            {
                Button btn = (Button)sender;
                GridViewRow gvr = (GridViewRow)btn.NamingContainer;
                string pname = gvr.Cells[0].Text;
                string fname = gvr.Cells[1].Text;
                string ver = gvr.Cells[2].Text;
                string q = "select file_ID from project_details where project_name='" + pname + "' and file_name='" + fname + "' and version='" + ver + "'";
                con.Open();
                OleDbDataAdapter da = new OleDbDataAdapter(q, con);// create data adapter
                DataTable dt = new DataTable();//declare data table
                DataSet ds = new DataSet();// declare a data set
                da.Fill(ds, "project_details");
                dt = ds.Tables["project_details"];

                if (dt.Rows.Count == 1)//search data is present or not
                {
                    string fileid = dt.Rows[0]["file_ID"].ToString();
                    Session["fileid"] = fileid;
                }

                q = "DELETE FROM project_details WHERE file_ID=@file_id ";
                OleDbCommand cmd = new OleDbCommand(q, con);
                cmd.Parameters.AddWithValue("@file_id", Session["fileid"].ToString());
                cmd.ExecuteNonQuery();

                q = "DELETE FROM permission WHERE file_ID=@file_id ";
                cmd = new OleDbCommand(q, con);
                cmd.Parameters.AddWithValue("@file_id", Session["fileid"].ToString());
                cmd.ExecuteNonQuery();

                q = "DELETE FROM log WHERE file_ID=@file_id ";
                cmd = new OleDbCommand(q, con);
                cmd.Parameters.AddWithValue("@file_id", Session["fileid"].ToString());
                cmd.ExecuteNonQuery();
                
               
            }
            con.Close();
            Response.Redirect("display.aspx");
        }
       
    }
}