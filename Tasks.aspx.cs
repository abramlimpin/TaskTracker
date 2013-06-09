using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Tasks : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnectionString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {
            Session["page"] = "Task";
            GetTasks();
        }
        else
            Response.Redirect("Login.aspx");
    }

    void GetTasks()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT tblTask.TaskID, tblTask.TaskName, tblCategory.CategoryName, " +
            "tblTask.StartDateTime, tblTask.EndDateTime, tblTask.Status, " +
            "CASE WHEN tblTask.Status = 'In Progress' THEN 'task-pending' ELSE 'task-green' " +
            "END AS TaskColor, CASE WHEN tblTask.Status = 'In Progress' THEN  'label-grey' " +
            "ELSE 'green' END AS Color FROM tblTask INNER JOIN tblCategory ON " +
            "tblTask.CategoryID = tblCategory.CategoryID WHERE tblTask.UserID = @UserID";
        cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = Session["userid"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        lvTasks.DataSource = data;
        lvTasks.DataBind();
        con.Close();
    }
}