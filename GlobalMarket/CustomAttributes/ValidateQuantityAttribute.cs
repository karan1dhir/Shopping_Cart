using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Reflection;
using System.Web;

namespace GlobalMarket.CustomAttributes
{
    public class ValidateQuantityAttribute: ValidationAttribute
    {
        protected override ValidationResult IsValid(object OrderQuantity, ValidationContext validationContext)
        {
       
            object instance = validationContext.ObjectInstance;
            Type type = instance.GetType();
            PropertyInfo OrderLimit = type.GetProperty("OrderLimit");
            PropertyInfo Inventory = type.GetProperty("Inventory");
         
            int OrderLimitV = (int)OrderLimit.GetValue(instance);
            int InventoryV = (int)Inventory.GetValue(instance);

            int OrderLimitValue = OrderLimitV;
            int InventoryValue = InventoryV;

            int OrderQuantityValue = (int)OrderQuantity;

            if (OrderQuantityValue > OrderLimitValue)
            {
                return new ValidationResult($"OrderQuantity is limited to {OrderLimitValue}");
            }

            if (OrderQuantityValue > InventoryValue)
            {
                return new ValidationResult("Sorry! Not enough Products in the inventory");
            }
            return ValidationResult.Success;
        }
    }
}