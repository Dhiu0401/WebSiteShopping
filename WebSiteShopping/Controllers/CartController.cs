using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebSiteShopping.Infrastructure;
using WebSiteShopping.Models;

namespace WebSiteShopping.Controllers
{
    public class CartController(ILogger<HomeController> logger) : Controller
    {
        WebSiteShoppingDbContext db = new WebSiteShoppingDbContext();
        private readonly ILogger<HomeController> _logger = logger;

        public Cart Cart { get; set; }
        public IActionResult AddtoCart(int ProductId)
        {
            Product? product = db.Products.FirstOrDefault(p => p.Id == ProductId);
            if (product != null)
            {
                Cart = HttpContext.Session.GetJson<Cart>("cart") ?? new Cart();
                Cart.AddItem(product, 1);
                HttpContext.Session.SetJson("cart", Cart);
            }
            return View("Index", Cart);
        }
        public IActionResult RemovefromCart(int ProductId)
        {
            Product? product = db.Products.FirstOrDefault(p => p.Id == ProductId);
            if (product != null)
            {
                Cart = HttpContext.Session.GetJson<Cart>("cart");
                Cart.RemoveLine(product);
                HttpContext.Session.SetJson("cart", Cart);
            }
            return View("Index", Cart);
        }
        public IActionResult Index()
        {
            Cart = HttpContext.Session.GetJson<Cart>("cart");
            if (Cart == null)
                return View(new Cart());
            HttpContext.Session.SetJson("cart", Cart);
            return View(Cart);
        }
    }
}

