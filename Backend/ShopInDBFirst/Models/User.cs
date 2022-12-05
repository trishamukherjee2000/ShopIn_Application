using System;
using System.Collections.Generic;

namespace ShopInDBFirstDataAccessLayer.Models;

public partial class User
{
    public int UserId { get; set; }

    public string UserName { get; set; } = null!;

    public string? UserEmail { get; set; }

    public string UserContact { get; set; }

    public string UserAddress { get; set; } = null!;

    public string UserPassword { get; set; } = null!;

    public virtual ICollection<Order> Orders { get; } = new List<Order>();

    public virtual ICollection<Payment> Payments { get; } = new List<Payment>();
}
