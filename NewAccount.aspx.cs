using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Lab3
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CreateAccountBtn_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnect = new SqlConnection(" Server=Localhost;Database=Lab3;Trusted_Connection=Yes; ");
            sqlConnect.Open();
            string sqlquery = "INSERT INTO [InitialCustomer] (CustomerName,Email,Address,Phone) VALUES (@CustomerName,@Email,@Address,@Phone)";
            
            SqlCommand cmd = new SqlCommand(sqlquery, sqlConnect);

            string customerName = HttpUtility.HtmlEncode(NameTxt.Text);
            cmd.Parameters.AddWithValue("CustomerName", customerName);

            string email = HttpUtility.HtmlEncode(EmailTxt.Text);
            cmd.Parameters.AddWithValue("Email", email);

            string address = HttpUtility.HtmlEncode(Address.Text);
            cmd.Parameters.AddWithValue("Address", address);

            string phoneNum = HttpUtility.HtmlEncode(Phone.Text);
            cmd.Parameters.AddWithValue("Phone", phoneNum);

            cmd.ExecuteNonQuery();
            sqlConnect.Close();

            //Insert into AUTH table 
            if (NameTxt.Text != "" && Password.Text != "" && EmailTxt.Text != "") // all fields must be filled out
            {
                // COMMIT VALUES
                try
                {
                    SqlConnection sc = new SqlConnection(" Server=Localhost;Database=AUTH;Trusted_Connection=Yes; ");

                    sc.Open();

                    SqlCommand createUser = new SqlCommand();
                    createUser.Connection = sc;
                    // INSERT USER RECORD
                    createUser.CommandText = "INSERT INTO Customer (CustomerName, Username) VALUES (@CustomerName, @Username)";
                    createUser.Parameters.Add(new SqlParameter("@CustomerName", HttpUtility.HtmlEncode(NameTxt.Text)));
                    createUser.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(EmailTxt.Text)));
                    createUser.ExecuteNonQuery();

                    SqlCommand setPass = new SqlCommand();
                    setPass.Connection = sc;

                    // INSERT PASSWORD RECORD AND CONNECT TO USER
                    setPass.CommandText = "INSERT INTO Pass (UserID, Username, PasswordHash) VALUES ((select max(userid) from Customer), @Username, @Password)";
                    setPass.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(EmailTxt.Text)));
                    setPass.Parameters.Add(new SqlParameter("@Password", PasswordHash.HashPassword(HttpUtility.HtmlEncode(Password.Text)))); // hash entered password
                    setPass.ExecuteNonQuery();

                    sc.Close();

                    NameTxt.Enabled = false;
                    EmailTxt.Enabled = false;
                    Password.Enabled = false;
                    Address.Enabled = false;
                    CreateAccountBtn.Enabled = false;
                    
                    HomeBtn.Visible = true;
                }
                catch
                {
                    lblStatus.Text = "Database Error - User not committed.";
                }
            }
            else
                lblStatus.Text = "Fill all fields.";
        }

        protected void HomeBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerLogin.aspx");
        }
    }
}
