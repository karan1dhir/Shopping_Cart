using Business.BusinessObjects;
using Shared.DTO.Analytics;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GlobalMarket.Controllers
{
    public class HomeController : Controller
    {
        public void Index()

        {
            AnalyticsDTO analyticsDTO = new AnalyticsDTO();
            ProductBusinessContext productBusinessContext = new ProductBusinessContext();
            analyticsDTO = productBusinessContext.GetTopProductsByCart();
            Console.WriteLine("abc");
        }
    }
}