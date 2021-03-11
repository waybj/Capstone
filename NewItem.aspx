<%@ Page Title="" Language="C#" MasterPageFile="~/Lab2Master.Master" AutoEventWireup="true" CodeBehind="NewItem.aspx.cs" Inherits="Lab2.NewItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:DropDownList ID="CustomerDDL" runat="server" DataSourceID="SqlDataSource1" DataTextField="CustomerName" DataValueField="CustomerID"></asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="TypeDDL" runat="server" DataSourceID="SqlDataSource2" DataTextField="ServiceName" DataValueField="ServiceName"></asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;
     <asp:ListBox ID="itemslist" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ticketlist_SelectedIndexChanged"></asp:ListBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:GridView ID="itemsgv" runat="server"></asp:GridView> 
    <asp:Button ID="ShowItemBtn" runat="server" Text="Show Current Service Tickets" OnClick="ShowTicketBtn_Click" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
     <br />
    <asp:Label ID="Itemname" runat="server" Text="Item name" Visible="false"></asp:Label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="ItemNametext" runat="server" Visible="false"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="ItemNametext" runat="server" Text="Field cannot be blank" ForeColor="Red" Visible="false"></asp:RequiredFieldValidator>
        <br />
        <br />
    <asp:Label ID="Itemcost" runat="server" Text="Item Cost" Visible="false"></asp:Label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="ItemCosttext" runat="server" Visible="false"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ItemCosttext" runat="server" Text="Field cannot be blank" ForeColor="Red" Visible="false"></asp:RequiredFieldValidator>
        <br />
        <br />
    <asp:Label ID="Itemdescription" runat="server" Text="Item Description"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="ItemDescriptiontext" runat="server" Visible="false"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ItemDescriptiontext" runat="server" Text="Field cannot be blank" ForeColor="Red" Visible ="false"></asp:RequiredFieldValidator>
    <asp:Button ID="additems" runat="server" Text="Add Items To Ticket" OnClick="additems_Click" />
    <asp:Label ID="AddBtn" runat="server" Text="Added Successfully" Visible="false"></asp:Label>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString9 %>" SelectCommand="SELECT [CustomerID], [CustomerName] FROM [Customer]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString10 %>" SelectCommand="SELECT DISTINCT [ServiceName] FROM [Service]"></asp:SqlDataSource>
</asp:Content>
