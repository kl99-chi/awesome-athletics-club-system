<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Store.aspx.cs" Inherits="project223.Ordering" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:aquamarine">
<head runat="server">
    <title>Store</title>
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
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="auto-style1">
            <h1>
                <asp:Label ID="Label1" runat="server" ForeColor="Black" Text="Awesome Athletics Club Store"></asp:Label>
            </h1>
            <p>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Models/Backgrounds/download.jpeg" style="text-align: right" Width="182px" />
            </p>
            <h3>
                <asp:Label ID="Label36" runat="server" Text="Click the image to add the item to the cart" ForeColor="#0066FF"></asp:Label>
            </h3>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <h1>
                        <asp:Label ID="Label2" runat="server" ForeColor="#0000CC" Text="Gear"></asp:Label>
                    </h1>
                    <h3>
                        <asp:Label ID="Label38" runat="server" ForeColor="#006699" Text="Running Tops"></asp:Label>
                    </h3>
                    <br />
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="162px" ImageUrl="~/Models/PRODUCTS/AAC Running Vest.png" Width="140px" OnClick="ImageButton1_Click" />
                    <asp:Label ID="Label39" runat="server" Text="AAC Running Top - R120"></asp:Label>
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="163px" ImageUrl="~/Models/PRODUCTS/Short Sleeve Shirt (Women).png" Width="152px" OnClick="ImageButton2_Click" />
                    <asp:Label ID="Label40" runat="server" Text="Short Sleeve Shirt (Women) - R150"></asp:Label>
                    <asp:ImageButton ID="ImageButton3" runat="server" Height="163px" ImageUrl="~/Models/PRODUCTS/Short Sleeve Shirt (Kids).png" Width="152px" OnClick="ImageButton3_Click" />
                    <asp:Label ID="Label6" runat="server" Text="Short Sleeve Shirt (Kids) - R100"></asp:Label>
                    <asp:ImageButton ID="ImageButton4" runat="server" Height="162px" ImageUrl="~/Models/PRODUCTS/Short Sleeve Shirt (Men).png" Width="140px" OnClick="ImageButton4_Click" />
                    <asp:Label ID="Label7" runat="server" Text="Short Sleeve Shirt (Men) - R150"></asp:Label>
                    <br /><br />
                    <asp:ImageButton ID="ImageButton5" runat="server" Height="194px" ImageUrl="~/Models/PRODUCTS/AAC Jersey (Unisex).png" Width="175px" OnClick="ImageButton5_Click" />
                    <asp:Label ID="Label34" runat="server" Text="AAC Jersey (Uni) - R250"></asp:Label>
                    <asp:ImageButton ID="ImageButton6" runat="server" Height="176px" ImageUrl="~/Models/PRODUCTS/AAC Tracksuit Top (Kids).png" Width="167px" OnClick="ImageButton6_Click" />
                    <asp:Label ID="Label33" runat="server" Text="ACC Tracksuit Top (Kids) - R250"></asp:Label>
                    <asp:ImageButton ID="ImageButton20" runat="server" Height="176px" ImageUrl="~/Models/PRODUCTS/AAC Tracksuit Top.png" Width="167px" OnClick="ImageButton20_Click" />
                    <asp:Label ID="Label37" runat="server" Text="ACC Tracksuit Top - R350"></asp:Label>
                    <h3 />
                    <asp:Label ID="Label14" runat="server" Text="Running Shorts" ForeColor="#006699"></asp:Label>
                    <h3 />
                    <asp:ImageButton ID="ImageButton7" runat="server" Height="334px" ImageUrl="~/Models/PRODUCTS/AAC Running Long Tights (Unisex).png" Width="133px" OnClick="ImageButton7_Click" />
                    <asp:Label ID="Label13" runat="server" Text="AAC Running Long Tights (Uni) - R250"></asp:Label>
                    <asp:ImageButton ID="ImageButton8" runat="server" Height="195px" ImageUrl="~/Models/PRODUCTS/AAC Running Short Tights.png" Width="162px" OnClick="ImageButton8_Click" />
                    <asp:Label ID="Label15" runat="server" Text="AAC Running Short Tights - R180"></asp:Label>
                    <asp:ImageButton ID="ImageButton9" runat="server" Height="330px" ImageUrl="~/Models/PRODUCTS/AAC Running Long Tights (Kids).png" Width="145px" OnClick="ImageButton9_Click" />
                    <asp:Label ID="Label16" runat="server" Text="AAC Running Long Tights (Kids) - R180"></asp:Label>
                    <h3 />
                    <asp:Label ID="Label31" runat="server" Text="Running Accessories" ForeColor="#006699"></asp:Label>
                    <h3 />
                    <asp:ImageButton ID="ImageButton10" runat="server" Height="143px" ImageUrl="~/Models/PRODUCTS/AAC Beanie.png" Width="147px" OnClick="ImageButton10_Click" />
                    <asp:Label ID="Label11" runat="server" Text="AAC Beanie - R120"></asp:Label>
                    <asp:ImageButton ID="ImageButton11" runat="server" Height="151px" ImageUrl="~/Models/PRODUCTS/AAC Bandana.png" Width="141px" OnClick="ImageButton11_Click" />
                    <asp:Label ID="Label18" runat="server" Text="AAC Bandana - R80"></asp:Label>
                    <asp:ImageButton ID="ImageButton12" runat="server" Height="146px" ImageUrl="~/Models/PRODUCTS/AAC Bag.png" Width="143px" OnClick="ImageButton12_Click" />
                    <asp:Label ID="Label17" runat="server" Text="AAC Bag - R100"></asp:Label>
                    <h1>
                        <asp:Label ID="Label21" runat="server" ForeColor="#0000CC" Text="Recovery Products"></asp:Label>
                    </h1>
                    <h3>
                        <asp:Label ID="Label32" runat="server" ForeColor="#006699" Text="Hydrations & Multi-Vitamins"></asp:Label>
                    </h3>
                    <asp:ImageButton ID="ImageButton13" runat="server" Height="120px" ImageUrl="~/Models/PRODUCTS/Hydrate Energy Drink (500ml).png" Width="147px" OnClick="ImageButton13_Click" />
                    <asp:Label ID="Label23" runat="server" Text="Hydrate Energy Drink (500ml) - R20"></asp:Label>
                    <asp:ImageButton ID="ImageButton14" runat="server" Height="120px" ImageUrl="~/Models/PRODUCTS/Hydrate Powder (30 sachets).png" Width="147px" OnClick="ImageButton14_Click" />
                    <asp:Label ID="Label24" runat="server" Text="Hydrate Powder (30 sachets) - R150"></asp:Label>
                    <asp:ImageButton ID="ImageButton15" runat="server" Height="120px" ImageUrl="~/Models/PRODUCTS/Centrum Multivitamin (30 capsules).png" Width="147px" OnClick="ImageButton15_Click" />
                    <asp:Label ID="Label25" runat="server" Text="Centrum Multivitamin (30 capsules) - R180"></asp:Label>
                    <asp:ImageButton ID="ImageButton16" runat="server" Height="120px" ImageUrl="~/Models/PRODUCTS/Centrum Multivitamin (60 capsules).png" Width="147px" OnClick="ImageButton16_Click" />
                        <asp:Label ID="Label26" runat="server" Text="Centrum Multivitamin (60 capsules) - R350"></asp:Label>

                        <br />
                    <br />

                        <asp:ImageButton ID="ImageButton17" runat="server" Height="120px" ImageUrl="~/Models/PRODUCTS/Deep%20Heat%20Muscle%20Rub%20(100g).png" Width="147px" OnClick="ImageButton17_Click" />
                        <asp:Label ID="Label27" runat="server" Text="Deep Heat Muscle Rub (100g) - R80"></asp:Label>

                        <asp:ImageButton ID="ImageButton18" runat="server" Height="120px" ImageUrl="~/Models/PRODUCTS/Deep%20Heat%20Muscle%20Rub%20(100gX3).png" Width="147px" OnClick="ImageButton18_Click" />
                        <asp:Label ID="Label3" runat="server" Text="Deep Heat Muscle Rub 3x(100g) - R200"></asp:Label>

                        <asp:ImageButton ID="ImageButton19" runat="server" Height="120px" ImageUrl="~/Models/PRODUCTS/Stark%20Pain%20Relief%20Tape.png" Width="147px" OnClick="ImageButton19_Click" />
                        <asp:Label ID="Label4" runat="server" Text="Stark Pain Relief Tape - R120"></asp:Label>
                        <!-- Continue for other products -->
                    </div>                
                    <br />
                    <br />
                    <h2><asp:Label ID="Label35" runat="server"></asp:Label></h2>
                    <h2><asp:Label ID="LabelCartCount" runat="server" ForeColor="#0000CC"></asp:Label><h2>
                </ContentTemplate>
            </asp:UpdatePanel>

            <p>
                &nbsp;</p>
            <p>
                <asp:Button ID="Button1" runat="server" Text="Check-Out" Height="44px" style="text-align: center" Width="209px" BackColor="#FFFFCC" OnClick="Button1_Click" />
            </p>
            <p>
                <asp:Button ID="Button2" runat="server" BackColor="#CCCCFF" Text="Help" Width="69px" OnClick="Button2_Click1" />
            </p>
        </div>
        <p>
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Red" style="text-align: center" NavigateUrl="~/WelcomePg.aspx">BACK TO HOME PAGE</asp:HyperLink>
        </p>
    </form>
</body>
</html>