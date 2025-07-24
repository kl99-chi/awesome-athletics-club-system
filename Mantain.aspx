<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mantain.aspx.cs" Inherits="project223.Mantain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:azure">
<head runat="server">
    <title>Schedules</title>
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
            background-image: url('<%= ResolveUrl("~/Models/Backgrounds/Screenshot 2024-08-19 220706.png") %>');
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
        .auto-style2 {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
        <h1><asp:Label ID="Label1" runat="server" ForeColor="Black" Text="AWESOME ATHLETICS CLUB SCHEDULES"></asp:Label></h1>
            <div>
            <br />
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Models/IMAGES/SCHEDULE.jpg" style="text-align: right" Width="182px" Height="140px" />
            <br />
        </div>
        <h3 class="auto-style2">
            <asp:Label ID="Label2" runat="server" Text="MENU"></asp:Label>
        </h3>
            <p class="auto-style2">
            <asp:Button ID="Button1" runat="server" Height="64px" OnClick="Button1_Click" Text="TRAINING SLOTS" Width="335px" BackColor="#00CCFF" />
        </p>
            <div class="auto-style2">
        <asp:Button ID="Button2" runat="server" Height="64px" Text="UPCOMING EVENTS" Width="339px" BackColor="Red" OnClick="Button2_Click" />
        <br />
            </div>
            <p class="auto-style2">
            <asp:Button ID="Button3" runat="server" Height="64px" Text="SUPPORT SERVICE" Width="338px" BackColor="Yellow" OnClick="Button3_Click" />
        </p>
            <p class="auto-style1">
                &nbsp;</p>
        <p>
            <asp:Button ID="Button4" runat="server" BackColor="#CCCCFF" Text="Help" Width="69px" Height="26px" OnClick="Button4_Click" />
            </p>
            <div>
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#FF3300" NavigateUrl="~/WelcomePg.aspx">BACK TO HOME PAGE</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
