using AutoMapper;
using DataAccess.Exceptions;
using Entities;
using System.Data.Entity;
using Shared.DTO.Category;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Shared.DTO.Product;

namespace DataAccess.DBObjects
{

    public class CategoryDatabaseContext
    {
        ShoppingCartEntities shoppingCartEntities;
        public CategoryDatabaseContext()
        {
            shoppingCartEntities = new ShoppingCartEntities();
        }

        public CategoriesDTO GetCategory()
        {
            CategoriesDTO categoriesDTO = new CategoriesDTO();
            IEnumerable<string> categories = shoppingCartEntities.Categories.ToList().Select(p => p.Name);
            categoriesDTO.categories = categories;
            return categoriesDTO;
        }
    }
}