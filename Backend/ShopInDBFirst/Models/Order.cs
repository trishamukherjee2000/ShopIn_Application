using System;
using System.Collections.Generic;

namespace ShopInDBFirstDataAccessLayer.Models;

public partial class Order
{
    public decimal OrderId { get; set; }

    public int? UserId { get; set; }

    public int NoOfItems { get; set; }

    public string? ProductId { get; set; }

    public virtual Product? Product { get; set; }

    public virtual User? User { get; set; }
}
