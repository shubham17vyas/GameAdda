using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Roles.IsUserInRole("admin"))
        {
            HyperLink1.Visible = true;
        }

        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
        {
            HyperLink8.Visible = true;
        }

    }
}
