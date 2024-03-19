using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace project231.Models;

public partial class OrderItem
{
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int Id { get; set; }

    public int? OrdersId { get; set; }

    public int? ProductId { get; set; }

    public int? Quantity { get; set; }

    public int? PricePerItem { get; set; }

    public virtual Order? Orders { get; set; }

    public virtual Product? Product { get; set; }
}
