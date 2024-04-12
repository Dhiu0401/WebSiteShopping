using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using WebSiteShopping.Controllers;
using WebSiteShopping.Models;

[Route("api/[controller]")]
[ApiController]
[Authorize]
public class AuthController : ControllerBase
{
	WebSiteShoppingDbContext db = new WebSiteShoppingDbContext();
	private readonly IConfiguration _config;
	public AuthController(IConfiguration config)
	{
		_config = config;
	}
	[HttpPost]
	[Route(("login"))]
	public IActionResult Login([FromForm] string email, string password)
	{
		// Kiểm tra thông tin đăng nhập
		// ...

		// Tạo token
		var token = GenerateJwtToken(email);

		return Ok(new { token });
	}

	private string GenerateJwtToken(string username)
	{
		var tokenHandler = new JwtSecurityTokenHandler();
		var secretKey = _config["Jwt:sadhjaskdaksdasdhawjehkawhj2hj31hk23h123h123h12h3kjk"];
		byte[] key = null;
		if (!string.IsNullOrEmpty(secretKey))
		{
			key = Encoding.ASCII.GetBytes(secretKey);
		}
		else
		{
			return null;
		}
		var tokenDescriptor = new SecurityTokenDescriptor
		{
			Subject = new ClaimsIdentity(new[] { new Claim("username", username) }),
			Expires = DateTime.UtcNow.AddDays(7),
			SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
		};
		var token = tokenHandler.CreateToken(tokenDescriptor);
		return tokenHandler.WriteToken(token);
	}
}