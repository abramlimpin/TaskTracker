using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class ActivateUser : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["uid"] == null ||
            Request.QueryString["pw"] == null)
            Response.Redirect("Default.aspx");
        else
        {
            ActivateUserAccount();
        }
    }

    bool IsSessionIDExisting(string email, string password)
    {
        bool isExisting = true;
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT UserID FROM tblUser WHERE UserID = @UserID AND Password=@Password";
        cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = email;
        cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = password;
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
            isExisting = true;
        else
            isExisting = false;
        con.Close();
        return isExisting;
    }

    void ActivateUserAccount()
    {
        string email = Request.QueryString["uid"].ToString();
        string password = Request.QueryString["pw"].ToString().Replace(' ', '+');
        bool accountExisting = IsSessionIDExisting(email, password);

        if (accountExisting)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE tblUser SET Status='Active' WHERE UserID = @UserID " +
                "AND Password=@Password";
            cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = email;
            cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = password;
            cmd.ExecuteNonQuery();
            con.Close();
            Session["confirmed"] = "yes";
            Helper.AddLog(email, "Activate", "Activated Account");
            Response.Redirect("Login.aspx");
        }
        else
            Response.Redirect("Login.aspx");
    }
}