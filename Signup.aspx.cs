using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Signup : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    bool IsEmailAddressExisting()
    {
        bool isExisting = true;
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT UserID FROM tblUser WHERE UserID = @UserID";
        cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = txtEmail.Text;
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
            isExisting = true;
        else
            isExisting = false;
        con.Close();
        return isExisting;
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    protected void btnSignup_Click(object sender, EventArgs e)
    {
        if (!IsEmailAddressExisting())
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO tblUser VALUES (@UserID, @Password, @FirstName, @LastName, " +
                "@Mobile, @Status, @UserType)";
            cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = txtEmail.Text;
            cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = Helper.CreateSHAHash(txtPassword.Text);
            cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar).Value = txtFN.Text;
            cmd.Parameters.Add("@LastName", SqlDbType.NVarChar).Value = txtLN.Text;
            cmd.Parameters.Add("@Mobile", SqlDbType.NVarChar).Value = txtMobile.Text;
            cmd.Parameters.Add("@Status", SqlDbType.NVarChar).Value = "Pending";
            cmd.Parameters.Add("@UserType", SqlDbType.NVarChar).Value = "Basic";
            cmd.ExecuteNonQuery();
            con.Close();
            Helper.AddLog(txtEmail.Text, "Register", "Registered Successful");

            string message = "Hello, " + txtFN.Text + " " + txtLN.Text + "! <br /><br />" +
                    "You have successfully registered in the system. Please click the link below " +
                    "to acvitate your account: <br /><br />" +
                    "<a href='http://localhost:12345/TaskTracker/ActivateUser.aspx?uid=" + txtEmail.Text +
                    "&pw=" + Helper.CreateSHAHash(txtPassword.Text) + "' target='_blank'>" +
                    "http://localhost:12345/TaskTracker/ActivateUser.aspx?uid=" + txtEmail.Text +
                    "&pw=" + Helper.CreateSHAHash(txtPassword.Text) + "</a><br /><br />" +
                    "Thank you.";

            Helper.SendEmail(txtEmail.Text, "Confirmation Link", message);
            Helper.ClearTextboxes(this.Controls);
            pnlRegister.Visible = true;
            pnlExisting.Visible = false;
        }
        else
        {
            pnlExisting.Visible = true;
            pnlRegister.Visible = false;
        }
    }
}