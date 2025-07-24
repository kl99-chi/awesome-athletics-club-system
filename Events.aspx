<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="project223.Reports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:aliceblue">
<head runat="server">
    <title>Events</title>
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 class="auto-style1"> <asp:Label ID="Label1" runat="server" ForeColor="Black" Text="AWESOME AC YEAR SCHEDULE"></asp:Label></h1>
            <p class="auto-style1">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Models/IMAGES/REPORTS.jpg" style="text-align: right" Width="182px" />
        </p>
        <p class="auto-style1">
            <asp:Image ID="Image1" runat="server" Height="722px" Width="1137px" ImageUrl="~/Models/IMAGES/Screenshot 2024-08-25 013548.png" />
    
        </p>
    
        <p class="auto-style1">
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#3399FF" style="text-align: center" NavigateUrl="~/Mantain.aspx">BACK TO SCHEDULES</asp:HyperLink>
         </p>
    
    </form>
</body>
</html>
