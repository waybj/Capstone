<%@ Page Language="C#" AutoEventWireup="true" masterpagefile ="~/Lab2Master.Master" CodeBehind="NewCustomer.aspx.cs" Inherits="test.WebForm2" %>

<asp:Content ID="contenthead" ContentPlaceHolderID="head" runat="server"></asp:Content>
 <asp:Content ID="content2" ContentPlaceHolderID="body" runat="server">
        <div>
            Enter Customer&#39;s Information
            <br />
            <br />
&nbsp;Name&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="CustomerNametext" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="CustomerNametext" runat="server" Text="Field cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>

            <br />
            <br />
&nbsp;Phone&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="CustomerPhonetext" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="CustomerPhonetext" runat="server" Text="Field cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>

            <br />
            <br />
&nbsp;Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="newcustemailtext" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="newcustemailtext" runat="server" Text="Field cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>

            <br />
            <br />
            <br />
            <br />
            <br />
            Employee Started&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="InitialContact" runat="server" DataSourceID="SqlDataSource1" DataTextField="CustomerName" DataValueField="CustomerID"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString12 %>" SelectCommand="SELECT [CustomerID], [CustomerName] FROM [Customer]"></asp:SqlDataSource>
            <br />
            <br />
            <br />
            Initial Contact&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="howtheyhearDDL" runat="server" AutoPostBack="True" OnSelectedIndexChanged="howtheyhearDDL_SelectedIndexChanged">
                <asp:ListItem>In Person</asp:ListItem>
                <asp:ListItem>By Phone</asp:ListItem>
                <asp:ListItem>Email</asp:ListItem>
                <asp:ListItem>Text</asp:ListItem>
                <asp:ListItem>Other</asp:ListItem>
            </asp:DropDownList>

             <br />
             <br />
             <br />

            <asp:Label ID="Label1" runat="server" Text="how did customer contact" Visible="false"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Visible="false" TextMode="MultiLine" Rows="3" Width="900px"></asp:TextBox>
               <br />
             <br />
             <br />
           How They Heard&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="howtheyheard" runat="server" TextMode="MultiLine" Rows="3" Width="300px"></asp:TextBox>

            <asp:Label ID="otherlbl" runat="server" Text="how did customer contact" Visible="false"></asp:Label>
            <asp:TextBox ID="othertxt" runat="server" Visible="false" TextMode="MultiLine" Rows="3" Width="900px"></asp:TextBox>
            <br />
            <br />
            Phone Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="phonetypeDDL" runat="server">
                <asp:ListItem>Home</asp:ListItem>
                <asp:ListItem>Cell</asp:ListItem>
                <asp:ListItem>Business</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Service Interest&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="serviceinterestddl" runat="server" DataSourceID="SqlDataSource2" DataTextField="ServiceName" DataValueField="ServiceName" AutoPostBack="True" OnSelectedIndexChanged="serviceinterestddl_SelectedIndexChanged" CausesValidation="false"></asp:DropDownList>
            <asp:Label ID="Moveandacutionlbl" runat="server" Text="" Visible="false"></asp:Label>
            <br />
            <asp:Label ID="Addresslbl" runat="server" Text="Address" Visible="false"></asp:Label>
            <asp:TextBox ID="AddressTxt" runat="server" Visible="false"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="AddressTxt" runat="server" Text="Field cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString13 %>" SelectCommand="SELECT DISTINCT ServiceName FROM Service"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Label ID="originlbl" runat="server" Text="Origin" Visible="false"></asp:Label>
            <asp:TextBox ID="origintxt" runat="server" Visible="false"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="origintxt" runat="server" Text="Field cannot be blank" ForeColor="Red" Visible="false"></asp:RequiredFieldValidator>

            <br />
            <br />
            <br />

            <asp:Label ID="destinationlbl" runat="server" Text="Destination" Visible="false"></asp:Label>
            <asp:TextBox ID="destinationtxt" runat="server" Visible="false"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="destinationtxt" runat="server" Text="Field cannot be blank" ForeColor="Red" Visible ="false"></asp:RequiredFieldValidator>
              <br />
            <br />
            <br />
            <br />
            Deadline&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="deadlinetxt" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="deadlinetxt" runat="server" Text="Field cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
             <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Sucesslabel" runat="server" Text="Customer added" ForeColor="Blue" Visible="false"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Populate" CausesValidation="false" />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Clear" CausesValidation="false" />
            <br />
            <br />
        </div>
     </asp:Content>