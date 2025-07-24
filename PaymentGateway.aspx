<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentGateway.aspx.cs" Inherits="project223.WebForm3" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" style="background-color: antiquewhite">
<head runat="server">
    <title>Payment Gateway</title>
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
        #form1 {
            width: 100%;
            max-width: 700px;
            margin: 0 auto;
        }
        .label {
            margin-bottom: 10px;
            display: block;
        }
        .input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .button {
            background-color: #FF9900;
            color: white;
            padding: 12px;
            border: none;
            cursor: pointer;
            width: 100%;
            margin-top: 20px;
            font-size: 16px;
        }
        .button:hover {
            background-color: #e68a00;
        }
        .error {
            color: red;
        }
        .auto-style1 {
            text-align: center;
        }
        .receipt {
            margin-top: 20px;
            border: 1px solid #ccc;
            padding: 10px;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 class="auto-style1">
            <asp:Label ID="Label1" runat="server" ForeColor="Black" Text="Awesome AC Payment Gateway"></asp:Label>
        </h1>
        <p class="auto-style1">
            <asp:Image ID="Image1" runat="server" Height="183px" ImageUrl="~/Models/Backgrounds/png-transparent-payment-gateway-payment-processor-computer-icons-e-commerce-payment-blue-angle-text-thumbnail.png" Width="299px" />
        </p>

        <!-- Full Name -->
        <label class="label">Full Name</label>
        <asp:TextBox ID="fullName" runat="server" CssClass="input" placeholder="Enter your full name" AutoCompleteType="Disabled"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFullName" runat="server" ControlToValidate="fullName" ErrorMessage="Full Name is required" CssClass="error"></asp:RequiredFieldValidator>

        <!-- Address -->
        <label class="label">Address</label>
        <asp:TextBox ID="address" runat="server" CssClass="input" placeholder="Enter your address" AutoCompleteType="Disabled"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" runat="server" ControlToValidate="address" ErrorMessage="Address is required" CssClass="error"></asp:RequiredFieldValidator>

        <!-- Card Number -->
        <label class="label">Card Number</label>
        <asp:TextBox ID="cardNumber" runat="server" CssClass="input" placeholder="1234 5678 9012 3456" MaxLength="16"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegexValidatorCardNumber" runat="server" ControlToValidate="cardNumber" ErrorMessage="Card number must be 16 digits" CssClass="error" ValidationExpression="^\d{16}$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCardNumber" runat="server" ControlToValidate="cardNumber" ErrorMessage="Card Number is required" CssClass="error"></asp:RequiredFieldValidator>

        <!-- Card Holder Name -->
        <label class="label">Card Holder Name</label>
        <asp:TextBox ID="cardHolderName" runat="server" CssClass="input" placeholder="Enter card holder name" AutoCompleteType="Disabled"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCardHolderName" runat="server" ControlToValidate="cardHolderName" ErrorMessage="Card Holder Name is required" CssClass="error"></asp:RequiredFieldValidator>

        <!-- Expiry Date -->
        <label class="label">Expiry Date (MM/YYYY)</label>
        <asp:TextBox ID="expiryDate" runat="server" CssClass="input" placeholder="MM/YYYY"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegexValidatorExpiryDate" runat="server" ControlToValidate="expiryDate" ErrorMessage="Invalid Expiry Date. Use MM/YYYY" CssClass="error" ValidationExpression="^(0[1-9]|1[0-2])\/?([0-9]{4})$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorExpiryDate" runat="server" ControlToValidate="expiryDate" ErrorMessage="Expiry Date is required" CssClass="error"></asp:RequiredFieldValidator>

        <!-- CVV -->
        <label class="label">CVV</label>
        <asp:TextBox ID="cvv" runat="server" CssClass="input" MaxLength="3" placeholder="CVV"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegexValidatorCVV" runat="server" ControlToValidate="cvv" ErrorMessage="CVV must be 3 digits" CssClass="error" ValidationExpression="^\d{3}$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCVV" runat="server" ControlToValidate="cvv" ErrorMessage="CVV is required" CssClass="error"></asp:RequiredFieldValidator>

        <!-- Payment Button -->
        <h3 class="auto-style1">
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <asp:Button ID="paymentButton" runat="server" CssClass="button" OnClick="paymentButton_Click" Text="Make Payment" />
        </h3>
        
        <!-- Receipt Display -->
        <div class="receipt">
            <h3>Receipt</h3>
            <asp:Label ID="orderNumberValue" runat="server" Text=""></asp:Label>
            <asp:ListBox ID="receiptListBox" runat="server" Height="150px" Width="100%"></asp:ListBox>
            <asp:Label ID="totalLabel" runat="server" CssClass="auto-style1"></asp:Label>
        </div>
        
        <h3 class="auto-style1">
            <asp:Label ID="Label3" runat="server" ForeColor="#006600"></asp:Label>
        </h3>
        <p class="auto-style1">
            <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#9900CC" NavigateUrl="~/PaymentGatewayHelp.aspx">Help</asp:HyperLink>
        </p>
        <p class="auto-style1">
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Red" NavigateUrl="~/Store.aspx">BACK TO STORE</asp:HyperLink>
        </p>
    </form>
</body>
</html>