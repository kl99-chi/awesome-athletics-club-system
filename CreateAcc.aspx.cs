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
    public partial class CreateAcc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) 
        {
         
        }

        string constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\User\Downloads\project223\App_Data\AwesomeAC_DB.mdf;Integrated Security=True";

        protected void Button1_Click(object sender, EventArgs e)
        {
            string firstName = TextBox1.Text;
            string surname = TextBox2.Text;
            string idNumber = TextBox3.Text;
            string age = TextBox4.Text;
            string email = TextBox5.Text;
            string password = TextBox6.Text;
            string confirmPassword = TextBox7.Text;

            // Validate input
            if (IsValidInput(password, confirmPassword, idNumber))
            {
                if (!IfIDExists(idNumber))  // Check if the ID number already exists
                {
                    if (!IfCredentialsExist(email, password))  // Check if email and password combination already exist
                    {
                        // Save user data to the database
                        RegisterUser(firstName, surname, idNumber, age, email, password);
                        Label14.Text = "Account created successfully. You can now login to your account.";
                        Label14.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        // Display an error message if the email and password combination already exists
                        Label14.Text = "This email and password combination is already registered.";
                        Label14.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    // Display an error message if the ID number already exists
                    Label14.Text = "This ID number is already registered.";
                    Label14.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                // Display an error message if validation fails
                Label11.Text = "Please correct the highlighted errors.";
                Label11.ForeColor = System.Drawing.Color.Red;
            }
        }

        // Method to validate the input
        private bool IsValidInput(string password, string confirmPassword, string idNumber)
        {
            bool isValid = true;

            // Check if password has exactly 4 digits
            if (password.Length != 4)
            {
                Label13.Text = "Password must have 4 digits.";
                Label13.ForeColor = System.Drawing.Color.Red;
                isValid = false;
            }
            else
            {
                Label13.Text = "";
            }

            // Check if password matches confirmation password
            if (password != confirmPassword)
            {
                Label12.Text = "Passwords do not match.";
                Label12.ForeColor = System.Drawing.Color.Red;
                isValid = false;
            }
            else
            {
                Label12.Text = "";
            }

            // Check if ID number has 13 digits and contains only digits
            if (idNumber.Length != 13 || !idNumber.All(char.IsDigit))
            {
                Label11.Text = "ID number must be exactly 13 digits and contain only numbers.";
                Label11.ForeColor = System.Drawing.Color.Red;
                isValid = false;
            }
            else
            {
                Label11.Text = ""; // Clear previous error message if valid
            }

            return isValid;
        }

        // Method to register the user in the database
        private void RegisterUser(string firstName, string surname, string idNumber, string age, string email, string password)
        {
            int ageValue = Convert.ToInt32(age);
            string category = setCategory(ageValue);

            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    string query = "INSERT INTO member_account (First_Name, Surname, ID_Num, Age, Category, Email, Password) VALUES (@FirstName, @Surname, @IDNumber, @Age, @Category, @Email, @Password)";
                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@Surname", surname);
                    cmd.Parameters.AddWithValue("@IDNumber", idNumber);
                    cmd.Parameters.AddWithValue("@Age", ageValue);
                    cmd.Parameters.AddWithValue("@Category", category);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            catch (SqlException ex)
            {
                Label14.Text = "Database error: " + ex.Message;
                Label14.ForeColor = System.Drawing.Color.Red;
            }
            catch (Exception ex)
            {
                Label14.Text = "An error occurred: " + ex.Message;
                Label14.ForeColor = System.Drawing.Color.Red;
            }
        }

        // Method to check if the email and password combination exists
        private bool IfCredentialsExist(string email, string password)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT COUNT(1) FROM member_account WHERE Email = @Email AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                con.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();

                return count > 0;  // If email and password combination exists, return true
            }
        }

        // Method to check if the ID number already exists
        private bool IfIDExists(string idNumber)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT COUNT(1) FROM member_account WHERE ID_Num = @IDNumber";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@IDNumber", idNumber);

                con.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();

                return count > 0;  // If ID exists, return true
            }
        }

        public string setCategory(int age)
        {
            if (age < 16) return "Sub-Youth";
            if (age < 18) return "Youth";
            if (age < 20) return "Junior";
            if (age < 30) return "Senior";
            return "Masters";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateAccHelp.aspx");
        }
    }
}