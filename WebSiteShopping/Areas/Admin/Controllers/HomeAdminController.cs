using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.DotNet.Scaffolding.Shared.Messaging;
using System.Runtime.CompilerServices;
using System.Runtime.Intrinsics.Arm;
using WebSiteShopping.Controllers;
using WebSiteShopping.Models;

namespace BanDongVat.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Route("Admin")]
    public class HomeAdminController : Controller
    {
        WebSiteShoppingDbContext db = new WebSiteShoppingDbContext();
        private readonly ILogger<HomeController> _logger;

        public HomeAdminController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }
        [Route("")]
        [Route("index")]
        public IActionResult Index()
        {
            return View();
        }
        [Route("danhmucsp")]
        public IActionResult DanhMucSP()
        {
            var list = from p in db.Products
                       select p;
            return View(list);
        }
        [Route("danhmuctk")]
        public IActionResult DanhMucTK()
        {
            var list = from p in db.Users
                       select p;
            return View(list);
        }
        [HttpPost]
        [Route("AddSp")]
        public async Task<JsonResult> AddSp(int id, string name, decimal price, IFormFile image, string color, double weight, string species, string gender, string info, int stock)
        {
            if (stock <= 0)
            {
                return Json(new { Message = "Vui lòng nhập tồn kho lớn hơn 0" });
            }
            var p = new Product();
            if (image != null && image.Length > 0)
            {
                var fileName = Path.GetFileName(image.FileName);
                var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "ProductImg", fileName);

                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    image.CopyTo(stream);
                }

                p.Image = fileName;
            }
            p.Id = id;
            p.Name = name;
            p.Price = price;
            p.Color = color;
            p.Weight = weight;
            p.Species = species;
            p.Gender = gender;
            p.Info = info;
            p.Stock = stock;
            try
            {
                db.Products.Add(p);
                await db.SaveChangesAsync();
            }
            catch
            {
                return Json(new { Message = "ID sản phẩm đã tồn tại" });
            }
            return Json(new { Message = "Thêm sản phẩm thành công" });
        }
        [HttpPost]
        [Route("RemoveSp")]
        public async Task<IActionResult> RemoveSp(int id)
        {
            var p = await db.Products.FindAsync(id);
            if (p.Image != null)
            {
                string imagePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "ProductImg", p.Image);

                if (System.IO.File.Exists(imagePath))
                {
                    System.IO.File.Delete(imagePath);
                }
            }
            db.Products.Remove(p);
            await db.SaveChangesAsync();
            DanhMucSP();
            return View("DanhMucSP");
        }
        [HttpPost]
        [Route("EditSp")]
        public async Task<JsonResult> EditSp(int id, string name, decimal price, IFormFile image, string color, double weight, string species, string gender, string info, int stock)
        {
            var p = await db.Products.FindAsync(id);
            if (image != null && image.Length > 0)
            {
                var fileName = Path.GetFileName(image.FileName);
                var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "ProductImg", fileName);

                if (!string.IsNullOrEmpty(p.Image))
                {
                    string oldImagePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "ProductImg", p.Image);
                    if (System.IO.File.Exists(oldImagePath))
                    {
                        System.IO.File.Delete(oldImagePath);
                    }
                }

                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await image.CopyToAsync(stream);
                }

                p.Image = fileName;
            }

            p.Name = name;
            p.Price = price;
            p.Color = color;
            p.Weight = weight;
            p.Species = species;
            p.Gender = gender;
            p.Info = info;
            p.Stock = stock;

            await db.SaveChangesAsync();

            return Json(new { Message = "Sửa sản phẩm thành công" });
        }
        [HttpPost]
        [Route("AddTk")]
        public JsonResult AddTk(string email, string password1, string password2, int role)
        {
            if (password1 != password2)
                return Json(new { Message = "Vui lòng nhập mật khẩu giống nhau" });
            var p = new User();
            p.Email = email;
            p.Password = password1;
            p.Role = role;
            try
            {
                db.Users.Add(p);
                db.SaveChanges();
            }
            catch
            {
                return Json(new { Message = "Email đã tồn tại" });
            }
            return Json(new { Message = "Thêm tài khoản thành công" });
        }
        [HttpPost]
        [Route("RemoveTk")]
        public async Task<IActionResult> RemoveTk(string email)
        {
            var p = await db.Users.FindAsync(email);
            if (p != null)
            {
                db.Users.Remove(p);
                await db.SaveChangesAsync();
            }
            DanhMucTK();
            return View("DanhMucTK");
        }
        [HttpPost]
        [Route("EditTk")]
        public async Task<IActionResult> EditTk(string email, string password, int role)
        {
            var p = await db.Users.FindAsync(email);
            p.Password=password;
            p.Role = role;
            await db.SaveChangesAsync();
            DanhMucTK();
            return View("DanhMucTK");
        }
    }
}

