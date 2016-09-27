using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Membership_CurrentUserinfo : System.Web.UI.UserControl
{
    protected void Page_Prerender(object sender, EventArgs e)
    {
        // name of current user
        //Label1.Text = "Welcome" + Page.User.Identity.Name;


// grab profile values for current user and put in text box 
        //use profile property

        txtFirstName.Text = Profile.FirstName;
        txtLastName.Text = Profile.lastName;
        txtBirthDate.Text = Profile.Birthdate.ToString();
        txtStreet.Text = Profile.Addess.Street;
        txtCity.Text = Profile.Addess.City;
        txtState.Text = Profile.Addess.State;
        txtZip.Text = Profile.Addess.Zip;
        txtCountry.Text = Profile.Addess.Country;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        // to update
        Profile.FirstName = txtFirstName.Text;
        Profile.lastName = txtLastName.Text;
        Profile.Birthdate = Convert.ToDateTime(txtBirthDate.Text);
        Profile.Addess.Street = txtStreet.Text;
        Profile.Addess.City = txtCity.Text;
        Profile.Addess.State = txtState.Text;
        Profile.Addess.Zip = txtZip.Text;
        Profile.Addess.Country = txtCountry.Text;
    }
}