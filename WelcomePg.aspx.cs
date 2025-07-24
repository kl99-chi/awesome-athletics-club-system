using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project223
{
    public partial class WelcomePg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LoggedInID"] != null)
                {
                    // Get the user's name from the session
                    string userName = Session["UserName"] as string;

                    if (!string.IsNullOrEmpty(userName))
                    {
                        // Display the personalized welcome message
                        Label1.Text = $"Welcome back {userName}, what do you want to do today?";
                    }
                }
                else
                {
                    // Redirect to login page if session has expired or user is not logged in
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Mantain.aspx");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Store.aspx");
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Account.aspx");
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Reports.aspx");
        }

        protected void Logout()
        {
            // Remove specific cookies
            if (Request.Cookies["YourCookieName"] != null)
            {
                HttpCookie myCookie = new HttpCookie("YourCookieName");
                myCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(myCookie);
            }

            // Alternatively, remove all cookies
            foreach (string cookie in Request.Cookies.AllKeys)
            {
                HttpCookie myCookie = new HttpCookie(cookie);
                myCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(myCookie);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Logout();
            Response.Redirect("Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("WelcomePgHelp.aspx");
        }
    }
}