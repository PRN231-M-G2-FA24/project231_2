using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OfficeOpenXml;
using project231.Models;
using project231_2.DTO;
using project231_2.Models;
using project231_2.Repository;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace project231_2.Controllers
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    [Authorize(Roles = "Admin")]
    public class InventoryController : ControllerBase
    {
        private readonly Project231Context context;
        private readonly IGetInventoryRepository Repository;

        public InventoryController(IGetInventoryRepository repository, Project231Context _context)
        {
            Repository = repository;
            context = _context;
        }

        // GET: InventoryController
        [HttpGet]
        public IActionResult GetInventory(int? categoryName, string? productName, int? supplierName, DateTime? StartDate, int? minPrice, int? maxPrice, int page, int pageSize)
        {
            var productList = Repository.GetInventory(categoryName, productName, supplierName, StartDate, minPrice, maxPrice, page, pageSize);




            return Ok(productList);






        }
        [HttpGet]
        public IActionResult ExportExcel(string FileName)
        {
            var products = context.Products
               .Include(p => p.Category)
               .Include(p => p.Supplier)
               .ToList();

            byte[] excelData;

            using (var package = new ExcelPackage())
            {
                var worksheet = package.Workbook.Worksheets.Add("Products");

                worksheet.Cells[1, 1].Value = "Category Name";
                worksheet.Cells[1, 2].Value = "Product Name";
                worksheet.Cells[1, 3].Value = "Price";
                worksheet.Cells[1, 4].Value = "Supplier Name";
                worksheet.Cells[1, 5].Value = "Quantity";

                int rowIndex = 2;

                foreach (var product in products)
                {
                    string categoryName = product.Category?.Name ?? "N/A";
                    string supplierName = product.Supplier?.Name ?? "N/A";

                    worksheet.Cells[rowIndex, 1].Value = categoryName;
                    worksheet.Cells[rowIndex, 2].Value = product.Name;
                    worksheet.Cells[rowIndex, 3].Value = product.Price;
                    worksheet.Cells[rowIndex, 4].Value = supplierName;
                    worksheet.Cells[rowIndex, 5].Value = product.QuantityInStock;

                    rowIndex++;
                }

                excelData = package.GetAsByteArray();
            }

            if (excelData == null || excelData.Length == 0)
            {

                return NotFound();
            }

            if (string.IsNullOrEmpty(FileName))
            {
                FileName = $"Products_{DateTime.Now.ToString("yyyyMMddHHmmss")}.xlsx";
            }


            Response.Headers.Add("Content-Disposition", $"attachment; filename={FileName}");

            return File(excelData, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        }
        [HttpPost]
        public IActionResult ImportProducts(IFormFile file)
        {
            if (file == null || file.Length <= 0)
            {
                // Handle error: File not found or file is empty
                return BadRequest();
            }

            var getAllProduct = context.Products.ToList();

            var categoryMap = new Dictionary<string, int>();
            var categories = context.Categories.ToList();
            foreach (var category in categories)
            {
                categoryMap[category.Name] = category.Id;
            }

            var supMap = new Dictionary<string, int>();
            var sups = context.Suppliers.ToList();
            foreach (var sup in sups)
            {
                supMap[sup.Name] = sup.Id;
            }

            using (var stream = new MemoryStream())
            {
                file.CopyTo(stream);
                stream.Position = 0;

                using (var package = new ExcelPackage(stream))
                {
                    var worksheet = package.Workbook.Worksheets.FirstOrDefault();
                    if (worksheet != null)
                    {
                        int rowCount = worksheet.Dimension.Rows;

                        for (int row = 2; row <= rowCount; row++)
                        {
                            var name = worksheet.Cells[row, 1].Value?.ToString();
                            var description = worksheet.Cells[row, 2].Value?.ToString();
                            var price = Convert.ToDecimal(worksheet.Cells[row, 3].Value);
                            var categoryName = worksheet.Cells[row, 4].Value?.ToString();
                            var supplierName = worksheet.Cells[row, 5].Value?.ToString();
                            var img = worksheet.Cells[row, 6].Value?.ToString();
                            var quantity = Convert.ToInt32(worksheet.Cells[row, 7].Value);

                            if (!supMap.ContainsKey(supplierName))
                            {
                                var suppliers = new Supplier
                                {
                                    Name = supplierName,
                                };
                                context.Suppliers.Add(suppliers);
                                context.SaveChanges();
                                supMap[supplierName] = suppliers.Id;
                            }

                            if (!categoryMap.ContainsKey(categoryName))
                            {
                                var cate = new Category
                                {
                                    Name = categoryName,
                                };
                                context.Categories.Add(cate);
                                context.SaveChanges();
                                categoryMap[categoryName] = cate.Id;
                            }

                            var product = new Product
                            {
                                Name = name,
                                Description = description,
                                Price = (int?)price,
                                CategoryId = categoryMap[categoryName],
                                Status = 0,
                                SupplierId = supMap[supplierName],
                                Image = img,
                                QuantityInStock = quantity,
                                Date = DateTime.Now,
                            };

                            context.Products.Add(product);
                        }

                        context.SaveChanges();
                    }
                }
            }

            return Ok(); // You can customize the response based on your needs
        }

    }
}
