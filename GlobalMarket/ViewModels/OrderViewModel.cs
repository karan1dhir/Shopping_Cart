using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GlobalMarket.ViewModels
{
    public class OrderViewModel
    {
        public Guid ID { get; set; }
        public int StatusID { get; set; }
        public string Status { get; set; }
        public double TotalAmount { get; set; }
        public System.DateTime OrderDate { get; set; }
        public IEnumerable<OrderProductViewModel> OrderPlaceds { get; set; }
 }
}