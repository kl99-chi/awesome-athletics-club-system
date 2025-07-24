<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrainingSlotHelp.aspx.cs" Inherits="project223.UpdateTrainingSlot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:azure">
<head runat="server">
    <title>Help - AWESOME AC Training Slots</title>
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
            <h1>AWESOME AC Training Slots - Help Guide</h1>

            <div class="help-section">
                <h2>How to Book a Training Slot</h2>
                <ol>
                    <li>Select a date using the calendar provided.</li>
                    <li>Choose a venue from the dropdown list (Track, Training Ground, or Swimming Pool).</li>
                    <li>Select the type of training (Individual or Group).</li>
                    <li>Pick a time slot from the available options.</li>
                    <li>If you need a monitor, check the "Include a monitor" box.</li>
                    <li>Click the "Select Slot" button to add your booking to the list.</li>
                </ol>
            </div>

            <div class="help-section">
                <h2>Managing Your Bookings</h2>
                <ul>
                    <li>To update a booking, select the booking in the list by checking the box, then make your changes, and click "UPDATE SLOT".</li>
                    <li>To remove a booking, check the booking you want to delete, and then click the "DELETE SLOTS" button.</li>
                    <li>You can book multiple slots by repeating the booking process.</li>
                    <li>You can only book slots that are within 8 days from todays date</li>
                </ul>
            </div>

            <div class="help-section">
                <h2>Tips</h2>
                <ul>
                    <li>Make sure to fill out all required fields before selecting a slot.</li>
                    <li>You can view all your selected slots in the table at the bottom of the page.</li>
                    <li>If you need to make changes, you can always update or delete your bookings.</li>
                </ul>
            </div>

            <div class="back-button">
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#FF3300" style="text-align: center" NavigateUrl="~/TrainingSlot.aspx">BACK TO TRAINING SLOTS</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
