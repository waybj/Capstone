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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {

            }
            else
            {
                Session["InvalidUse"] = "You must login to access the website";
                Response.Redirect("Login.aspx");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            OriginTextBox.Text = "Reston, VA";
            DestinationTextBox.Text = "Blacksburg, VA";
            CustomerDatetext.Text = "1/12/21";
            Budgettext.Text = "$1000";
            ServiceCostText.Text = "$900";
            ItemNametext.Text = "Bed";
            ItemDescriptiontext.Text = "Big";
            ItemCosttext.Text = "$100";

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            OriginTextBox.Text = "";
            DestinationTextBox.Text = "";
            CustomerDatetext.Text = "";
            Budgettext.Text = "";
            ServiceCostText.Text = "";
            ItemNametext.Text = "";
            ItemDescriptiontext.Text = "";
            ItemCosttext.Text = "";
        }
        //using the service table inserting information for the user to enter into the ui to be entered into the database
        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnect = new SqlConnection(" Server=Localhost;Database=Lab3;Trusted_Connection=Yes; ");
            sqlConnect.Open();
            string sqlquery = "INSERT INTO [Service] (Origin,Destination,Budget,ServiceCost,ServiceDate,ServiceName,EmployeeContact) VALUES (@Origin,@Destination,@Budget,@ServiceCost,@ServiceDate,@ServiceName,@Contact)";
            SqlCommand cmd = new SqlCommand(sqlquery, sqlConnect);

            cmd.Parameters.AddWithValue("ServiceName", "Move");
            string Origin = HttpUtility.HtmlEncode(OriginTextBox.Text);
            cmd.Parameters.AddWithValue("Origin", Origin);
            
            string Destination = HttpUtility.HtmlEncode(DestinationTextBox.Text);
            cmd.Parameters.AddWithValue("Destination", Destination);
            
            string Budget = HttpUtility.HtmlEncode(Budgettext.Text);
            cmd.Parameters.AddWithValue("Budget", Budget);
            
            string ServiceCost = HttpUtility.HtmlEncode(ServiceCostText.Text);
            cmd.Parameters.AddWithValue("ServiceCost", ServiceCost);

            string ServiceDate = HttpUtility.HtmlEncode(CustomerDatetext.Text);
            cmd.Parameters.AddWithValue("ServiceDate", ServiceDate);

            cmd.Parameters.AddWithValue("Contact", AssignedEmployee.SelectedValue);



            cmd.ExecuteNonQuery();

            //same as in auction using the workflow table to insert the necessary information using the foreign keys this the unique identifiers are made by the databse automatically
            string sqlquery1 = "INSERT INTO [Workflow] (CustomerID,EmployeeID,EquipmentID,ServiceID,CustomerDate,Status) VALUES ((SELECT CustomerID FROM [Customer] Where CustomerID = @CustomerID),(SELECT EmployeeID FROM [Employee] Where EmployeeID = @EmployeeID),(SELECT EquipmentID FROM [Equipment] Where EquipmentID = @EquipmentID), (SELECT TOP 1 Service.ServiceID FROM Service, Customer WHERE Customer.CustomerID = @CustomerID AND Service.ServiceDate = @ServiceDate ORDER BY Service.ServiceID DESC),@CustomerDate, 'Active')";

            SqlCommand cmd1 = new SqlCommand(sqlquery1, sqlConnect);

           
            cmd1.Parameters.AddWithValue("CustomerID", CustomerNameDropDown.SelectedValue);
            cmd1.Parameters.AddWithValue("EmployeeID", AssignedEmployee.SelectedValue);
            cmd1.Parameters.AddWithValue("EquipmentID", EquipmentTypetext.SelectedValue);

            string ServiceDate1 = HttpUtility.HtmlEncode(CustomerDatetext.Text);
            cmd1.Parameters.AddWithValue("CustomerDate", ServiceDate1);
            cmd1.Parameters.AddWithValue("ServiceDate", ServiceDate1);

            cmd1.ExecuteNonQuery();
            //inserting into inventory the inputted items based on the user inputs on the move webform
            string sqlquery2 = "INSERT INTO [Inventory] (ServiceID,ItemName,ItemCost,ItemDescription) VALUES ((SELECT TOP 1 Service.ServiceID FROM Service, Customer WHERE Customer.CustomerID = @CustomerID AND Service.ServiceDate = @ServiceDate ORDER BY Service.ServiceID DESC),@ItemName,@ItemCost,@ItemDescription)";
            SqlCommand cmd2 = new SqlCommand(sqlquery2, sqlConnect);

            cmd2.Parameters.AddWithValue("CustomerID", CustomerNameDropDown.SelectedValue);


            string ItemName = HttpUtility.HtmlEncode(ItemNametext.Text);
            cmd2.Parameters.AddWithValue("ItemName", ItemName);

            string ItemCost = HttpUtility.HtmlEncode(ItemCosttext.Text);
            cmd2.Parameters.AddWithValue("ItemCost", ItemCost);

            string ServiceDate2 = HttpUtility.HtmlEncode(CustomerDatetext.Text);
            cmd2.Parameters.AddWithValue("ServiceDate", ServiceDate2);

            string ItemDescription = HttpUtility.HtmlEncode(ItemDescriptiontext.Text);
            cmd2.Parameters.AddWithValue("ItemDescription", ItemDescription);

            cmd2.ExecuteNonQuery();

            Sucesslabel.Visible = true;

            sqlConnect.Close();


            //to be able to pull the customer info into a ticket histroy table so that previous tickets can be pulled up easier
            string query2 = "INSERT INTO TicketHistory (ChangeDate,EmployeeID,Status,WorkflowID) VALUES (@ChangeDate,@EmployeeID,@Status,(SELECT TOP 1 WorkflowID FROM [Workflow] ORDER BY workflowID DESC))";
            SqlConnection sqlconnect = new SqlConnection(" Server=Localhost;Database=Lab3;Trusted_Connection=Yes; ");
            sqlconnect.Open();
            SqlCommand cmd3 = new SqlCommand(query2, sqlconnect);

            cmd3.Parameters.AddWithValue("EmployeeID", AssignedEmployee.SelectedValue);
            cmd3.Parameters.AddWithValue("ChangeDate", ServiceDate1);
            cmd3.Parameters.AddWithValue("Status", "Active");

            cmd3.ExecuteNonQuery();

            //based on the notes box on the move page this will add that information into the notes table for updates
            string query3 = "INSERT INTO [Notes] (NoteTitle,NoteBody,WorkflowID) VALUES (@NoteTitle, @NoteBody, (SELECT TOP 1 WorkflowID FROM [Workflow] ORDER BY workflowID DESC))";
            SqlCommand cmd4 = new SqlCommand(query3, sqlconnect);

            string Title = HttpUtility.HtmlEncode(notetitletxt.Text);
            cmd4.Parameters.AddWithValue("NoteTitle", Title);
            string body = HttpUtility.HtmlEncode(notebodytxt.Text);
            cmd4.Parameters.AddWithValue("NoteBody", body);


            cmd4.ExecuteNonQuery();
            sqlconnect.Close();

        }


    }
}