using Canva.Models;
using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Canva.Controllers
{
    public class AccountController : Controller
    {
        //  public  DbEntities db = new DbEntities();
        // GET: Accounts
        private DbEntities _db = new DbEntities();



        [HttpPost]
        public ActionResult Login(MainPageModel model)
        {
            using (DbEntities db = new DbEntities())
            {
                var personObject = db.People
                    .Include("Role")
                    .Where(x => x.EmailAddress == model.loginModel.Email && x.Password == model.loginModel.Password).FirstOrDefault();
                if (personObject != null)
                {

                    Session.Add("userId", personObject.Id);
                    Session.Add("username", personObject.FullName);
                    if (personObject.FK_Role == Convert.ToInt64(ERole.ADMIN))
                    {
                        Session.Add("Admin", true);
                        return RedirectToAction("Index", "Admin");
                    }
                    else
                    {
                        Session.Add("Admin", false);
                        return RedirectToAction("Index", "Home");
                    }
                }
                return RedirectToAction("Register");
            }
        }
        public ActionResult Register(int? Id)
        {
            Session.Clear();
            Session.Abandon();
            MainPageModel model = new MainPageModel();
            using (DbEntities db = new DbEntities())
            {
                var personObject = db.People.Where(x => x.Id == Id.Value).FirstOrDefault();
                if (personObject != null)
                {
                    model.registerModel = new RegisterModel()
                    {
                        EmailAddress = personObject.EmailAddress,
                        FullName = personObject.FullName,
                        Id = personObject.Id,
                        ProfessionId = personObject.ProfessionId.GetValueOrDefault()
                    };


                }
                ViewBag.professionDropdown = ModelHelper.ProfessionDropdown(db.Professions.ToList(), personObject != null ? personObject.ProfessionId.Value : 0);
                return View(model);
            }
        }
        [HttpPost]
        public ActionResult Register(MainPageModel model)
        {
            using (DbEntities db = new DbEntities())
            {
                bool isNewRecord = model.registerModel.Id > 0 ? false : true;
                if (ModelState.IsValid)
                {
                    if (isNewRecord)
                    {
                        Person personObject = new Person()
                        {
                            FullName = model.registerModel.FullName,
                            EmailAddress = model.registerModel.EmailAddress,
                            Password = model.registerModel.Password,
                            ProfessionId = model.registerModel.ProfessionId,
                            CreatedOn = DateTime.Now,
                            UpdatedOn = DateTime.Now,
                            IsDeleted = false
                        };
                        db.Entry(personObject).State = System.Data.Entity.EntityState.Added;
                        db.SaveChanges();
                    }
                    else
                    {
                        Person personObject = db.People.Where(x => x.Id == model.registerModel.Id).FirstOrDefault();
                        if (personObject != null)
                        {
                            personObject.FullName = model.registerModel.FullName;
                            personObject.EmailAddress = model.registerModel.EmailAddress;
                            personObject.Password = model.registerModel.Password;
                            personObject.ProfessionId = model.registerModel.ProfessionId;
                            personObject.UpdatedOn = DateTime.Now;
                            db.Entry(personObject).State = System.Data.Entity.EntityState.Modified;
                            db.SaveChanges();
                        }
                    }
                }
                return RedirectToAction("Register");
            }
        }

        public JsonResult ForgetPassword(string Email)
        {
            using (DbEntities db = new DbEntities())
            {
                bool result = false;
                try
                {

                    var obj = db.People.Where(x => x.EmailAddress == Email && x.IsDeleted == false).FirstOrDefault();
                    if (obj != null)
                    {
                        ModelHelper.SendEmail(obj.EmailAddress, "Forget Password", "Your password is: " + obj.Password);
                        result = true;
                    }
                    else
                    {
                        result = false;
                    }
                    return Json(result, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {

                    return Json(result, JsonRequestBehavior.AllowGet);
                }
            }
        }


      



        protected override void Dispose(bool disposing)
        {
            using (DbEntities db = new DbEntities())
            {
                base.Dispose(disposing);
                db.Dispose();
                _db.Dispose();
            }
        }
    }
}