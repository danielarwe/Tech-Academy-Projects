using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace FirstChallenge
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(    //determines correct controller to turn execution over to, based on incoming URL
                name: "Default",   //name of route
                url: "{controller}/{action}/{id}",  //URL pattern; controller/action method to call/optional id
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );  //default controller is home controller; default action method "Index; 
        }
    }
}
