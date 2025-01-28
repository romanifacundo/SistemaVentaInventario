using ProyectoVenta.Models;

namespace ProyectoVenta.Services
{
    public interface IReporteRepository
    {
        /// <summary>
        /// Lista los reportes de ventas según el rango de fechas proporcionado.
        /// </summary>
        /// <param name="fechaInicio">Fecha de inicio del rango en formato string.</param>
        /// <param name="fechaFin">Fecha de fin del rango en formato string.</param>
        /// <returns>Lista de reportes.</returns>
        List<Reporte> Listar(string fechaInicio, string fechaFin);
    }
}
