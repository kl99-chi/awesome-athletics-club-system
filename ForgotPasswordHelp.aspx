<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPasswordHelp.aspx.cs" Inherits="project223.ForgotPasswordHelp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:azure">
<head runat="server">
    <title>Help - AWESOME AC Forgot Password</title>
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
            <h1>AWESOME AC Forgot Password - Help Guide</h1>

            <div class="help-section">
                <h2>How to Reset Your Password</h2>
                <ol>
                    <li>Navigate to the "Forgot Password" page from the login screen.</li>
                    <li>Enter your registered ID Number and Email address.</li>
                    <li>Set your new password as a four-digit PIN and confirm it.</li>
                    <li>Submit your new password to complete the process.</li>
                    <li>If your ID and Email are found in our records, you will be allowed to set the new password and be able to use it.</li>
                </ol>
            </div>

            <div class="help-section">
                <h2>Troubleshooting</h2>
                <ul>
                    <li>If you receive an error indicating that your ID Number or Email is not recognized, please check your entries for typos.</li>
                    <li>If you cannot remember your registered ID Number or Email, please contact support for assistance.</li>
                    <li>If your new password does not meet the four-digit requirement, ensure you are using exactly four numeric characters.</li>
                </ul>
            </div>

            <div class="help-section">
                <h2>Tips</h2>
                <ul>
                    <li>Always use a password that is easy for you to remember but difficult for others to guess.</li>
                    <li>Keep your ID Number and Email safe, as they are crucial for resetting your password.</li>
                    <li>If you encounter issues with resetting your password, check your spam or junk mail folder for any verification emails.</li>
                </ul>
            </div>

            <div class="back-button">
                <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#FF3300" style="text-align: center" NavigateUrl="~/ForgotPassword.aspx">BACK TO FORGOT PASSWORD</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
