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
    public partial class WebForm2 : System.Web.UI.Page
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

            //populating the notification
            if (Session["Notification"] != null)
            {
                SqlConnection sqlConnect = new SqlConnection(" Server=Localhost;Database=Lab3;Trusted_Connection=Yes; ");
                sqlConnect.Open();
                SqlCommand cmd1 = new SqlCommand();
                cmd1.Connection = sqlConnect;
                cmd1.CommandText  = "SELECT NotificationLog.ServiceType, NotificationLog.Date, InitialCustomer.CustomerName, InitialCustomer.Email, InitialCustomer.Address, InitialCustomer.Phone FROM NotificationLog, InitialCustomer WHERE NotificationLog.NotificationCountID = @Count AND NotificationLog.InitialCustomerID = InitialCustomer.InitialCustomerID";

                

                string notification = Session["Notification"].ToString();
                cmd1.Parameters.AddWithValue("Count", notification);

                SqlDataReader reader = cmd1.ExecuteReader();
                while (reader.Read())
                {
                    string CustomerName = reader["CustomerName"].ToString();
                    CustomerNametext.Text = CustomerName;
                    string CustomerPhone = reader["Phone"].ToString();
                    CustomerPhonetext.Text = CustomerPhone;
                    string CustomerEmail = reader["Email"].ToString();
                    if(reader["ServiceType"].ToString() == "Move")
                    {
                        AddressTxt.Visible = false;
                        Addresslbl.Visible = false;
                        originlbl.Visible = true;
                        origintxt.Visible = true;
                        destinationlbl.Visible = true;
                        RequiredFieldValidator3.Visible = false;
                        destinationtxt.Visible = true;
                        string Address = reader["Address"].ToString();
                        origintxt.Text = Address;
                        serviceinterestddl.Enabled = false;
                        Moveandacutionlbl.Visible = true;
                        Moveandacutionlbl.Text = "Move Ticket";
                    }
                    else
                    {
                        if (reader["ServiceType"].ToString() == "Auction")
                        {
                            AddressTxt.Visible = true;
                            Addresslbl.Visible = true;
                            originlbl.Visible = false;
                            origintxt.Visible = false;
                            destinationlbl.Visible = false;
                            destinationtxt.Visible = false;
                            string Address = reader["Address"].ToString();
                            AddressTxt.Text = Address;
                            serviceinterestddl.Enabled = false;
                            Moveandacutionlbl.Visible = true;
                            Moveandacutionlbl.Text = "Auction Ticket";
                        }
                        else
                        {

                        }
                    }
                    

                    newcustemailtext.Text = CustomerEmail;
                    string CustomerAddress = reader["Address"].ToString();
                    AddressTxt.Text = CustomerAddress;
                    string CustomerDate = reader["Date"].ToString();
                    deadlinetxt.Text = CustomerDate;
                }
     
                sqlConnect.Close();
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //test info for populate button

            CustomerNametext.Text = "Johnny Test";
            CustomerPhonetext.Text = "7038675309";
            newcustemailtext.Text = "Jtest@gmail.com";
            deadlinetxt.Text = "8/20/2021";

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //clear button
            CustomerNametext.Text = "";
            CustomerPhonetext.Text = "";
            newcustemailtext.Text = "";
            deadlinetxt.Text = "";
        }

        //button that take user input of new custoemr data and puts it into the customer table
        protected void Button1_Click(object sender, EventArgs e)
        {
        

           
            SqlConnection sqlConnect = new SqlConnection(" Server=Localhost;Database=Lab3;Trusted_Connection=Yes; ");
            sqlConnect.Open();
            string sqlquery = "INSERT INTO [Customer] (CustomerName,CustomerAddress,CustomerPhone,CustomerEmail,EmployeeContact,CustomerInitialContact,CustomerReference,PhoneType,InterestedService,Origin,Destination,DateAndTime,Deadline)";
            sqlquery += " VALUES (@CustomerName, @CustomerAddress,@CustomerPhone,@CustomerEmail,@EmployeeContact,@CustomerInitialContact,@CustomerReference,@PhoneType,@InterestedService,@Origin,@Destination,@DateAndTime,@Deadline)";

            
            SqlCommand cmd = new SqlCommand(sqlquery, sqlConnect);

            string CustomerName = HttpUtility.HtmlEncode(CustomerNametext.Text);
            cmd.Parameters.AddWithValue("CustomerName", CustomerName);
            string CustomerPhone = HttpUtility.HtmlEncode(CustomerPhonetext.Text);
            cmd.Parameters.AddWithValue("CustomerPhone", CustomerPhone);
            string CustomerEmail = HttpUtility.HtmlEncode(newcustemailtext.Text);
            cmd.Parameters.AddWithValue("CustomerEmail", CustomerEmail);
            string employee = InitialContact.SelectedItem.ToString();
            cmd.Parameters.AddWithValue("EmployeeContact", employee);

            string initialcontact = "";
            if (howtheyhearDDL.SelectedValue == "Other")
            {
                initialcontact = HttpUtility.HtmlEncode(othertxt.Text);
            }
            else
            {
                initialcontact = howtheyhearDDL.SelectedItem.ToString();
            }

            cmd.Parameters.AddWithValue("CustomerInitialContact", initialcontact);

            string howheard = HttpUtility.HtmlEncode(howtheyheard.Text);
            cmd.Parameters.AddWithValue("CustomerReference", howheard);
            string phone = phonetypeDDL.SelectedValue;
            cmd.Parameters.AddWithValue("PhoneType", phone);
            string serviceint = serviceinterestddl.SelectedValue;
            cmd.Parameters.AddWithValue("InterestedService", serviceint);

            string CustomerAddress = HttpUtility.HtmlEncode(AddressTxt.Text);
            string origin = HttpUtility.HtmlEncode(origintxt.Text);
            string destination = HttpUtility.HtmlEncode(destinationtxt.Text);

            if (serviceinterestddl.SelectedValue == "Move")
            {
                cmd.Parameters.AddWithValue("Origin", origin);
                cmd.Parameters.AddWithValue("Destination", destination);
                cmd.Parameters.AddWithValue("CustomerAddress", "");
            }
            else
            {
                cmd.Parameters.AddWithValue("Origin", "");
                cmd.Parameters.AddWithValue("Destination", "");
                cmd.Parameters.AddWithValue("CustomerAddress", CustomerAddress);
            }
            string deadline = HttpUtility.HtmlEncode(deadlinetxt.Text);
            cmd.Parameters.AddWithValue("Deadline", deadline);
            cmd.Parameters.AddWithValue("DateAndTime", "2/3/2021");

            DateTime dateTimeVariable = DateTime.Now;
            cmd.Parameters.AddWithValue("Datetime", dateTimeVariable);




            cmd.ExecuteNonQuery();
            Sucesslabel.Visible = true;
            sqlConnect.Close();
        
          



        }

        protected void serviceinterestddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            //inserts ddl for the move or auction service option
            if (serviceinterestddl.SelectedValue == "Move")
            {
                originlbl.Visible = true;
                origintxt.Visible = true;
                destinationlbl.Visible = true;
                destinationtxt.Visible = true;
                Addresslbl.Visible = false;
                AddressTxt.Visible = false;
                RequiredFieldValidator5.Visible = false;
            }
            else
            {
                originlbl.Visible = false;
                origintxt.Visible = false;
                destinationlbl.Visible = false;
                destinationtxt.Visible = false;
                Addresslbl.Visible = true;
                AddressTxt.Visible = true;
            }
        }

        protected void howtheyhearDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(howtheyhearDDL.SelectedValue == "Other")
            {
                otherlbl.Visible = true;
                othertxt.Visible = true;
            }
            else
            {
                otherlbl.Visible = false;
                othertxt.Visible = false;
            }
        
        }
    }
}