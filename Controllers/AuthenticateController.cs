
using Gconnect.Domain.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using project231.Authenticate;
using project231.Models;
using project231_2.Models;
using System.Diagnostics.Eventing.Reader;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace project231.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class AuthenticateController : ControllerBase
    {
        
        private readonly IConfiguration _configuration;
        private readonly Project231Context context;

        public AuthenticateController( IConfiguration configuration,Project231Context _context)
        {

            context = _context;
            _configuration = configuration;
        }


        [HttpPost]

        public async Task<IActionResult> Login([FromBody] LoginModel model)
        {
            var user = await context.AspNetUsers.FirstOrDefaultAsync(x=>x.UserName==model.Username);
           

            if (user != null)
            {
                var userRoles = (from u in context.AspNetUsers
                                 where user.UserName == model.Username
                                 join userRole in context.AspNetUserRoles on user.Id equals userRole.UserId
                                 join role in context.AspNetRoles on userRole.RoleId equals role.Id
                                 select role.Name).ToList();

                var authClaims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, user.UserName),
                    new Claim(ClaimTypes.Name, user.Id),
                    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                };

               

                foreach (var userRole in userRoles)
                {
                    authClaims.Add(new Claim(ClaimTypes.Role, userRole));
                }
              

               
                var authSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JWT:Secret"]));

                var token = new JwtSecurityToken(
                    issuer: _configuration["JWT:ValidIssuer"],
                    audience: _configuration["JWT:ValidAudience"],
                    expires: DateTime.Now.AddHours(3),
                    claims: authClaims,
                    signingCredentials: new SigningCredentials(authSigningKey, SecurityAlgorithms.HmacSha256)
                    );

                return Ok(new
                {
                    token = new JwtSecurityTokenHandler().WriteToken(token),
                    expiration = token.ValidTo
                });
            }
            return Unauthorized();
        }
        [HttpPost]
    
        public async Task<IActionResult> Register([FromBody] RegisterModel model)
        {
            var userExists = await context.AspNetUsers.FirstOrDefaultAsync(x => x.UserName.Equals(model.Username));
            if (userExists != null)
            {
               return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "User already exists!" });
            }
            else
            { 
                AspNetUser user = new AspNetUser()
               {
                Email = model.Email,
                SecurityStamp = Guid.NewGuid().ToString(),
                UserName = model.Username,
                PasswordHash=model.Password,
               };

               context.AspNetUsers.Add(user);

               
           
            var result = context.SaveChangesAsync();

            AspNetUserRole role = new AspNetUserRole()
            {
                UserId=user.Id,
                RoleId= "2"
            };
            await context.AspNetUserRoles.AddAsync(role);
            context.SaveChangesAsync();
             

            return Ok(new Response { Status = "Success", Message = "User created successfully!" });

            }
        }
    }
}
