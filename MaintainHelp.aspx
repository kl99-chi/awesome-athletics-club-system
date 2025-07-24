<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintainHelp.aspx.cs" Inherits="project223.MaintainHelp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:azure">
<head runat="server">
    <title>Awesome Athletic Club - Maintain Help</title>
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
        <h1>AWESOME AC SCHEDULES - Help Guide</h1>

        <div class="help-section">
            <h2>How to Use the Schedule Feature</h2>
                <ol>
                    <li>You can access the Menu which includes different sections like Training Slots, Events, and Support Services using the buttons provided.</li>
                    <li>You can maintain both the Training Slots and Support Services for the booked sessions and view the year calendar in the Events page</li>
                    <li>If you encounter issues, consult the support service.</li>
                </ol>
            <p>
                &nbsp;</p>
        </div>

        <div class="back-button">
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#FF3300" NavigateUrl="~/Mantain.aspx">BACK TO SCHEDULES</asp:HyperLink>
        </div>
    </form>
</body>
</html>
