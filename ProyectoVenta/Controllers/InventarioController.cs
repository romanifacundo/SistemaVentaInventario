using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ProyectoVenta.Models;
using ProyectoVenta.Services;

namespace ProyectoVenta.Controllers
{
    [Authorize]
    public class InventarioController : Controller
    {
        private readonly ICategoriaRepository _categoriaRepository;
        private readonly IProductoRepository _productoRepository;

        public InventarioController(ICategoriaRepository categoriaRepository, 
                                    IProductoRepository productoRepository)
        {
            _categoriaRepository = categoriaRepository;
            _productoRepository = productoRepository;
        }

        public IActionResult Productos()
        {
            return View();
        }

        public IActionResult Categorias()
        {
            return View();
        }

        [HttpGet]
        public JsonResult ListaProducto()
        {
            List<Producto> oLista = new List<Producto>();
            oLista = _productoRepository.Listar();
            return Json(new { data = oLista });
        }

        [HttpPost]
        public JsonResult GuardarProducto([FromBody] Producto obj)
        {
            string operacion = Request.Headers["operacion"];
            bool respuesta;

            if (operacion == "crear")
            {
                respuesta = _productoRepository.Guardar(obj);
            }
            else {
                respuesta = _productoRepository.Editar(obj);
            }
            

            return Json(new { respuesta = respuesta });
        }

        [HttpDelete]
        public JsonResult EliminarProducto(int idproducto)
        {
            bool respuesta;
            respuesta = _productoRepository.Eliminar(idproducto);
            return Json(new { respuesta = respuesta });
        }

        [HttpGet]
        public JsonResult ListaCategoria()
        {
            List<Categoria> oLista = new List<Categoria>();
            oLista = _categoriaRepository.Listar();
            return Json(new { data = oLista });
        }

        [HttpPost]
        public JsonResult GuardarCategoria([FromBody] Categoria obj)
        {
            string operacion = Request.Headers["operacion"];
            bool respuesta;

            if (operacion == "crear")
            {
                respuesta = _categoriaRepository.Guardar(obj);
            }
            else
            {
                respuesta = _categoriaRepository.Editar(obj);
            }


            return Json(new { respuesta = respuesta });
        }

        [HttpDelete]
        public JsonResult EliminarCategoria(int idcategoria)
        {
            bool respuesta;
            respuesta = _categoriaRepository.Eliminar(idcategoria);
            return Json(new { respuesta = respuesta });
        }

    }
}
