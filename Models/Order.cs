using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace project231.Models;

public partial class Order
{
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int Id { get; set; }

    public string? UserId { get; set; }

    public DateTime? OrderDate { get; set; }

    public int? TotalAmout { get; set; }

    public int? Status { get; set; }

    public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();
    public virtual AspNetUser AspNetUsers { get; set; } = new AspNetUser();
}
