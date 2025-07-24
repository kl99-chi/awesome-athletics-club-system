<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="project223.Account" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:snow">
<head runat="server">
    <title>Account</title>
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
        .auto-style2 {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 class="auto-style1">
            <asp:Label ID="Label1" runat="server" Text="AAC MEMBER ACCOUNT" ForeColor="Black"></asp:Label>
        </h1>
        <p class="auto-style1">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Models/Backgrounds/acc.png" style="text-align: right" Width="182px" />
        </p>
        <h3 class="auto-style1">
            <asp:Label ID="Label11" runat="server" Text="Member's Details:"></asp:Label>
        </h3>
        <p class="auto-style1">
            <asp:ListBox ID="ListBox1" runat="server" Height="306px" Width="399px"></asp:ListBox>
        </p>
        <div class="auto-style2">
            <asp:Label ID="Label9" runat="server" ForeColor="#FF6600" Text="Update Member Details"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="FIRST NAME: " ForeColor="Black"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Width="265px" AutoCompleteType="Disabled"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="SURNAME: " ForeColor="Black"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" Width="265px" AutoCompleteType="Disabled"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="UPDATE MEMBER DETAILS" OnClick="Button1_Click" />
            <br />
            <br />
            <asp:Label ID="Label10" runat="server" ForeColor="#FF6600" Text="Update Username and Password"></asp:Label>
            <br />
            <asp:Label ID="Label6" runat="server" Text="EMAIL(USERNAME): " ForeColor="Black"></asp:Label>
            &nbsp;&nbsp;
            <asp:TextBox ID="TextBox5" runat="server" Width="257px" AutoCompleteType="Disabled" TextMode="Email"></asp:TextBox>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox5" ErrorMessage="EMAIL IS NOT IN THE CORRECT FORMAT" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <asp:Label ID="Label7" runat="server" Text="PASSWORD: " ForeColor="Black"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox6" runat="server" Width="258px" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TextBox6" ErrorMessage="PASSWORD MUST HAVE 4 DIGITS" ForeColor="Red" MaximumValue="9999" MinimumValue="1000"></asp:RangeValidator>
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" Text="CONFIRM PASSWORD: " ForeColor="Black"></asp:Label>
            <asp:TextBox ID="TextBox7" runat="server" Width="257px" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
            <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="TextBox7" ErrorMessage="PASSWORD MUST HAVE 4 DIGITS" ForeColor="Red" MaximumValue="9999" MinimumValue="1000"></asp:RangeValidator>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="UPDATE USERNAME &amp; PASSWORD" OnClick="Button2_Click" />
            <br />
        </div>
        <p class="auto-style1">
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
        </p>
        <p class="auto-style1">
            <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#3366FF" NavigateUrl="~/AccountHelp.aspx">Help</asp:HyperLink>
        </p>
        <p class="auto-style1">
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Red" style="text-align: center" NavigateUrl="~/WelcomePg.aspx">back to home page</asp:HyperLink>
        </p>
    </form>
</body>
</html>

