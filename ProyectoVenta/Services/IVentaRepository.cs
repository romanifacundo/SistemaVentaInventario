using ProyectoVenta.Models;
using System;

namespace ProyectoVenta.Services
{
    public interface IVentaRepository
    {
        /// <summary>
        /// Registra una venta en la base de datos utilizando un XML.
        /// </summary>
        /// <param name="venta_xml">El XML que contiene los detalles de la venta.</param>
        /// <returns>El número de documento generado tras registrar la venta.</returns>
        string Registrar(string venta_xml);

        /// <summary>
        /// Obtiene el detalle de una venta específica.
        /// </summary>
        /// <param name="codigoventa">El código de la venta a consultar.</param>
        /// <returns>Un objeto de tipo Venta con los detalles de la venta.</returns>
        Venta Detalle(string codigoventa);
    }
}

