using Business.Exceptions;
using DataAccess.DBObjects;
using Shared.DTO.Category;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.BusinessObjects
{
    public class CategoryBusinessContext
    {
        CategoryDatabaseContext categoryDatabaseContext;
        public CategoryBusinessContext()
        {
            categoryDatabaseContext = new CategoryDatabaseContext();
        }
        public CategoriesDTO GetCategories()
        {
            CategoriesDTO categoriesDTO = categoryDatabaseContext.GetCategory();
            return categoriesDTO;
        }
    }
}
