using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static project223.Ordering;

namespace project223
{
    public partial class Cart : System.Web.UI.Page
    {
        string constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\User\Downloads\project223\App_Data\AwesomeAC_DB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LoggedInID"] != null)
                {
                    LoadCartItems();
                }
                else
                {
                    // Redirect to login page if session has expired or user is not logged in
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void LoadCartItems()
        {
            List<CartItem> cart = (List<CartItem>)Session["Cart"];

            if (cart != null && cart.Count > 0)
            {
                ListBox1.Items.Clear();

                decimal totalPrice = 0;
                foreach (var item in cart)
                {
                    string displayText = $"{item.Name} - R{item.Price}";
                    ListBox1.Items.Add(new ListItem(displayText, item.Name));
                    totalPrice += item.Price;
                }

                Label5.Text = $"Total Price: {totalPrice:C}";
                Label6.Text = $"Total Items: {cart.Count}";
            }
            else
            {
                Label5.Text = "Total Price: R0.00";
                Label6.Text = "Total Items: 0";
                ListBox1.Items.Add("Your cart is empty.");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaymentGateway.aspx");
        }

        protected void RemoveButton_Click(object sender, EventArgs e)
        {
            if (ListBox1.SelectedIndex != -1)
            {
                List<CartItem> cart = (List<CartItem>)Session["Cart"];
                string selectedItem = ListBox1.SelectedItem.ToString();
                CartItem itemToRemove = cart[ListBox1.SelectedIndex];

                // Remove the item from the cart
                cart.RemoveAt(ListBox1.SelectedIndex);
                Session["Cart"] = cart; // Update session

                // Update the database quantity
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    string updateStockQuery = "UPDATE products SET QuantityInStock = QuantityInStock + 1 WHERE ProductName = @ProductName";
                    SqlCommand cmd = new SqlCommand(updateStockQuery, con);
                    cmd.Parameters.AddWithValue("@ProductName", itemToRemove.Name);

                    cmd.ExecuteNonQuery();
                }

                // Refresh the cart display
                LoadCartItems();
                RemovalLabel.Text = $"{selectedItem} removed from the cart.";
            }
            else
            {
                RemovalLabel.Text = "Please select an item to remove.";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("CartHelp.aspx");
        }
    }
}