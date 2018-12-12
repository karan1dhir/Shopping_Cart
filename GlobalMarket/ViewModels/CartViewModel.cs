using GlobalMarket.CustomAttributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GlobalMarket.ViewModels
{
    public class CartViewModel
    {
        [ValidateQuantity]
        public int Quantity { get; set; }
        public System.Guid UserID { get; set; }
        public System.Guid VariantID { get; set; }
        public System.Guid ProductID { get; set; }
        public int OrderLimit { get; set; }
        public int Inventory { get; set; }
    }
}