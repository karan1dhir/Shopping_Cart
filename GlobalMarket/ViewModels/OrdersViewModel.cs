﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GlobalMarket.ViewModels
{
    public class OrdersViewModel
    {
        public IEnumerable<OrderViewModel> Orders { get; set; }
    }
}