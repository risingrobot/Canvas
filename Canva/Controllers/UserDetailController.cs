using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Canva.Controllers
{
    public class UserDetailController : Controller
    {
        // GET: UserDetail
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetUserDetails()
        {
            //var model2 = _db.People;

            return View();


        }
    }
}