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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Customer"] != null)
            {

            }
            else
            {
                Session["InvalidUse"] = "You must login to access the website";
                Response.Redirect("CustomerLogin.aspx");
            }

        }

        protected void ServiceRequestBtn_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnect = new SqlConnection(" Server=Localhost;Database=Lab3;Trusted_Connection=Yes; ");
            sqlConnect.Open();
            string sqlquery = "INSERT INTO [NotificationLog] (ServiceType, Date, DescriptionOfNeeds,InitialCustomerID) VALUES (@ServiceType,@Date,@DescriptionOfNeeds, (SELECT InitialCustomerID From InitialCustomer WHERE Email = @Email))";

            SqlCommand cmd = new SqlCommand(sqlquery, sqlConnect);

            string email = Session["Customer"].ToString();
            cmd.Parameters.AddWithValue("Email", email);

            string serviceType = ServiceTypeDDL.SelectedValue;
            cmd.Parameters.AddWithValue("ServiceType", serviceType);

            string date = HttpUtility.HtmlEncode(DateTxt.Text);
            cmd.Parameters.AddWithValue("Date", date);

            string descriptionOfNeeds = HttpUtility.HtmlEncode(Description.Text);
            cmd.Parameters.AddWithValue("DescriptionOfNeeds", descriptionOfNeeds);

            cmd.ExecuteNonQuery();
            sqlConnect.Close();
            SentLbl.Visible = true;
        }
    }
}