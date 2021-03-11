<%@ Page Title="" Language="C#" MasterPageFile="~/Lab2Master.Master" AutoEventWireup="true" CodeBehind="Notes.aspx.cs" Inherits="Lab2.Notes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:DropDownList ID="CustomerDDL" runat="server" DataSourceID="SqlDataSource1" DataTextField="CustomerName" DataValueField="CustomerID"></asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="TypeDDL" runat="server" DataSourceID="SqlDataSource2" DataTextField="ServiceName" DataValueField="ServiceName"></asp:DropDownList>
    &nbsp;<br />
    &nbsp;&nbsp;&nbsp;
     <asp:ListBox ID="noteslst" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ticketlist_SelectedIndexChanged"></asp:ListBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:GridView ID="notesgv" runat="server"></asp:GridView> 
    <asp:Button ID="ShowTicketBtn" runat="server" Text="Show Current Service Tickets" OnClick="ShowTicketBtn_Click" />
    <br />
     <br />
            Add Additional Notes Below<br />
            <br />
    <asp:Label ID="notetitlelbl" runat="server" Text="Note Title"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="notetitletxt" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Label ID="notebodylbl" runat="server" Text="Note Body"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="notebodytxt" runat="server" TextMode="MultiLine" Rows="10" Width="900px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="AddNoteBtn" runat="server" Text="Add Notes" OnClick="AddNoteBtn_Click" />
    <asp:Label ID="NoteAdd" runat="server" Text="Note Was added" Visible="false"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString9 %>" SelectCommand="SELECT [CustomerID], [CustomerName] FROM [Customer]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString10 %>" SelectCommand="SELECT DISTINCT [ServiceName] FROM [Service]"></asp:SqlDataSource>
</asp:Content>
