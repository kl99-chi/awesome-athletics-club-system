<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentGatewayHelp.aspx.cs" Inherits="project223.PaymentGatewayHelp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"style="background-color:azure">
<head runat="server">
    <title>Payment Gateway Help</title>
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
            <h1>AWESOME AC Payment Gateway - Help Guide</h1>

            <div class="help-section">
                <h2>How to Use the Payment Gateway</h2>
                <ol>
                    <li>Fill in your full name in the "Full Name" field.</li>
                    <li>Provide your billing address in the "Address" field.</li>
                    <li>Enter your card number (must have 16 digits).</li>
                    <li>Input the card holder's name in the designated field.</li>
                    <li>Specify the expiry date of your card in the format MM/YYYY.</li>
                    <li>Enter the CVV code (must have 3 digits).</li>
                    <li>Ensure all required fields are filled correctly before proceeding.</li>
                    <li>Click on the "Make Payment" button to process your payment.</li>
                    <li>Once the payment has been processed you will see the receipt</li>
                </ol>
            </div>

            <div class="help-section">
                <h2>Important Notes</h2>
                <ul>
                    <li>Make sure your card number, expiry date, and CVV are correct.</li>
                    <li>Contact your bank if you face issues with your card.</li>
                    <li>Ensure you are connected to a secure internet connection.</li>
                </ul>
            </div>

            <div class="back-button">
                <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#FF3300" style="text-align: center" NavigateUrl="~/PaymentGateway.aspx">BACK TO PAYMENT GATEWAY</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
