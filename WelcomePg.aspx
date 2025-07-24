<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WelcomePg.aspx.cs" Inherits="project223.WelcomePg" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:aliceblue">
<head runat="server">
    <title>Home</title>
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
            background-image: url('<%= ResolveUrl("~/Models/Backgrounds/download.png") %>');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            filter: blur(8px); /* Blurs the background image */
            z-index: -1; /* Ensures the background stays behind the content */
}
        .auto-style2 {
            text-align: left;
        }
        .auto-style3 {
            text-align: right;
        }
        .auto-style4 {
            margin-left: 0px;
        }
        .auto-style5 {
            text-align: center;
        }
        .auto-style6 {
            text-align: justify;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 class="auto-style5">
            <asp:Label ID="Label6" runat="server" ForeColor="Blue" Text="AWESOME ATHLETICS CLUB HOME"></asp:Label>
        </h1>

        <div class="auto-style3">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Models/Backgrounds/home.png" style="text-align: right" Width="182px" Height="140px" />
            <br />
            <asp:Button ID="Button1" runat="server" BackColor="#CCCCFF" Text="Help" Width="69px" OnClick="Button1_Click" />
            <br />
                <asp:Button ID="Button2" runat="server" CssClass="auto-style4" OnClick="Button2_Click" Text="Logout" Width="69px" />
            <h2 class="auto-style5">
            <asp:Label ID="Label1" runat="server" ForeColor="Black"></asp:Label>
            </h2>
            <h2 class="auto-style2">
                <asp:Label ID="Label7" runat="server" Text="MENU"></asp:Label>
            </h2>
        </div>

        <div class="auto-style2">
            <asp:ImageButton ID="ImageButton1" runat="server" Height="175px" ImageUrl="~/Models/IMAGES/SCHEDULE.jpg" Width="272px" OnClick="ImageButton1_Click" />
            <asp:Label ID="Label2" runat="server" Text="SCHEDULE"></asp:Label>
            <br />
        </div>

        <div class="auto-style2">
            <br />
            <asp:ImageButton ID="ImageButton3" runat="server" Height="179px" ImageUrl="~/Models/Backgrounds/acc.png" Width="272px" OnClick="ImageButton3_Click" />
            <asp:Label ID="Label4" runat="server" Text="ACCOUNT"></asp:Label>
            <br />
        </div>

        <div class="auto-style2">
            <br />
            <asp:ImageButton ID="ImageButton2" runat="server" Height="175px" ImageUrl="~/Models/IMAGES/SHOPPING.jpg" Width="272px" OnClick="ImageButton2_Click" />
            <asp:Label ID="Label3" runat="server" Text="STORE"></asp:Label>
            <br />
        </div>

        <div class="auto-style2">
            <br />
            <asp:ImageButton ID="ImageButton4" runat="server" Height="175px" ImageUrl="~/Models/Backgrounds/1000_F_207614195_Lkhqpv4ExvMifZLxugEl5qnlive1quZ2.jpg" Width="272px" OnClick="ImageButton4_Click" />
            <asp:Label ID="Label5" runat="server" Text="REPORTS"></asp:Label>
        </div>
    </form>
</body>
</html>
