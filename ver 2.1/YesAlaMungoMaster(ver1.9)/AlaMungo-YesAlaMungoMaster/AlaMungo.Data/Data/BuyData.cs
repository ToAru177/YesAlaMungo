using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;

namespace AlaMungo.Data
{
    public class BuyData : EntityData<Buy>
    {

        public List<Buy> Search(string cusId,
           string title, DateTime? fromDate, DateTime? ToDate)
        {
            using (YesAlaMungoEntities context = new YesAlaMungoEntities())
            {


                /*
                 * 구매버튼을 눌렀을 경우
                 * 구매 동시에                *
                 */
                //var query = from x in context.Buys
                //    where x.UsedBooks
                //    select x;

                //var productsInCategory = db.Categorys
                //    .Where(c => c.CategoryId == categoryId)
                //    .SelectMany(c => c.Products);


                //var products = (from p in db.Product_Category
                //    join ProductTable pt on p.ID = pt.ProductID
                //join Category c on c.ID = P.CategoryID
                //select new
                //{
                //    p.ID,
                //    p.Name,
                //    p.Description,
                //    p.Price
                //}).ToList();



                //buy 에서 title 과 customerId만 빼오면되는데.

                
                var query = from x in context.Buys
                            join y in context.UsedBooks on x.BuyID equals y.UsedBookID
                            where x.Customer.LoginID.Equals(cusId)
                            select new
                            {
                                Buy = x,
                                BuyerLoginID = x.Customer.LoginID,
                                Title = y.MetaDataBook.Title,
                                BookWriter = y.MetaDataBook.Writer
                            };

                if (string.IsNullOrEmpty(title) == false)
                    query = query.Where(x => x.Title.Contains(title));

                if (fromDate != null && ToDate != null)
                    query = query.Where(x => x.Buy.OrderDate >=
                    fromDate && x.Buy.OrderDate <= ToDate);



                var list = query.ToList();

                foreach (var item in list)
                {
                    item.Buy.Title = item.Title;
                    item.Buy.BuyerLoginID = item.BuyerLoginID;
                    item.Buy.Writer = item.BookWriter;
                }



                //var list =context.UsedBooks.SelectMany (x => x.Buys);
                // list.Where(x=>x.)

                // var query = from VAR in  


                return list.ConvertAll(x => x.Buy);

            }
        }


        public List<Buy> Search2(string bookName, string cusID, DateTime? fromDate, DateTime? toDate)
        {
            using (YesAlaMungoEntities context = DbContextFactory.Create())
            {
                var query = from x in context.Buys
                            join y in context.UsedBooks on x.BuyID equals y.UsedBookID
                            //join z in context.Customers on x.BuyerID equals z.CustomerID
                            select new
                            {
                                Buy = x,
                                BookTitle = y.MetaDataBook.Title,
                                //BuyerLoginID = z.LoginID
                                BuyerLoginID = x.Customer.LoginID
                            };

                if (string.IsNullOrEmpty(bookName) == false)
                    query = query.Where(y => y.BookTitle.Contains(bookName));

                if (string.IsNullOrEmpty(cusID) == false)
                    query = query.Where(x => x.Buy.Customer.LoginID.Contains(cusID));


                if (fromDate.HasValue && toDate.HasValue)
                    query = query.Where(x => x.Buy.OrderDate >= fromDate && x.Buy.OrderDate <= toDate);

                var list = query.ToList();

                foreach (var item in list)
                {
                    item.Buy.Title = item.BookTitle;
                    item.Buy.BuyerLoginID = item.BuyerLoginID;
                }


                return list.ConvertAll(x => x.Buy);
            }
        }

        public List<Buy> Search3(string cusID, string bookName)
        {
            using (YesAlaMungoEntities context = DbContextFactory.Create())
            {
                var query = from x in context.Buys
                            join y in context.UsedBooks on x.BuyID equals y.UsedBookID
                            //join z in context.Customers on x.BuyerID equals z.CustomerID
                            select new
                            {
                                Buy = x,
                                UsedBook = y,
                                BuyerLoginID = x.Customer.LoginID,
                                BookTitle = y.MetaDataBook.Title,
                                BookWriter = y.MetaDataBook.Writer,
                                BookPublisher = y.MetaDataBook.Publisher,
                                BookQuality = y.Quality,
                                BookPricce = y.MetaDataBook.Price,
                                ImagePath = y.MetaDataBook.Image
                            };

                if (string.IsNullOrEmpty(bookName) == false)
                    query = query.Where(y => y.BookTitle.Contains(bookName));

                if (string.IsNullOrEmpty(cusID) == false)
                    query = query.Where(x => x.Buy.Customer.LoginID.Contains(cusID));

                query = query.Where(x => x.Buy.InvoiceState == 0);

                var list = query.ToList();

                foreach (var item in list)
                {
                    item.Buy.Title = item.BookTitle;
                    item.Buy.BuyerLoginID = item.BuyerLoginID;
                    item.Buy.Writer = item.BookWriter;
                    item.Buy.Pubilsher = item.BookPublisher;
                    item.Buy.Quality = item.BookQuality;
                    item.Buy.ImagePath = item.ImagePath;

                    item.Buy.Price = Discount.SalePrices(item.BookQuality, item.BookPricce);
                }


                return list.ConvertAll(x => x.Buy);
            }
        }


    }
}
