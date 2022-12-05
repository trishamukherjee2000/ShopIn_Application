using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ShopInDBFirstDataAccessLayer.Models;

namespace ShopInDBFirstDataAccessLayer
{
    public class ShopInRepository
    {
        ShopInDbContext context;
        public ShopInRepository()
        {
            context = new ShopInDbContext();

        }

        public List<Category> GetAllCategories()
        {
            List<Category> categoriesList = (from category in context.Categories
                                             orderby category.CategoryId
                                             select category).ToList();
            return categoriesList;
        }

        public List<Product> GetAllProducts()
        {
            List<Product> productList = null;
            try
            {
                productList = context.Products.OrderByDescending(p => p.Rating).ToList();
            }
            catch (Exception ex)
            {
                productList = null;
            }
            return productList;
        }
        public Product GetProductDetailsById(String PId)
        {
            Product productList = null;
            try
            {
                productList = context.Products.Find(PId);
            }
            catch (Exception ex)
            {
                productList = null;
            }
            return productList;
        }
        public List<Product> GetProductsByCategoryId(int CId)
        {
            List<Product> productList = null;
            try
            {
                productList = context.Products.Where(p => p.CategoryId == CId).ToList();
            }
            catch (Exception ex)
            {
                productList = null;
            }
            return productList;
        }
        public List<Order> GetAllOrdersByUserId(int UId)
        {
            List<Order> orderList = null;
            try
            {
                orderList = context.Orders.Where(o => o.UserId == UId).ToList();
            }
            catch (Exception ex)
            {
                orderList = null;
            }
            return orderList;
        }



        public bool AddCategory(string categoryName)
        {
            bool status = false;
            Category category = new Category();
            category.CategoryName = categoryName;
            try
            {
                context.Categories.Add(category);
                //context.Add<Categories>(category);
                context.SaveChanges();
                status = true;
            }
            catch (Exception ex)
            {
                status = false;
            }
            return status;
        }

        public bool AddProducts(Product products)
        {
            bool status = false;
            try
            {
                products.ProductId = ShopInDbContext.GenerateNewProductId();

                context.Products.Add(products);
                context.SaveChanges();
                status = true;
            }
            catch (Exception ex)
            {
                status = false;
            }
            return status;
        }

        public bool AddUsers(User users)
        {
            bool status = false;
            User find = null;
            try
            {
                find = context.Users.Where(p => p.UserEmail.Equals(users.UserEmail)).FirstOrDefault();
                if (find != null)
                {
                    status = false;
                }
                else
                {
                    context.Users.Add(users);
                    context.SaveChanges();
                    status = true;
                }

            }
            catch (Exception ex)
            {
                status = false;
            }
            return status;
        }

        public int CheckUser(string Email, string Password)
        {
            int status = 0;
            User ob = null;
            try
            {
                ob = context.Users.Where(p => p.UserEmail.Equals(Email) && p.UserPassword.Equals(Password)).FirstOrDefault();
                if (ob == null)
                    status = 0;
                else
                    status = ob.UserId;
            }
            catch (Exception ex)
            {
                status = 0;
            }
            return status;
        }

        public bool AddOrder(Order ob)
        {
            bool status = false;
            Order find = null;
            try
            {
                find = context.Orders.Where(p => p.UserId == ob.UserId && p.ProductId.Equals(ob.ProductId)).FirstOrDefault();
                if(find!=null)
                {
                    find.NoOfItems = find.NoOfItems + 1;
                    context.SaveChanges();
                    status = true;
                }
                else
                {
                    context.Orders.Add(ob);
                    context.SaveChanges();
                    status = true;
                }
                
            }
            catch (Exception ex)
            {

                status = false;
            }
            return status;
        }

        public List<Order> GetOrderByUser(int UserId)
        {
            List < Order > obj= new List<Order>();
            try
            {
                obj = context.Orders.Where(p => p.UserId == UserId).ToList();
                
            }
            catch (Exception ex)
            {
                obj = null;
            }
            return obj;


        }

        public String GetCatNameByCatId(int CId)
        {
            Category catObj = null;
            String catName = "";
            try
            {
                catObj = context.Categories.Where(p => p.CategoryId == CId).FirstOrDefault();
                if (catObj != null)
                {
                    catName = catObj.CategoryName;
                }
            }
            catch (Exception ex)
            {
                catObj = null;
            }
            return catName;
        }
    }
}
