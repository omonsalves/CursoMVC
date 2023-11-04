using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidad;

namespace CapaNegocio
{
    public class CN_Usuarios
    {
        private CD_Usuarios objCapadato = new CD_Usuarios();
        public List<Usuario> Listar()
        {
            return objCapadato.Listar();
        }

        public int Registrar(Usuario obj, out string Mensaje)
        {
            Mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.Nombres) || string.IsNullOrWhiteSpace(obj.Nombres))
            {
                Mensaje = "El nombre del usuario no puede ser vacio";

            }
            else if (string.IsNullOrEmpty(obj.Apellidos) || string.IsNullOrWhiteSpace(obj.Apellidos))
            {
                Mensaje = "El apellido del usuario no puede ser vacio";

            }
            else if (string.IsNullOrEmpty(obj.Correo) || string.IsNullOrWhiteSpace(obj.Correo))
            {
                Mensaje = "El correo del usuario no puede ser vacio";

            }

            if (string.IsNullOrEmpty(Mensaje))
            {
                string clave = CN_Recursos.GenerarClave();

                string asunto = "Creacion de cuenta";
                string mensaje_correo = "<img src=\"https://i.ibb.co/3zPw3tv/Imagen-de-Whats-App-2023-10-10-a-las-19-02-14-5e33b20c.jpg\" alt=\"https://i.ibb.co/3zPw3tv/Imagen-de-Whats-App-2023-10-10-a-las-19-02-14-5e33b20c.jpg\">" +
                    "<h2>Su cuenta fue creada exitosamente</h2>" +
                    "</br>" +
                    "<h4>Ahora haces parte de la familia TIENDABOD</h4>" +
                    "<P>Su contraseña para acceder es: </P>" + clave;




                bool respuesta = CN_Recursos.EnviarCorreo(obj.Correo, asunto, mensaje_correo);

                if (respuesta == true)
                {

                    obj.Clave = CN_Recursos.ConvertirRIPEMD160(clave);

                    return objCapadato.Registrar(obj, out Mensaje);

                }
                else
                {
                    Mensaje = "No se puede enviar el correo";
                    return 0;
                }


            }
            else
            {
                return 0;
            }
        }


        public bool Editar(Usuario obj, out string Mensaje)
        {
            Mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.Nombres) || string.IsNullOrWhiteSpace(obj.Nombres))
            {
                Mensaje = "El nombre del usuario no puede ser vacio";

            }
            else if (string.IsNullOrEmpty(obj.Apellidos) || string.IsNullOrWhiteSpace(obj.Apellidos))
            {
                Mensaje = "El apellido del usuario no puede ser vacio";

            }
            else if (string.IsNullOrEmpty(obj.Correo) || string.IsNullOrWhiteSpace(obj.Correo))
            {
                Mensaje = "El correo del usuario no puede ser vacio";

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





        public bool CambiarClave(int idusuario, string nuevaclave, out string Mensaje)
        {

            return objCapadato.CambiarClave(idusuario, nuevaclave, out Mensaje);
        }





        public bool ReestablecerClave(int idusuario, string correo, out string Mensaje)
        {

            Mensaje = string.Empty;
            string nuevaclave = CN_Recursos.GenerarClave();
            bool resultado = objCapadato.ReestablecerClave(idusuario, CN_Recursos.ConvertirRIPEMD160(nuevaclave), out Mensaje);

            if (resultado)
            {

                string asunto = "Contraseña Reestablecida";
                string mensaje_correo = "<h3>Su cuenta fue reestablecida correctamente</h3></br><p>Su contraseña para acceder ahora es: !clave!</p>";
                mensaje_correo = mensaje_correo.Replace("!clave!", nuevaclave);


                bool respuesta = CN_Recursos.EnviarCorreo(correo, asunto, mensaje_correo);

                if (respuesta)
                {

                    return true;
                }
                else
                {
                    Mensaje = "No se pudo enviar el correo";
                    return false;
                }

            }
            else
            {
                Mensaje = "No se pudo reestablecer la contraseña";

                return false;
            }




        }

    }

}
