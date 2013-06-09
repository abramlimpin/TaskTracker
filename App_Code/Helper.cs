using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Security.Cryptography;
using System.Net.Mail;
using System.Net;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for Helper
/// </summary>
public class Helper
{
	public Helper()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString;
    }

    public static string CreateSHAHash(string Phrase)
    {
        SHA512Managed HashTool = new SHA512Managed();
        Byte[] PhraseAsByte = System.Text.Encoding.UTF8.GetBytes(string.Concat(Phrase));
        Byte[] EncryptedBytes = HashTool.ComputeHash(PhraseAsByte);
        HashTool.Clear();
        return Convert.ToBase64String(EncryptedBytes);
    }

    public static int GetCreatedCategory(string name, string userID)
    {
        int count = 0;
        SqlConnection con = new SqlConnection(Helper.GetConnectionString());
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO tblCategory VALUES (@CategoryName, @UserID); " +
            "SELECT TOP 1 CategoryID FROM tblCategory ORDER BY CategoryID DESC;";
        cmd.Parameters.Add("@CategoryName", SqlDbType.NVarChar).Value = name;
        cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = userID;
        count = (int)cmd.ExecuteScalar();
        con.Close();
        return count;
    }

    public static int GetCreatedGroup(string name, string userID)
    {
        int count = 0;
        SqlConnection con = new SqlConnection(Helper.GetConnectionString());
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO tblGroup VALUES (@GroupName, @UserID); " +
            "SELECT TOP 1 GroupID FROM tblGroup ORDER BY GroupID DESC;";
        cmd.Parameters.Add("@GroupName", SqlDbType.NVarChar).Value = name;
        cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = userID;
        count = (int)cmd.ExecuteScalar();
        con.Close();
        return count;
    }


    public static string GetFirstName(string userID)
    {
        string firstName = "";
        SqlConnection con = new SqlConnection(Helper.GetConnectionString());
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT FirstName FROM tblUser WHERE UserID = @UserID";
        cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = userID;
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            firstName = data["FirstName"].ToString();
        }
        con.Close();
        return firstName;
    }

    public static string GetUserType(string userID)
    {
        string userType = "";
        SqlConnection con = new SqlConnection(Helper.GetConnectionString());
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT UserType FROM tblUser WHERE UserID = @UserID";
        cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = userID;
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            userType = data["UserType"].ToString();
        }
        con.Close();
        return userType;
    }

    public static void SendEmail(string email, string subject, string message)
    {
        MailMessage msg = new MailMessage();
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.EnableSsl = true;
        NetworkCredential NetworkCred = new NetworkCredential();
        NetworkCred.UserName = "dumby.abram@gmail.com";
        NetworkCred.Password = "dumby1dea92";
        smtp.UseDefaultCredentials = true;
        smtp.Credentials = NetworkCred;
        smtp.Port = 587;
        msg.To.Add(email);
        msg.From = new MailAddress("dumby.abram@gmail.com");
        msg.Subject = subject;
        msg.IsBodyHtml = true;
        msg.Body = message;
        smtp.Send(msg);
    }

    public static void AddLog(string userID, string logType, string description)
    {
        SqlConnection con = new SqlConnection(Helper.GetConnectionString());
        con.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO tblLogs VALUES (@UserID, @LogType, @LogDesc, @Timestamp)";
        cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = userID;
        cmd.Parameters.Add("@LogType", SqlDbType.NVarChar).Value = logType;
        cmd.Parameters.Add("@LogDesc", SqlDbType.NVarChar).Value = description;
        cmd.Parameters.Add("@Timestamp", SqlDbType.DateTime).Value = DateTime.Now;
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public static void ClearTextboxes(ControlCollection cc)
    {
        foreach (Control ctrl in cc)
        {
            TextBox tb = ctrl as TextBox;
            if (tb != null)
            {
                tb.Text = "";
            }
            else
                ClearTextboxes(ctrl.Controls);
        }
    }
}