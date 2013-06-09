using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logout"] != null)
        {
            pnlLogout.Visible = true;
            Session.Remove("logout");
        }
        else if (Session["expired"] != null)
        {
            pnlExpired.Visible = true;
            Session.Remove("expired");
        }
        else if (Session["confirmed"] != null)
        {
            pnlConfirmed.Visible = true;
            Session.Remove("confirmed");
        }
        else
        {
            pnlLogout.Visible = false;
            pnlExpired.Visible = false;
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT UserID FROM tblUser WHERE UserID = @UserID AND Password = @Password " +
            "AND Status = 'Active'";
        cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = txtEmail.Text;
        cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = Helper.CreateSHAHash(txtPassword.Text);
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
        {
            pnlError.Visible = false;
            pnlExpired.Visible = false;
            while (data.Read())
            {
                Session["userid"] = data["UserID"].ToString();
            }
            con.Close();
            Response.Redirect("Default.aspx");
        }
        else
        {
            pnlError.Visible = true;
            pnlExpired.Visible = false;
            con.Close();
        }
    }
}