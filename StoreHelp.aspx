<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoreHelp.aspx.cs" Inherits="project223.StoreHelp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:azure">
<head runat="server">
    <title>Store Help</title>
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
            <h1>Awesome AC Store - Help Guide</h1>

            <div class="help-section">
                <h2>How to Use the Store</h2>
                <ol>
                    <li>Navigate through the available products displayed on the store page.</li>
                    <li>Select a product to add it to the cart.</li>
                    <li>Once a product has been added to the cart, a confirmation message will be displayed along with the count of the number of items added to your cart.</li>
                    <li>Once you're ready to checkout, click on the cart icon.</li>
                </ol>
                <p>
                    &nbsp;</p>
            </div>

            <div class="help-section">
                <h2>Tips</h2>
                <ul>
                    <li>Keep an eye out for promotions and discounts available in the store.</li>
                    <li>If you have questions about a product, check the product description or contact support.</li>
                </ul>
            </div>

            <div class="back-button">
                <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#FF3300" style="text-align: center" NavigateUrl="~/Store.aspx">BACK TO STORE</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
