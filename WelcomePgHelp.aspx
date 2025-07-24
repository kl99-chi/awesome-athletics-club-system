<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WelcomePgHelp.aspx.cs" Inherits="project223.WelcomePgHelp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:azure">
<head runat="server">
    <title>Welcome Page Help</title>
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
            <h1>AWESOME AC Welcome Page - Help Guide</h1>

            <div class="help-section">
                <h2>How to Navigate the Welcome Page</h2>
                <ol>
                    <li>After logging in, you will be greeted with a personalized welcome message.</li>
                    <li>You can access the Menu which includes different sections like Schedule, Account, Store, and Reports using the buttons provided.</li>
                    <li>Click on the corresponding images to navigate to those sections.</li>
                    <li>If you want to log out, click the "Logout" button.</li>
                </ol>
            </div>

            <div class="help-section">
                <h2>Tips</h2>
                <ul>
                    <li>If you have any questions or issues, feel free to click the Help button to get assistance.</li>
                    <li>Always log out after you are done to ensure your account is secure.</li>
                </ul>
            </div>

            <div class="back-button">
                <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#FF3300" NavigateUrl="~/WelcomePg.aspx">BACK TO WELCOME PAGE</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
