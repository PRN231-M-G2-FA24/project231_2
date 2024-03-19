using System.ComponentModel.DataAnnotations.Schema;

namespace project231.Models
{
    public class SaleReport
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public string? ProductName { get; set; }
        public int? TotalQuantitySold { get; set; }
        public decimal? TotalPrice { get; set; }
    }
}
