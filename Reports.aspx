<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="project223.Reports1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" style="background-color: antiquewhite">
<head runat="server">
    <title>Reports</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            position: relative;
        }

        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url('<%= ResolveUrl("~/Models/Backgrounds/Screenshot 2024-08-19 220544.png") %>');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            filter: blur(8px); /* Blurs the background image */
            z-index: -1; /* Ensures the background stays behind the content */
}
        .auto-style1 {
            text-align: center;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <h1><asp:Label ID="Label1" runat="server" ForeColor="Black" Text="AWESOME ATHLETICS CLUB REPORTS"></asp:Label></h1>
            <p>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Models/Backgrounds/1000_F_207614195_Lkhqpv4ExvMifZLxugEl5qnlive1quZ2.jpg" style="text-align: right" Width="182px" />
            </p>
        </div>
        <h2 class="auto-style1">
            <asp:Label ID="Label2" runat="server" Text="Members Report"></asp:Label>
        </h2>
        <h3 class="auto-style1">
            <asp:Label ID="Label4" runat="server" Text="Select Report: "></asp:Label>
            <asp:DropDownList ID="ddlMemberCategory" runat="server" Width="161px">
            </asp:DropDownList>
        </h3>
        <h3 class="auto-style1">
            <asp:Label ID="Label6" runat="server" Text="Sort By:"></asp:Label>
            <asp:RadioButton ID="RadioButton1" runat="server" GroupName="Member" Text="Age" />
            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="Member" Text="Name" />
        </h3>
        <h3 class="auto-style1">
            <asp:Button ID="Button7" runat="server" Text="Generate Report" OnClick="Button7_Click" />
        </h3>
        <asp:GridView ID="GridViewMembers" runat="server" AutoGenerateColumns="False" CssClass="auto-style1">
            <Columns>
                <asp:BoundField DataField="First_Name" HeaderText="First Name" />
                <asp:BoundField DataField="Surname" HeaderText="Surname" />
                <asp:BoundField DataField="ID_Num" HeaderText="ID Number" />
                <asp:BoundField DataField="Age" HeaderText="Age" />
                <asp:BoundField DataField="Category" HeaderText="Category" />
            </Columns>
        </asp:GridView>

        <p class="auto-style1">
            <asp:Button ID="Button5" runat="server" BackColor="#0099FF" Text="Save Members Report To File" Width="203px" OnClick="Button5_Click" />
        </p>
        <p class="auto-style1">
            <asp:Label ID="lblMemberMessage" runat="server" ForeColor="Red"></asp:Label>
        </p>

        <h2 class="auto-style1">
            <asp:Label ID="Label3" runat="server" Text="Products in Stock  Report"></asp:Label>
        </h2>
        <h3 class="auto-style1">
            <asp:Label ID="Label5" runat="server" Text="Select Report: "></asp:Label>
            <asp:DropDownList ID="ddlProductCategory" runat="server" Width="161px">
            </asp:DropDownList>
        </h3>
        <h3 class="auto-style1">
            <asp:Label ID="Label7" runat="server" Text="Sort By:"></asp:Label>
            <asp:RadioButton ID="RadioButton3" runat="server" GroupName="Product" Text="Product Name" />
            <asp:RadioButton ID="RadioButton4" runat="server" GroupName="Product" Text="Price" />
        </h3>
        <h3 class="auto-style1">
            <asp:Button ID="Button8" runat="server" Text="Generate Report" OnClick="Button8_Click" />
        </h3>
        <asp:GridView ID="GridViewProducts" runat="server" AutoGenerateColumns="False" CssClass="auto-style1">
            <Columns>
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" />
            </Columns>
        </asp:GridView>

        <p class="auto-style1">
            <asp:Button ID="Button6" runat="server" BackColor="#FFFF66" Text="Save Products Report To File" Width="203px" OnClick="Button6_Click" />
        </p>
        <p class="auto-style1">
            <asp:Label ID="lblProductMessage" runat="server" ForeColor="Green"></asp:Label>
        </p>

        <p class="auto-style1">
            <asp:Button ID="Button4" runat="server" BackColor="#CCCCFF" Text="Help" Width="69px" OnClick="Button4_Click" />
        </p>
        <p class="auto-style1">
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Red" style="text-align: center" NavigateUrl="~/WelcomePg.aspx">BACK TO HOME PAGE</asp:HyperLink>
        </p>
    </form>
</body>
</html>

