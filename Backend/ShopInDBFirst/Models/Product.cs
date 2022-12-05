using System;
using System.Collections.Generic;

namespace ShopInDBFirstDataAccessLayer.Models;

public partial class Product
{
    public string ProductId { get; set; } = null!;

    public string ProductName { get; set; } = null!;

    public int? CategoryId { get; set; }

    public decimal Price { get; set; }

    public int QuantityAvailable { get; set; }

    public string ImgUrl { get; set; } = null!;

    public string VideoUrl { get; set; } = null!;

    public decimal Rating { get; set; }

    public virtual Category? Category { get; set; }

    public virtual ICollection<Order> Orders { get; } = new List<Order>();
}
