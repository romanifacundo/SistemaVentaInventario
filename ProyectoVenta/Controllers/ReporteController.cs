using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ProyectoVenta.Models;
using ProyectoVenta.Services;

namespace ProyectoVenta.Controllers
{
    [Authorize]
    public class ReporteController : Controller
    {
        private readonly IReporteRepository _reporteRepository;

        public ReporteController(IReporteRepository reporteRepository) 
        {
            this._reporteRepository = reporteRepository;
        }

        public IActionResult Ventas()
        {
            return View();
        }

        [HttpGet]
        public JsonResult ReporteVenta(string fechaInicio, string fechaFin)
        {
            List<Reporte> oLista = new List<Reporte>();
            oLista = _reporteRepository.Listar(fechaInicio, fechaFin);
            return Json(new { data = oLista });
        }
    }
}
