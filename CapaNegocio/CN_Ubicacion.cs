using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidad;

namespace CapaNegocio
{
    public class CN_Ubicacion
    {
        private CD_Ubicacion objcapadato = new CD_Ubicacion();




        public List<Departamento> ObtenerDepartamento()
        {

            return objcapadato.ObtenerDepartamento();

        }



        public List<Ciudad> ObtenerCiudad(string iddepartamento)
        {
            return objcapadato.ObtenerCiudad(iddepartamento);
        }




        public List<Barrio> ObtenerBarrio(string iddepartamento, string idciudad)
        {
            return objcapadato.ObtenerBarrio(iddepartamento, idciudad);
        }

    }
}
