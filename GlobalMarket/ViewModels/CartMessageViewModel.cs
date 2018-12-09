using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GlobalMarket.ViewModels
{
    public class CartMessageViewModel
    {
        public string SuccessMessage { get; set; }
        public List<string> ErrorMessages { get; set; }
        public CartMessageViewModel()
        {
            ErrorMessages = new List<string>();
        }
    }
}