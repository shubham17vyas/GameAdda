using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;


/// <summary>
/// This class represents a shopping cart with a list of product objects
/// </summary>
public class Cart
{
    private List<Prod> products = new List<Prod>();

    //public property to access (not modify) the products list
    public List<Prod> Products
    {
        get { return products; }
    }

    //Boolean property indicating whether the cart has items in it
    public bool HasItems
    {
        get
        {
            return products.Count > 0;
        }
    }

    // Method to add product to the cart.  If the product already exists, just update the quantity by one 
    public void AddProduct(string id, string name, decimal price, int qty)
    {
        Prod result = products.Find(
            delegate(Prod tp)
            {
                return tp.ID == id;
            }
            );

        if (result != null)
        {
            UpdateQuantity(result.Quantity + 1, result.ID);
        }
        else
        {
            Prod tp = new Prod(id, name, price, qty);
            products.Add(tp);
        }

    }

    // Method to remove product from the cart
    public void RemoveProduct(string ProdID)
    {
        Prod prodToRemove = null;

        foreach (Prod p in products)
        {
            if (p.ID == ProdID)
            {
                prodToRemove = p;
            }
        }


        products.Remove(prodToRemove);

    }

    // Method to update the  quantity of the product in the cart. 
    public void UpdateQuantity(int UpdateQty, string ID)
    {
        foreach (Prod q in products)
        {
            if (q.ID == ID)
            {
                q.Quantity = UpdateQty;
            }
        }
    }

    // Method to return the total dollar amount in the cart
    public decimal GetTotal()
    {
        decimal total = 0;
        foreach (Prod p in products)
        {
            total += p.Price * p.Quantity;
        }
        return total;
    }

    // Method that saves the cart information as an order in the database (happens at checkout)
    public bool CreateOrder(string CustomerId)
    {

        //Create a data table for the order details that will be passed to the stored procedure
        //This uses SQL Server's Table valued parameter method as described here:
        //http://lennilobel.wordpress.com/2009/07/29/sql-server-2008-table-valued-parameters-and-c-custom-iterators-a-match-made-in-heaven/
        //Basically, we create a user-defined type that looks like this:  CREATE TYPE OrderDetailUdt AS TABLE (ProductId int,  Quantity int,  Price money) 
        //We then insert the entire datatable as an instance of this type

        DataTable details = new DataTable();

        details.Columns.Add("ProductId", typeof(int));
        details.Columns.Add("Quantity", typeof(int));
        details.Columns.Add("Price", typeof(decimal));

        //Add the products in the cart to the data table
        foreach (Prod p in products)
        {
            details.Rows.Add(new object[] { p.ID, p.Quantity, p.Price });
        }

        //Execute the ADO code.  Return true if it succeeds, false otherwise.
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "InsertOrder";


        com.Parameters.AddWithValue("@CustomerId", CustomerId);
        com.Parameters.AddWithValue("@OrderedAt", System.DateTime.Now);
        com.Parameters.AddWithValue("@OrderDetails", details);

        try
        {
            con.Open();
            com.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            return false;
            throw ex;
        }

        finally
        {
            con.Close();

        }

    }

    // Empty constructor
    public Cart()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}
