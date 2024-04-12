using System;
using System.Collections.Generic;

namespace WebSiteShopping.Models;

public partial class Customer
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public string? Email { get; set; }

    public int? Phone { get; set; }

    public string? Address { get; set; }

    public virtual ICollection<Bill> Bills { get; set; } = new List<Bill>();

    public virtual User? EmailNavigation { get; set; }
}
