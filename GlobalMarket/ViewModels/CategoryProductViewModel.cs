using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GlobalMarket.ViewModels
{
    public class CategoryProductViewModel
    {
        public Guid ID { get; set; }
        public int ProductsSold { get; set; }
        public string Name { get; set; }
        public IEnumerable<ProductViewModel> Products { get; set; }
    }
}