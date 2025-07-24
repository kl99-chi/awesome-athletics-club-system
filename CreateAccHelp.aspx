<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAccHelp.aspx.cs" Inherits="project223.CreateAccHelp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:azure">
<head runat="server">
    <title>Help - AWESOME AC Create Account</title>
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
            <h1>AWESOME AC Create Account - Help Guide</h1>

            <div class="help-section">
                <h2>How to Create an Account</h2>
                <ol>
                    <li>Go to the "Create Account" page from the Awesome AC login page.</li>
                    <li>Fill in your personal information, including your First Name, Last Name, Email, and Password.</li>
                    <li>Make sure your password follows the format provided and matches the confirmation field.</li>
                    <li>Click the "Create Account" button to complete the process.</li>
                    <li>You can now proceed to Login.</li>
                </ol>
            </div>

            <div class="help-section">
                <h2>Troubleshooting</h2>
                <ul>
                    <li>If you encounter an error while creating your account, double-check all required fields and ensure they are filled out correctly.</li>
                    <li>If the passwords do not match, you will be prompted to correct them before submitting the form.</li>
                    <li>If your email is already registered, try resetting your password using the "Forgot Password" option on the login page.</li>
                </ul>
            </div>

            <div class="help-section">
                <h2>Tips</h2>
                <ul>
                    <li>Make sure to use a strong password for security. Your password should have 4 digits.</li>
                    <li>Ensure your email address is correct, as you will need it to verify your account and receive important notifications.</li>
                    <li>If you encounter issues with email verification, check your spam or junk mail folder.</li>
                </ul>
            </div>

            <div class="back-button">
                <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#FF3300" style="text-align: center" NavigateUrl="~/CreateAcc.aspx">BACK TO CREATE ACCOUNT</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
