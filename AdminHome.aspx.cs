using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_System
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateAuthor_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateAuthor.aspx");
        }

        protected void btnViewAuthors_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListAuthors.aspx");
        }

        protected void btnCreateBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateBooks.aspx");
        }

        protected void btnViewBookList_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListBooks.aspx");
        }
    }
}