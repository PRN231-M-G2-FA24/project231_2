using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace project231.Models;

public partial class Supplier
{
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int Id { get; set; }

    public string? Name { get; set; }

    public string? Email { get; set; }

    public string? Phone { get; set; }

    public string? Address { get; set; }

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
