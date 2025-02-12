using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ProyectoVenta.Models;
using ProyectoVenta.Services; 
using System.Collections.Generic;

namespace ProyectoVenta.Controllers
{
    [Authorize]
    public class UsuarioController : Controller
    {
        private readonly IUsuarioRepository _usuarioRepository;

        public UsuarioController(IUsuarioRepository usuarioRepository)
        {
            this._usuarioRepository = usuarioRepository;
        }

        [Authorize(Roles = "Administrador")]
        public IActionResult Usuarios()
        {
            return View();
        }

        [HttpGet]
        public JsonResult ListaUsuario()
        {
            var oLista = _usuarioRepository.Listar();
            return Json(new { data = oLista });
        }

        [HttpPost]
        public JsonResult GuardarUsuario([FromBody] Usuario obj)
        {
            string operacion = Request.Headers["operacion"];
            bool respuesta;

            respuesta = operacion == "crear" ? _usuarioRepository.Guardar(obj) : _usuarioRepository.Editar(obj);

            return Json(new { respuesta = respuesta });
        }

        [HttpDelete]
        public JsonResult EliminarUsuario(int idUsuario)
        {
            var respuesta = _usuarioRepository.Eliminar(idUsuario);
            return Json(new { respuesta = respuesta });
        }
    }
}

