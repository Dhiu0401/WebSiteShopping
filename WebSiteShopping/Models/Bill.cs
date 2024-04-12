using System;
using System.Collections.Generic;

namespace WebSiteShopping.Models;

public partial class Bill
{
    public int Id { get; set; }

    public int? IdCustomer { get; set; }

    public decimal? Cost { get; set; }

    public virtual ICollection<BillDetail> BillDetails { get; set; } = new List<BillDetail>();

    public virtual Customer? IdCustomerNavigation { get; set; }
}
