using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using project231.Models;
using project231_2.Models;
using System.Data;

namespace project231.Controllers
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    [Authorize(Roles = "Admin")]
    public class SupplierController : ControllerBase
    {
        private readonly Project231Context _context;
        public SupplierController(Project231Context context)
        {
            _context = context;
        }
        [HttpGet]
        public IActionResult GetSupplier()
        {
            var supplier = _context.Suppliers.ToList();
            return Ok(supplier);
        }
    }
}
