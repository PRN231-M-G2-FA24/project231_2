using Gconnect.Application.Common.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using project231_2.DTO;
using project231_2.Models;
using project231_2.Repository;
using System.Data;

namespace project231_2.Controllers
{
    [ApiController]
    [Route("api/[controller]/[action]")]
   
    public class HomeController : ControllerBase
    {
   
        private readonly IGetInventoryRepository Repository;
        private readonly Project231Context context;
        public HomeController(Project231Context _context,IGetInventoryRepository getInventory)
        {
           
            Repository = getInventory;
           context = _context;

        }

        [HttpGet]
        public IActionResult HomePage(int? categoryName, string? productName, int? supplierName, DateTime? StartDate, int? minPrice, int? maxPrice, int page, int pageSize)
        {
            if (!StartDate.HasValue)
            {
                StartDate = DateTime.Now;
            }

            var query = (from pro in context.Products
                         join c in context.Categories on pro.CategoryId equals c.Id
                         join sup in context.Suppliers on pro.SupplierId equals sup.Id
                         where (
                            (!categoryName.HasValue || (categoryName.HasValue && categoryName.Equals(c.Id))) &&
                            (string.IsNullOrEmpty(productName) || (!string.IsNullOrEmpty(productName) && pro.Name.ToLower().Contains(productName.ToLower().Trim()))) &&
                            (!supplierName.HasValue || (supplierName.HasValue && supplierName.Equals(sup.Id))) &&
                           
                            (!minPrice.HasValue || (minPrice.HasValue && pro.Price >= minPrice.Value)) && // Kiểm tra giá tối thiểu
                            (!maxPrice.HasValue || (maxPrice.HasValue && pro.Price <= maxPrice.Value)) // Kiểm tra giá tối đa
                        )
                         select new ProductDTO
                         {
                             Id = pro.Id,
                             Name = pro.Name,
                             Price = pro.Price,
                             Image = pro.Image,
                             QuantityInStock = pro.QuantityInStock,
                             Description = pro.Description,
                             Status = pro.Status,
                             DateInventory = pro.Date.ToString(),
                             CategoryName = c.Name,
                             SupplierName = sup.Name,
                             Date = pro.Date,

                         }).ToList();

            int totalItems = query.Count();

            var productList = query.Skip((page - 1) * pageSize).Take(pageSize).ToList();

            var result = new PaginatedList<ProductDTO>(productList, totalItems, page, pageSize);
            return Ok(result);
        }
    }
}
