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
    public partial class log_admin : System.Web.UI.Page
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
            DataTable dt1 = new DataTable();
            DataTable dt2 = new DataTable();
            DataTable dt3 = new DataTable();
            DataRow dr;
            dt1.TableName = "project_details";
            dt2.TableName = "log";
            dt3.TableName = "emp_details";
            dt3.Columns.Add(new DataColumn("emp_id", typeof(String)));
            dt3.Columns.Add(new DataColumn("emp_name", typeof(String)));
            dt1.Columns.Add(new DataColumn("project_name", typeof(String)));
            dt1.Columns.Add(new DataColumn("file_name", typeof(String)));
            dt1.Columns.Add(new DataColumn("version", typeof(String)));
            dt2.Columns.Add(new DataColumn("dt1", typeof(String)));
            

            dr = dt1.NewRow();
            dt1.Rows.Add(dr);
            dr = dt2.NewRow();
            dt2.Rows.Add(dr);
            dr = dt3.NewRow();
            dt3.Rows.Add(dr);
            ViewState["project_details"] = dt1;
            ViewState["log"] = dt2;
            ViewState["emp_details"] = dt3;
            //display_view.DataSource = dt;
            logAdmin_view.DataBind();

        }

        protected void home_btn_Click(object sender, EventArgs e)
        {
            if (Session["userlogin"] != null)
            {
                Response.Redirect("home_admin.aspx");
            }
        }

        protected void logOut_btn_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("logIn.aspx");
        }
    }
}