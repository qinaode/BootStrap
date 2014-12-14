using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bootstrap.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public JsonResult getData()
        {
            List<dynamic> producteList = new List<dynamic>();
            for (int i = 0; i < 10; i++)
            {
                producteList.Add(new { id=i,name="产品名称"+i});
            }
            return Json(producteList);
        }
    }
}
