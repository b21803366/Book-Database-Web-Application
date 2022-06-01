use BOOKSTORE;

call insert_category("Education");
call insert_category("Novel");
call insert_category("Literature");
call insert_category("Science");
call insert_category("History");

call insert_subcategory(1, "High School");
call insert_subcategory(1, "Self Development");
call insert_subcategory(2, "Horror");
call insert_subcategory(2, "Adventure");
call insert_subcategory(3, "English Literary");
call insert_subcategory(3, "Russian Literary");
call insert_subcategory(4, "Engineering");
call insert_subcategory(4, "Astronomy");
call insert_subcategory(4, "Biology");
call insert_subcategory(5, "World History");
call insert_subcategory(5, "Ottoman history");

call insert_book(5, 'H.P. Lovecraft', 1928, 'The Call of Cthulhu', 1291239123, 'https://i.dr.com.tr/cache/136x136-0/originals/0001796506001-1.jpg','Atlas', 'Fascinating story !!', 2,23);
call insert_book(5, 'Dan Brown', 2001, 'Lost Symbol', 1291264743, 'https://i.dr.com.tr/cache/154x170-0/originals/0000000317832-1.jpg','Gold', 'Amazing story !!', 5,29.99);
call insert_book(5, 'Dan Brown', 2003, 'Angels and Deamons', 1671264743, 'https://i.dr.com.tr/cache/154x170-0/originals/0000000151552-1.jpg','Gold', 'Interesting story !!', 10,24.50);
call insert_book(4, 'Stephan King', 1998, 'It', 9871264743, 'https://i.dr.com.tr/cache/154x170-0/originals/0000000706011-1.jpg','Gold', 'Horrible story !!', 3,19);
call insert_book(4, 'Alein Kentigerna', 2015, 'Hallucinations', 1671264743, 'https://i.dr.com.tr/cache/154x170-0/originals/0000000434749-1.jpg','Panama', 'Good story !!', 7,24);
call insert_book(2, 'Kolektif', 2019, 'Geometri 0', 1291999123, 'https://i.dr.com.tr/cache/154x170-0/originals/0001779881001-1.jpg','Karekok', 'Learn quickly !!', 11,23);
call insert_book(2, 'Orhan Kutay', 2019, 'TYT Fizik Deneme', 1273294123, 'https://i.dr.com.tr/cache/154x170-0/originals/0001863577001-1.jpg','Delta', 'To Win !!', 6,26.87);
call insert_book(3, 'Eckhart Tolle', 2018, 'The Power of Now', 8888294123, 'https://i.dr.com.tr/cache/136x136-0/originals/0001818159001-1.jpg','Hodder', 'Improve yourself !!', 9,35);
call insert_book(3, 'Sarah Harvey', 2019, 'Kaizen', 7777294123, 'https://i.dr.com.tr/cache/600x600-0/originals/0001844661001-1.jpg','Bluebird', 'For japons !!', 8,10);
call insert_book(6, 'George Orwell', 1990, '1984', 1291966773, 'https://i.dr.com.tr/cache/136x136-0/originals/0000000064038-1.jpg','Can', ' Distopik', 1,23);
call insert_book(6, 'George Orwell', 1985, 'Animal Farm', 12732900775, 'https://i.dr.com.tr/cache/136x136-0/originals/0000000105409-1.jpg','Can', 'Utopik', 17,26.87);
call insert_book(7, 'Tolstoy', 2006, 'What Men Live By', 124545456773, 'https://i.dr.com.tr/cache/136x136-0/originals/0001870178001-1.jpg','Platanus', ' masterpiece', 3,23);
call insert_book(7, 'Dostoyevski', 2007, 'Crime and Punishment', 1289898900775, 'https://i.dr.com.tr/cache/136x136-0/originals/0001869884001-1.jpg','Platanus', 'masterpiece', 5,26.87);
call insert_book(8, 'Kolektif', 2009, 'Studies In Engineering', 124919256773, 'https://i.dr.com.tr/cache/136x136-0/originals/0001791602001-1.jpg','Night', 'information for studies', 25,238);
call insert_book(8, 'Kolektif', 2010, 'Computer Engineering', 12898810063, 'https://i.dr.com.tr/cache/136x136-0/originals/0001694291001-1.jpg','DaisyScience', 'easy to learn', 71,265.87);
call insert_book(10, 'Eric Simon', 2000, 'Biology The Core', 66666656773, 'https://i.dr.com.tr/cache/136x136-0/originals/0000000639975-1.jpg','Night', 'information about cell', 2,250);
call insert_book(11, 'Abidin Temizer', 1999, 'Glimpses Of Balkans', 12495555444, 'https://i.dr.com.tr/cache/136x136-0/originals/0001700399001-1.jpg','Night', 'balkans culturucal history', 6,23);
call insert_book(11, 'Dorling Kinder', 1987, 'Who Chanched History ', 2255337788, 'https://i.dr.com.tr/cache/136x136-0/originals/0001837504001-1.jpg','DK Publish', 'amazing scientists', 19,26);
call insert_book(12, 'Ilber Ortayli', 1950, 'Ottoman Studies', 9988776655, 'https://i.dr.com.tr/cache/136x136-0/originals/0001807565001-1.jpg','Kronik Kitap', 'ottomon story', 4,23);
call insert_book(12, 'Halil Inancik', 1955, 'The Ottoman Empire', 7744990033, 'https://i.dr.com.tr/cache/136x136-0/originals/0001741995001-1.jpg','Kronik Kitap', 'ottoman story', 3,26);

