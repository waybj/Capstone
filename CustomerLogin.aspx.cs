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
using Lab2;

namespace Lab3
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
           

            // connect to database to retrieve stored password string
            try
            {
                SqlConnection sc = new SqlConnection("Server = Localhost; Database = AUTH; Trusted_Connection = Yes;");

                sc.Open();
                System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
                findPass.Connection = sc;
                // SELECT PASSWORD STRING WHERE THE ENTERED USERNAME MATCHES
                findPass.CommandText = "SELECT PasswordHash FROM Pass WHERE Username = @Username";
                findPass.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(useridtxt.Text)));

                SqlDataReader reader = findPass.ExecuteReader(); // create a reader

                if (reader.HasRows) // if the username exists, it will continue
                {
                    while (reader.Read()) // this will read the single record that matches the entered username
                    {
                        string storedHash = reader["PasswordHash"].ToString(); // store the database password into this variable

                        if (PasswordHash.ValidatePassword(HttpUtility.HtmlEncode(passwordtxt.Text), storedHash)) // if the entered password matches what is stored, it will show success
                        {
                            Failure.Text = "Success!";
                            LoginBtn.Enabled = false;
                            useridtxt.Enabled = false;
                            passwordtxt.Enabled = false;
                            Session["Customer"] = HttpUtility.HtmlEncode(useridtxt.Text);
                            Response.Redirect("CustomerHome.aspx");
                        }
                        else
                            Failure.Text = "Password is wrong.";
                    }
                }
                else // if the username doesn't exist, it will show failure
                    Failure.Text = "Login failed.";

                sc.Close();
            }
            catch
            {
                Failure.Text = "Database Error.";
            }
        }













        protected void NewAccountBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewAccount.aspx");
        }
    }
}

