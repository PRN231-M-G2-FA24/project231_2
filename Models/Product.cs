using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace project231.Models;

public partial class Product
{
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Description { get; set; } = null!;

    public int? Price { get; set; }

    public string Image { get; set; } = null!;

    public int? CategoryId { get; set; }

    public int? SupplierId { get; set; }

    public int? InventoryId { get; set; }

    public int? QuantityInStock { get; set; }

    public int? Status { get; set; }

    public DateTime? Date { get; set; }

    public string? ProductCode { get; set; }

    public virtual Category? Category { get; set; }

    public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();

    public virtual Supplier? Supplier { get; set; }
}
