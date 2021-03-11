using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Lab2
{
    public partial class EditTicket : System.Web.UI.Page
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

        protected void ShowTicketBtn_Click(object sender, EventArgs e)
        {
            
                using (SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;"))
                {
                using (SqlCommand cmd = new SqlCommand("SELECT Workflow.WorkflowID, Service.ServiceDate FROM Workflow, Service WHERE Service.ServiceID=Workflow.ServiceID AND Service.ServiceName='" + TypeDDL.SelectedValue + "' AND Workflow.CustomerID ='" + CustomerDDL.SelectedValue + "'"))

                {
                    cmd.CommandType = CommandType.Text;
                        cmd.Connection = sqlConnect;
                        sqlConnect.Open();
                        ticketlist.DataSource = cmd.ExecuteReader();
                        ticketlist.DataTextField = "ServiceDate";
                        ticketlist.DataValueField = "WorkflowID";
                        ticketlist.DataBind();
                        sqlConnect.Close();
                    }
                }
            
        }

        protected void ticketlist_SelectedIndexChanged(object sender, EventArgs e)
        {String sqlQuery = "Select TicketHistory.ChangeDate as CompletionDate, TicketHistory.Status, EmployeeName FROM employee, TicketHistory WHERE TicketHistory.workflowID ='" + ticketlist.SelectedValue.ToString() + "' AND employee.employeeID = TicketHistory.employeeID AND TicketHistory.Status = 'Active'";

            SqlConnection sqlconnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlconnect);

            DataTable data= new DataTable();
            sqlAdapter.Fill(data);

            detailsgv.DataSource = data;
            detailsgv.DataBind();
        }

        protected void editservice_Click(object sender, EventArgs e)
        {
            //updating the workflow that you are editing
            string workquery = "UPDATE Workflow SET CustomerDate = @CustomerDate, EmployeeID = @EmployeeID, Status = @Status WHERE WorkflowID ='" + ticketlist.SelectedValue.ToString() + "'";

            SqlConnection sqlconnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");
            sqlconnect.Open();
            SqlCommand com = new SqlCommand(workquery, sqlconnect);
            com.Parameters.AddWithValue("EmployeeID", employeeDDL.SelectedValue);
            string Cdate = HttpUtility.HtmlEncode(datetxt.Text);
            com.Parameters.AddWithValue("CustomerDate", Cdate);

            if (statuschange.SelectedValue == "Yes")
            {
                com.Parameters.AddWithValue("Status", "Completed");
            }
            else
            {
                com.Parameters.AddWithValue("Status", "Active");
            }
            com.ExecuteNonQuery();
            sqlconnect.Close();
            //edit the workflow ticket history 
            string sqlquery2 = "INSERT INTO TicketHistory (ChangeDate,WorkflowID,EmployeeID,Status) VALUES (@ChangeDate,@WorkFlowID,@EmployeeID,@Status)";
            SqlConnection sqlconnect1 = new SqlConnection(" Server=Localhost;Database=Lab3;Trusted_Connection=Yes; ");
            sqlconnect1.Open();
            SqlCommand cmd = new SqlCommand(sqlquery2, sqlconnect1);

            cmd.Parameters.AddWithValue("EmployeeID", employeeDDL.SelectedValue);
            cmd.Parameters.AddWithValue("ChangeDate", Cdate);
            cmd.Parameters.AddWithValue("WorkflowID", ticketlist.SelectedValue);

            if (statuschange.SelectedValue == "Yes")
            {
                cmd.Parameters.AddWithValue("Status", "Completed");
            }
            else
            {
                cmd.Parameters.AddWithValue("Status", "Active");
            }

            cmd.ExecuteNonQuery();
            sqlconnect1.Close();



        }

    }
}