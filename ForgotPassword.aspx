<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="project223.ForgotPassword" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:gray">
<head runat="server">
    <title>Forgot Password</title>
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
            <h1><asp:Label ID="Label1" runat="server" ForeColor="#FF6600" Text="AWESOME ATHLETICS CLUB"></asp:Label></h1>
            <p>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Models/IMAGES/background.jpg" style="text-align: right" Width="182px" />
            </p>
            <h2 class="auto-style2">
                <asp:Label ID="Label6" runat="server" Text="Set New Password" ForeColor="White"></asp:Label>
            </h2>
        </div>

        <p class="auto-style2">
            <asp:Label ID="Label2" runat="server" Text="ID Number: " ForeColor="White"></asp:Label>
            <asp:TextBox ID="TextBoxID" runat="server" Width="257px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorID" runat="server" ControlToValidate="TextBoxID" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>

        <p class="auto-style2">
            <asp:Label ID="Label3" runat="server" Text="Email: " ForeColor="White"></asp:Label>
            <asp:TextBox ID="TextBoxEmail" runat="server" Width="257px" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Email format is not valid." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </p>

        <p class="auto-style2"><asp:Label ID="Label4" runat="server" Text="New Password (4-Digit PIN):" ForeColor="White"></asp:Label>
            <asp:TextBox ID="TextBoxNewPassword" runat="server" Width="257px" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="TextBoxNewPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" runat="server" ControlToValidate="TextBoxNewPassword" ErrorMessage="Password must be a 4-digit PIN." ForeColor="Red" ValidationExpression="^\d{4}$"></asp:RegularExpressionValidator>
        </p>

        <p class="auto-style2"><asp:Label ID="Label5" runat="server" Text="Confirm Password:" ForeColor="White"></asp:Label>
            <asp:TextBox ID="TextBoxConfirmPassword" runat="server" Width="257px" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPassword" runat="server" ControlToValidate="TextBoxConfirmPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidatorPassword" runat="server" ControlToCompare="TextBoxNewPassword" ControlToValidate="TextBoxConfirmPassword" ErrorMessage="Passwords do not match." ForeColor="Red"></asp:CompareValidator>
        </p>

        <p class="auto-style2">
            <asp:Button ID="ButtonSubmit" runat="server" Text="Reset Password" OnClick="ButtonSubmit_Click" />
        </p>
        
        <p class="auto-style2">
            <asp:Label ID="LabelMessage" runat="server" ForeColor="Red"></asp:Label>
        </p>
        <p class="auto-style1">
            
            <asp:HyperLink ID="HyperLink2" runat="server" BackColor="Orange" ForeColor="White" NavigateUrl="~/ForgotPasswordHelp.aspx">Help</asp:HyperLink>
        </p>
        <p class="auto-style1">
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#FF6600" NavigateUrl="~/Login.aspx">BACK TO LOGIN</asp:HyperLink>
        </p>
    </form>
</body>
</html>