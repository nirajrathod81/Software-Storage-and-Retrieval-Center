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
    public partial class permission : System.Web.UI.Page
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
            dt.TableName = "emp_details";
            dt.Columns.Add(new DataColumn("emp_id", typeof(String)));
            dt.Columns.Add(new DataColumn("emp_name", typeof(String)));
            dr = dt.NewRow();
            dt.Rows.Add(dr);
            ViewState["emp_details"] = dt;
            permission_view.DataBind();

            if (Session["userlogin"] != null && Session["fileid"] != null)
            {
                string creator_id = Session["userlogin"].ToString();
                string file_id = Session["fileid"].ToString();
            }

           // Label1.Text = Session["fileid"].ToString();
        }

        protected void save_btn_Click(object sender, EventArgs e)
        {
          //  List sel;
            

            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\Siddharth\Documents\Database1.accdb";
            //OleDbCommand cmd = new OleDbCommand();
            con.Open();

           
            // StringBuilder str = new StringBuilder();
            if (Session["userlogin"] != null && Session["fileid"] != null)
            {
                string creator_id = Session["userlogin"].ToString();
                string file_id = Session["fileid"].ToString();
                
                for (int i = 0; i < permission_view.Rows.Count; i++)
                {
                    GridViewRow row = permission_view.Rows[i];
                    bool isCheck = ((CheckBox)row.FindControl("chkSelect")).Checked;
                    
                    if (isCheck==true)
                    {
                        string per = permission_view.Rows[i].Cells[1].Text;
                        string q = "INSERT INTO permission(file_ID,emp_id,creator) VALUES('" + file_id + "','" + per + "','" + creator_id + "')";
                        OleDbCommand cmd = new OleDbCommand(q,con);
                        cmd.ExecuteNonQuery();

                        
                    }
                }                
            }
            con.Close();
            Response.Redirect("home_admin.aspx");
        }
     }
}