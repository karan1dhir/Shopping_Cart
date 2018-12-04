using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GlobalMarket.ViewModels
{
    public class VariantViewModel
    {
        public Guid ID { get; set; }
        public float ListingPrice { get; set; }
        public float Discount { get; set; }
        public int QuantitySold { get; set; }
        public int Inventory { get; set; }
        public ProductViewModel Product { get; set; }
    }
}