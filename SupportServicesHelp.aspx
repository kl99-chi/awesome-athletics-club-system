<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupportServicesHelp.aspx.cs" Inherits="project223.SupportServicesHelp1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:azure">
<head runat="server">
    <title>Help - AWESOME AC Support Services</title>
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
            <h1>AWESOME AC Support Services - Help Guide</h1>

            <div class="help-section">
                <h2>How to Book a Support Session</h2>
                <ol>
                    <li>Select a date using the calendar provided.</li>
                    <li>Choose the type of session (Ice Bath & Massage or Therapy Session).</li>
                    <li>Pick a time slot from the available options.</li>
                    <li>Click the "Book Session" button to confirm your booking.</li>
                </ol>
            </div>

            <div class="help-section">
                <h2>Managing Your Sessions</h2>
                <ul>
                    <li>To update a session, select the session in the list by checking the box, then make your changes, and click "UPDATE SESSION".</li>
                    <li>To remove a session, check the session you want to delete, and then click the "DELETE SESSION" button.</li>
                    <li>You can book multiple sessions by repeating the booking process.</li>
                    <li>You can only book slots that are within 8 days from todays date</li>
                </ul>
            </div>

            <div class="help-section">
                <h2>Tips</h2>
                <ul>
                    <li>Make sure to fill out all required fields before booking a session.</li>
                    <li>You can view all your selected sessions in the table at the bottom of the page.</li>
                    <li>If you need to make changes, you can always update or delete your sessions.</li>
                </ul>
            </div>

            <div class="back-button">
                <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#FF3300" style="text-align: center" NavigateUrl="~/SupportService.aspx">BACK TO SUPPORT SERVICES</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
