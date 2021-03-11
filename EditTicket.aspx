<%@ Page Title="" Language="C#" MasterPageFile="~/Lab2Master.Master" AutoEventWireup="true" CodeBehind="EditTicket.aspx.cs" Inherits="Lab2.EditTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:DropDownList ID="CustomerDDL" runat="server" DataSourceID="SqlDataSource1" DataTextField="CustomerName" DataValueField="CustomerID"></asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="TypeDDL" runat="server" DataSourceID="SqlDataSource2" DataTextField="ServiceName" DataValueField="ServiceName"></asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;

    <asp:Button ID="ShowTicketBtn" runat="server" Text="Show Current Service Tickets" OnClick="ShowTicketBtn_Click" />

     <br />
     <br />
     <br />

    <asp:ListBox ID="ticketlist" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ticketlist_SelectedIndexChanged"></asp:ListBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="changeemployeetxt" runat="server" Text="Change Employee"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="employeeDDL" runat="server" DataSourceID="SqlDataSource3" DataTextField="EmployeeName" DataValueField="EmployeeID"></asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="datelbl" runat="server" Text="New Date"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="datetxt" runat="server"></asp:TextBox> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />
    <asp:Label ID="statuslbl" runat="server" Text="Change Status"></asp:Label>
    <asp:RadioButtonList ID="statuschange" runat="server">
        <asp:ListItem>Yes</asp:ListItem>
        <asp:ListItem>No</asp:ListItem>
    </asp:RadioButtonList>

    <asp:GridView ID="detailsgv" runat="server"></asp:GridView> 
    <br />
    <br />
    <br />
    <asp:Button ID="editservice" runat="server" Text="Revise Service Ticket" OnClick="editservice_Click" />
     <br />
    <br />
    <br />
     <br />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString9 %>" SelectCommand="SELECT [CustomerID], [CustomerName] FROM [Customer]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString10 %>" SelectCommand="SELECT DISTINCT [ServiceName] FROM [Service]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString11 %>" SelectCommand="SELECT [EmployeeID], [EmployeeName] FROM [Employee]"></asp:SqlDataSource>

</asp:Content>
