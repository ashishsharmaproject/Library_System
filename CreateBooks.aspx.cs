using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Xml.Linq;

namespace Library_System
{
    public partial class CreateBooks : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlconn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AuthorShow();
            }

            if (Request.QueryString["pp"] != null)
            {
                if (!IsPostBack)
                {
                    Editfn();
                }
            }
            
        }

        public void clear()
        {
            txtbookname.Text = "";
            txtbookDescription.Text = "";
            txtbookimg.AccessKey = null;
        }
        public void AuthorShow()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("author_select", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            txtauthor.DataValueField = "aid";
            txtauthor.DataTextField = "author";
            txtauthor.DataSource = dt;
            txtauthor.DataBind();
        }
        
        public void Editfn()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("edit_Book", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", Request.QueryString["pp"]);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            txtauthor.Text = dt.Rows[0]["author"].ToString();
            txtbookname.Text = dt.Rows[0]["books"].ToString();
            txtbookDescription.Text = dt.Rows[0]["booksDes"].ToString();
            btnsubmit.Text = "Update";

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if(btnsubmit.Text == "Submit")
            {
                string bImage = Path.GetFileName(txtbookimg.PostedFile.FileName);
                txtbookimg.SaveAs(Server.MapPath("BooksIMG" + "\\" + bImage));
                con.Open();
                SqlCommand cmd = new SqlCommand("add_Book", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@authorid", txtauthor.SelectedValue);
                cmd.Parameters.AddWithValue("@books", txtbookname.Text);
                cmd.Parameters.AddWithValue("@booksDes", txtbookDescription.Text);
                cmd.Parameters.AddWithValue("@booksImg", bImage);
                cmd.ExecuteNonQuery();
                con.Close();
                btnsubmit.Text = "Submited..";
                lblMsg.Text = "Entry Saved Successfully.......!";
                clear();
            }
            else if (btnsubmit.Text == "Update")
            {
                string bImage = Path.GetFileName(txtbookimg.PostedFile.FileName);
                txtbookimg.SaveAs(Server.MapPath("BooksIMG" + "\\" + bImage));
                con.Open();
                SqlCommand cmd = new SqlCommand("update_Book", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@authorid", txtauthor.SelectedValue);
                cmd.Parameters.AddWithValue("@books", txtbookname.Text);
                cmd.Parameters.AddWithValue("@booksDes", txtbookDescription.Text);
                cmd.Parameters.AddWithValue("@booksImg", bImage);
                cmd.Parameters.AddWithValue("@id", Request.QueryString["pp"]);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("ListBooks.aspx");
            }
        }
    }
}