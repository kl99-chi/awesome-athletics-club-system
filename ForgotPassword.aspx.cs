using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace project223
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        string constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\User\Downloads\project223\App_Data\AwesomeAC_DB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            string idNum = TextBoxID.Text.Trim();
            string email = TextBoxEmail.Text.Trim();
            string newPassword = TextBoxNewPassword.Text.Trim();

            if (CheckUserExists(idNum, email))
            {
                UpdatePassword(idNum, newPassword);
                LabelMessage.Text = "Password reset successfully!";
            }
            else
            {
                LabelMessage.Text = "The provided ID Number and Email do not match our records.";
            }
        }

        private bool CheckUserExists(string idNum, string email)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT COUNT(1) FROM member_account WHERE ID_Num = @IDNum AND Email = @Email";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@IDNum", idNum);
                cmd.Parameters.AddWithValue("@Email", email);

                con.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();

                return count == 1; // Returns true if a match is found
            }
        }

        private void UpdatePassword(string idNum, string newPassword)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "UPDATE member_account SET Password = @Password WHERE ID_Num = @IDNum";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Password", newPassword);
                cmd.Parameters.AddWithValue("@IDNum", idNum);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
    }
}