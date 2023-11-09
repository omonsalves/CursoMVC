using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidad;

namespace CapaNegocio
{
    public class CN_Carrito
    {
        private CD_Carrito objCapadato = new CD_Carrito();


        public bool ExisteCarrito(int idcliente, int idproducto)
        {
            return objCapadato.ExisteCarrito(idcliente, idproducto);
        }


        public bool OperacionCarrito(int idcliente, int idproducto, bool sumar, out string Mensaje)
        {
            return objCapadato.OperacionCarrito(idcliente, idproducto, sumar, out Mensaje);
        }




        public int CantidadEnCarrito(int idcliente)
        {
            return objCapadato.CantidadEnCarrito(idcliente);
        }


        public List<Carrito> ListarProducto(int idcliente)
        {
            return objCapadato.ListarProducto(idcliente);
        }



        public bool EliminarCarrito(int idcliente, int idproducto)
        {
            return objCapadato.EliminarCarrito (idcliente, idproducto);
        }

    }
}
