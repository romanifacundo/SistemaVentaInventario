using Microsoft.AspNetCore.Mvc;
using ProyectoVenta.Models;
using System.Xml.Linq;

using Microsoft.AspNetCore.Authorization;
using ProyectoVenta.Services;
using System.Reflection;
using Rotativa.AspNetCore;

namespace ProyectoVenta.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        private readonly IVentaRepository _ventaRepository;
        private readonly IProductoRepository _productoRepository;

        public HomeController(IVentaRepository ventaRepository,
                       IProductoRepository productoRepository)
        {
            _productoRepository = productoRepository;
            _ventaRepository = ventaRepository;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult DetalleVenta()
        {
            return View();
        }

        public IActionResult DescargarPDF(string numeroDocumento)
        {
            var oVenta = _ventaRepository.Detalle(numeroDocumento);  

            if (oVenta == null || string.IsNullOrEmpty(oVenta.NumeroDocumento))
            {
                return NotFound("Venta no encontrada.");
            }

            return new ViewAsPdf("PDFVenta", oVenta)
            {
                FileName = $"Venta_{oVenta.NumeroDocumento}.pdf"
            };
        }

        [HttpGet]
        public JsonResult AutoCompleteProducto(string search)
        {
            List<Autocomplete> autocomplete = new List<Autocomplete>();
            autocomplete = _productoRepository.Listar()
                .Where(x => string.Concat(x.Codigo.ToUpper(), x.oCategoria.Descripcion.ToUpper(), x.Descripcion.ToUpper()).Contains(search.ToUpper()))
                .Select(m => new Autocomplete
                {
                    label = $"{m.Codigo} - {m.oCategoria.Descripcion} - {m.Descripcion}",
                    value = m.IdProducto
                }
                ).ToList();

            return Json(autocomplete);
        }

        [HttpGet]
        public JsonResult ObtenerProducto(int idproducto)
        {
            Producto? oProducto = new Producto();
            oProducto = _productoRepository.Listar().Where(x => x.IdProducto == idproducto).FirstOrDefault();
            return Json(oProducto);
        }

        [HttpPost]
        public JsonResult RegistrarVenta([FromBody] Venta body)
        {

            string rpta = "";

            XElement venta = new  XElement("Venta",
                new XElement("TipoPago",body.TipoPago),
                new XElement("NumeroDocumento", "0"),
                new XElement("DocumentoCliente",body.DocumentoCliente),
                new XElement("NombreCliente",body.NombreCliente),
                new XElement("MontoPagoCon",body.MontoPagoCon),
                new XElement("MontoCambio",body.MontoCambio),
                new XElement("MontoSubTotal",body.MontoSubTotal),
                new XElement("MontoIGV",body.MontoIGV),
                new XElement("MontoTotal",body.MontoTotal)
            );

            XElement oDetalleVenta = new XElement("Detalle_Venta");
            foreach (Detalle_Venta item in body.oDetalleVenta)
            {
                oDetalleVenta.Add(new XElement("Item",
                    new XElement("IdProducto", item.oProducto.IdProducto),
                    new XElement("PrecioVenta",item.PrecioVenta ),
                    new XElement("Cantidad", item.Cantidad),
                    new XElement("Total", item.Total)
                    ));
            }

            venta.Add(oDetalleVenta);

            rpta = _ventaRepository.Registrar(venta.ToString());

            return Json(new { respuesta = rpta });
        }

        [HttpGet]
        public JsonResult ObtenerVenta(string nrodocumento)
        {
            Venta? oVenta = new Venta();
            oVenta = _ventaRepository.Detalle(nrodocumento);
            return Json(oVenta);
        }

    }
}