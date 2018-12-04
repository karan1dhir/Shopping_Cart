using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GlobalMarket.ViewModels
{
    public class AnalyticsViewModel
    {
       public IEnumerable<CategoryProductViewModel> categoryProducts { get; set; }
    }
}