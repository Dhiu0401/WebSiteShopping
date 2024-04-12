using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebSiteShopping.Models;

namespace WebSiteShopping.Controllers
{
    public class ShopController : Controller
    {
        WebSiteShoppingDbContext db = new WebSiteShoppingDbContext();
        private readonly ILogger<HomeController> _logger;
        public ShopController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }
        [HttpGet]
        public IActionResult Index(decimal? from, string? mau, string? loai)
        {
            var species = db.Products.Select(p => p.Species)
                             .Distinct()
                             .ToList();
            ViewBag.Species = species;
            var color = db.Products.Select(p => p.Color)
                             .Distinct()
                             .ToList();
            ViewBag.Color = color;
            var sp = from p in db.Products select p;
            if (mau != null && loai != null) 
            {
                sp = from p in db.Products
                     where p.Color == mau && p.Species == loai
                     select p;
            } else
                if (mau != null)
                {
                    sp = from p in db.Products
                             where p.Color == mau
                             select p;
                } else
                    if (loai != null)
                    {
                        sp = from p in db.Products
                             where p.Species == loai
                             select p;
                    }
            if (from != null)
            {
                if (from == 25000000)
                {
                    sp = sp.Where(x => x.Price > from);
                    return View(sp);
                }
                var to = from + 5000000;
                sp = sp.Where(x => x.Price >= from && x.Price <= to);
            }
            sp = sp.OrderBy(y => y.Name).OrderBy(x => x.Price);
            return View(sp);
        }
    }
}
