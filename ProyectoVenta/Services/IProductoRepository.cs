using System.Collections.Generic;
using ProyectoVenta.Models;

namespace ProyectoVenta.Services
{
    public interface IProductoRepository
    {
        List<Producto> Listar();

        bool Guardar(Producto obj);

        bool Editar(Producto obj);

        bool Eliminar(int idProducto);
    }
}

