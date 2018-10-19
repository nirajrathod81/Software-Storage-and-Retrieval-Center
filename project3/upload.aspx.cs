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
    public partial class upload : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void cancel_button_Click(object sender, EventArgs e)
        {
            if (Session["userlogin"] != null)
            {
                Response.Redirect("home_admin.aspx");
            }
        }

        protected void save_button_Click(object sender, EventArgs e)
        {

            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\Siddharth\Documents\Database1.accdb";
            OleDbCommand cmd = new OleDbCommand();
            if (Session["userlogin"] != null)
            {
                if (project_name.Text != "" && file_name.Text != "" && version.Text != "" && file_upload.HasFile)
                {
                    string filename = Path.GetFileName(file_upload.FileName);
                    file_upload.SaveAs(Server.MapPath("~/Files/") + filename);
                    string filePath = Server.MapPath("~/Files/") + filename; // file name with path.
                    StatusLabel.Text = "Upload status: File uploaded!";
                    Label1.Text = filePath;

                    string creator_id = Session["userlogin"].ToString();
                    //DateTime dt1 = new DateTime();
                    //string dt2=date.Text;
                    //string format = dt2.ToString("dd-mm-yyyy");
                    //DateTime dt1 = DateTime.ParseExact(format,"dd/mm/yyyy",CultureInfo.InvariantCulture);
                    //dt1 = Convert.ToDateTime(dt2);
                    cmd.CommandText = "INSERT INTO project_details(project_name,file_name,version,dt,path,description,creator) VALUES('" + project_name.Text + "','" + file_name.Text + "','" + version.Text + "','" + DateTime.Now + "','" + Label1.Text + "','" + desc.Text + "','" + creator_id + "')";
                    con.Open();
                    cmd.Connection = con;
                    int i = cmd.ExecuteNonQuery();

                    if (i > 0)
                    {
                        Response.Write("<script>alert('Data added successfully');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Data is not added');</script>");
                    }

                    string q = "select file_ID from project_details where project_name='" + project_name.Text + "'and file_name='" + file_name.Text + "'";
                    //Session["fileid"] = file_ID;
                    OleDbDataAdapter da = new OleDbDataAdapter(q, con);// create data adapter
                    DataTable dt = new DataTable();//declare data table
                    DataSet ds = new DataSet();// declare a data set
                    da.Fill(ds, "project_details");
                    dt = ds.Tables["project_details"];

                    if (dt.Rows.Count > 0)//search data is present or not
                    {
                        string fileid = dt.Rows[0]["file_ID"].ToString();
                        Session["fileid"] = fileid;
                    }


                    con.Close();

                    Response.Redirect("permission.aspx");

                }
                else
                {
                    Response.Write("<script>alert('Please fill all the details..!!');</script>");
                }

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
                Response.Redirect("home_admin.aspx");
            }
        }

       
    }
}