using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace GlobalMarket.ViewModels
{
    public class AddressViewModel
    {
        [Required]
        [Display(Name = "AddressLine 1")]
        public string AddressLine1 { get; set; }

        [Required]
        [Display(Name = "AddressLine 2")]
        public string AddressLine2 { get; set; }

        [Required]
        public int Pin { get; set; }

        [Required]
        public string City { get; set; }

        [Required]
        public string State { get; set; }

        [Required]
        public string Country { get; set; }
    }
}