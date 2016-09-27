using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    // 
    protected void btnSend_Click(object sender, EventArgs e)
    {
        MailMessage mm = new MailMessage(txtEmail.Text, "shubhamshri291@gmail.com");
        mm.Subject = txtSubject.Text;
        mm.Body = "Name: " + txtName.Text + "<br /><br />Email: " + txtEmail.Text + "<br />" + txtBody.Text;
       
       // Checking if there is file attached to the mail and if file is attached then send it with mail 
        if (FileUpload1.HasFile)
        {
            // Fetching file from sysytem. 
            string FileName = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
            mm.Attachments.Add(new Attachment(FileUpload1.PostedFile.InputStream, FileName));
        }
        mm.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        // Using gmail smtp service.
        smtp.Host = "smtp.gmail.com";
        smtp.EnableSsl = true;
        System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
        NetworkCred.UserName ="shubhamshri291@gmail.com";
        NetworkCred.Password = "7898119888";
        smtp.UseDefaultCredentials = true;
        smtp.Credentials = NetworkCred;
        smtp.Port = 587;
        smtp.Send(mm);
        lblMessage.Text = "Email Sent SucessFully.";
       
    }
}