using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project223
{
    public partial class SupportService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LoggedInID"] != null)
                {
                    PopulateTimeDropdown();
                    InitializeGridView();
                    Calendar1.SelectedDate = DateTime.Today;
                }
                else
                {
                    // Redirect to login page if session has expired or user is not logged in
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void PopulateTimeDropdown()
        {
            ddlTime.Items.AddRange(new ListItem[] {
                new ListItem("Select..."),
                new ListItem("06:00 AM - 08:00 AM"),
                new ListItem("08:00 AM - 10:00 AM"),
                new ListItem("10:00 AM - 12:00 PM"),
                new ListItem("12:00 PM - 02:00 PM"),
                new ListItem("02:00 PM - 04:00 PM"),
                new ListItem("04:00 PM - 06:00 PM")
            });
        }

        private void InitializeGridView()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[] {
                new DataColumn("Date", typeof(string)),
                new DataColumn("SessionType", typeof(string)),
                new DataColumn("Time", typeof(string))
            });
            gvSessions.DataSource = dt;
            gvSessions.DataBind();
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                AddSessionToGridView();
            }
        }

        private void AddSessionToGridView()
        {
            DateTime selectedDate = Calendar1.SelectedDate;
            string sessionType = rbSessionType.SelectedValue;
            string selectedTime = ddlTime.SelectedValue;

            // Ensure the selected date is today or a future date
            if (selectedDate < DateTime.Today)
            {
                lblMessage.Text = "You can only book sessions for today or future dates.";
                return;
            }

            // Retrieve or initialize the DataTable from ViewState
            DataTable dt = ViewState["BookedSessions"] as DataTable ?? new DataTable();
            if (dt.Columns.Count == 0)
            {
                dt.Columns.Add("Date", typeof(string));  // Store date as string for formatted display
                dt.Columns.Add("SessionType", typeof(string));
                dt.Columns.Add("Time", typeof(string));
            }

            // Check if a session is already booked for the selected date
            foreach (DataRow row in dt.Rows)
            {
                if (row["Date"].ToString() == selectedDate.ToString("yyyy/MM/dd"))
                {
                    lblMessage.Text = "You have already booked a session for this date.";
                    return;
                }
            }

            // Add the new session to the DataTable with the formatted date
            DataRow newRow = dt.NewRow();
            newRow["Date"] = selectedDate.ToString("yyyy/MM/dd"); // Format date without time
            newRow["SessionType"] = sessionType;
            newRow["Time"] = selectedTime;

            dt.Rows.Add(newRow);

            // Sort the DataTable by Date
            DataView dv = dt.DefaultView;
            dv.Sort = "Date ASC";  // Sort by Date in ascending order (nearest date first)

            // Bind the sorted DataView to the GridView
            gvSessions.DataSource = dv;
            gvSessions.DataBind();

            // Store the sorted DataTable back into ViewState
            ViewState["BookedSessions"] = dt;

            lblMessage.Text = "Session booked successfully.";
        }

        // Update selected slot in the GridView
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            DataTable dt = ViewState["BookedSessions"] as DataTable;
            if (dt != null)
            {
                DateTime newDate = Calendar1.SelectedDate;

                // Check if the new date is already booked by another session
                foreach (DataRow row in dt.Rows)
                {
                    // Skip the currently selected row to allow updating other fields
                    if (row["Date"].ToString() == newDate.ToString("yyyy/MM/dd"))
                    {
                        lblMessage.Text = "You have already booked a session for this date.";
                        return;
                    }
                }

                for (int i = 0; i < gvSessions.Rows.Count; i++)
                {
                    CheckBox chkSelect = (CheckBox)gvSessions.Rows[i].FindControl("chkSelect");
                    if (chkSelect != null && chkSelect.Checked)
                    {
                        dt.Rows[i]["Date"] = newDate.ToString("yyyy/MM/dd"); // Update with formatted date
                        dt.Rows[i]["SessionType"] = rbSessionType.SelectedValue;
                        dt.Rows[i]["Time"] = ddlTime.SelectedValue;
                    }
                }

                gvSessions.DataSource = dt;
                gvSessions.DataBind();
                ViewState["BookedSessions"] = dt;

                lblMessage.Text = "Session updated successfully.";
            }
        }

        // Delete selected slot(s) in the GridView
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            DataTable dt = ViewState["BookedSessions"] as DataTable;
            if (dt != null)
            {
                for (int i = gvSessions.Rows.Count - 1; i >= 0; i--)
                {
                    CheckBox chkSelect = (CheckBox)gvSessions.Rows[i].FindControl("chkSelect");
                    if (chkSelect != null && chkSelect.Checked)
                    {
                        dt.Rows[i].Delete();
                    }
                }
                dt.AcceptChanges();
                gvSessions.DataSource = dt;
                gvSessions.DataBind();
                ViewState["BookedSessions"] = dt;

                lblMessage.Text = "Session deleted successfully.";
            }
        }

        protected void btnHelp_Click(object sender, EventArgs e)
        {
            Response.Redirect("SupportServicesHelp.aspx");
        }
    }
}