using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class ContactInfo : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] != null &&
            Request.QueryString["ID"] != null)
        {
            int contactID = 0;
            bool isValid = int.TryParse(Request.QueryString["ID"].ToString(), out contactID);

            if (isValid)
            {
                if (!IsPostBack)
                {
                    GetGroup();
                    GetContactInfo(contactID);
                }
            }
        }
        else
            Response.Redirect("Login.aspx");
    }

    void GetContactInfo(int ID)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT tblContact.FirstName, tblContact.LastName, tblContact.Nickname, " +
            "tblContact.Mobile, tblContact.Email, tblGroup.GroupID FROM tblContact " +
            "INNER JOIN tblGroup ON tblContact.GroupID = tblGroup.GroupID " +
            "WHERE tblGroup.UserID = @UserID AND tblContact.GroupID = @GroupID";
        cmd.Parameters.Add("@GroupID", SqlDbType.Int).Value = ID;
        cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = Session["userid"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
        {
            while (data.Read())
            {
                txtFN.Text = data["FirstName"].ToString();
                txtLN.Text = data["LastName"].ToString();
                txtNickname.Text = data["Nickname"].ToString();
                txtEmail.Text = data["Email"].ToString();
                txtMobile.Text = data["Mobile"].ToString();
                ddlGroup.SelectedValue = data["GroupID"].ToString();
            }
            con.Close();
        }
        else
        {
            con.Close();
            Response.Redirect("Contacts.aspx");
        }
    }

    void GetGroup()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT GroupID, GroupName FROM tblGroup WHERE UserID = @UserID";
        cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = Session["userid"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        ddlGroup.DataSource = data;
        ddlGroup.DataTextField = "GroupName";
        ddlGroup.DataValueField = "GroupID";
        ddlGroup.DataBind();
        con.Close();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "UPDATE tblContact SET FirstName = @FirstName, LastName = @LastName, " +
            "Nickname = @Nickname, Email = @Email, Mobile = @Mobile, GroupID = @GroupID " +
            "WHERE ContactID = @ContactID";
        cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar).Value = txtFN.Text;
        cmd.Parameters.Add("@LastName", SqlDbType.NVarChar).Value = txtLN.Text;
        cmd.Parameters.Add("@Nickname", SqlDbType.NVarChar).Value = txtNickname.Text;
        cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txtEmail.Text;
        cmd.Parameters.Add("@Mobile", SqlDbType.NVarChar).Value = txtMobile.Text;
        cmd.Parameters.Add("@GroupID", SqlDbType.Int).Value = ddlGroup.SelectedValue;
        cmd.Parameters.Add("@ContactID", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
        cmd.ExecuteNonQuery();
        con.Close();
        Session["contact_edit"] = "yes";
        Response.Redirect("Contacts.aspx");
    }
}