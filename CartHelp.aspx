<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartHelp.aspx.cs" Inherits="project223.CartHelp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:azure">
<head runat="server">
    <title>Cart Help</title>
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
            <h1>Awesome AC Cart - Help Guide</h1>

            <div class="help-section">
                <h2>How to Use Your Cart</h2>
                <ol>
                    <li>Once you have added items, navigate to your cart to review your selections.</li>
                    <li>You can adjust quantities or remove items as needed.</li>
                    <li>To complete your purchase, click the "Proceed to Checkout" button.</li>
                </ol>
            </div>

            <div class="help-section">
                <h2>Managing Your Cart</h2>
                <ul>
                    <li>Your cart will display a summary of selected items, quantities, and total price.</li>
                    <li>Make sure to review your cart before proceeding to checkout.</li>
                    <li>If you encounter any issues with the cart, you can clear it and start over.</li>
                </ul>
            </div>

            <div class="help-section">
                <h2>Tips</h2>
                <ul>
                    <li>Check for any discount codes that may apply to your order before checking out.</li>
                    <li>If you have any questions about a product, check the product details or contact support.</li>
                </ul>
            </div>

            <div class="back-button">
                <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#FF3300" style="text-align: center" NavigateUrl="~/Cart.aspx">BACK TO CART</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>