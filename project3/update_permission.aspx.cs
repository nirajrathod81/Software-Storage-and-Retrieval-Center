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
    public partial class update_permission : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["fileid"] != null && Session["userlogin"]!=null)
            {
                string file_id = Session["fileid"].ToString();
                
               // string q = "select * from permission where file_ID='"+ file_id +"'";

                DataTable dt = new DataTable();
                DataRow dr;
                dt.TableName = "emp_details";

                //DataTable dt1 = new DataTable();
                //DataRow dr1;
                //dt1.TableName = "permission";

                //dt1.Columns.Add(new DataColumn("emp_id", typeof(Boolean)));
                //dt1.Columns.Add(new DataColumn("emp_name", typeof(String)));

                dt.Columns.Add(new DataColumn("emp_id", typeof(String)));
                dt.Columns.Add(new DataColumn("emp_name", typeof(String)));

               // dr1 = dt1.NewRow();
                dr = dt.NewRow();
                dt.Rows.Add(dr);
                ViewState["emp_details"] = dt;
                //display_view.DataSource = dt;
               // display_view.DataBind();

            }
        }

        protected void update_btn_Click(object sender, EventArgs e)
        {

            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\Siddharth\Documents\Database1.accdb";
            //OleDbCommand cmd = new OleDbCommand();
            

            if (Session["userlogin"] != null && Session["fileid"] != null)
            {
                con.Open();
                string creator_id = Session["userlogin"].ToString();
                string file_id1 = Session["fileid"].ToString();

                string q = "DELETE FROM permission WHERE file_ID=@file_id ";
                OleDbCommand cmd = new OleDbCommand(q, con);
                cmd.Parameters.AddWithValue("@file_id", Session["fileid"].ToString());
                cmd.ExecuteNonQuery();

                for (int i = 0; i < update_per_view.Rows.Count; i++)
                {
                    GridViewRow row = update_per_view.Rows[i];
                    bool isCheck = ((CheckBox)row.FindControl("chkSelect")).Checked;

                    if (isCheck == true)
                    {
                        string per = update_per_view.Rows[i].Cells[1].Text;
                        //  sel.add(per);
                        q = "INSERT INTO permission(file_ID,emp_id,creator) VALUES('" + file_id1 + "','" + per + "','" + creator_id + "')";
                        cmd = new OleDbCommand(q, con);
                        //cmd.Connection = con;
                        cmd.ExecuteNonQuery();
                    }
                }

                //Response.Write(str.ToString());
                con.Close();
                Response.Redirect("home_admin.aspx");
            }
        }

        protected void cancel_btn_Click(object sender, EventArgs e)
        {
            if (Session["userlogin"] != null)
            {
                Response.Redirect("display.aspx");
            }
        }
    }
}