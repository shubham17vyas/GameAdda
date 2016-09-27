using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Insert_game(object sender, EventArgs e)
    {
        
        GridView2.Visible = false;
        DetailsView1.Visible = true;
        DetailsView1.DefaultMode = DetailsViewMode.Insert;

    }

   

    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        if (!UploadFile(true))
        {
            e.Cancel = true;
        }

    }

    protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {

        GridView2.DataBind();
        GridView2.Visible = true;
        DetailsView1.Visible = false;
    }

    protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        SqlDataSource2.InsertParameters["Date_Added"].DefaultValue = DateTime.Today.ToShortDateString();
        if (!UploadFile(false))
        {
            e.Cancel = true;
        }
    }

    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        GridView2.DataBind();
        GridView2.Visible = true;
        DetailsView1.Visible = false;
    }
    protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            GridView2.Visible = true;
            DetailsView1.Visible = false;
            AddNewGame.Visible = true;
        }
    }
   
    //This method uploads an image file to the server and sets the parameter for the SQLDataSource to the name of the image
    //The method accepts a boolean value that indicates whether the action being performed is an update (versus an insert)
    //It returns a boolean value to indicate upload success (true) or failure (false)
    private bool UploadFile(bool isUpdate)
    {

        //Get references to the necessary controls in the DetailsView
        FileUpload uploader = (FileUpload)DetailsView1.FindControl("FileUpload1");
        Label uploadLabel = (Label)DetailsView1.FindControl("lblUpload");


        // Place files in a website subfolder named ProductImages.
        string uploadDirectory = Path.Combine(
        Request.PhysicalApplicationPath, "ProductImages");
        string serverFileName = Path.GetFileName(uploader.PostedFile.FileName);
        string fullUploadPath = Path.Combine(uploadDirectory, serverFileName);

        // if no file is uploaded and the action is an update, use the existing picture (value stored in a hidden field on the gridview)
        if (uploader.PostedFile.FileName == "" && isUpdate)
        {
            HiddenField origfilename = (HiddenField)DetailsView1.FindControl("HiddenField1");
            SqlDataSource2.UpdateParameters["Game_Image"].DefaultValue = origfilename.Value;

            return true;
        }

        else
        {
            // Check the extension to make sure an image is being uploaded
            string extension = Path.GetExtension(uploader.PostedFile.FileName);
            switch (extension.ToLower())
            {
                case ".bmp":
                case ".gif":
                case ".jpg":
                    break;
                default:
                    uploadLabel.Text = "This file type is not allowed.";

                    return false; ;
            }

            //Save the file and set the update/insert parameter values to the name of the file.  Catch any exceptions.
            try
            {

                uploader.PostedFile.SaveAs(fullUploadPath);
                SqlDataSource2.UpdateParameters["Game_Image"].DefaultValue = serverFileName;
                SqlDataSource2.InsertParameters["Game_Image"].DefaultValue = serverFileName;
                return true;

            }
            catch (Exception err)
            {
                uploadLabel.Text = err.Message;
                return false;

            }


        }
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView2.Visible = false;
            DetailsView1.Visible = true;
            DetailsView1.DefaultMode = DetailsViewMode.Edit;
            AddNewGame.Visible = false;
            DetailsView1.DataBind();
    }

 
}