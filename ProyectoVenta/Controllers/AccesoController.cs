using Microsoft.AspNetCore.Mvc;
using ProyectoVenta.Datos;
using ProyectoVenta.Models;


using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using ProyectoVenta.Services;

namespace ProyectoVenta.Controllers
{
    public class AccesoController : Controller
    {
        private readonly IUsuarioRepository _usuarioRepository;

        public AccesoController(IUsuarioRepository usuarioRepository)
        {
            _usuarioRepository = usuarioRepository;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Index(string correo, string clave)
        {
            Usuario user = new Usuario();
            user = _usuarioRepository.Listar().Where(u => u.Correo == correo && u.Clave == clave).FirstOrDefault();

            if (user == null)
            {
                ViewData["mensaje"] = "Usuario no encontrado";
                return View();
            }

            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, user.Correo),
                new Claim("NombreCompleto", user.NombreCompleto),
                new Claim(ClaimTypes.Role, user.Rol.Descripcion) // Asigna el rol dinámicamente
            };

            var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity));

            return RedirectToAction("Index", "Home");
        }

        public async Task<IActionResult> Salir()
        {
            // Clear cookie
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);

            return RedirectToAction("Index", "Acceso");
        }
    }
}
