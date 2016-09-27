using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CartPage : System.Web.UI.Page
{
    
         protected void Page_Load(object sender, EventArgs e)
    {

        //Check the shopping cart is empty or not.  If not, display its contents in a Gridview
        if (Session["ShoppingCart"] == null)
        {
            Label1.Text = "Your shopping cart is empty";
            
        }
        else
        {
            Cart c = (Cart)Session["ShoppingCart"];

            GridView1.DataSource = c.Products;

            if (!IsPostBack)
            {

                GridView1.DataBind();
            }
        }
    }

    //Use the RowCommand event of the Gridview to handle removing items from the cart.  The CommandArgument property of the remove button supplies the product ID to remove
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            Cart c = (Cart)Session["ShoppingCart"];
            c.RemoveProduct(e.CommandArgument.ToString());
            GridView1.DataBind();

            if (GridView1.Rows.Count == 0)
                Label1.Text = "Your shopping cart is empty";
        }




    }

    //Use the RowEditing event of the Gridview to update item quantities
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {

        Cart c = (Cart)Session["ShoppingCart"];
        string prodid = GridView1.DataKeys[e.NewEditIndex].Value.ToString();
        int quantity = Convert.ToInt16(((TextBox)GridView1.Rows[e.NewEditIndex].FindControl("txtQuantity")).Text);
        c.UpdateQuantity(quantity, prodid);
        GridView1.EditIndex = -1;
        GridView1.DataBind();

    }



    //When the gridview has been bound to the data, calculate the order total and display in the Gridview footer
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        Cart c = (Cart)Session["ShoppingCart"];

        //Only do the calculation if the Gridview has something in it
        if (GridView1.Rows.Count > 0)
        {
            Label lblTotal = (Label)GridView1.FooterRow.FindControl("lblTotal");
            lblTotal.Text = c.GetTotal().ToString();
        }
    }

    //When the user clicks checkout with Paypal, add the cart to the database as an order and transfer to Paypal for payment processing
    protected void btnCheckoutWithPaypal_Click(object sender, EventArgs e)
    {
        if (Session["ShoppingCart"] != null)
        {

            Cart c = (Cart)Session["ShoppingCart"];

            if (c.HasItems) // only transfer to paypal if the cart has something in it
            {
                bool ordercreated = c.CreateOrder(User.Identity.Name);

                //If the order was successfully created in the database, redirect the user to the Paypal checkout page.
                if (ordercreated)
                {

                    Response.Redirect("PaypalCheckout.aspx");

                }
                else
                {
                    lblStatus.Text = "There was a problem with your order.  Please try again later.";
                }
            }
            else
            {
                lblStatus.Text = "Please add items to your shopping cart before checking out.";
            }
        }
        else
        {
            lblStatus.Text = "Please add items to your shopping cart before checking out.";
        }


    }

   
    }
