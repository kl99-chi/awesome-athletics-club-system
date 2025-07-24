using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project223
{
    public partial class Account : System.Web.UI.Page
    {
        string constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\User\Downloads\project223\App_Data\AwesomeAC_DB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LoggedInID"] != null)
                {
                    LoadMemberDetails();
                }
                else
                {
                    // Redirect to login page if session has expired or user is not logged in
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void LoadMemberDetails()
        {
            string memberId = Session["LoggedInID"].ToString(); // Get the logged-in user's ID
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT First_Name, Surname, ID_Num, Age, Email FROM member_account WHERE ID_Num = @IDNumber";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@IDNumber", memberId);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    ListBox1.Items.Clear();
                    // Display details in separate lines
                    ListBox1.Items.Add($"Name: {reader["First_Name"]}");
                    ListBox1.Items.Add($"Surname: {reader["Surname"]}");
                    ListBox1.Items.Add($"ID Number: {reader["ID_Num"]}");
                    ListBox1.Items.Add($"Age: {reader["Age"]}");
                    ListBox1.Items.Add($"Email: {reader["Email"]}");

                    // Pre-fill the textboxes with the member's current details
                    TextBox1.Text = reader["First_Name"].ToString();
                    TextBox2.Text = reader["Surname"].ToString();
                    TextBox5.Text = reader["Email"].ToString();
                }
                con.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e) // Update Member Details Button
        {
            if (Session["LoggedInID"] != null)
            {
                string memberId = Session["LoggedInID"].ToString();
                string firstName = TextBox1.Text;
                string surname = TextBox2.Text;

                using (SqlConnection con = new SqlConnection(constr))
                {
                    string query = "UPDATE member_account SET First_Name = @FirstName, Surname = @Surname WHERE ID_Num = @IDNumber";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@Surname", surname);
                    cmd.Parameters.AddWithValue("@IDNumber", memberId);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();

                    if (rowsAffected > 0)
                    {
                        // Update the session variable with the new name
                        Session["UserName"] = firstName;

                        lblMessage.Text = "Member details updated successfully!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblMessage.Text = "Failed to update member details!";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }

                LoadMemberDetails(); // Refresh the list box
            }
        }

        protected void Button2_Click(object sender, EventArgs e) // Update Username & Password Button
        {
            if (Session["LoggedInID"] != null)
            {
                string memberId = Session["LoggedInID"].ToString();
                string email = TextBox5.Text;
                string password = TextBox6.Text;
                string confirmPassword = TextBox7.Text;

                // Check if the password and confirm password fields are not empty
                if (string.IsNullOrWhiteSpace(password) || string.IsNullOrWhiteSpace(confirmPassword))
                {
                    lblMessage.Text = "Password fields cannot be empty!";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                // Check if the first name and surname fields are not empty
                if (string.IsNullOrWhiteSpace(TextBox1.Text) || string.IsNullOrWhiteSpace(TextBox2.Text))
                {
                    lblMessage.Text = "First name and surname cannot be empty!";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                if (password != confirmPassword)
                {
                    lblMessage.Text = "Passwords do not match!";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                using (SqlConnection con = new SqlConnection(constr))
                {
                    string query = "UPDATE member_account SET Email = @Email, Password = @Password WHERE ID_Num = @IDNumber";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@IDNumber", memberId);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();

                    if (rowsAffected > 0)
                    {
                        lblMessage.Text = "Username and password updated successfully!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblMessage.Text = "Failed to update username and password!";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }

                LoadMemberDetails(); // Refresh the list box
            }
        }
    }
}