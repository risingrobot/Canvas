using Canva.Models;
using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Canva.Controllers
{
    public class HomeController : Controller
    {
        private DbEntities db = new DbEntities();
        public ActionResult Index()
        {
            if (Session["userId"]==null)
            {
                return RedirectToAction("register", "Account");
            }
            var categories = db.Categories.Where(x=>x.IsDeleted==false).ToList();
            ViewBag.Categories = categories;
            return View();
        }


        public ActionResult Design(int Id)
        {
            if (Session["userId"] == null)
            {
                return RedirectToAction("register", "Account");
            }
            var design = db.Designs.Where(x => x.CategoryId == Id).ToList();
            var categories = db.Categories.Where(x => x.IsDeleted == false).ToList();
            ViewBag.Categories = categories;
            return View(design);
        }


        public ActionResult CreateDesign(int Id)
        {
            if (Session["userId"] == null)
            {
                return RedirectToAction("register", "Account");
            }
            Design model = new DataModel.Design();
            using (DbEntities db= new DbEntities())
            {
                model = db.Designs.Where(x => x.Id == Id).FirstOrDefault();
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult SaveDesign(int designId ,string title, string description)
        {
            UserDesign userDesignObj = new UserDesign();
            if (ModelState.IsValid)
            {
                using (DbEntities db = new DbEntities())
                {
                    userDesignObj.Heading = title;
                    userDesignObj.Description = description;
                    userDesignObj.PersonId =Convert.ToInt32(Session["userId"]);
                    userDesignObj.CreatedOn = DateTime.Now;
                    userDesignObj.DesignId = designId;
                    userDesignObj.IsDeleted = false;
                    userDesignObj.UpdatedOn = DateTime.Now;
                    db.Entry(userDesignObj).State = System.Data.Entity.EntityState.Added;
                    db.SaveChanges();
                }
            }
            else
            {
                RedirectToAction("Index");
            }
            //return RedirectToAction("MyDesign", new { Id =userDesignObj.Id});
            return RedirectToAction("New","Checkouts",new { designId = userDesignObj.Id});
        }

        public ActionResult MyDesign(int Id)
        {
            if (Session["userId"] == null)
            {
                return RedirectToAction("register", "Account");
            }
            MyDesignModel model = new MyDesignModel();
            UserDesign obj = new UserDesign();
            using (DbEntities db= new DbEntities())
            {
                obj = db.UserDesigns
                    .Include("Design")
                    .Include("Person")
                    .Where(x => x.Id == Id).FirstOrDefault();
                model.html = obj.Design.Html;
                model.title = obj.Heading;
                model.description = obj.Description;
            }
            return View(model);
        }

        public ActionResult AllDesign()
        {
            if (Session["userId"] == null)
            {
                return RedirectToAction("register", "Account");
            }
            int userId =Convert.ToInt32(Session["userId"]);
            Person model = new Person();

            using (DbEntities db= new DbEntities())
            {
                model = db.People
                    .Include("UserDesigns")
                    .Include("UserDesigns.Design")
                    .Where(x => x.Id == userId).FirstOrDefault();
            }
            return View(model);
        }


        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
            db.Dispose();
        }
    }
}