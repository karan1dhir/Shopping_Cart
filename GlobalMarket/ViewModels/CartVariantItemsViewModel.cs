using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GlobalMarket.ViewModels
{
    public class CartVariantItemsViewModel
    {
        public float SubTotal { get; set; }
        public IEnumerable<CartVarientViewModel> CartItems { get; set; }
    }
}