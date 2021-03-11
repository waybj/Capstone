<%@ Page Title="" Language="C#" MasterPageFile="~/Lab2Master.Master" AutoEventWireup="true" CodeBehind="CustomerServiceRequest.aspx.cs" Inherits="Lab3.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:Table ID="ServiceRequestTble" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="CustomerServiceTypeLbl" runat="server" Text="Service Type"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                 <asp:DropDownList ID="ServiceTypeDDL" runat="server">
         <asp:ListItem>Move</asp:ListItem>
         <asp:ListItem>Auction</asp:ListItem>
    </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Datelbl" runat="server" Text="Date"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="DateTxt" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="DescriptionLbl" runat="server" Text="Description"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="Description" runat="server" TextMode="MultiLine" Rows="5" Width="300px"></asp:TextBox>
            </asp:TableCell>

        </asp:TableRow>
    </asp:Table>
    <asp:Table ID="ButtonRequestTble" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="ServiceRequestBtn" runat="server" Text="Submit" OnClick="ServiceRequestBtn_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="SentLbl" runat="server" Text="Request Sent Successfully" Visible="false"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    
</asp:Content>
