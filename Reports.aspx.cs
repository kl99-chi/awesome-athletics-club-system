using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project223
{
    public partial class Reports1 : System.Web.UI.Page
    {
        string constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\User\Downloads\project223\App_Data\AwesomeAC_DB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Populate dropdowns for categories on initial load
                ddlMemberCategory.Items.Add(new ListItem("All members"));
                ddlMemberCategory.Items.Add(new ListItem("Sub-Youth"));
                ddlMemberCategory.Items.Add(new ListItem("Junior"));
                ddlMemberCategory.Items.Add(new ListItem("Senior"));
                ddlMemberCategory.Items.Add(new ListItem("Masters"));

                ddlProductCategory.Items.Add(new ListItem("All Products"));
                ddlProductCategory.Items.Add(new ListItem("Gear"));
                ddlProductCategory.Items.Add(new ListItem("Recovery"));
            }
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            // Load the selected members category report
            string category = ddlMemberCategory.SelectedValue;
            string sortBy = RadioButton1.Checked ? "Age" : "First_Name"; // Sort by Age or Name
            LoadMembers(category, sortBy);
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            // Load the selected products category report
            string category = ddlProductCategory.SelectedValue;
            string sortBy = RadioButton3.Checked ? "ProductName" : "Price"; // Sort by Product Name or Price
            LoadProducts(category, sortBy);
        }

        private void LoadMembers(string category, string sortBy)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT First_Name, Surname, ID_Num, Age, Category FROM member_account";

                // Check if a specific category is selected
                if (!string.IsNullOrEmpty(category) && category != "All members")
                {
                    query += " WHERE Category = @Category";
                }

                // Add sorting logic
                query += $" ORDER BY {sortBy}";

                SqlCommand cmd = new SqlCommand(query, con);
                if (!string.IsNullOrEmpty(category) && category != "All members")
                {
                    cmd.Parameters.AddWithValue("@Category", category);
                }

                con.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                GridViewMembers.DataSource = dt;
                GridViewMembers.DataBind();
                con.Close();
            }
        }

        private void LoadProducts(string type, string sortBy)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT ProductName, Price FROM products";

                // Filter by product type if not "All Products"
                if (!string.IsNullOrEmpty(type) && type != "All Products")
                {
                    query += " WHERE ProductDescription = @Type"; // Adjust this based on your table schema
                }

                // Add sorting logic
                query += $" ORDER BY {sortBy}";

                SqlCommand cmd = new SqlCommand(query, con);
                if (!string.IsNullOrEmpty(type) && type != "All Products")
                {
                    cmd.Parameters.AddWithValue("@Type", type);
                }

                con.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                GridViewProducts.DataSource = dt;
                GridViewProducts.DataBind();
                con.Close();
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            // Save members report to a text file
            try
            {
                using (StreamWriter writer = new StreamWriter(Server.MapPath("~/members.txt")))
                {
                    foreach (GridViewRow row in GridViewMembers.Rows)
                    {
                        writer.WriteLine($"{row.Cells[0].Text}, {row.Cells[1].Text}, {row.Cells[2].Text}, {row.Cells[3].Text}, {row.Cells[4].Text}");
                    }
                }
                lblMemberMessage.Text = "Members report saved successfully!";
            }
            catch (Exception ex)
            {
                lblMemberMessage.Text = $"Error saving report: {ex.Message}";
                lblMemberMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            // Save products report to a text file
            try
            {
                using (StreamWriter writer = new StreamWriter(Server.MapPath("~/products.txt")))
                {
                    foreach (GridViewRow row in GridViewProducts.Rows)
                    {
                        writer.WriteLine($"{row.Cells[0].Text}, Price: R{row.Cells[1].Text}");
                    }
                }
                lblProductMessage.Text = "Products report saved successfully!";
            }
            catch (Exception ex)
            {
                lblProductMessage.Text = $"Error saving report: {ex.Message}";
                lblProductMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReportsHelp.aspx");
        }
    }
}