using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab3
{
    public partial class CustomerHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Customer"] != null)
            {

            }
            else
            {
                Session["InvalidUse"] = "You must login to access the website";
                Response.Redirect("CustomerLogin.aspx");
            }

        }

        protected void ServiceStart_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerServiceRequest.aspx");
        }
    }
}