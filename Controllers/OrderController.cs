using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using project231.Models;
using project231_2.DTO;
using project231_2.Models;

namespace project231_2.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        private readonly Project231Context _context;
        public OrderController(Project231Context context)
        {
            _context = context;
        }
        [HttpPost]

        public IActionResult Buy(List<CartItems> cartItems)
        {
            try
            {



                foreach (var cartItemDto in cartItems)
                {
                    var product = _context.Products.Find(cartItemDto.ProductId);

                    if (product != null)
                    {
                        // Kiểm tra xem có đủ số lượng hàng để giảm không
                        if (product.QuantityInStock >= cartItemDto.Quantity)
                        {
                            product.QuantityInStock -= cartItemDto.Quantity;
                            _context.Products.Update(product);

                            _context.SaveChanges();
                        }
                        else
                        {
                            // Nếu số lượng không đủ, rollback giao dịch và trả về thông báo lỗi
                          
                            return BadRequest($"Không đủ số lượng hàng cho sản phẩm {product.Name}");
                        }
                    }
                }

                    var newOrder = new Order
                {

                    OrderDate = DateTime.Now,
                    TotalAmout = cartItems.Sum(d => d.Quantity * d.PricePerItem),
                  
                };
               


                  
                _context.Orders.Add(newOrder);
                _context.SaveChanges();

                // Thêm chi tiết đơn hàng vào bảng OrderItems
                foreach (var cartItemDto in cartItems)
                {
                    var orderItem = new OrderItem
                    {
                        OrdersId = newOrder.Id,
                        ProductId = cartItemDto.ProductId,
                        Quantity = cartItemDto.Quantity,
                        PricePerItem = cartItemDto.PricePerItem,  // Giả sử bạn đã tính giá trước đó
                    };

                    _context.OrderItems.Add(orderItem);
                   
                }
                _context.SaveChanges();
                // Lưu thay đổi


                return Ok("Đã đặt hàng thành công");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Lỗi: {ex.Message}");
            }
        }
       


    }
}
