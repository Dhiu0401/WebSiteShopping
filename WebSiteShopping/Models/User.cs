using System;
using System.Collections.Generic;

namespace WebSiteShopping.Models;

public partial class User
{
    public string Email { get; set; } = null!;

    public string? Password { get; set; }

    public int? Role { get; set; }

    public virtual ICollection<Customer> Customers { get; set; } = new List<Customer>();
}
