using CapaDatos;
using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class CN_Marca
    {

        private CD_Marca objCapadato = new CD_Marca();

        public List<Marca> Listar()
        {
            return objCapadato.Listar();
        }



        public int Registrar(Marca obj, out string Mensaje)
        {
            Mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.Descripción) || string.IsNullOrWhiteSpace(obj.Descripción))
            {
                Mensaje = "La descripción de la marca no puede ser vacio";

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


        public bool Editar(Marca obj, out string Mensaje)
        {
            Mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.Descripción) || string.IsNullOrWhiteSpace(obj.Descripción))
            {
                Mensaje = "La descripción de la marca no puede ser vacio";

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
