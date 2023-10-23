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

namespace Library_System
{
    public partial class CreateAuthor : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlconn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void clear()
        {
            txtname.Text = "";
            txtAuthorBio.Text = "";
            txtAuthorimg.AccessKey = "";
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string fname = Path.GetFileName(txtAuthorimg.PostedFile.FileName);
            txtAuthorimg.SaveAs(Server.MapPath("AuthorIMG" +"\\"+ fname));

            con.Open();
            SqlCommand cmd = new SqlCommand("author_insert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@author", txtname.Text);
            cmd.Parameters.AddWithValue("@authorBio", txtAuthorBio.Text);
            cmd.Parameters.AddWithValue("@authorImg", fname);
            cmd.ExecuteNonQuery();
            con.Close();
            clear();
            lblMgs.Text = "Entry Saved Successfully..";
        }
    }
}