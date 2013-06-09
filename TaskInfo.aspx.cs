using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class TaskInfo : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] != null &&
            Request.QueryString["ID"] != null)
        {
            int taskID = 0;
            bool isValid = int.TryParse(Request.QueryString["ID"].ToString(), out taskID);

            if (isValid)
            {
                GetTaskInfo(taskID);
            }
            else
                Response.Redirect("Tasks.aspx");
        }
        else
            Response.Redirect("Tasks.aspx");
    }

    void GetTaskInfo(int taskID)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT tblTask.TaskName, tblCategory.CategoryName, tblTask.StartDateTime, " +
            "tblTask.EndDateTime, tblUser.FirsName + ' ' + tblUser.LastName AS AssigneeName, " +
            "tblTask.SMS, tblTask.Email FROM tblTask " +
            "INNER JOIN tblCategory ON tblTask.CategoryID = tblCategory.CategoryID " +
            "INNER JOIN tblUser ON tblTask.Assignee = tblUser.UserID " +
            "WHERE tblTask.UserID = @UserID AND tblTask.TaskID = @TaskID";
        cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = Session["userid"].ToString();
        cmd.Parameters.Add("@TaskID", SqlDbType.Int).Value = taskID;
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
        {
            while (data.Read())
            {
                lblName.Text = data["TaskName"].ToString();
                lblCategory.Text = data["CategoryName"].ToString();
                lblStartDateTime.Text =
                    DateTime.Parse(data["StartDateTime"].ToString()).ToString("MMMM dd, yyyy HH:mm tt");
                lblEndDateTime.Text =
                    DateTime.Parse(data["EndDateTime"].ToString()).ToString("MMMM dd, yyyy HH:mm tt");
                lblDelegates.Text = data["DelegateName"].ToString();

                if (bool.Parse(data["SMS"].ToString()))
                    cbMobile.Checked = true;
                else
                    cbMobile.Checked = false;

                if (bool.Parse(data["Email"].ToString()))
                    cbEmail.Checked = true;
                else
                    cbEmail.Checked = false;
            }
            con.Close();
        }
        else
        {
            con.Close();
            Response.Redirect("Tasks.aspx");
        }
    }


    protected void btnAdd_Click(object sender, EventArgs e)
    { }
}