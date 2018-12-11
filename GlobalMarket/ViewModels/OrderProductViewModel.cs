using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GlobalMarket.ViewModels
{
    public class OrderProductViewModel
    {
        public IEnumerable<OrderPlacedVariantViewModel> OrderPlacedVariants { get; set; }
    }
}