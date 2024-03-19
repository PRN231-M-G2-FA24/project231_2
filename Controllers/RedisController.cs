using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Distributed;

namespace project231_2.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RedisController : ControllerBase
    {
        private readonly IDistributedCache distributedCache;

        public RedisController(IDistributedCache _distributedCache)
        {
            distributedCache = _distributedCache;
        }
      
        
    }
}
