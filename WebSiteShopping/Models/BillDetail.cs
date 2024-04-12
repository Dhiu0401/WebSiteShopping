using System;
using System.Collections.Generic;

namespace WebSiteShopping.Models;

public partial class BillDetail
{
    public int BillId { get; set; }

    public int ProductId { get; set; }

    public int? Count { get; set; }

    public decimal? Cost { get; set; }

    public virtual Bill Bill { get; set; } = null!;

    public virtual Product Product { get; set; } = null!;
}
