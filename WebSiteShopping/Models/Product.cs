using System;
using System.Collections.Generic;

namespace WebSiteShopping.Models;

public partial class Product
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public decimal? Price { get; set; }

    public string? Image { get; set; }

    public string? Color { get; set; }

    public double? Weight { get; set; }

    public string? Species { get; set; }

    public string? Gender { get; set; }

    public string? Info { get; set; }

    public int? Stock { get; set; }

    public virtual ICollection<BillDetail> BillDetails { get; set; } = new List<BillDetail>();
}
