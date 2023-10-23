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
    public partial class ListBooks : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlconn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvBookShow();
            }
        }

        public void gvBookShow()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("books_list", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            gvBookReport.DataSource = dt;
            gvBookReport.DataBind();
        }

        protected void gvBookReport_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "A")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("books_delete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                gvBookShow();
            }
            else if(e.CommandName == "B")
            {
                Response.Redirect("CreateBooks.aspx?pp=" + e.CommandArgument);
            }
            
        }

        protected void btnHomePageBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }
    }
}