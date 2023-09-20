﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CapaEntidad;
using CapaNegocio;

namespace CapaPresentacionTienda.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }public ActionResult Usuarios()
        {
            return View();
        }
        public JsonResult ListarUsuarios()
        {
            List<Usuario> olista = new List<Usuario>(); 

            olista = new CN_Usuarios().Listar();
            return Json(olista, JsonRequestBehavior.AllowGet);
        }

    }
}