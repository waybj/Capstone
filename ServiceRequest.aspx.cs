using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace test
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //statement to redirect user to login page before access is granted to other webforms
            if (Session["Username"] != null)
            {

            }
            else
            {
                Session["InvalidUse"] = "You must login to access the website";
                Response.Redirect("Login.aspx");
            }

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        //based on the menu selection and pressing the button the user is redirected to the correct ui to enter the information
        protected void Button1_Click(object sender, EventArgs e)
        {
            if(ServiceSelect.SelectedValue == "Move")
            {

                Response.Redirect("Move.aspx");
            }
            else
            {
                Response.Redirect("Auction.aspx");
            }
        }
    }
}