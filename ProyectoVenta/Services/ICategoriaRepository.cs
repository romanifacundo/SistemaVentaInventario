using ProyectoVenta.Models;
using System.Collections.Generic;

namespace ProyectoVenta.Services
{
    public interface ICategoriaRepository
    {
        List<Categoria> Listar(); 

        bool Guardar(Categoria obj); 

        bool Editar(Categoria obj); 

        bool Eliminar(int idCategoria); 
    }
}

