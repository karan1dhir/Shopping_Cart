using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GlobalMarket.ViewModels
{
    public class VariantViewModel
    {
       public Guid ID { get; set; }
       public string Name { get; set; }
       public ProductViewModel Product { get; set; }

    }
}