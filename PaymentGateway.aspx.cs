using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace project223
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        private static int orderNumberCounter = 1; // Static counter to generate unique order numbers

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LoggedInID"] == null)
                {
                    Response.Redirect("Login.aspx");
                }

            }
        }

        protected void paymentButton_Click(object sender, EventArgs e)
        {
            // Validate all fields
            if (Page.IsValid)
            {
                // Retrieve values from the textboxes
                string name = fullName.Text;
                string adr = address.Text;
                string cardNum = cardNumber.Text;
                string cardHolder = cardHolderName.Text;
                string expDate = expiryDate.Text;
                string c = cvv.Text;

                // Here you would add your payment processing logic
                // For example, communicating with a payment gateway API

                // Simulating payment processing success
                bool paymentSuccess = ProcessPayment(name, adr, cardNum, cardHolder, expDate, c);

                // Load cart items
                List<CartItem> cart = (List<CartItem>)Session["Cart"];
                decimal totalAmount = 0;

                if (paymentSuccess && cart != null && cart.Count > 0)
                {
                    // Display success message
                    Label2.Text = "Payment processed successfully!";
                    Label2.ForeColor = System.Drawing.Color.Green;

                    // Generate and display order number
                    int orderNumber = orderNumberCounter++;
                    orderNumberValue.Text = $"Order Number: {orderNumber}";

                    // Populate receipt
                    receiptListBox.Items.Clear();
                    foreach (var item in cart)
                    {
                        receiptListBox.Items.Add($"{item.Name} - R{item.Price}");
                        totalAmount += item.Price;
                    }
                    totalLabel.Text = $"Total Amount: {totalAmount:C}";

                    // Save receipt to text file
                    SaveReceiptToFile(orderNumber, cart, totalAmount);

                    Label3.Text = "Receipt saved to file successfuly. Please use when collecting your order!";

                    // Optionally clear cart after payment
                    Session["Cart"] = new List<CartItem>(); // Clear the cart
                }
                else
                {
                    // Display failure message
                    Label2.Text = "Payment failed. Please try again.";
                    Label2.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        // Simulated payment processing method (replace this with actual payment gateway logic)
        private bool ProcessPayment(string fullName, string address, string cardNumber, string cardHolderName, string expiryDate, string cvv)
        {
            // Simulate payment success
            return true;
        }

        // Save the receipt to a text file
        private void SaveReceiptToFile(int orderNumber, List<CartItem> cart, decimal totalAmount)
        {
            string filePath = Server.MapPath("~/project223/"); // Ensure this directory exists
            string fileName = $"Receipt_{orderNumber}.txt";

            using (StreamWriter writer = new StreamWriter(Path.Combine(filePath, fileName)))
            {
                writer.WriteLine($"Order Number: {orderNumber}");
                writer.WriteLine($"Date: {DateTime.Now}");
                writer.WriteLine("Items Purchased:");
                foreach (var item in cart)
                {
                    writer.WriteLine($"{item.Name} - R{item.Price}");
                }
                writer.WriteLine($"Total Amount: R{totalAmount:C}");
            }
        }

    }
}