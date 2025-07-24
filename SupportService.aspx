<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupportService.aspx.cs" Inherits="project223.SupportService" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:aliceblue">
<head runat="server">
    <title>Support Services</title>
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
            background-image: url('<%= ResolveUrl("~/Models/Backgrounds/360_F_99474971_kvwn04WzYNdXntumZ4ajbDYyfOpKxUoX.jpg") %>');
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
        .auto-style2 {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1 class="auto-style1"><asp:Label ID="Label1" runat="server" ForeColor="#6699FF" Text="AWESOME ATHLETICS CLUB SUPPORT SERVICES"></asp:Label></h1>
            <p class="auto-style1">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Models/Backgrounds/360_F_99474971_kvwn04WzYNdXntumZ4ajbDYyfOpKxUoX.jpg" style="text-align: right" Width="182px" />
            </p>
            <h2 class="auto-style1"><asp:Label ID="Label2" runat="server" Text="Select a session and date to book your therapy." ForeColor="Black"></asp:Label></h2>
            <h3 class="auto-style2">
            <asp:Label ID="Label8" runat="server" Text="Select any date 8 days from today"></asp:Label>
            </h3>

            <!-- Calendar -->
            <div class="auto-style1">
                <asp:Calendar ID="Calendar1" runat="server" BackColor="#99CCFF" BorderColor="Black" SelectedDate="08/24/2024 23:06:01" Width="458px"></asp:Calendar>
            </div>

            <!-- Radio buttons for session selection -->
            <h3 class="auto-style2"><asp:Label ID="Label3" runat="server" Text="Session Type: "></asp:Label></h3>
            <p class="auto-style2">
                <asp:RadioButtonList ID="rbSessionType" runat="server">
                    <asp:ListItem Text="Ice Bathing & Massage Session" Value="Ice Bathing & Massage" />
                    <asp:ListItem Text="Therapy Session" Value="Therapy" />
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorSessionType" runat="server" ControlToValidate="rbSessionType" InitialValue="" ErrorMessage="* Please select a session type" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>

            <!-- Time selection dropdown -->
            <p class="auto-style2">
                <asp:Label ID="Label5" runat="server" Text="Time: "></asp:Label>
                <asp:DropDownList ID="ddlTime" runat="server" Height="23px" Width="151px"></asp:DropDownList>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator1" 
                    runat="server" 
                    ControlToValidate="ddlTime" 
                    InitialValue="Select..." 
                    ErrorMessage="Please select a time" 
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </p>
    
            <!-- Buttons for booking, updating, deleting -->
            <div class="auto-style2">
                <asp:Button ID="btnBook" runat="server" Text="Book Session" OnClick="btnBook_Click" Width="120px" />
            &nbsp;<asp:Label ID="lblMessage" runat="server"></asp:Label>
            </div>

            <!-- GridView to display the booked sessions -->
            <div class="auto-style1">
                <h3>Booked Sessions</h3>
                <asp:GridView ID="gvSessions" runat="server" AutoGenerateColumns="False" Width="100%">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelect" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Date" HeaderText="Date" />
                        <asp:BoundField DataField="SessionType" HeaderText="Session Type" />
                        <asp:BoundField DataField="Time" HeaderText="Time" />
                    </Columns>
                </asp:GridView>
                <br />
                <asp:Button ID="btnUpdate" runat="server" Text="Update Session" OnClick="btnUpdate_Click" Width="120px" />
                <br />
                <br />
                <asp:Button ID="btnDelete" runat="server" Text="Delete Session" OnClick="btnDelete_Click" Width="120px" />
            </div>

            <p class="auto-style1">
                <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#6666FF" NavigateUrl="~/SupportServicesHelp.aspx">Help</asp:HyperLink>
            </p>
            <p class="auto-style1">
                <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Red" NavigateUrl="~/Mantain.aspx">BACK TO SCHEDULES</asp:HyperLink>
            </p>
        </div>
    </form>
</body>
</html>
