using HospedagemOnline.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HospedagemOnline.Controllers
{
    public class TipoQuartoController : Controller
    {
        private HospedagemBDEntities db = new HospedagemBDEntities();

        public ActionResult Index()
        {
            var tipoQuarto = db.TipoQuarto.ToList();
            return View(tipoQuarto);
        }

        public ActionResult Inserir()
        {
            return View();

        }
        [HttpPost]
        public ActionResult Inserir(TipoQuarto tipoQuarto)
        {
            if (ModelState.IsValid)
            {
                db.TipoQuarto.Add(tipoQuarto);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tipoQuarto);
        }

        public ActionResult Alterar(long id)
        {
            TipoQuarto tipoQuarto = db.TipoQuarto.Find(id);

            return View(tipoQuarto);

        }
        [HttpPost]
        public ActionResult Alterar(TipoQuarto tipoQuarto)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tipoQuarto).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tipoQuarto);

        }

        public ActionResult Excluir(long id)
        {
            TipoQuarto tipoQuarto = db.TipoQuarto.Find(id);

            return View(tipoQuarto);

        }
        [HttpPost, ActionName("Excluir")]
        public ActionResult EfetivaExcluisao(long id)
        {
            try
            {
                TipoQuarto tipoQuarto = db.TipoQuarto.Find(id);
                db.TipoQuarto.Remove(tipoQuarto);
                db.SaveChanges();
                return RedirectToAction("Index");

            }
            catch
            {
                return RedirectToAction("ErroExcluir");

            }

        }
        public ActionResult ErroExcluir()
        {
            return View();

        }
    }
}