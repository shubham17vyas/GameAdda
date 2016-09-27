using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Games : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void FormView1_ItemCommand1(object sender, FormViewCommandEventArgs e)
    {
        string id = ((HiddenField)(FormView1.FindControl("HiddenField1"))).Value;
        string name = ((Label)FormView1.FindControl("lblname")).Text;
        int qty = 1;
        decimal price = decimal.Parse(((Label)FormView1.FindControl("lblprice")).Text);



          //if the cart doesn't exist, create it.  Otherwise, get it from the session and add the product.
        if (Session["ShoppingCart"] == null)
        {
            Cart c = new Cart();
            c.AddProduct(id, name, price, qty);
            Session["ShoppingCart"] = c;
        }
        else
        {
            Cart c = (Cart)Session["ShoppingCart"];
            c.AddProduct(id, name, price, qty);
            Session["ShoppingCart"] = c;
        }

        Response.Redirect("CartPage.aspx");


    }

   
}