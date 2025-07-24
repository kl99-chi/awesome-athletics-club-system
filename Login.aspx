<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="project223.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:gray">
<head runat="server">
    <title>Login</title>
    <style type="text/css">
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
            <h1><asp:Label ID="Label1" runat="server" ForeColor="#FF6600" Text="AWESOME ATLHETICS CLUB"></asp:Label></h1></div>

        <p class="auto-style1">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Models/IMAGES/background.jpg" style="text-align: right" Width="182px" />
        </p>
        <p class="auto-style2">
        </p>
        <p class="auto-style1">
            <asp:Label ID="Label6" runat="server" Text="EMAIL(USERNAME): " ForeColor="White"></asp:Label>
        <asp:TextBox ID="TextBox5" runat="server" Width="257px" AutoCompleteType="Disabled" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox5" ErrorMessage="EMAIL IS NOT IN THE CORRECT FORMAT" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </p>
        <p class="auto-style1">
            <asp:Label ID="Label7" runat="server" Text="PASSWORD: " ForeColor="White"></asp:Label>
            <asp:TextBox ID="TextBox6" runat="server" Width="248px" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox6" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox6" ErrorMessage="PASSWORD MUST HAVE 4 DIGITS" ForeColor="Red" MaximumValue="9999" MinimumValue="1000"></asp:RangeValidator>
        </p>
        <p class="auto-style1">
            <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#FF6600" NavigateUrl="~/ForgotPassword.aspx">FORGOT PASSWORD</asp:HyperLink>
        </p>
        <p class="auto-style1">
            <asp:Label ID="Label9" runat="server"></asp:Label>
        </p>
        <p class="auto-style1">
    <asp:Button ID="Button1" runat="server" BackColor="#FF6600" Text="LOGIN" Width="157px" OnClick="Button1_Click" />
        </p>
        <p class="auto-style1">
            <asp:Label ID="Label8" runat="server" Text="New to the club?  " ForeColor="White"></asp:Label>
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#FF6600" NavigateUrl="~/CreateAcc.aspx">CREATE ACCOUNT</asp:HyperLink>
        </p>
        <p class="auto-style1">
            &nbsp;</p>
    </form>
</body>
</html>