call insert_customer('Ahmet Tas', '5444343', 'ahmet@xyz.com', '3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'Cok Evler Sitesi Eryaman/Ankara');
call insert_customer('Mehmet Tas', '5444343', 'mehmet@xyz.com', '3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'Yok Evler Sitesi Eryaman/Ankara');
call insert_customer('Yusuf Tas', '5444343', 'yusuf@xyz.com', '3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'Cok Evler Sitesi Eryaman/Ankara');
call insert_customer('Recep Tas', '5444343', 'recep@xyz.com', '3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'Hep Evler Sitesi Eryaman/Ankara');
call insert_customer('Deniz Tas', '5444343', 'deniz@xyz.com', '3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'Guzel Evler Sitesi Eryaman/Ankara');

call insert_page_admin('3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'admin@admin');

call insert_mail(1, 1,'hello','hello dear');

call insert_book_comment(1, 1, 3,'this book is sucks but i like it');
call insert_book_comment(2, 1, 3,'this book is sucks but i like it');
call insert_book_comment(3, 1, 3,'this book is sucks but i like it');
call insert_book_comment(4, 1, 3,'this book is sucks but i like it');
call insert_book_comment(5, 1, 3,'this book is sucks but i like it');
call insert_book_comment(6, 1, 3,'this book is sucks but i like it');
 
call insert_campaign(1, 50,"Horror Books 50% OFF !!","https://i.pinimg.com/originals/5c/10/30/5c103001e28430a2f7f18bc3f4d2dde5.jpg");
call insert_campaign(2, 30,"Literature Books %30 OFF for weekend!","https://i.pinimg.com/originals/56/72/08/5672085fef1d265902089910705d5cae.jpg"); 
call insert_campaign(3, 20,"Read this books with %20 OFF!!","https://yazname.com/wp-content/uploads/2016/11/Wonderful-Book-Wallpaper.jpg"); 
call insert_campaign(4, 20,"Extreme campaign on this books!","https://wallpaperaccess.com/full/124378.jpg"); 

call insert_courier_company("https://www.ups.com.tr/","03122835298","UPS",9.99);
call insert_courier_company("https://www.dhl.com.tr/tr/express.html","08502734563","DHL Express",8.75);

call insert_payment_service("Visa","1234123412341234");
call insert_payment_service("MasterCard","1234123412341234");

call insert_purchase_request(0); 
call insert_purchase_request(0);

call insert_cart(1, 1 ,3, 1);
call insert_cart(1, 1, 3, 1);
call insert_cart(1, 2, 3, 2);
call insert_cart(1, 2, 2, 2);
call insert_cart(2, 2, 3, 2);
call insert_cart(2, 2, 3, 2);
call insert_cart(2, 2, 4, 2);
call insert_cart(2, 2, 3, 2);

call insert_in_cargo(1);
call insert_in_cargo(2);
 