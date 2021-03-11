<%@ Page Language="C#" AutoEventWireup="true" masterpagefile ="~/Lab2Master.Master" CodeBehind="ServiceRequest.aspx.cs" Inherits="test.WebForm3" %>


<asp:Content ID="contenthead" ContentPlaceHolderID="head" runat="server"></asp:Content>
 <asp:Content ID="content2" ContentPlaceHolderID="body" runat="server">
        <div>
            Please Select Service&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ServiceSelect" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Value="Move" Text="Move"></asp:ListItem>
                <asp:ListItem Value="Auction" Text="Auction"></asp:ListItem>
            </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" style="width: 14px" />
        </div>
</asp:Content>