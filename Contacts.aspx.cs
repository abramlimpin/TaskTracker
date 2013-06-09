using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Contacts : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {
            Session["page"] = "Contacts";
            if (!IsPostBack)
            {
                GetContacts();
                ToggleGroup();
            }
        }
        else
            Response.Redirect("Login.aspx");
    }

    void GetContacts()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT tblContact.ContactID, tblContact.FirstName + ' ' + tblContact.LastName " +
            "AS FullName, tblContact.Nickname, tblContact.Email, tblContact.Mobile, tblGroup.GroupName " +
            "FROM tblContact INNER JOIN tblGroup ON tblContact.GroupID = tblGroup.GroupID WHERE " +
            "tblGroup.UserID = @UserID";
        cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = Session["userid"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        lvContacts.DataSource = data;
        lvContacts.DataBind();
        con.Close();
    }

    void ToggleGroup()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT GroupID, GroupName FROM tblGroup WHERE UserID = @UserID";
        cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = Session["userid"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
        {
            ddlGroup.DataSource = data;
            ddlGroup.DataTextField = "GroupName";
            ddlGroup.DataValueField = "GroupID";
            pnlGroup.Visible = true;
            ddlGroup.DataBind();
            con.Close();
        }
        else
        {
            con.Close();
            pnlGroup.Visible = false;
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        int groupID = 0;

        if (pnlGroup.Visible == true)
            groupID = int.Parse(ddlGroup.SelectedValue);

        if (txtGroup.Text != "")
        {
            groupID = Helper.GetCreatedGroup(txtGroup.Text, Session["userid"].ToString());  
        }
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO tblContact VALUES (@FirstName, @LastName, @Nickname, @Email, " +
            "@Mobile, @GroupID)";
        cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar).Value = txtFN.Text;
        cmd.Parameters.Add("@LastName", SqlDbType.NVarChar).Value = txtLN.Text;
        cmd.Parameters.Add("@Nickname", SqlDbType.NVarChar).Value = txtNickname.Text;
        cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txtEmail.Text;
        cmd.Parameters.Add("@Mobile", SqlDbType.NVarChar).Value = txtMobile.Text;
        cmd.Parameters.Add("@GroupID", SqlDbType.Int).Value = groupID;
        cmd.ExecuteNonQuery();
        con.Close();
        GetContacts();
        ToggleGroup();
        Helper.ClearTextboxes(this.Controls);
        pnlAdd.Visible = true;
    }
}