using project231.Models;

namespace project231_2.DTO
{
    public class ProductDTO
    {
        public int Id { get; set; }

        public string Name { get; set; } = null!;

        public string Description { get; set; } = null!;

        public int? Price { get; set; }

        public string Image { get; set; } = null!;

        public int? CategoryId { get; set; }

        public int? SupplierId { get; set; }
        public string? SupplierName { get; set; }
        public string? CategoryName { get; set; }

        public string? DateInventory { get;set; }

        public int? InventoryId { get; set; }

        public int? QuantityInStock { get; set; }

        public int? Status { get; set; }

        public DateTime? Date { get; set; }

        public string? ProductCode { get; set; }

        public virtual Category? Category { get; set; }

        public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();

        public virtual Supplier? Supplier { get; set; }
    }
}
