using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class MyProfile : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {
            GetProfile();
        }
    }

    void GetProfile()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT UserID, FirstName, LastName, Mobile FROM tblUser WHERE " +
            "UserID = @UserID";
        cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = Session["userid"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            txtEmail.Text = data["UserID"].ToString();
            txtFN.Text = data["FirstName"].ToString();
            txtLN.Text = data["LastName"].ToString();
            txtMobile.Text = data["Mobile"].ToString();
        }
        con.Close();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "UPDATE tblUser SET UserID = @UserID, FirstName = @FirstName, " +
            "LastName = @LastName, Mobile = @Mobile, Password = @Password";
        cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = txtEmail.Text;
        cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar).Value = txtFN.Text;
        cmd.Parameters.Add("@LastName", SqlDbType.NVarChar).Value = txtLN.Text;
        cmd.Parameters.Add("@Mobile", SqlDbType.NVarChar).Value = txt
    }
}