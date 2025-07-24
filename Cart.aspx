<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="project223.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color: aliceblue">
<head runat="server">
    <title>Cart</title>
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <h1>
               <asp:Label ID="Label1" runat="server" ForeColor="Black" Text="Awesome Athletics Club Cart"></asp:Label>
           </h1>
        </div>
        <p>
            &nbsp;</p>
        <p class="auto-style1">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Models/IMAGES/SHOPPING.jpg" style="text-align: right" Width="182px" />
            </p>
            <h3 class="auto-style1"><asp:Label ID="Label2" runat="server" Text="Select the item to remove from the list"></asp:Label></h3>
        <p class="auto-style1">
            <asp:Button ID="RemoveButton" runat="server" Text="Remove Selected Item" Width="141px" OnClick="RemoveButton_Click" />
        </p>
        <p class="auto-style1">
            <asp:ListBox ID="ListBox1" runat="server" Height="373px" Width="570px"></asp:ListBox>
        </p>
        <p class="auto-style1">
            <asp:Label ID="RemovalLabel" runat="server" ForeColor="Red"></asp:Label>
        </p>
        
        <p class="auto-style1">
            <asp:Label ID="Label5" runat="server" Text="Total Price"></asp:Label>
        </p>
        <p class="auto-style1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label6" runat="server" Text="Total items"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
        <p class="auto-style1">
            <asp:Button ID="Button2" runat="server" BackColor="#FF3300" Height="43px" OnClick="Button2_Click" Text="PAY" Width="151px" />
        </p>
        <p class="auto-style1">
            <asp:Button ID="Button3" runat="server" BackColor="#CCCCFF" Text="Help" Width="69px" OnClick="Button3_Click" />
         </p>
        <p class="auto-style1">
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#FF3300" style="text-align: center" NavigateUrl="~/Store.aspx">BACK TO STORE</asp:HyperLink>
         </p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
