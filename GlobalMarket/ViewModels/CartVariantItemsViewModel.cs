using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GlobalMarket.ViewModels
{
    public class CartVariantItemsViewModel
    {
        public double SubTotal { get; set; }
        public double TotalDiscount { get; set; }
        public IEnumerable<CartVarientViewModel> CartItems { get; set; }
    }
}