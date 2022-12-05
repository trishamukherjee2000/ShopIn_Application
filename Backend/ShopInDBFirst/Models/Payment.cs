using System;
using System.Collections.Generic;

namespace ShopInDBFirstDataAccessLayer.Models;

public partial class Payment
{
    public decimal PaymentId { get; set; }

    public int? UserId { get; set; }

    public decimal? CardNumber { get; set; }

    public string NameOnCard { get; set; } = null!;

    public string CardType { get; set; } = null!;

    public decimal Cvvnumber { get; set; }

    public DateTime ExpiryDate { get; set; }

    public int? AmountPaid { get; set; }

    public virtual User? User { get; set; }
}
