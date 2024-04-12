using WebSiteShopping.Models;

namespace WebSiteShopping.Repository
{
    public class UserRepository
    {
        private readonly WebSiteShoppingDbContext _dbContext;

        public UserRepository(WebSiteShoppingDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public User GetUserByEmailAndPassword(string email, string password)
        {
            return _dbContext.Users.SingleOrDefault(u => u.Email == email && u.Password == password);
        }
        public User GetUserByEmail(string email)
        {
            return _dbContext.Users.SingleOrDefault(u => u.Email == email);
        }
    }
}
