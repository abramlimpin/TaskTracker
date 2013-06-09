using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {
            string userType = Helper.GetUserType(Session["userid"].ToString());

            if (userType == "Basic")
            {
                lblName.Text = "Welcome, " +
                    Helper.GetFirstName(Session["userid"].ToString()) + "!";
            }
            else
            {
                lblName.Text = "Welcome, " +
                    Helper.GetFirstName(Session["userid"].ToString()) + "! <b>[ Premium ]</b>";
            }
        }
        else
        {
            Session["expired"] = "yes";
            Response.Redirect("http://localhost:12345/TaskTracker/Login.aspx");
        }
        ToggleMenus();
    }

    void ToggleMenus()
    {
        if (Session["page"].ToString() == "Home")
        {
            home.Attributes.Add("class", "active");
            tasks.Attributes.Add("class", "exp");
            contacts.Attributes.Add("class", "exp");
        }
        else if (Session["page"].ToString() == "Task")
        {
            home.Attributes.Add("class", "exp");
            tasks.Attributes.Add("class", "active");
            contacts.Attributes.Add("class", "exp");
        }
        else if (Session["page"].ToString() == "Contacts")
        {
            home.Attributes.Add("class", "exp");
            tasks.Attributes.Add("class", "exp");
            contacts.Attributes.Add("class", "active");
        }
    }
}
