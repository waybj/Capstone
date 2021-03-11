using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;

namespace Lab2
{
    public partial class Lab2Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["Username"] != null)
            {
                loggedin.Text = Session["Username"].ToString();
                loggedin.ForeColor = Color.Green;
                loggedin.Font.Bold = true;
                SignOutBtn.Visible = true;
                HomeButton.Visible = true;


            }
            else
            {
                if (Session["Customer"] != null)
                {
                    loggedin.Text = Session["Customer"].ToString();
                    loggedin.ForeColor = Color.Green;
                    loggedin.Font.Bold = true;
                    SignOutBtn.Visible = true;
                    HomeButton.Visible = true;


                }
                else
                {
                    loggedin.Text = " ";
                }
            }
            
        }

        protected void SignOutBtn_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            if (Session["Username"] != null)
            {
                Response.Redirect("Login.aspx?loggedout-true");
            }
            else
            {
               
                Response.Redirect("CustomerLogin.aspx?loggedout=true");
            }
            Response.Redirect("login.aspx?loggedout=true");
        }

        protected void HomeButton_Click(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                Response.Redirect("Customer.aspx");
            }
            else
            {
                if (Session["Customer"] != null)
                {
                    Response.Redirect("CustomerHome.aspx");
                }
                else { }
            }

        }
    }
}