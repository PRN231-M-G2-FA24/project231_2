using Gconnect.Application.Common.Models;
using project231.Models;
using project231_2.DTO;

namespace project231_2.Repository
{
    public interface IGetInventoryRepository
    {
        public PaginatedList<ProductDTO> GetInventory(int? categoryName, string productName, int? supplierName, DateTime? StartDate, int? minPrice, int? maxPrice, int page, int pageSize);
    }
}
