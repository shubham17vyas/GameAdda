using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Prod
/// </summary>
public class Prod
{
    public Prod(string id, string name, decimal price, int qty)
    {
        this.id = id;
        this.name = name;
        this.price = price;
        this.qty = qty;
    }

    private string name;
    private decimal price;
    private int qty;
    private string id;

    public string ID
    {
        get
        { return id; }

    }

    public string Name
    {
        get
        { return name; }

    }


    public decimal Price
    {
        get
        { return price; }

    }

    public int Quantity
    {
        get
        { return qty; }
        set { qty = value; }
    }

}