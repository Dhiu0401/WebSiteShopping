using Microsoft.CodeAnalysis.CSharp.Syntax;

namespace WebSiteShopping.Models
{
    public class LoginRequest
    { 
        public string Email { get; set; }
        public string Password { get; set; }
        public int GetRole(WebSiteShoppingDbContext db)
        {
            var p=db.Users.Find(Email);
            return (int)p.Role;
        }
    }
}
