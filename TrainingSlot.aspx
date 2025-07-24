<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrainingSlot.aspx.cs" Inherits="project223.TrainingSlot" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:snow">
<head runat="server">
    <title>Training Slots</title>
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
            filter: blur(8px);
            z-index: -1;
        }
        .auto-style22 {
            text-align: center;
        }
        .auto-style23 {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 class="auto-style22">
            <asp:Label ID="Label1" runat="server" ForeColor="#FF6600" Text="AWESOME AC TRAINING SLOTS"></asp:Label>
        </h1>
        <p class="auto-style22">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Models/Backgrounds/Screenshot 2024-08-19 220544.png" style="text-align: right" Width="182px" />
        </p>
        <h2 class="auto-style22">
            <asp:Label ID="Label7" runat="server"></asp:Label>
        </h2>
        <h3 class="auto-style23">
            <asp:Label ID="Label8" runat="server" Text="Select any date 8 days from today"></asp:Label>
        </h3>
        <div class="auto-style22">
            <asp:Calendar ID="Calendar1" runat="server" BackColor="#FF9900" BorderColor="Black" SelectedDate="08/24/2024 23:06:01" Width="458px"></asp:Calendar>
            <h3 class="auto-style23">
                <asp:Label ID="Label2" runat="server" Text="Select the following to book a slot"></asp:Label>
            </h3>
            <div class="auto-style23">
                <asp:Label ID="Label3" runat="server" Text="Venue: "></asp:Label>
                <asp:DropDownList ID="dVenue" runat="server" Height="30px" Width="154px">
                    <asp:ListItem Text="Select..." Value="" />
                    <asp:ListItem Text="Track" Value="Track" />
                    <asp:ListItem Text="Training Ground" Value="Training Ground" />
                    <asp:ListItem Text="Swimming Pool" Value="Swimming Pool" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="dVenue" InitialValue="" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Type of Training: "></asp:Label>
            <asp:DropDownList ID="dTrainingType" runat="server" Height="21px" Width="149px">
                <asp:ListItem Text="Select..." Value="" />
                <asp:ListItem Text="Individual training" Value="Individual training" />
                <asp:ListItem Text="Group training" Value="Group training" />
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dTrainingType" InitialValue="" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" Text="Time: "></asp:Label>
            <asp:DropDownList ID="dTime" runat="server" Height="23px" Width="151px">
                <asp:ListItem Text="Select..." Value="" />
                <asp:ListItem Text="06:00 AM - 08:00 AM" Value="06:00 AM - 08:00 AM" />
                <asp:ListItem Text="08:00 AM - 10:00 AM" Value="08:00 AM - 10:00 AM" />
                <asp:ListItem Text="10:00 AM - 12:00 PM" Value="10:00 AM - 12:00 PM" />
                <asp:ListItem Text="12:00 PM - 02:00 PM" Value="12:00 PM - 02:00 PM" />
                <asp:ListItem Text="02:00 PM - 04:00 PM" Value="02:00 PM - 04:00 PM" />
                <asp:ListItem Text="04:00 PM - 06:00 PM" Value="04:00 PM - 06:00 PM" />
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="dTime" InitialValue="" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p class="auto-style23">
            <asp:CheckBox ID="Monitor" runat="server" Text="Include a monitor" />
        </p>
        <p class="auto-style23">
            <asp:Button ID="Button1" runat="server" Text="Select Slot" OnClick="Button1_Click" />
        </p>
        <h3 class="auto-style22">
            <asp:Label ID="Label6" runat="server" Text="Selected Slots"></asp:Label>
        </h3>
        <div class="auto-style22">
            <asp:GridView ID="tblSelectedSlots" runat="server" AutoGenerateColumns="False" Width="778px">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Date" HeaderText="Date" />
                    <asp:BoundField DataField="Venue" HeaderText="Venue" />
                    <asp:BoundField DataField="TrainingType" HeaderText="Type of Training" />
                    <asp:BoundField DataField="Time" HeaderText="Time" />
                    <asp:BoundField DataField="Monitor" HeaderText="Monitor" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
        <p class="auto-style22">
            <asp:Button ID="Button7" runat="server" Text="UPDATE SLOT" Width="249px" OnClick="Button7_Click" />
        </p>
        <p class="auto-style22">
            <asp:Button ID="Button9" runat="server" Height="26px" Text="DELETE SLOT" Width="249px" OnClick="Button9_Click" />
        </p>
        <p class="auto-style22">
            <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#6666FF" NavigateUrl="~/TrainingSlotHelp.aspx">Help</asp:HyperLink>
        </p>
        <p class="auto-style22">
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Red" style="text-align: center" NavigateUrl="~/Mantain.aspx">BACK TO SCHEDULES</asp:HyperLink>
        </p>
    </form>
</body>
</html>