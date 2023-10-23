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
    public partial class SearchBooks : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlconn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                authorShow();
                txtBookList.Items.Insert(0, new ListItem("--Select--", "0"));
                txtBookList.Enabled = false;
            }
        }

        public void authorShow()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Author_Table", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            txtAuthorList.DataValueField = "aid";
            txtAuthorList.DataTextField = "author";
            txtAuthorList.DataSource = dt;
            txtAuthorList.DataBind();
            txtAuthorList.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void bookShow()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Books_Table join Author_Table on authorid = aid where aid='"+txtAuthorList.SelectedValue+"'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            txtBookList.Enabled = true;
            txtBookList.DataValueField = "bid";
            txtBookList.DataTextField = "books";
            txtBookList.DataSource = dt;
            txtBookList.DataBind();
            txtBookList.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        protected void btnSearch_Click1(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Books_Table join Author_Table on authorid = aid where author like '" + txtSearch.Text + "%' or books like '" + txtSearch.Text+ "%'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            gvSearchResult.DataSource = dt;
            gvSearchResult.DataBind();

            if (dt.Rows.Count > 0)
            {
                lblMsg.Text = dt.Rows.Count + " Result Found.";
            }
            else
            {
                lblMsg.Text = "Result Not found...";
            }
        }

        protected void txtAuthorList_SelectedIndexChanged(object sender, EventArgs e)
        {
            bookShow();
        }

        protected void btnSearchDD_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Books_Table join Author_Table on authorid = aid where bid = '" + txtBookList.Text + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            gvSearchResult.DataSource = dt;
            gvSearchResult.DataBind();

            if (dt.Rows.Count > 0)
            {
                lblMsg.Text = dt.Rows.Count + " Result Found.";
            }
            else
            {
                lblMsg.Text = "Result Not found...";
            }
        }
    }
}