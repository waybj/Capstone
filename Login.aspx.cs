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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //statement to redirect user to login page before access is granted to other webforms
            if (Request.QueryString.Get("loggedout") == "true")
            {
                loginstate.Text = "User has logged out";
            }
            if (Session["InvalidUse"] != null)
            {
                loginstate.Text = Session["InvalidUse"].ToString();
                loginstate.Font.Bold = true;
                loginstate.ForeColor = Color.Red;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            

            try
            {

            
            SqlConnection con = new SqlConnection(" Server = Localhost; Database = AUTH; Trusted_Connection = Yes; ");

            SqlCommand loginCommand = new SqlCommand();

            loginCommand.Connection = con;
            loginCommand.CommandType = CommandType.StoredProcedure;
            loginCommand.CommandText = "JeremyEzellLab3";

            loginCommand.Parameters.AddWithValue("@Username", HttpUtility.HtmlEncode(useridtxt.Text));
            loginCommand.Parameters.AddWithValue("@PassWord", HttpUtility.HtmlEncode(passwordtxt.Text));

            con.Open();
            SqlDataReader loginResults = loginCommand.ExecuteReader();

            if (loginResults.HasRows) // if the username exists, it will continue
            {
                while (loginResults.Read()) // this will read the single record that matches the entered username
                {
                    string storedHash = loginResults["PasswordHash"].ToString(); // store the database password into this variable

                    if (PasswordHash.ValidatePassword(HttpUtility.HtmlEncode(passwordtxt.Text), storedHash)) // if the entered password matches what is stored, it will show success
                    {
                        Failure.Text = "Success!";
                        LoginBtn.Enabled = false;
                        useridtxt.Enabled = false;
                        passwordtxt.Enabled = false;
                        Session["Username"] = useridtxt.Text;
                        Response.Redirect("Customer.aspx");
                    }
                    else
                        Failure.Text = "Password is wrong.";
                }
            }
            else // if the username doesn't exist, it will show failure
                Failure.Text = "Login failed.";

            con.Close();
        }
            catch
            {
                Failure.Text = "Database Error.";
            }
           
        }
    }
}

        
    
