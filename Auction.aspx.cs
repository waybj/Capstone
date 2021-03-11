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
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //statement to redirect user to login page before access is granted to other webforms
            if (Session["Username"] != null)
            {

            }
            else
            {
                Session["InvalidUse"] = "Please Login to use site.";
                Response.Redirect("Login.aspx");
            }

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //TextBox1.Text = "Johnny Test";
            
            ServiceCostText.Text = "$40";
            ServiceDate.Text = "10/19/21";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //TextBox1.Text = "";
            ServiceCostText.Text = "";
            ServiceDate.Text = "";
           
        }
        //inserts into service table the user entered information through a query
        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnect = new SqlConnection(" Server=Localhost;Database=Lab3;Trusted_Connection=Yes; ");
            sqlConnect.Open();
            string sqlquery = "INSERT INTO [Service] (ServiceDate,ServiceCost,ServiceName,Owner,EmployeeContact) VALUES (@ServiceDate,@ServiceCost,@ServiceName,@Owner,@Contact)";
            SqlCommand cmd = new SqlCommand(sqlquery, sqlConnect);
            cmd.Parameters.AddWithValue("Owner", CustomerListDropDown.SelectedValue);
            cmd.Parameters.AddWithValue("Contact", EmployeeContacttext.SelectedValue);

            cmd.Parameters.AddWithValue("ServiceName", "Auction");
            string Date = ServiceDate.Text;
            cmd.Parameters.AddWithValue("ServiceDate", Date);

            string ServiceCost = ServiceCostText.Text;
            cmd.Parameters.AddWithValue("ServiceCost", ServiceCost);

            cmd.ExecuteNonQuery();
            
            //inserts into workflow information from the other tables using the foreign keys to provide a complete workflow for autions
            string sqlquery2 = "INSERT INTO [Workflow] (CustomerID,EmployeeID,ServiceID,CustomerDate,Status) VALUES ((SELECT CustomerID FROM [Customer] Where CustomerID = @CustomerID),(SELECT EmployeeID FROM [Employee] Where EmployeeID = @EmployeeID), (SELECT TOP 1 Service.ServiceID FROM Service, Customer WHERE Customer.CustomerID = @CustomerID AND Service.ServiceDate = @ServiceDate ORDER BY Service.ServiceID DESC),@CustomerDate,'Active')";

            SqlCommand cmd2 = new SqlCommand(sqlquery2, sqlConnect);

            cmd2.Parameters.AddWithValue("CustomerID", CustomerListDropDown.SelectedValue);
            cmd2.Parameters.AddWithValue("EmployeeID", EmployeeContacttext.SelectedValue);

            string ServiceDate1 = HttpUtility.HtmlEncode(ServiceDate.Text);
            string ServiceDate2 = HttpUtility.HtmlEncode(ServiceDate.Text);
            cmd2.Parameters.AddWithValue("CustomerDate", ServiceDate2);
            cmd2.Parameters.AddWithValue("ServiceDate", ServiceDate1);

            cmd2.ExecuteNonQuery();
            Sucesslabel.Visible = true;
            sqlConnect.Close();

            //edit tickets based on the boxes entered in auction link
            string query2 = "INSERT INTO TicketHistory (ChangeDate,EmployeeID,Status,WorkflowID) VALUES (@ChangeDate,@EmployeeID,@Status,(SELECT TOP 1 WorkflowID FROM [Workflow] ORDER BY workflowID DESC))";
            SqlConnection sqlconnect = new SqlConnection(" Server=Localhost;Database=Lab3;Trusted_Connection=Yes; ");
            sqlconnect.Open();
            SqlCommand cmd3 = new SqlCommand(query2, sqlconnect);

            cmd3.Parameters.AddWithValue("EmployeeID", EmployeeContacttext.SelectedValue);
            cmd3.Parameters.AddWithValue("ChangeDate", Date);
            cmd3.Parameters.AddWithValue("Status", "Active");

            cmd3.ExecuteNonQuery();


            string query3 = "INSERT INTO [Notes] (NoteTitle,NoteBody,WorkflowID) VALUES (@NoteTitle, @NoteBody, (SELECT TOP 1 WorkflowID FROM [Workflow] ORDER BY workflowID DESC))";
            SqlCommand cmd4 = new SqlCommand(query3, sqlconnect);

            string Title = HttpUtility.HtmlEncode(notetitletxt.Text);
            cmd4.Parameters.AddWithValue("NoteTitle", Title);
            string body = HttpUtility.HtmlEncode(notebodytxt.Text);
            cmd4.Parameters.AddWithValue("NoteBody", body);


            cmd4.ExecuteNonQuery();
            sqlconnect.Close();

        }

        protected void TextBox8_TextChanged(object sender, EventArgs e)
        {

        }
    }
}