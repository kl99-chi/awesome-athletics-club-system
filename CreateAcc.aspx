<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAcc.aspx.cs" Inherits="project223.CreateAcc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:gray">
<head runat="server">
    <title>Create Account</title>
    <style type="text/css">
        .auto-style2 {
            text-align: left;
        }
        .auto-style3 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style3">
        <h1><asp:Label ID="Label1" runat="server" ForeColor="#FF6600" Text="AWESOME ATLHETICS CLUB"></asp:Label></h1>
        <div class="auto-style3">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Models/IMAGES/background.jpg" style="text-align: right" Width="182px" />
        </div>
            <div class="auto-style2">
                <h2 class="auto-style2"><asp:Label ID="Label9" runat="server" ForeColor="#FF6600" Text="CREATE ACCOUNT"></asp:Label>
                </h2>
            </div>
        <p class="auto-style2">
        <asp:Label ID="Label2" runat="server" Text="FIRST NAME: " ForeColor="White"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" Width="265px" AutoCompleteType="Disabled"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        &nbsp;</p>
            <p class="auto-style2">
            <asp:Label ID="Label3" runat="server" Text="SURNAME: " ForeColor="White"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" Width="257px" AutoCompleteType="Disabled"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p class="auto-style2">
            <asp:Label ID="Label4" runat="server" Text="IDENTITY NUMBER: " ForeColor="White"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" Width="248px" AutoCompleteType="Disabled"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
            <div class="auto-style2">
            <asp:Label ID="Label5" runat="server" Text="AGE: " ForeColor="White"></asp:Label>
        <asp:TextBox ID="TextBox4" runat="server" Width="265px" style="margin-bottom: 0px" AutoCompleteType="Disabled" TextMode="Number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox4" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
            
            </div>
        </div>
        <p class="auto-style2">
            &nbsp;</p>
            <h2 class="auto-style2">
                <asp:Label ID="Label10" runat="server" ForeColor="#FF6600" Text="USERNAME &amp; PASSWORD"></asp:Label></h2>
        <p class="auto-style2">
            <asp:Label ID="Label6" runat="server" Text="EMAIL(USERNAME): " ForeColor="White"></asp:Label>
        <asp:TextBox ID="TextBox5" runat="server" Width="257px" AutoCompleteType="Disabled" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox5" ErrorMessage="EMAIL IS NOT IN THE CORRECT FORMAT" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </p>
        <p class="auto-style2">
            <asp:Label ID="Label7" runat="server" Text="PASSWORD(4 DIGIT PIN): " ForeColor="White"></asp:Label>
            <asp:TextBox ID="TextBox6" runat="server" Width="248px" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox6" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox6" ErrorMessage="PASSWORD MUST HAVE 4 DIGITS" ForeColor="Red" MaximumValue="9999" MinimumValue="1000"></asp:RangeValidator>
            <asp:Label ID="Label13" runat="server"></asp:Label>
        </p>
        <div class="auto-style2">
            <asp:Label ID="Label8" runat="server" Text="CORNFIRM PASSWORD: " ForeColor="White"></asp:Label>
        <asp:TextBox ID="TextBox7" runat="server" Width="257px" TextMode="Password" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox7" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TextBox7" ErrorMessage="PASSWORD MUST HAVE 4 DIGITS" ForeColor="Red" MaximumValue="9999" MinimumValue="1000"></asp:RangeValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox6" ControlToValidate="TextBox7" ErrorMessage="INCORRECT PASSWORD" ForeColor="Red"></asp:CompareValidator>
            <asp:Label ID="Label12" runat="server"></asp:Label>
            </div>
        <p class="auto-style3">
            <asp:Label ID="Label11" runat="server"></asp:Label>
                </p>
        <p class="auto-style3">
            <asp:Label ID="Label14" runat="server"></asp:Label>
        </p>
        <p class="auto-style3">
            
        <asp:Button ID="Button1" runat="server" BackColor="#FF6600" Height="41px" OnClick="Button1_Click" Text="CREATE ACCOUNT" Width="155px" />
            </p>
        <p class="auto-style3">
            
            <asp:HyperLink ID="HyperLink2" runat="server" BackColor="Orange" ForeColor="White" NavigateUrl="~/CreateAccHelp.aspx">Help</asp:HyperLink>
            </p>
        <p class="auto-style3">
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#FF6600" NavigateUrl="~/Login.aspx">BACK TO LOGIN</asp:HyperLink>
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
