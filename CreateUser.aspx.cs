using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Library_System
{
    public partial class CreateUser : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlconn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                atShow();
            }
            
        }

        public void atShow()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("account_type", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            txtaccountType.DataValueField = "acid";
            txtaccountType.DataTextField = "account";
            txtaccountType.DataSource = dt;
            txtaccountType.DataBind();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("add_User", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name",txtname.Text);
            cmd.Parameters.AddWithValue("@email",txtEmail.Text);
            cmd.Parameters.AddWithValue("@username",txtUsername.Text);
            cmd.Parameters.AddWithValue("@password",txtPassword.Text);
            cmd.Parameters.AddWithValue("@accountType",txtaccountType.SelectedValue);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("AdminLogin.aspx");

        }

        protected void btnLoginBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }
    }
}