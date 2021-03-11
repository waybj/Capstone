<%@ Page Language="C#" AutoEventWireup="true" masterpagefile ="~/Lab2Master.Master" CodeBehind="Move.aspx.cs" Inherits="test.WebForm4" %>
<asp:Content ID="contenthead" ContentPlaceHolderID="head" runat="server"></asp:Content>
 <asp:Content ID="content2" ContentPlaceHolderID="body" runat="server">

        <div>
            Customer Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="CustomerNameDropDown" runat="server" DataSourceID="SqlDataSource1" DataTextField="CustomerName" DataValueField="CustomerID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString4 %>" SelectCommand="SELECT [CustomerID], [CustomerName] FROM [Customer]"></asp:SqlDataSource>
            <br />
            <br />
            Origin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="OriginTextBox" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="OriginTextBox" runat="server" Text="Field cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            Destination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="DestinationTextBox" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="DestinationTextBox" runat="server" Text="Field cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            EquipmentType&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="EquipmentTypetext" runat="server" DataSourceID="SqlDataSource3" DataTextField="EquipmentName" DataValueField="EquipmentID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString6 %>" SelectCommand="SELECT [EquipmentID], [EquipmentName] FROM [Equipment]"></asp:SqlDataSource>
            <br />
            <br />
            Assigned Employee&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="AssignedEmployee" runat="server" DataSourceID="SqlDataSource2" DataTextField="EmployeeName" DataValueField="EmployeeID" Height="17px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString5 %>" SelectCommand="SELECT [EmployeeID], [EmployeeName] FROM [Employee]"></asp:SqlDataSource>
            <br />
            ItemName&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="ItemNametext" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ItemNametext" runat="server" Text="Field cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            ItemDescription&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="ItemDescriptiontext" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="ItemDescriptiontext" runat="server" Text="Field cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            Item Cost&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="ItemCosttext" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="ItemCosttext" runat="server" Text="Field cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            CustomerDate&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="CustomerDatetext" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="CustomerDatetext" runat="server" Text="Field cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            Budget&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Budgettext" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="Budgettext" runat="server" Text="Field cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            Service&nbsp;Cost&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="ServiceCostText" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="ServiceCostText" runat="server" Text="Field cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <br />
            <asp:Label ID="notetitlelbl" runat="server" Text="Note Title"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="notetitletxt" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="notetitletxt" runat="server" Text="Field cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="notebodylbl" runat="server" Text="Note Body"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="notebodytxt" runat="server" TextMode="MultiLine" Rows="10" Width="900px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="notebodytxt" runat="server" Text="Field cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Populate" CausesValidation="false" />
&nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Clear" CausesValidation="false" />
&nbsp;<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Add Ticket" />
            &nbsp; <asp:Label ID="Sucesslabel" runat="server" Text="Customer added" ForeColor="Blue" Visible="false"></asp:Label> <br />
        </div>
</asp:Content>