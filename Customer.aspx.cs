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
    public partial class WebForm1 : System.Web.UI.Page
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

            if (!Page.IsPostBack)
            {



                using (SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;"))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM NotificationLog"))

                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = sqlConnect;
                        sqlConnect.Open();
                        NotificationListBox.DataSource = cmd.ExecuteReader();
                        NotificationListBox.DataTextField = "DescriptionOfNeeds";
                        NotificationListBox.DataValueField = "NotificationCountID";
                        NotificationListBox.DataBind();
                        sqlConnect.Close();
                    }
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewCustomer.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ServiceRequest.aspx");
        }

       
        //}
        //button 4 is showing all the previous workflows and the customer that correlates to that workflow
        protected void Button4_Click(object sender, EventArgs e)
        {
            string sqlQuery1 = " SELECT workflow.customerdate, Workflow.Status, employee.employeename, service.servicename, service.serviceid, inventory.itemname, Notes.NoteTitle, Notes.NoteBody ";
            sqlQuery1 += " FROM employee,workflow, service, inventory, Notes ";
            sqlQuery1 += " WHERE workflow.serviceid = service.serviceid AND Workflow.WorkflowID = Notes.WorkflowID AND workflow.employeeid=employee.employeeid AND service.serviceid = inventory.serviceid AND workflow.customerid = " + WorkflowsDropDown.SelectedValue;

            SqlConnection workflowsqlconnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery1, workflowsqlconnect);

            DataTable workflowdatagridview = new DataTable();
            sqlAdapter.Fill(workflowdatagridview);

            if (workflowdatagridview.Rows.Count > 0)
            {
                failedmessage.Visible = false;
            }
            else
            {
                failedmessage.Visible = true;
            }

            GridView2.DataSource = workflowdatagridview;
            GridView2.DataBind();

        }
        //add buttons to add notes, items and edit services
        protected void AddNoteBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Notes.aspx");
        }

        protected void ItemAddButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewItem.aspx");
        }

        protected void EditServiceBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditTicket.aspx");
        }

        protected void NotificationListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            NotificationBtn.Enabled = true;
        }

        protected void NotificationBtn_Click(object sender, EventArgs e)
        {
            Session["Notification"] = NotificationListBox.SelectedValue;
            Response.Redirect("NewCustomer.aspx");
        }

        protected void CustomerSearchBtn_Click(object sender, EventArgs e)
        {
            CustomerNameTxt.Enabled = true;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string grid = GridView1.SelectedValue.ToString();
            IDStore.Text = grid;
            GridView3.Visible = true;
        }

        protected void InformationonCurrentCustomers_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            ServiceDrill.Visible = true;
            Ticketgridv.Visible = true;
            GridView4.Visible = true;
            EmployeeGridView.Visible = true;
        }

        protected void ClearBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer.aspx");
        }

        //protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //}

        //protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        //{

        //}
    }
}