using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project223
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        string constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kelet\Desktop\Y2\S2\CMPG223\Project\project223\App_Data\AwesomeAC_DB.mdf;Integrated Security=True";

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = TextBox5.Text;
            string password = TextBox6.Text;

            if (IsEmailRegistered(email))
            {
                if (ValidateUser(email, password)) // Checks if the credentials are valid
                {
                    // Retrieve the user's first name and ID from the database
                    string firstName = GetUserName(email);
                    string memberId = GetMemberId(email);

                    if (!string.IsNullOrEmpty(firstName) && !string.IsNullOrEmpty(memberId))
                    {
                        // Store the first name and ID in the session for later use
                        Session["UserName"] = firstName;
                        Session["LoggedInID"] = memberId; // Store the member ID

                        // Redirect to the welcome page
                        Response.Redirect("WelcomePg.aspx");
                    }
                    else
                    {
                        Label9.Text = "Failed to retrieve user information.";
                        Label9.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    Label9.Text = "Invalid Password. Please try again.";
                    Label9.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                Label9.Text = "Email not recognized. If you're new please create an account.";
                Label9.ForeColor = System.Drawing.Color.Red;
            }
        }

        // Method to check if the email exists in the database
        private bool IsEmailRegistered(string email)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT COUNT(1) FROM member_account WHERE Email=@Email";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);

                con.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();

                return count == 1; // Email exists if count is 1
            }
        }

        // Function to retrieve the user's first name
        private string GetUserName(string email)
        {
            string firstName = "";
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT First_Name FROM member_account WHERE Email = @Email";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    firstName = reader["First_Name"].ToString();
                }
                con.Close();
            }
            return firstName;
        }

        // Function to retrieve the user's ID
        private string GetMemberId(string email)
        {
            string memberId = "";
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT ID_Num FROM member_account WHERE Email = @Email";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    memberId = reader["ID_Num"].ToString();
                }
                con.Close();
            }
            return memberId;
        }

        // Validate the user credentials
        private bool ValidateUser(string email, string password)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT COUNT(1) FROM member_account WHERE Email=@Email AND Password=@Password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password); // Assuming password is stored as int

                con.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();

                return count == 1; // Credentials are correct if count is 1
            }
        }
    }
}