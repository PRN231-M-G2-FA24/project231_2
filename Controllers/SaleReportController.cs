using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using project231.Models;
using project231_2.Models;
using System.Collections.Generic;
using System.Globalization;

namespace project231_2.Controllers
{
    [Authorize(Roles = "Admin")]
    [Route("api/[controller]/[action]")]
    [ApiController]
    

    public class SaleReportController : ControllerBase
    {
        private readonly Project231Context context;
    
        public SaleReportController(Project231Context _context)
        {
            context= _context;
        }
        [HttpGet]
        public IActionResult GetRevenue()
        {
          
           

            var products = (from o_item in context.OrderItems
                            join o in context.Orders on o_item.OrdersId equals o.Id
                            join p in context.Products on o_item.ProductId equals p.Id
                            group o_item by new { p.Id, p.Name } into g
                            select new SaleReport
                            {
                                ProductName = g.Key.Name,
                                TotalQuantitySold = g.Sum(od => od.Quantity),
                                TotalPrice = g.Sum(od => od.Quantity * od.PricePerItem)
                            });
            

            return Ok(products);
        }
        [HttpGet("getRevenueData")]
        public IActionResult ReportPerMonth()
        {

            try
            {
                int? totalRevenue;
                List<OrderItem> orderItems = new List<OrderItem>();
                List<string> monthLabels = new List<string>();
                List<int> monthlyRevenue = new List<int>();

                var order = from o_item in context.OrderItems
                            join o in context.Orders on o_item.OrdersId equals o.Id
                            join p in context.Products on o_item.ProductId equals p.Id
                            select new OrderItem
                            {
                                Orders = o,
                                Product = p,
                                Quantity = o_item.Quantity,
                                Id = o_item.Id,
                                PricePerItem = o_item.PricePerItem
                            };

                orderItems = order.ToList();

                totalRevenue = orderItems.Sum(item => item.Quantity * item.PricePerItem);

                var revenueData = context.Orders
                    .Join(
                        context.OrderItems,
                        order => order.Id,
                        orderItem => orderItem.OrdersId,
                        (order, orderItem) => new
                        {
                            OrderDate = order.OrderDate,
                            Revenue = orderItem.Quantity * orderItem.PricePerItem
                        }
                    )
                    .ToList();

                totalRevenue = revenueData.Sum(item => item.Revenue);

                var monthlyRevenueData = revenueData
                    .GroupBy(item => item.OrderDate?.Month)
                    .Select(group => new
                    {
                        Month = group.Key,
                        Revenue = group.Sum(item => item.Revenue)
                    })
                    .ToList();

                for (int month = 1; month <= 12; month++)
                {
                    var data = monthlyRevenueData.FirstOrDefault(item => item.Month == month);
                    monthLabels.Add(CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(month));
                    monthlyRevenue.Add(data?.Revenue ?? 0);
                }

                var response = new
                {
                    TotalRevenue = totalRevenue,
                    OrderItems = orderItems,
                    MonthLabels = monthLabels,
                    MonthlyRevenue = monthlyRevenue
                };

                return Ok(response);
            }
            catch (Exception ex)
            {
                // Log the exception or handle it as needed
                return StatusCode(500, "Internal server error");
            }

        }
    }
}
