using HospedagemOnline.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HospedagemOnline.Controllers
{
    public class EstabelecimentoController : Controller
    {
        private HospedagemBDEntities db = new HospedagemBDEntities();

        public ActionResult Index()
        {
            var estabelecimento = db.Estabelecimento.ToList();
            return View(estabelecimento);
        }

        public ActionResult Inserir()
        {
            return View();

        }
        [HttpPost]
        public ActionResult Inserir(Estabelecimento usuario)
        {
            if (ModelState.IsValid)
            {
                db.Estabelecimento.Add(usuario);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(usuario);
        }

        public ActionResult Alterar(long id)
        {
            Estabelecimento usuario = db.Estabelecimento.Find(id);

            return View(usuario);

        }
        [HttpPost]
        public ActionResult Alterar(Estabelecimento usuario)
        {
            if (ModelState.IsValid)
            {
                db.Entry(usuario).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(usuario);

        }

        public ActionResult Excluir(long id)
        {
            Estabelecimento usuario = db.Estabelecimento.Find(id);

            return View(usuario);

        }
        [HttpPost, ActionName("Excluir")]
        public ActionResult EfetivaExcluisao(long id)
        {
            try
            {
                Estabelecimento usuario = db.Estabelecimento.Find(id);
                db.Estabelecimento.Remove(usuario);
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