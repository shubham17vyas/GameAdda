using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LatestTweets : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.DataBind();
       
    }
    protected void Button1_Click(object sender, EventArgs e)
   
    {
        string name = Button1.Text; 

    // TO insert tweets in the data base.    
        string connectionString = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionString);

        string insertsql = "INSERT INTO Tweets Values (@Tweet)";
        SqlCommand cmd = new SqlCommand(insertsql, con);
         cmd.Parameters.AddWithValue("@Tweet", TextBox1.Text);
        int added= 0;
        try
        {

            con.Open();
            added = cmd.ExecuteNonQuery();
            
      
                Label1.Visible = true;
                Label1.Text = "Your comment is added.";
                TextBox1.Text = "";
            }
        
        catch (Exception err)
        {
            Label1.Text = err.Message;
        }
        
       
        finally
        {
            con.Close();
        }
      
    }

  
}