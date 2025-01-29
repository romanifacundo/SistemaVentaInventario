using ProyectoVenta.Datos;
using ProyectoVenta.Models;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Xml;
using System.Xml.Linq;

namespace ProyectoVenta.Services
{
    public class VentaRepository : IVentaRepository
    {
        public string Registrar(string venta_xml)
        {
            string respuesta = "";
            var cn = new Conexion();
            try
            {
                using (SqlConnection oconexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    oconexion.Open();
                    SqlCommand cmd = new SqlCommand("sp_registrar_venta", oconexion);
                    cmd.Parameters.Add("Venta_xml", SqlDbType.Xml).Value = venta_xml;
                    cmd.Parameters.Add("NroDocumento", SqlDbType.VarChar, 6).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.ExecuteNonQuery();
                    respuesta = cmd.Parameters["NroDocumento"].Value.ToString();
                }
            }
            catch (Exception ex)
            {
                respuesta = "";
            }

            return respuesta;
        }

        public Venta Detalle(string codigoventa)
        {
            Venta? oVenta = new Venta();
            var cn = new Conexion();
            try
            {
                using (SqlConnection oconexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    oconexion.Open();
                    SqlCommand cmd = new SqlCommand("sp_detalle_venta", oconexion);
                    cmd.Parameters.AddWithValue("codigoventa", codigoventa);
                    cmd.CommandType = CommandType.StoredProcedure;

                    XmlReader dr = cmd.ExecuteXmlReader();

                    if (dr.Read())
                    {
                        XDocument doc = XDocument.Load(dr);

                        oVenta = doc.Element("Venta") != null ? (from v in doc.Elements("Venta")
                                                                   select new Venta()
                                                                   {
                                                                       TipoPago = v.Element("TipoPago")?.Value ?? string.Empty,
                                                                       NumeroDocumento = v.Element("NumeroDocumento")?.Value ?? string.Empty,
                                                                       DocumentoCliente = v.Element("DocumentoCliente")?.Value ?? string.Empty,
                                                                       NombreCliente = v.Element("NombreCliente")?.Value ?? string.Empty,
                                                                       MontoPagoCon = Convert.ToDecimal(v.Element("MontoPagoCon")?.Value ?? "0", new CultureInfo("es-PE")),
                                                                       MontoCambio = Convert.ToDecimal(v.Element("MontoCambio")?.Value ?? "0", new CultureInfo("es-PE")),
                                                                       MontoSubTotal = Convert.ToDecimal(v.Element("MontoSubTotal")?.Value ?? "0", new CultureInfo("es-PE")),
                                                                       MontoIGV = Convert.ToDecimal(v.Element("MontoIGV")?.Value ?? "0", new CultureInfo("es-PE")),
                                                                       MontoTotal = Convert.ToDecimal(v.Element("MontoTotal")?.Value ?? "0", new CultureInfo("es-PE")),
                                                                       FechaRegistro = v.Element("FechaRegistro")?.Value ?? string.Empty,
                                                                       oDetalleVenta = v.Element("DetalleVenta") != null ? 
                                                                       (from i in v.Element("DetalleVenta").Elements("Item")
                                                                                                                              select new Detalle_Venta()
                                                                                                                              {
                                                                                                                                  oProducto = new Producto()
                                                                                                                                  {
                                                                                                                                      Descripcion = i.Element("Descripcion").Value
                                                                                                                                  },
                                                                                                                                  Cantidad = Convert.ToInt32(i.Element("Cantidad").Value),
                                                                                                                                  PrecioVenta = Convert.ToDecimal(i.Element("PrecioVenta").Value, new CultureInfo("es-PE")),
                                                                                                                                  Total = Convert.ToDecimal(i.Element("Total").Value, new CultureInfo("es-PE")),
                                                                                                                              }).ToList() : new List<Detalle_Venta>()

                                                                   }).FirstOrDefault() : new Venta();

                    }


                }
            }
            catch (Exception ex)
            {
                oVenta = new Venta();
            }

            return oVenta;
        }

    }
}
