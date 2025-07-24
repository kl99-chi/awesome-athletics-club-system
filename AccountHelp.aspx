<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountHelp.aspx.cs" Inherits="project223.AccountHelp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"style="background-color:azure">
<head runat="server">
    <title>Account Help</title>
    <style type="text/css">
        body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; max-width: 800px; margin: 0 auto; padding: 20px; }
        h1 { color: #FF6600; text-align: center; }
        h2 { color: #0066cc; }
        .help-section { margin-bottom: 20px; }
        .back-button { text-align: center; margin-top: 20px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>AWESOME AC Member Account - Help Guide</h1>

            <div class="help-section">
                <h2>How to Manage Your Account</h2>
                <ol>
                    <li>To view your account details, navigate to the "Account" section from the welcome page.</li>
                    <li>You can update your personal information, such as your first name and surname, in the provided fields.</li>
                    <li>To change your email or password, fill in the respective fields and click "UPDATE USERNAME & PASSWORD".</li>
                    <li>Ensure all required fields are filled out before submitting your updates.</li>
                    <li>After making changes, a confirmation message will appear indicating the status of your updates.</li>
                </ol>
            </div>

            <div class="help-section">
                <h2>Tips</h2>
                <ul>
                    <li>Always check your email format when updating your username.</li>
                    <li>Make sure your passwords match and meet any security criteria set by the system.</li>
                    <li>If you encounter any issues, feel free to reach out for support.</li>
                </ul>
            </div>

            <div class="back-button">
                <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#FF3300" NavigateUrl="~/Account.aspx">BACK TO ACCOUNT PAGE</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>