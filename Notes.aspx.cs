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
    public partial class Notes : System.Web.UI.Page
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
 //MY INNER JOIN STATEMENT 
                using (SqlCommand cmd = new SqlCommand("SELECT Workflow.WorkflowID, Service.ServiceDate FROM Workflow INNER JOIN Service ON Service.ServiceID=Workflow.ServiceID WHERE Service.ServiceName='" + TypeDDL.SelectedValue + "' AND Workflow.CustomerID ='" + CustomerDDL.SelectedValue + "'"))

                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = sqlConnect;
                    sqlConnect.Open();
                    noteslst.DataSource = cmd.ExecuteReader();
                    noteslst.DataTextField = "ServiceDate";
                    noteslst.DataValueField = "WorkflowID";
                    noteslst.DataBind();
                    sqlConnect.Close();
                }
            }
        }

        protected void ticketlist_SelectedIndexChanged(object sender, EventArgs e)
        {
            String sqlQuery = "Select notes.notetitle, notes.notebody FROM workflow, notes WHERE workflow.workflowid ='" + noteslst.SelectedValue.ToString() + "' AND notes.workflowid = workflow.workflowid";
            //connection to the db
            SqlConnection sqlconnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlconnect);

            DataTable data = new DataTable();
            sqlAdapter.Fill(data);

            notesgv.DataSource = data;
            notesgv.DataBind();
        }

        protected void AddNoteBtn_Click(object sender, EventArgs e)
        {
            //adding the necessary information into the notes table
            string workquery = "INSERT INTO [Notes] (NoteTitle,NoteBody,WorkflowID) VALUES (@NoteTitle,@NoteBody,@WorkflowID)";

            SqlConnection sqlconnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");
            sqlconnect.Open();
            SqlCommand com = new SqlCommand(workquery, sqlconnect);
            string NotesTitle = HttpUtility.HtmlEncode(notetitletxt.Text);
            com.Parameters.AddWithValue("NoteTitle", NotesTitle);
            string notesbody = HttpUtility.HtmlEncode(notebodytxt.Text);
            com.Parameters.AddWithValue("NoteBody", notesbody);
            string wf = noteslst.SelectedValue.ToString();
            com.Parameters.AddWithValue("WorkflowID", wf);

            com.ExecuteNonQuery();
            sqlconnect.Close();

            NoteAdd.Visible = true;
        }
    }
}