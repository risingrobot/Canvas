using Canva.Models;
using DataModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Canva.Controllers
{
    public class AdminController : Controller
    {
        private DbEntities _db = new DbEntities();
        // GET: Admin
        public ActionResult Index()
        {
            ViewBag.Users = _db.People.Where(x => x.IsDeleted == false).ToList().Count;
            ViewBag.Design = _db.Designs.Where(x => x.IsDeleted == false).ToList().Count;
            ViewBag.Subscribe = _db.Subscribes.Where(x => x.IsDeleted == false).ToList().Count;
            ViewBag.Categories = _db.Categories.Where(x => x.IsDeleted == false).ToList().Count;
            return View();
        }

        public ActionResult Categories()
        {
            var model= _db.Categories.Where(x=>x.IsDeleted==false).Select(x => new CategoryModel()
            {
                Id = x.Id,
                Name = x.Name
            }).ToList();
           
            return View(model);
        }

        public ActionResult EditCategory(long? Id)
        {
            try
            {
                CategoryModel model;
                if (Id!=null)
                {
                    model = _db.Categories.Where(x => x.Id == Id && x.IsDeleted == false).Select(x => new CategoryModel()
                    {
                        Id = x.Id,
                        Name = x.Name
                    }).FirstOrDefault();
                }
                else
                {
                    model = new CategoryModel();
                }

                return View(model);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [HttpPost]
        public ActionResult EditCategory(CategoryModel model)
        {
            try
            {
                if (model.Id>0)
                {
                    var obj = _db.Categories.Where(x => x.Id == model.Id && x.IsDeleted == false).FirstOrDefault();
                    if (obj != null)
                    {
                        obj.Name = model.Name;
                        _db.Entry(obj).State = System.Data.Entity.EntityState.Modified;
                        _db.SaveChanges();
                    }
                }
                else
                {
                    var newObj = new Category()
                    {
                        Name = model.Name,
                        IsDeleted = false,
                        CreatedOn = DateTime.UtcNow
                    };
                    _db.Entry(newObj).State = System.Data.Entity.EntityState.Added;
                    _db.SaveChanges();
                }
                
                return RedirectToAction("Categories", "Admin");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ActionResult DeleteCategory(long Id)
        {
            try
            {
                using (var trans= _db.Database.BeginTransaction())
                {
                    try
                    {
                        var objCategory = _db.Categories.Where(x => x.Id == Id && x.IsDeleted == false).FirstOrDefault();
                        if (objCategory != null)
                        {
                            objCategory.IsDeleted = true;
                            _db.Entry(objCategory).State = System.Data.Entity.EntityState.Modified;
                            _db.SaveChanges();
                        }
                        var objDesign = _db.UserDesigns.Where(x => x.Design.CategoryId == Id).ToList();
                        if (objDesign != null)
                        {
                            foreach (var item in objDesign)
                            {
                                item.IsDeleted = true;
                                _db.Entry(item).State = System.Data.Entity.EntityState.Modified;
                                _db.SaveChanges();
                            }
                        }
                        var design = _db.Designs.Where(x => x.CategoryId == Id).ToList();
                        if (design != null)
                        {
                            foreach (var item in design)
                            {
                                item.IsDeleted = true;
                                _db.Entry(item).State = System.Data.Entity.EntityState.Modified;
                                _db.SaveChanges();
                            }
                        }
                        var DesignGalleries = _db.DesignGalleries.Where(x => x.CategoryId == Id && x.IsDeleted == false).ToList();
                        foreach (var item in DesignGalleries)
                        {
                            item.IsDeleted = true;
                            _db.Entry(item).State = System.Data.Entity.EntityState.Modified;
                            _db.SaveChanges();
                        }

                        trans.Commit();
                        return RedirectToAction("Categories");
                    }
                    catch (Exception ex)
                    {
                        trans.Rollback();
                        throw ex;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public ActionResult Design()
        {
            try
            {
                var model= _db.Designs.Where(x => x.IsDeleted == false).Select(x => new DesignModel() {
                     Id= x.Id,
                     Url= x.ImageUrl,
                     Category= x.Category.Name
                }).ToList();

                return View(model);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [HttpGet]

        public ActionResult GetUserDetails()
        {
            try
            {
                var model2 = _db.People.Where(x => x.FullName != null);
                return View("/Views/Admin/UserDetails.cshtml",model2);
            }
            catch (Exception ex)
            { throw ex; }


        }

        public ActionResult EditDesign(long? Id)
        {
            try
            {
                DesignModel model;
                if (Id!=null)
                {
                    model = _db.Designs.Where(x => x.Id == Id && x.IsDeleted == false).Select(x => new DesignModel()
                    {

                        Id = x.Id,
                        Fk_Category = x.CategoryId,
                        Html = x.Html,
                        Url = x.ImageUrl
                    }).FirstOrDefault();
                    model.Categories = _db.Categories.Where(x => x.IsDeleted == false).Select(x => new CategoryModel()
                    {
                        Id= x.Id,
                        Name= x.Name
                    }).ToList();
                }
                else
                {
                    model = new DesignModel();
                    model.Categories = _db.Categories.Where(x => x.IsDeleted == false).Select(x => new CategoryModel()
                    {
                        Id = x.Id,
                        Name = x.Name
                    }).ToList();
                }
                return View(model);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult EditDesign(DesignModel model)
        {
            try
            {
                string image = model.Url;

                for (int i = 0; i < Request.Files.Count; i++)
                {
                    HttpPostedFileBase file = Request.Files[i];
                    if (file.ContentLength>0)
                    {
                        string fileName = Guid.NewGuid() + "." + file.FileName.Split('.')[1];
                        string path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory + "screenshots\\", fileName);
                        file.SaveAs(path);
                        image = "/screenshots/" + fileName;
                    }
                }
                if (model.Id>0)
                {
                    var obj= _db.Designs.Where(x => x.Id == model.Id && x.IsDeleted == false).FirstOrDefault();
                    obj.Html = model.Html;
                    obj.CategoryId = model.Fk_Category;
                    obj.ImageUrl = image;
                    obj.UpdatedOn = DateTime.UtcNow;
                    _db.Entry(obj).State = System.Data.Entity.EntityState.Modified;
                    _db.SaveChanges();
                }
                else
                {
                    var obj= new Design()
                    {
                        CategoryId = model.Fk_Category,
                        Html = model.Html,
                        ImageUrl = image,
                        CreatedOn = DateTime.UtcNow,
                        IsDeleted = false
                    };
                    _db.Entry(obj).State = System.Data.Entity.EntityState.Added;
                    _db.SaveChanges();
                }
                return RedirectToAction("Design");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ActionResult DeleteDesign(long Id)
        {
            using (var trans = _db.Database.BeginTransaction())
            {
                try
                {
                    var userDesign= _db.UserDesigns.Where(x => x.DesignId == Id && x.IsDeleted==false).ToList();
                    foreach (var item in userDesign)
                    {
                        item.IsDeleted = true;
                        _db.Entry(item).State = System.Data.Entity.EntityState.Modified;
                        _db.SaveChanges();
                    }
                    var design = _db.Designs.Where(x => x.Id == Id && x.IsDeleted == false).FirstOrDefault();
                    if (design!=null)
                    {
                        design.IsDeleted = true;
                        _db.Entry(design).State = System.Data.Entity.EntityState.Modified;
                        _db.SaveChanges(); 
                    }
                    trans.Commit();
                    return RedirectToAction("Design");
                }
                catch (Exception ex)
                {
                    trans.Rollback();
                    throw ex;
                } 
            }
        }


        public ActionResult Advertisement()
        {
            return View();
        }

        public ActionResult Subscribe()
        {
            try
            {
                var model= _db.Subscribes.Where(x => x.IsDeleted == false).Select(x=>new SubscribeModel() {
                    Id= x.Id,
                    Email= x.Email
                }).ToList();
                return View(model);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public ActionResult ProfileSetting(int Id)
        {
            try
            {
                var model=_db.People.Where(x => x.Id == Id && x.IsDeleted == false).Select(x => new ProfileModel() {
                    Id= x.Id,
                    Password= x.Password,
                    Email= x.EmailAddress,
                    FullName= x.FullName
                }).FirstOrDefault();

                return View(model);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        [HttpPost]
        public ActionResult ProfileSetting(ProfileModel model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var obj = _db.People.Where(x => x.Id == model.Id && x.IsDeleted==false).FirstOrDefault();
                    if (obj!=null)
                    {
                        obj.FullName = model.FullName;
                        obj.EmailAddress = model.Email;
                        obj.Password = model.Password;
                        _db.Entry(obj).State = System.Data.Entity.EntityState.Modified;
                        _db.SaveChanges();
                        return RedirectToAction("ProfileSetting", new { Id = obj.Id });
                    }
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }



        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
            _db.Dispose();
        }
    }
}