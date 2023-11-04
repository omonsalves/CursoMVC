using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;
using System.IO;


namespace CapaNegocio
{
    public class CN_Recursos
    {

        public static string GenerarClave()
        {
            string clave = Guid.NewGuid().ToString("N").Substring(0, 6);
            return clave;
        }


        public static string ConvertirRIPEMD160(string input)
        {
            using (RIPEMD160 ripeMd160 = RIPEMD160.Create())
            {
                byte[] inputBytes = Encoding.ASCII.GetBytes(input);
                byte[] hashBytes = ripeMd160.ComputeHash(inputBytes);

                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < hashBytes.Length; i++)
                {
                    sb.Append(hashBytes[i].ToString("X2"));
                }
                return sb.ToString();
            }
        }

       
       




        public static bool EnviarCorreo(string correo, string asunto, string mensaje)
        {

            bool resultado = false;

            try
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(correo);
                mail.From = new MailAddress("tiendabod48@gmail.com");
                mail.Subject = asunto;
                mail.Body = mensaje;    
                mail.IsBodyHtml = true;

                var smtp = new SmtpClient()
                {
                    Credentials = new NetworkCredential("tiendabod48@gmail.com", "dbzhkxypiiqeaknz"),
                    Host = "smtp.gmail.com",
                    Port= 587,
                    EnableSsl = true
                };

                smtp.Send(mail);
                resultado = true;

            }catch (Exception ex)
            {
               // string msg = ex.ToString(); 
                resultado = false;
            }

            return resultado;
        }




        public static string ConvertirBase64(string ruta, out bool conversion)
        {

            string textoBase64 = string.Empty;
            conversion = true;
            try
            {
                byte[] bytes = File.ReadAllBytes(ruta); 
                textoBase64 = Convert.ToBase64String(bytes);


            }catch (Exception ex)
            {
                conversion = false;
            }
            return textoBase64;
        }





    }
}
