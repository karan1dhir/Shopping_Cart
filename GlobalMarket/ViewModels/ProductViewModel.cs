using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GlobalMarket.ViewModels
{
    public class ProductViewModel
    {
        public Guid ID { get; set; }
        public IEnumerable<VariantViewModel> Variants { get; set; }
        public CategoryProductViewModel Category { get; set; }
        public VariantViewModel variantDisplay { get; set; }
        public string Name { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public int OrderLimit { get; set; }
        public int TotalVariantsSold { get; set; }
    }
}