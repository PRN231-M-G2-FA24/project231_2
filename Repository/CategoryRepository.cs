using project231.Models;
using project231_2.Models;
using System.Drawing.Printing;

namespace project231_2.Repository
{
    public class CategoryRepository : ICategoryRepository
    {  
        private readonly Project231Context _context;

        public CategoryRepository(Project231Context context) {
        
        _context=context;   
        }
        public List<Category> GetCategories()
        {
            var category = _context.Categories.ToList();

            return category;    
        }
    }
}
