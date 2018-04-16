using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FirstChallenge.Models;  //must have this to access model and data contained within

namespace FirstChallenge.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()  //executed on call from routes.MapRoute in RouteConfig.cs
        {
            List<ComicBook> ComicsList = ComicBookManager.GetComicBooks();  //pull a list of comics from data model
                                                                            //(ComicBook.cs)
            return View(ComicsList);    //pass list of comics from data model to "Index" view (Index.cshtml)
        }

        public ActionResult Detail(int id)  //executed on call from routes.MapRoute in RouteConfig.cs
        {                                   // takes one param., the ComicBookId to return details on correct book
            List<ComicBook> ComicsList = ComicBookManager.GetComicBooks(); //pull a list of comics from data model
            var comic = ComicsList.FirstOrDefault(p => p.ComicBookId == id);  //filter for matching id with input param.
            return View(comic);  //pass ComicBook object to view for display, using "Detail" view (Detail.cshtml)
        }
    }
}