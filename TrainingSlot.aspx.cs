using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project223
{
    public partial class TrainingSlot : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LoggedInID"] != null)
                {
                    InitializeGridView();
                    Calendar1.SelectedDate = DateTime.Today;
                    Label7.Text = "Today's Date: " + DateTime.Today.ToString("dd/MM/yyyy"); // Display today's date
                }
                else
                {
                    // Redirect to login page if session has expired or user is not logged in
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void InitializeGridView()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[] {
                new DataColumn("Date", typeof(string)),
                new DataColumn("Venue", typeof(string)),
                new DataColumn("TrainingType", typeof(string)),
                new DataColumn("Time", typeof(string)),
                new DataColumn("Monitor", typeof(string))
            });
            tblSelectedSlots.DataSource = dt;
            tblSelectedSlots.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                AddSlotToTable();
            }
        }

        // Method to validate if the selected date is within 8 days from today
        private bool IsDateValid(DateTime selectedDate)
        {
            DateTime today = DateTime.Today;
            DateTime maxBookingDate = today.AddDays(8);
            return selectedDate >= today && selectedDate <= maxBookingDate;
        }

        private void AddSlotToTable()
        {
            DateTime selectedDate = Calendar1.SelectedDate;

            // Validate the date
            if (!IsDateValid(selectedDate))
            {
                lblMessage.Text = "You can only book slots within 8 days from today.";
                return;
            }

            // Retrieve the DataTable from ViewState, initialize if it doesn't exist
            DataTable dt = (DataTable)ViewState["SelectedSlots"];
            if (dt == null)
            {
                dt = new DataTable();
                dt.Columns.Add("Date", typeof(string));
                dt.Columns.Add("Venue", typeof(string));
                dt.Columns.Add("TrainingType", typeof(string));
                dt.Columns.Add("Time", typeof(string));
                dt.Columns.Add("Monitor", typeof(string));
                ViewState["SelectedSlots"] = dt;
            }

            // Check if a slot for the selected date already exists
            foreach (DataRow row in dt.Rows)
            {
                if (Convert.ToDateTime(row["Date"]).Date == selectedDate.Date)
                {
                    lblMessage.Text = "You have already booked a slot for this day.";
                    return;
                }
            }

            // Proceed with adding the slot if no slot exists for the selected date
            DataRow newRow = dt.NewRow();
            newRow["Date"] = selectedDate.ToShortDateString();
            newRow["Venue"] = dVenue.SelectedValue;
            newRow["TrainingType"] = dTrainingType.SelectedValue;
            newRow["Time"] = dTime.SelectedValue;
            newRow["Monitor"] = Monitor.Checked ? "Yes" : "No";

            dt.Rows.Add(newRow);

            // Sort the table by date
            DataView dv = dt.DefaultView;
            dv.Sort = "Date ASC";
            dt = dv.ToTable();

            // Save the updated DataTable back to ViewState
            ViewState["SelectedSlots"] = dt;

            // Rebind the updated DataTable to the GridView
            tblSelectedSlots.DataSource = dt;
            tblSelectedSlots.DataBind();

            lblMessage.Text = "Slot booked successfully.";
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            // Retrieve the DataTable from ViewState
            DataTable dt = (DataTable)ViewState["SelectedSlots"];

            if (dt == null || dt.Rows.Count == 0)
            {
                lblMessage.Text = "No slots available to delete.";
                return;
            }

            // Iterate through GridView rows and delete selected slots
            for (int i = tblSelectedSlots.Rows.Count - 1; i >= 0; i--) // Reverse loop to avoid index issues
            {
                CheckBox chkSelect = (CheckBox)tblSelectedSlots.Rows[i].FindControl("chkSelect");
                if (chkSelect != null && chkSelect.Checked)
                {
                    dt.Rows[i].Delete();
                }
            }

            // Remove empty rows and rebind the GridView
            dt.AcceptChanges();
            ViewState["SelectedSlots"] = dt;

            tblSelectedSlots.DataSource = dt;
            tblSelectedSlots.DataBind();

            lblMessage.Text = "Selected slots deleted successfully.";
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            // Retrieve the DataTable from ViewState
            DataTable dt = (DataTable)ViewState["SelectedSlots"];

            if (dt == null || dt.Rows.Count == 0)
            {
                lblMessage.Text = "No slots available to update.";
                return;
            }

            int selectedIndex = -1;

            // Find the selected slot
            for (int i = 0; i < tblSelectedSlots.Rows.Count; i++)
            {
                CheckBox chkSelect = (CheckBox)tblSelectedSlots.Rows[i].FindControl("chkSelect");
                if (chkSelect != null && chkSelect.Checked)
                {
                    selectedIndex = i;
                    break;
                }
            }

            if (selectedIndex != -1)
            {
                DateTime newDate = Calendar1.SelectedDate;

                // Check if the new date already has a booked session
                foreach (DataRow row in dt.Rows)
                {
                    if (Convert.ToDateTime(row["Date"]).Date == newDate.Date && row != dt.Rows[selectedIndex]) // Ensure it's not the same row
                    {
                        lblMessage.Text = "Cannot update to a date that is already booked.";
                        return;
                    }
                }

                // Update the selected slot
                dt.Rows[selectedIndex]["Date"] = newDate.ToShortDateString();
                dt.Rows[selectedIndex]["Venue"] = dVenue.SelectedValue;
                dt.Rows[selectedIndex]["TrainingType"] = dTrainingType.SelectedValue;
                dt.Rows[selectedIndex]["Time"] = dTime.SelectedValue;
                dt.Rows[selectedIndex]["Monitor"] = Monitor.Checked ? "Yes" : "No";

                // Save the updated DataTable back to ViewState
                ViewState["SelectedSlots"] = dt;

                // Rebind the updated DataTable to the GridView
                tblSelectedSlots.DataSource = dt;
                tblSelectedSlots.DataBind();

                lblMessage.Text = "Slot updated successfully.";
            }
            else
            {
                lblMessage.Text = "Please select a slot to update.";
            }
        }
    }
}