<%@ Page Language="C#" AutoEventWireup="true" masterpagefile ="~/Lab2Master.Master" CodeBehind="Auction.aspx.cs" Inherits="test.WebForm5" %>

<asp:Content ID="contenthead" ContentPlaceHolderID="head" runat="server"></asp:Content>
 <asp:Content ID="content2" ContentPlaceHolderID="body" runat="server">
        Customer Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;<asp:DropDownList ID="CustomerListDropDown" runat="server" DataSourceID="SqlDataSource1" DataTextField="CustomerName" DataValueField="CustomerID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString3 %>" SelectCommand="SELECT [CustomerName], [CustomerID] FROM [Customer]"></asp:SqlDataSource>
        <br />
        <br />
        <br />
        Service Cost&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="ServiceCostText" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ServiceCostText" runat="server" Text="Field cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        Employee Contact&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="EmployeeContacttext" runat="server" DataSourceID="SqlDataSource2" DataTextField="EmployeeName" DataValueField="EmployeeID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString7 %>" SelectCommand="SELECT [EmployeeID], [EmployeeName] FROM [Employee]"></asp:SqlDataSource>
        <br />
        <br />
        Service Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="ServiceDate" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="ServiceDate" runat="server" Text="Field cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
                <asp:Label ID="notetitlelbl" runat="server" Text="Note Title"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="notetitletxt" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="notetitletxt" runat="server" Text="Field cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
            <br />
            <br />
            <br />
            <asp:Label ID="notebodylbl" runat="server" Text="Note Body"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="notebodytxt" runat="server" TextMode="MultiLine" Rows="10" Width="900px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="notebodytxt" runat="server" Text="Field cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
     <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Populate" CausesValidation="false" />
&nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Clear" CausesValidation="false" />
&nbsp;<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" style="height: 26px" Text="Add Ticket" />
        &nbsp; <asp:Label ID="Sucesslabel" runat="server" Text="Customer added" ForeColor="Blue" Visible="false"></asp:Label>        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
</asp:Content>