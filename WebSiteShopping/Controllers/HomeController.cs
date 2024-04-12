using WebSiteShopping.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Security.Claims;

namespace WebSiteShopping.Controllers
{
    public class HomeController : Controller
    {
        WebSiteShoppingDbContext db = new WebSiteShoppingDbContext();
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Login()
        {
            return View();
        }
        public IActionResult Dvtheoloai(string id)
        {
            List<Product> list = db.Products.Where(x => x.Species == id).OrderBy(x => x.Name).ToList();
            return View(list);
        }
        public IActionResult Signup()
        {
            return View();
        }
		[HttpPost]
		public JsonResult SignupRequest(string email, string pass1, string pass2)
		{
			var p = new User();
            if (pass1 != pass2)
            {
                return Json(new { Message = "Vui lòng nhập mật khẩu giống nhau" });
            }
			p.Email = email;
			p.Password = pass1;
			p.Role = 1;
            try
            {
				db.Users.Add(p);
				db.SaveChanges();
			}
			catch
            {
                return Json(new { Message = "Email đã tồn tại" });
            }
			return Json(new { Message = "Tạo tài khoản thành công" });
		}
	}
}
