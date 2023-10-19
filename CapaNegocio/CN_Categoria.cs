using CapaDatos;
using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace CapaNegocio
{
    public class CN_Categoria
    {
        private CD_Categoria objCapadato = new CD_Categoria ();

        public List<Categoria> Listar()
        {
            return objCapadato.Listar();
        }



        public int Registrar(Categoria obj, out string Mensaje)
        {
            Mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.Descripción) || string.IsNullOrWhiteSpace(obj.Descripción))
            {
                Mensaje = "La descripción de la categoria no puede ser vacio";

            }
            

            if (string.IsNullOrEmpty(Mensaje))
            {
               
                    return objCapadato.Registrar(obj, out Mensaje);
            }
            else
            {
                return 0;
            }
        }


        public bool Editar(Categoria obj, out string Mensaje)
        {
            Mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.Descripción) || string.IsNullOrWhiteSpace(obj.Descripción))
            {
                Mensaje = "La descripción de la categoria no puede ser vacio";

            }


            if (string.IsNullOrEmpty(Mensaje))
            {
                return objCapadato.Editar(obj, out Mensaje);
            }
            else
            {
                return false;
            }
        }


        public bool Eliminar(int id, out string Mensaje)
        {
            return objCapadato.Eliminar(id, out Mensaje);
        }

    }
}
