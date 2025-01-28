using ProyectoVenta.Models;

namespace ProyectoVenta.Services
{
    public interface IUsuarioRepository
    {
        List<Usuario> Listar();

        bool Guardar(Usuario usuario);

        bool Editar(Usuario usuario);

        bool Eliminar(int idUsuario);
    }
}

