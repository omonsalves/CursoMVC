using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidad;
using System.Data.SqlClient;
using System.Data;

namespace CapaDatos
{
    public class CD_Ubicacion
    {

        public List<Departamento> ObtenerDepartamento()
        {
            List<Departamento> lista = new List<Departamento>();

            try
            {
                using (SqlConnection oconexion = new SqlConnection(Conexion.cn))
                {
                    oconexion.Open();
                    string query = "SELECT * FROM DEPARTAMENTO";
                    SqlCommand cmd = new SqlCommand(query, oconexion);
                    cmd.CommandType = CommandType.Text;

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            lista.Add(

                                new Departamento()
                                {
                                    IdDepartamento = dr["idDepartamento"].ToString(),
                                    Descripcion = dr["Descripción"].ToString()
                                    
                                }
                                );
                        }
                    }
                    oconexion.Close();
                }
            }
            catch (Exception ex)
            {
                lista = new List<Departamento>();
            }

            return lista;
        }



        public List<Ciudad> ObtenerCiudad(string iddepartamento)
        {
            List<Ciudad> lista = new List<Ciudad>();

            try
            {
                using (SqlConnection oconexion = new SqlConnection(Conexion.cn))
                {
                    oconexion.Open();
                    string query = "SELECT * FROM CIUDAD WHERE idDepartamento = @iddepartamento";
                    SqlCommand cmd = new SqlCommand(query, oconexion);
                    cmd.Parameters.AddWithValue("@iddepartamento", iddepartamento);
                    cmd.CommandType = CommandType.Text;

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            lista.Add(

                                new Ciudad()
                                {
                                    IdCiudad = dr["idCiudad"].ToString(),
                                    Descripcion = dr["Descripción"].ToString()

                                }
                                );
                        }
                    }
                    oconexion.Close();
                }
            }
            catch (Exception ex)
            {
                lista = new List<Ciudad>();
            }

            return lista;
        }


        public List<Barrio> ObtenerBarrio(string iddepartamento, string idciudad)
        {
            List<Barrio> lista = new List<Barrio>();

            try
            {
                using (SqlConnection oconexion = new SqlConnection(Conexion.cn))
                {
                    oconexion.Open();
                    string query = "SELECT * FROM BARRIO WHERE idCiudad = @idciudad AND idDepartamento = @iddepartamento";
                    SqlCommand cmd = new SqlCommand(query, oconexion);
                    cmd.Parameters.AddWithValue("@idciudad", idciudad);
                    cmd.Parameters.AddWithValue("@iddepartamento", iddepartamento);
                    cmd.CommandType = CommandType.Text;
                        
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            lista.Add(

                                new Barrio()
                                {
                                    IdBarrio = dr["idBarrio"].ToString(),
                                    Descripcion = dr["Descripción"].ToString()

                                }
                                );
                        }
                    }
                    oconexion.Close();
                }
            }
            catch (Exception ex)
            {
                lista = new List<Barrio>();
            }

            return lista;
        }

    }
}
