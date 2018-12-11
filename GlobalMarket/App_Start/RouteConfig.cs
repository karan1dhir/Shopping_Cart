using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace GlobalMarket
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");


            routes.MapRoute(
                name: "Login",
                url: "Login",
                new { controller = "Login", action = "Login" }
            );

            routes.MapRoute(
                name: "ProductDetail",
                url: "Products/ProductDetail/{ProductID}",
                new { controller = "Products", action = "ProductDetail" }
            );

            routes.MapRoute(
             name: "Products",
             url: "Products/{CategoryName}",
             new { controller = "Products", action = "CategoryProducts" }
         );
            routes.MapRoute(
                name: "Register",
                url: "Register",
                defaults: new { controller = "Register", action = "Register" }
                );

            routes.MapRoute(
              name: "Orders",
              url: "MyOrders",
              new { controller = "User", action = "Orders" }
          );

            routes.MapRoute(
              name: "ProductSearch",
              url: "Product/SearchProducts",
              new { controller = "Product", action = "SearchProducts" }
          );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

        }
    }
}
