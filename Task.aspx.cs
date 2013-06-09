using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Task : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["page"] = "Task";

        if (Session["userid"] != null)
        {
            if (Request.QueryString["mode"] != null)
            {
                if (Request.QueryString["mode"].ToString() == "add")
                {
                    btnAdd.Visible = true;
                    btnUpdate.Visible = false;
                    lblTitle.Text = "Add a Task";
                }
                else if (Request.QueryString["mode"].ToString() == "edit")
                {
                    btnAdd.Visible = false;
                    btnUpdate.Visible = true;
                    if (Request.QueryString["ID"] != null)
                    {
                        int taskID = 0;
                        bool isValid = int.TryParse(Request.QueryString["ID"].ToString(),
                            out taskID);

                        if (isValid)
                            GetTaskInfo(taskID);
                        else
                            Response.Redirect("Tasks.aspx");
                    }
                    else
                        Response.Redirect("Tasks.aspx");
                }
                else
                    lblTitle.Text = "Task";
            }
            else
                Response.Redirect("Task.aspx?mode=add");
        }
        else
            Response.Redirect("Login.aspx");    
    }

    void GetTaskInfo(int taskID)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT tblTask.TaskName, tblCategory.CategoryName, tblTask.StartDateTime, " +
            "tblTask.EndDateTime, tblTask.Assignee, tblTask.SMS, tblTask.Email FROM tblTask " +
            "INNER JOIN tblCategory ON tblTask.CategoryID = tblCategory.CategoryID " +
            "WHERE tblTask.UserID = @UserID AND tblTask.TaskID = @TaskID";
        cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = Session["userid"].ToString();
        cmd.Parameters.Add("@TaskID", SqlDbType.Int).Value = taskID;
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
        {
            while (data.Read())
            {
                txtName.Text = data["TaskName"].ToString();
                txtCategory.Text = data["CategoryName"].ToString();
                txtStartDate.Text = DateTime.Parse(data["StartDateTime"].ToString()).ToShortDateString();
                txtStartTime.Text = DateTime.Parse(data["StartDateTime"].ToString()).ToString("HH:mm:ss");
                txtEndDate.Text = DateTime.Parse(data["EndDateTime"].ToString()).ToShortDateString();
                txtEndTime.Text = DateTime.Parse(data["EndDateTime"].ToString()).ToString("HH:mm:ss");

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
    {
        int categoryID = Helper.GetCreatedCategory(txtName.Text,
            Session["userid"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO tblTask VALUES (@TaskName, @CategoryID, @StartDateTime, " +
            "@EndDateTime, @UserID, @Assignee, @ParentID, @SequenceID, @SMS, @Email, @ReminderID, " +
            "@Status)";
        cmd.Parameters.Add("@TaskName", SqlDbType.NVarChar).Value = txtName.Text;
        cmd.Parameters.Add("@CategoryID", SqlDbType.Int).Value = categoryID;
        cmd.Parameters.Add("@StartDateTime", SqlDbType.DateTime).Value = 
            txtStartDate.Text + " " + txtStartTime.Text;
        cmd.Parameters.Add("@EndDateTime", SqlDbType.DateTime).Value =
            txtEndDate.Text + " " + txtEndTime.Text;
        cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = Session["userid"].ToString();
        cmd.Parameters.Add("@Assignee", SqlDbType.Int).Value = "123";
        cmd.Parameters.Add("@ParentID", SqlDbType.Int).Value = "1";
        cmd.Parameters.Add("@SequenceID", SqlDbType.Int).Value = "1";
        
        if (cbEmail.Checked)
            cmd.Parameters.Add("@SMS", SqlDbType.Bit).Value = 1;
        else
            cmd.Parameters.Add("@SMS", SqlDbType.Bit).Value = 0;

        if (cbMobile.Checked)
            cmd.Parameters.Add("@Email", SqlDbType.Bit).Value = 1;
        else
            cmd.Parameters.Add("@Email", SqlDbType.Bit).Value = 0;

        cmd.Parameters.Add("@ReminderID", SqlDbType.Int).Value = 1;
        cmd.Parameters.Add("@Status", SqlDbType.NVarChar).Value = "In Progress";
        cmd.ExecuteNonQuery();
        con.Close();
        Session["task"] = "yes";
        Response.Redirect("Tasks.aspx");
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int categoryID = Helper.GetCreatedCategory(txtName.Text,
            Session["userid"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "UPDATE tblTask SET TaskName = @TaskName, CategoryID = @CategoryID, " +
            "StartDateTime = @StartDateTime, EndDateTime = @EndDateTime, UserID = @UserID, " +
            "Assignee = @Assignee, ParentID = @ParentID, SequenceID = @SequenceID, SMS = @SMS, " +
            "Email = @Email, ReminderID = @ReminderID, Status = @Status)";
        cmd.Parameters.Add("@TaskName", SqlDbType.NVarChar).Value = txtName.Text;
        cmd.Parameters.Add("@CategoryID", SqlDbType.Int).Value = categoryID;
        cmd.Parameters.Add("@StartDateTime", SqlDbType.DateTime).Value = 
            txtStartDate.Text + " " + txtStartTime.Text;
        cmd.Parameters.Add("@EndDateTime", SqlDbType.DateTime).Value =
            txtEndDate.Text + " " + txtEndTime.Text;
        cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = Session["userid"].ToString();
        cmd.Parameters.Add("@Assignee", SqlDbType.Int).Value = "123";
        cmd.Parameters.Add("@ParentID", SqlDbType.Int).Value = "1";
        cmd.Parameters.Add("@SequenceID", SqlDbType.Int).Value = "1";
    }
}