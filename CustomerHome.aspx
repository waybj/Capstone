<%@ Page Title="" Language="C#" MasterPageFile="~/Lab2Master.Master" AutoEventWireup="true" CodeBehind="CustomerHome.aspx.cs" Inherits="Lab3.CustomerHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
        <asp:Table ID="CustomerHomeTbl" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="WelcomeHome" runat="server" Text="Welcome Home" Font-Size="X-Large"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    <br />
    <br />
    <asp:Button ID="ServiceStart" runat="server" OnClick="ServiceStart_Click" Text="New Service Request" />

</asp:Content>
