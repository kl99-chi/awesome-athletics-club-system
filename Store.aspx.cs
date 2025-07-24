using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services.Description;
using System.Reflection.Emit;

namespace project223
{
    public partial class Ordering : System.Web.UI.Page
    {
        string constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\User\Downloads\project223\App_Data\AwesomeAC_DB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LoggedInID"] != null)
                {
                    LoadProducts();
                }
                else
                {
                    // Redirect to login page if session has expired or user is not logged in
                    Response.Redirect("Login.aspx");
                }
            }
        }

        // Load products dynamically from the database
        private void LoadProducts()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT ProductId, ProductName, Price, QuantityInStock FROM products";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    int productId = Convert.ToInt32(reader["ProductId"]);
                    string productName = reader["ProductName"].ToString();
                    decimal price = Convert.ToDecimal(reader["Price"]);
                    int quantity = Convert.ToInt32(reader["QuantityInStock"]);

                }

                con.Close();
            }
        }

        protected void ProductImageButton_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton clickedButton = (ImageButton)sender;
            int productId = Convert.ToInt32(clickedButton.CommandArgument);
            AddToCartAndDecrementStock(productId);
        }

        private void AddToCartAndDecrementStock(int productId)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                SqlTransaction transaction = con.BeginTransaction();

                try
                {
                    // Step 1: Check the current stock of the item
                    string checkStockQuery = "SELECT QuantityInStock, ProductName, Price FROM products WHERE ProductId = @ProductId";
                    SqlCommand checkStockCmd = new SqlCommand(checkStockQuery, con, transaction);
                    checkStockCmd.Parameters.AddWithValue("@ProductId", productId);
                    SqlDataReader reader = checkStockCmd.ExecuteReader();

                    string productName = "";
                    decimal productPrice = 0;
                    int currentStock = 0;

                    if (reader.Read())
                    {
                        currentStock = Convert.ToInt32(reader["QuantityInStock"]);
                        productName = reader["ProductName"].ToString();
                        productPrice = Convert.ToDecimal(reader["Price"]);
                    }
                    reader.Close();

                    if (currentStock > 0)
                    {
                        // Step 2: Decrement the stock
                        string updateStockQuery = "UPDATE products SET QuantityInStock = QuantityInStock - 1 WHERE ProductId = @ProductId";
                        SqlCommand updateStockCmd = new SqlCommand(updateStockQuery, con, transaction);
                        updateStockCmd.Parameters.AddWithValue("@ProductId", productId);
                        updateStockCmd.ExecuteNonQuery();

                        // Step 3: Add the product to the cart
                        AddToCart(productName, productPrice);

                        // Commit the transaction
                        transaction.Commit();
                        Label35.Text = $"{productName} has been added to the cart successfully!";
                    }
                    else
                    {
                        Label35.Text = "Sorry, this item is out of stock!";
                    }
                }
                catch (Exception ex)
                {
                    // Roll back transaction if anything goes wrong
                    transaction.Rollback();
                    Label35.Text = "An error occurred. Please try again.";
                }
                finally
                {
                    con.Close();
                }
            }
        }

        // The existing AddToCart method
        private void AddToCart(string productName, decimal productPrice)
        {
            if (Session["Cart"] == null)
            {
                Session["Cart"] = new List<CartItem>();
            }

            List<CartItem> cart = (List<CartItem>)Session["Cart"];
            cart.Add(new CartItem { Name = productName, Price = productPrice });
            Session["Cart"] = cart;

            // Update the cart count label
            LabelCartCount.Text = $"Items in Cart: {cart.Count}";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("StoreHelp.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            AddToCartAndDecrementStock(1);
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            AddToCartAndDecrementStock(2);
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            AddToCartAndDecrementStock(3);
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            AddToCartAndDecrementStock(4);
        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            AddToCartAndDecrementStock(5);
        }

        protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
        {
            AddToCartAndDecrementStock(6);
        }

        protected void ImageButton20_Click(object sender, ImageClickEventArgs e)
        {
            AddToCartAndDecrementStock(20);
        }

        protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
        {
            AddToCartAndDecrementStock(7);
        }

        protected void ImageButton8_Click(object sender, ImageClickEventArgs e)
        {
            AddToCartAndDecrementStock(8);
        }

        protected void ImageButton9_Click(object sender, ImageClickEventArgs e)
        {
            AddToCartAndDecrementStock(9);
        }

        protected void ImageButton10_Click(object sender, ImageClickEventArgs e)
        {
            AddToCartAndDecrementStock(10);
        }

        protected void ImageButton11_Click(object sender, ImageClickEventArgs e)
        {
            AddToCartAndDecrementStock(11);
        }

        protected void ImageButton12_Click(object sender, ImageClickEventArgs e)
        {
            AddToCartAndDecrementStock(12);
        }

        protected void ImageButton13_Click(object sender, ImageClickEventArgs e)
        {
            AddToCartAndDecrementStock(13);
        }

        protected void ImageButton14_Click(object sender, ImageClickEventArgs e)
        {
            AddToCartAndDecrementStock(14);
        }

        protected void ImageButton15_Click(object sender, ImageClickEventArgs e)
        {
            AddToCartAndDecrementStock(15);
        }

        protected void ImageButton16_Click(object sender, ImageClickEventArgs e)
        {
            AddToCartAndDecrementStock(16);
        }

        protected void ImageButton17_Click(object sender, ImageClickEventArgs e)
        {
            AddToCartAndDecrementStock(17);
        }

        protected void ImageButton18_Click(object sender, ImageClickEventArgs e)
        {
            AddToCartAndDecrementStock(18);
        }

        protected void ImageButton19_Click(object sender, ImageClickEventArgs e)
        {
            AddToCartAndDecrementStock(19);
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("StoreHelp.aspx");
        }
    }

    public class CartItem
    {
        public string Name { get; set; }
        public decimal Price { get; set; }

        public override string ToString()
        {
            return $"{Name} - {Price:C}";
        }
    }

}