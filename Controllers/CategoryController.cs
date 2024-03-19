using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

using project231_2.Models;
using project231_2.Repository;
using System.Data;

namespace project231_2.Controllers
{
    [ApiController]
    [Authorize(Roles = "Admin")]
   
    [Route("api/[controller]/[action]")]
    public class CategoryController : ControllerBase
    {
       
        private readonly ICategoryRepository Repository;

        public CategoryController(ICategoryRepository repository)
        {
            Repository = repository;
        }
        [HttpGet]
        public IActionResult GetCategory()
        {
                var category = Repository.GetCategories();
            return Ok(category);
        }
    }
}
