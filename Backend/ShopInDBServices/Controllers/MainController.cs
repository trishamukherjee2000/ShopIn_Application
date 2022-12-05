using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ShopInDBFirstDataAccessLayer;
using ShopInDBFirstDataAccessLayer.Models;

namespace ShopInDBServices.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class MainController : Controller
    {
        ShopInRepository repository;
        public MainController()
        {
            repository = new ShopInRepository();
        }

        [HttpGet]
        public JsonResult GetAllCategories()
        {
            List<Category> ob = null;
            try
            {
                ob = repository.GetAllCategories();

            }
            catch (Exception)
            {
                ob = null;
            }
            return Json(ob);
        }

        [HttpGet]
        public JsonResult GetAllProducts()
        {
            List<Product> ob = null;
            try
            {
                ob = repository.GetAllProducts();

            }
            catch (Exception)
            {
                ob = null;
            }
            return Json(ob); 
        }

        [HttpGet]
        public JsonResult GetProductDetailsById(String PId)
        {
            Product ob = null;
            try
            {
                ob = repository.GetProductDetailsById(PId);

            }
            catch (Exception)
            {
                ob = null;
            }
            return Json(ob);
        }

        [HttpGet]
        public JsonResult GetProductsByCategoryId(int CId)
        {
            List<Product> ob = null;
            try
            {
                ob = repository.GetProductsByCategoryId(CId);

            }
            catch (Exception)
            {
                ob = null;
            }
            return Json(ob);
        }

        [HttpGet]
        public JsonResult GetAllOrdersByUserId(int UId)
        {
            List<Order> ob = null;
            try
            {
                ob = repository.GetAllOrdersByUserId(UId);

            }
            catch (Exception)
            {
                ob = null;
            }
            return Json(ob);
        }

        [HttpGet]
        public JsonResult AddCategory(string categoryName)
        {
            bool status = false;

            try
            {
                status = repository.AddCategory(categoryName);
                
            }
            catch (Exception ex)
            {
                status = false;
            }
            return Json(status);
        }

        [HttpPost]
        public JsonResult AddProducts(Product products)
        {
            bool status = false;
            

            try
            {
                status = repository.AddProducts(products);
                
            }
            catch (Exception ex)
            {
                status = false;
            }
            return Json(status);
        }


        [HttpPost]
        public JsonResult AddUsers(User ob)
        {
            bool status = false;
            string message;

            User mainob = new User();
            mainob.UserName = ob.UserName;
            mainob.UserEmail = ob.UserEmail;
            mainob.UserContact = ob.UserContact;
            mainob.UserAddress = ob.UserAddress;
            mainob.UserPassword = ob.UserPassword;


            try
            {
                status = repository.AddUsers(mainob);

            }
            catch (Exception ex)
            {
                status = false;
            }
            return Json(status);
        }
        [HttpPost]
        public JsonResult AddOrders(Order ob)
        {
            Order mainob = new Order();
            mainob.UserId = Convert.ToInt32(ob.UserId);
            mainob.NoOfItems = ob.NoOfItems;
            mainob.ProductId = ob.ProductId;

            bool status = false;
            try
            {
                status = repository.AddOrder(mainob);
            }
            catch (Exception)
            {

                status = false;
            }
            return Json(status);
        }
        [HttpGet]
        public JsonResult CheckUser(string Email, string Password)
        {
            int ob = 0;
            try
            {
                ob = repository.CheckUser(Email,Password);

            }
            catch (Exception)
            {
                ob = 0;
            }
            return Json(ob);
        }

        [HttpGet]
        public JsonResult GetCatNameByCatId(int CId)
        {
            String ob = null;
            try
            {
                ob = repository.GetCatNameByCatId(CId);

            }
            catch (Exception)
            {
                ob = null;
            }
            return Json(ob);
        }
        [HttpGet]
        public JsonResult GetOrderByUser(String UserId)
        {
            List<Order> ob = null;
            if(UserId==null)
            {
                return Json(ob);
            }

            
            try
            {
                int uid = Convert.ToInt32(UserId);
                ob = repository.GetOrderByUser(uid);

            }
            catch (Exception)
            {
                ob = null;
            }
            return Json(ob);
        }


    }
}
