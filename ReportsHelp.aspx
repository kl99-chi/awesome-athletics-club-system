<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportsHelp.aspx.cs" Inherits="project223.ReportsHelp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"style="background-color:azure">
<head runat="server">
    <title>Awesome Athletics Club - Reports Help</title>
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
        <h1>AWESOME AC Reports - Help Guide</h1>

        <div class="help-section">
            <h2>How to Generate Reports</h2>
            <ol>
                <li>Select the desired report type from the dropdown list (Members or Products).</li>
                <li>Click the "Generate Report" button to display the relevant report.</li>
                <li>You can filter and sort the reports based on categories provided.</li>
                <li>Once the report is displayed, you can choose to save it to a file.</li>
            </ol>
        </div>

        <div class="help-section">
            <h2>Understanding the Report Layout</h2>
            <ul>
                <li>The members report will display first name, surname, ID number, age, and category.</li>
                <li>The products report will show product name and price.</li>
                <li>Both reports are displayed in a tabular format for easy reading.</li>
            </ul>
        </div>

        <div class="help-section">
            <h2>Tips</h2>
            <ul>
                <li>Ensure to check your selections before submitting the report request.</li>
                <li>Use the save functionality to keep a copy of your reports for future reference.</li>
                <li>If you encounter issues, consult the support service or refer back to this guide.</li>
            </ul>
        </div>

        <div class="back-button">
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#FF3300" NavigateUrl="~/Reports.aspx">BACK TO REPORTS</asp:HyperLink>
        </div>
    </form>
</body>
</html>