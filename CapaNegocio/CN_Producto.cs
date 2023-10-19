using CapaDatos;
using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class CN_Producto
    {
         



        private CD_Producto objCapadato = new CD_Producto();

        public List<Producto> Listar()
        {
            return objCapadato.Listar();
        }



        public int Registrar(Producto obj, out string Mensaje)
        {
            Mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.Nombre) || string.IsNullOrWhiteSpace(obj.Nombre))
            {
                Mensaje = "El nombre del Producto no puede ser vacio";

            }
            else if (string.IsNullOrEmpty(obj.Descripción) || string.IsNullOrWhiteSpace(obj.Descripción))
            {
                Mensaje = "La descripción del Producto no puede ser vacio";

            }
            else if (obj.oMarca.IdMarca == 0)
            {
                Mensaje = "Debe seleccionar una marca";

            } 
            else if (obj.oCategoria.IdCategoria == 0)
            {
                Mensaje = "Debe seleccionar una categoria";

            }
            else if (obj.oCategoria.IdCategoria == 0)
            {
                Mensaje = "Debe seleccionar una categoria";

            }
            else if (obj.Precio == 0)
            {
                Mensaje = "Debe ingresar el precio del producto";

            }
            else if (obj.Stock == 0)
            {
                Mensaje = "Debe ingresar el stock del producto";

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


        public bool Editar(Producto obj, out string Mensaje)
        {
            Mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.Nombre) || string.IsNullOrWhiteSpace(obj.Nombre))
            {
                Mensaje = "El nombre del Producto no puede ser vacio";

            }
            else if (string.IsNullOrEmpty(obj.Descripción) || string.IsNullOrWhiteSpace(obj.Descripción))
            {
                Mensaje = "La descripción del Producto no puede ser vacio";

            }
            else if (obj.oMarca.IdMarca == 0)
            {
                Mensaje = "Debe seleccionar una marca";

            }
            else if (obj.oCategoria.IdCategoria == 0)
            {
                Mensaje = "Debe seleccionar una categoria";

            }
            else if (obj.oCategoria.IdCategoria == 0)
            {
                Mensaje = "Debe seleccionar una categoria";

            }
            else if (obj.Precio == 0)
            {
                Mensaje = "Debe ingresar el precio del producto";

            }
            else if (obj.Stock == 0)
            {
                Mensaje = "Debe ingresar el stock del producto";

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



        public bool GuardarDatosImagen(Producto obj, out string mensaje){

            return objCapadato.GuardarDatosImagen(obj, out mensaje);

        }


        public bool Eliminar(int id, out string Mensaje)
        {
            return objCapadato.Eliminar(id, out Mensaje);
        }






    }
}
