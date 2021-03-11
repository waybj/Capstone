<%@ Page Language="C#" AutoEventWireup="true" masterpagefile ="~/Lab2Master.Master"  CodeBehind="Customer.aspx.cs" Inherits="test.WebForm1" %>

<asp:Content ID="contenthead" ContentPlaceHolderID="head" runat="server"></asp:Content>
 <asp:Content ID="content2" ContentPlaceHolderID="body" runat="server">
        <asp:SqlDataSource runat="server"
            ID="dsCustomer"
            ConnectionString="<%$ connectionStrings:Lab3 %>"
            SelectCommand="SELECT * FROM Customer"
            InsertCommand="Insert INTO [Customer] (CustomerID,CustomerName,CustomerPhone,CustomerEmail,CustomerAddress) values (@CustomerID,@CustomerName,@CustomerPhone,@CustomerEmail,@CustomerAddress)"
            />
    
        <div>
            <asp:Label ID="Name" runat="server" Text="Lane Faulker" Font-Size="XX-Large"></asp:Label><br />
            <br />
            <asp:Button ID="AddNewCustomer" runat="server" OnClick="Button1_Click" Text="Add New Customer" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="AddNewServiceTicket" runat="server" OnClick="Button2_Click" Text="Add New Service Ticket" />
        
            <br />
            <br />
            <br />
            <br />
            Customer List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="InformationonCurrentCustomers" runat="server" Text="Show Customer Info" OnClick="InformationonCurrentCustomers_Click"/>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
             <asp:Button ID="CustomerSearchBtn" runat="server" Text="Search By Customer Name" OnClick="CustomerSearchBtn_Click" />
            <br />
            <br />
            <asp:Label ID="CustomerNameLbl" runat="server" Text="Customer Name"></asp:Label>
            <br />
            <asp:TextBox ID="CustomerNameTxt" runat="server" Enabled="false" AutoPostBack="true"></asp:TextBox>
            <br />
            <br />
            <br />
            


            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataSourceID="ConnectionStrng" DataKeyNames="CustomerID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Visible="false"
                Caption="Customer Info" CaptionAlign="Top" >
                <Columns>
                    <asp:CommandField ShowSelectButton="true" SelectText="Generate Service History" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" Visible="false" />
                    <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" />
                     <asp:BoundField DataField="CustomerPhone" HeaderText="CustomerPhone" />
                     <asp:BoundField DataField="CustomerEmail" HeaderText="CustomerEmail" />
                     <asp:BoundField DataField="CustomerAddress" HeaderText="CustomerAddress" />
                 </Columns>
            </asp:GridView>
            <asp:SqlDataSource
                ID="ConnectionStrng" runat="server" ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="SELECT CustomerID, CustomerName, CustomerPhone, CustomerEmail, CustomerAddress FROM Customer" FilterExpression="CustomerName LIKE '%{0}%'" >
                <FilterParameters>
                    <asp:ControlParameter Name="CustomerName" ControlID="CustomerNameTxt" Type="String" ConvertEmptyStringToNull="false" />
                </FilterParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Label ID="IDStore" runat="server" Text="" Visible="false"></asp:Label>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="false" AutoGenerateSelectButton="true" DataKeyNames="WorkflowID" Visible="false" DataSourceID="ConnectionStrng1" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" 
                 Caption="Service Info" CaptionAlign="Top" >
                <Columns>
                    <asp:BoundField DataField="WorkflowID" HeaderText="WorkflowID" Visible="false" />
                    <asp:BoundField DataField="CustomerDate" HeaderText="CustomerDate" />
                     <asp:BoundField DataField="Status" HeaderText="Status" />
                     <asp:BoundField DataField="ServiceName" HeaderText="ServiceName" />
                    
                </Columns>

            </asp:GridView>
            <asp:SqlDataSource
                ID="ConnectionStrng1" runat="server" ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select Workflow.WorkflowID, Workflow.CustomerDate, Service.ServiceName, Workflow.Status FROM Workflow, Service WHERE Service.ServiceID = Workflow.WorkflowID AND Workflow.CustomerID = @CustomerID" >

                <SelectParameters>                    <asp:ControlParameter Name="CustomerID" ControlID="GridView1" PropertyName="SelectedValue" />                </SelectParameters>

            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="ServiceDrill" runat="server" AutoGenerateColumns="false" AutoGenerateSelectButton="true" DataKeyNames="NoteID" Visible="false" DataSourceID="ConnectionStrng2" 
                 Caption="Notes Info" CaptionAlign="Top" >
                <Columns>
                    <asp:BoundField DataField="NoteID" HeaderText="NoteID" Visible="false" />
                    <asp:BoundField DataField="NoteTitle" HeaderText="NotesTitle" />
                     <asp:BoundField DataField="NoteBody" HeaderText="NotesBody" />
                </Columns>


            </asp:GridView>
            <asp:SqlDataSource ID="ConnectionStrng2" runat="server" ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;"  SelectCommand="Select NoteID, NoteTitle, NoteBody From Notes Where WorkflowID = @WorkflowID" >

                <SelectParameters>
                    <asp:ControlParameter Name="WorkflowID" ControlID="GridView3" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />


            <asp:GridView ID="Ticketgridv" runat="server" AutoGenerateColumns="false" AutoGenerateSelectButton="true" DataKeyNames="HistoryID" Visible="false" DataSourceID="ConnectionStrng3" 
                 Caption="Ticket History Info" CaptionAlign="Top" >
                <Columns>
                    <asp:BoundField DataField="HistoryID" HeaderText="HistoryID" Visible="false" />
                    <asp:BoundField DataField="ChangeDate" HeaderText="ChangeDate" />
                     
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="ConnectionStrng3" runat="server" ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="SELECT HistoryID, ChangeDate FROM TicketHistory WHERE WorkflowID = @WorkflowID" >
                <SelectParameters>
                    <asp:ControlParameter Name="WorkflowID" ControlID="GridView3" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

            <br />


             <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="false" AutoGenerateSelectButton="true" DataKeyNames="ItemID" Visible="false" DataSourceID="ConnectionStrng4" 
                  Caption="Inventory Info" CaptionAlign="Top" >
                <Columns>
                    <asp:BoundField DataField="ItemID" HeaderText="ItemID" Visible="false" />
                    <asp:BoundField DataField="ItemName" HeaderText="ItemName" />
                    <asp:BoundField DataField="ItemDescription" HeaderText="ItemDescription" />
                     <asp:BoundField DataField="ItemCost" HeaderText="ItemCost" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="ConnectionStrng4" runat="server" ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select Inventory.ItemID, Inventory.ItemName, Inventory.ItemDescription, Inventory.ItemCost From Inventory, Workflow Where Inventory.ServiceID = Workflow.ServiceID AND Workflow.WorkflowID = @WorkflowID" >
 
                <SelectParameters>
                    <asp:ControlParameter Name="WorkflowID" ControlID="GridView3" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

            <br />
            <br />


            <asp:GridView ID="EmployeeGridView" runat="server" AutoGenerateColumns="false" AutoGenerateSelectButton="true" DataSourceID="ConStrng6" Visible="false" DataKeyNames="EmployeeID"                 Caption="Employees Associated" CaptionAlign="Top">               <Columns>                   <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" Visible="false" />                   <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" />                   <asp:BoundField DataField="Phone" HeaderText="Phone" />                   <asp:BoundField DataField="Email" HeaderText="Email" />               </Columns>
                 </asp:GridView>           <asp:SqlDataSource ID="ConStrng6" runat="server" ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;"               SelectCommand="Select Employee.EmployeeID, Employee.EmployeeName, Employee.Phone, Employee.Email
               From Employee, Workflow Where Employee.EmployeeID = Workflow.EmployeeID AND Workflow.WorkflowID = @WorkflowID" >               <SelectParameters>                   <asp:ControlParameter Name="WorkflowID" ControlID="GridView3" PropertyName="SelectedValue" />               </SelectParameters>           </asp:SqlDataSource>

            <asp:Button ID="ClearBtn" runat="server" Text="Clear" OnClick="ClearBtn_Click" />
            <br />
            <br />
            <asp:ListBox ID="NotificationListBox" runat="server" OnSelectedIndexChanged="NotificationListBox_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox>
            <asp:Button ID="NotificationBtn" runat="server" Text="Redirect to Initial Customer Form" Enabled="false" OnClick="NotificationBtn_Click" />
            <br />


            <%--<asp:GridView runat="server" ID="GridView1" EmptyDataText="No Customer Selected!" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>                    <asp:ButtonField Text="View Service History" CommandName="Select" />                    <asp:TemplateField HeaderText="CustomerID" Visible="true" />                    </Columns>

            </asp:GridView>--%>            <br />
            <%--<asp:DropDownList ID="CustomerInfoDropDown" runat="server" DataSourceID="SqlDataSource1" DataTextField="CustomerName" DataValueField="CustomerID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>--%>
            <%-- <asp:Button ID="CustomerSearchBtn" runat="server" Text="Search By Customer Name" OnClick="CustomerSearchBtn_Click" />
            <asp:Label ID="CustomerNameLbl" runat="server" Text="Customer Name"></asp:Label>
            <br />
            <asp:TextBox ID="CustomerNameTxt" runat="server" Enabled="false" AutoPostBack="true"></asp:TextBox>
            <br />
            --%>




        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString2 %>" SelectCommand="SELECT [CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress] FROM [Customer]"></asp:SqlDataSource>
        <p style="margin-left: 120px">
            <asp:Button ID="PreviousWorkflows" runat="server" OnClick="Button4_Click" Text="Workflow Info" />
        &nbsp;
            <asp:Label ID="failedmessage" runat="server" Text="No workflow info available" Visible="false" ForeColor="MediumPurple"></asp:Label>
        </p>
     <asp:Button ID="AddNoteBtn" runat="server" Text="Add Notes to Ticket" OnClick="AddNoteBtn_Click" />
     <asp:Button ID="ItemAddButton" runat="server" Text="Add Items to Ticket" OnClick="ItemAddButton_Click" />
     <asp:Button ID="EditServiceBtn" runat="server" Text="Edit a Service Ticket" OnClick="EditServiceBtn_Click"/>
        <asp:GridView ID="GridView2" runat="server">
        </asp:GridView>
        <asp:DropDownList ID="WorkflowsDropDown" runat="server" DataSourceID="SqlDataSource2" DataTextField="CustomerName" DataValueField="CustomerID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString8 %>" SelectCommand="SELECT [CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress] FROM [Customer]"></asp:SqlDataSource>
</asp:Content>