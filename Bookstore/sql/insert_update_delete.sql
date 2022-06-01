use BOOKSTORE;

DELIMITER $$
	-- --------------------------------Insert, Update, Delete Procedures--------------------------------------------
    
	-- Category
    create procedure insert_category(in p_title varchar(50))
		begin
			insert into category(title) values (p_title);
		end$$
	create procedure update_category(in p_id int, in p_title varchar(50))
		begin
			update category
			set	title = p_title where id = p_id;
		end$$
	create procedure delete_category(in p_id int)
		begin
			delete from category where id = p_id;
		end$$
        
	-- Subcategory
    create procedure insert_subcategory(in p_category_id int, in p_title varchar(50))
		begin
			insert into subcategory(category_id, title) values (p_category_id, p_title);
		end$$
	create procedure update_subcategory(in p_id int, in p_title varchar(50))
		begin
			update subcategory
			set	title = p_title where id = p_id;
		end$$
	create procedure delete_subcategory(in p_id int)
		begin
			delete from subcategory where id = p_id;
		end$$
	
    -- Book
    create procedure insert_book(in p_subcategory_id int, in p_author_name varchar(255), in p_publish_year int, in p_title varchar(255), 
								in p_isbn varchar(20), in p_image_url varchar(2048), in p_publisher_name varchar(255), 
                                in p_subjects varchar(600), in p_count int, in p_price float(10,2))
		begin
			insert into book(subcategory_id, author_name, publish_year, title, isbn, image_url, publisher_name, subjects, count, price) 
            values (p_subcategory_id, p_author_name, p_publish_year, p_title, p_isbn, p_image_url, p_publisher_name, p_subjects, 
					p_count, p_price);
		end$$
	create procedure update_book(in p_id int, in p_subcategory_id int, in p_author_name varchar(255), in p_publish_year int, 
								in p_title varchar(255), in p_isbn varchar(20), in p_image_url varchar(2048), 
                                in p_publisher_name varchar(255), in p_subjects varchar(600), in p_count int, in p_price float(10,2))
		begin
			update book
			set	subcategory_id = p_subcategory_id, 
            author_name = p_author_name,
            publish_year = p_publish_year,
			title = p_title,
			isbn = p_isbn,
			image_url = p_image_url,
			publisher_name = p_publisher_name,
			subjects = p_subjects,
			count = p_count,
            price = p_price
            where id = p_id;
		end$$
	create procedure delete_book(in p_id int)
		begin
			delete from book where id = p_id;
		end$$
	
    -- Campaign
	create procedure insert_campaign(in p_book_id int, in p_discount_percentage float, in p_note varchar(600), in p_image_url varchar(2048))
		begin
			insert into campaign(book_id, discount_percentage, note, image_url) 
            values (p_book_id, p_discount_percentage, p_note, p_image_url);
		end$$
	create procedure update_campaign(in p_book_id int, in p_discount_percentage float, in p_note varchar(600), 
									in p_image_url varchar(2048))
		begin
			update campaign
			set	discount_percentage = p_discount_percentage,
            note = p_note,
            image_url = p_image_url
            where book_id = p_book_id;
		end$$
	create procedure delete_campaign(in p_book_id int)
		begin
			delete from campaign where book_id = p_book_id;
		end$$
	
    -- Customer
	create procedure insert_customer(in p_customer_name varchar(255), in p_phone varchar(255), in p_email varchar(255), 
									in p_customer_password varchar(300), in p_address varchar(255))
		begin
			insert into customer(customer_name, phone, email, customer_password, address) 
			values (p_customer_name, p_phone, p_email, p_customer_password, p_address);
		end$$
	create procedure update_customer(in p_id int, in p_customer_name varchar(255), in p_phone varchar(255), in p_email varchar(255), 
									in p_customer_password varchar(300), in p_address varchar(255))
		begin
			update customer
			set	customer_name = p_customer_name,
            phone = p_phone,
            email = p_email,
			customer_password = p_customer_password,
            address = p_address
            where id = p_id;
		end$$
	create procedure delete_customer(in p_id int)
		begin
			delete from customer where id = p_id;
		end$$
	
    -- Page_Admin
	create procedure insert_page_admin(in p_admin_password varchar(300), in p_email varchar(255))
		begin
			insert into page_admin(admin_password, email) values (p_admin_password, p_email);
		end$$
	create procedure update_page_admin(in p_id int, in p_admin_password varchar(300), in p_email varchar(255))
		begin
			update page_admin
			set	admin_password = p_admin_password,
            email = p_email
            where id = p_id;
		end$$
	create procedure delete_page_admin(in p_id int)
		begin
			delete from page_admin where id = p_id;
		end$$
        
	-- Mail
	create procedure insert_mail(in p_page_admin_id int, in p_customer_id int, in p_title varchar(255), in p_content varchar(10000))
		begin
			insert into mail(page_admin_id, customer_id, title, content) 
            values (p_page_admin_id, p_customer_id, p_title, p_content);
		end$$
	
    -- Book_Comment
	create procedure insert_book_comment(in p_book_id int, in p_customer_id int, in p_rate float, in p_user_comment varchar(600))
		begin
			insert into book_comment(book_id, customer_id, rate, user_comment) 
            values (p_book_id, p_customer_id, p_rate, p_user_comment);
		end$$
	create procedure update_book_comment(in p_id int, in p_book_id int, in p_customer_id int, in p_rate float, in p_user_comment varchar(600))
		begin
			update book_comment
			set	book_id = p_book_id,
            customer_id = p_customer_id,
            rate = p_rate,
            user_comment = p_user_comment
            where id = p_id;
		end$$
	create procedure delete_book_comment(in p_id int)
		begin
			delete from book_comment where id = p_id;
		end$$
        
	-- Payment_Service
    create procedure insert_payment_service(in p_payment_name varchar(50), in p_account_number varchar(40))
		begin
			insert into payment_service(payment_name, account_number) values (p_payment_name, p_account_number);
		end$$
	create procedure update_payment_service(in p_id int, in p_payment_name varchar(50), in p_account_number varchar(40))
		begin
			update payment_service
			set	payment_name = p_payment_name,
            account_number = p_account_number
            where id = p_id;
		end$$
	create procedure delete_payment_service(in p_id int)
		begin
			delete from payment_service where id = p_id;
		end$$
	
    -- Courier_Company
    create procedure insert_courier_company(in p_url varchar(2048), in p_phone varchar(15), in p_company_name varchar(255), in p_price float)
		begin
			insert into courier_company(url, phone, company_name, price) 
            values (p_url, p_phone, p_company_name, p_price);
		end$$
	create procedure update_courier_company(in p_id int, in p_url varchar(2048), in p_phone varchar(15), in p_company_name varchar(255), 
									in p_price float)
		begin
			update courier_company
			set	url = p_url,
            phone = p_phone,
            company_name = p_company_name,
            price = p_price
            where id = p_id;
		end$$
	create procedure delete_courier_company(in p_id int)
		begin
			delete from courier_company where id = p_id;
		end$$
	
    -- Billing_Information
    create procedure insert_billing_information(in p_customer_id int, in p_customer_name varchar(255), in p_phone varchar(255), 
												in p_email varchar(255), in p_address varchar(255))
		begin
			insert into billing_information(customer_id, customer_name, phone, email, address) 
			values (p_customer_id, p_customer_name, p_phone, p_email, p_address);
		end$$
	create procedure update_billing_information(in p_id int, in p_customer_id int, in p_customer_name varchar(255), in p_phone varchar(255), 
												in p_email varchar(255), in p_address varchar(255))
		begin
			update billing_information
			set	customer_id = p_customer_id,
            customer_name = p_customer_name,
            phone = p_phone,
            email = p_email,
            address = p_address
            where id = p_id;
		end$$
	create procedure delete_billing_information(in p_id int)
		begin
			delete from billing_information where id = p_id;
		end$$
        
	-- Purchase_Request
    create procedure insert_purchase_request(in p_is_confirmed int)
		begin
			insert into purchase_request(is_confirmed) values (p_is_confirmed);
		end$$
	create procedure update_purchase_request(in p_id int, in p_payment_service_id int, in p_courier_company_id int, 
											in p_billing_information_id int, in p_is_confirmed int)
		begin
			update purchase_request
			set	payment_service_id = p_payment_service_id,
            courier_company_id = p_courier_company_id,
            billing_information_id = p_billing_information_id,
            is_confirmed = p_is_confirmed
            where id = p_id;
		end$$
	create procedure delete_purchase_request(in p_id int)
		begin
			delete from purchase_request where id = p_id;
		end$$
        
	-- Cart
    create procedure insert_cart(in p_book_id int, in p_customer_id int, in p_count int, in p_purchase_request_id int)
		begin
			insert into cart(book_id, customer_id, count, purchase_request_id) 
            values (p_book_id, p_customer_id, p_count, p_purchase_request_id);
		end$$
	create procedure update_cart(in p_id int, in p_book_id int, in p_customer_id int, in p_count int, in p_purchase_request_id int)
		begin
			update cart
			set	book_id = p_book_id,
            customer_id = p_customer_id,
            count = p_count,
            purchase_request_id = p_purchase_request_id
            where id = p_id;
		end$$
	create procedure delete_cart(in p_id int)
		begin
			delete from cart where id = p_id;
		end$$
        
	-- In_Cargo
    create procedure insert_in_cargo(in p_purchase_request_id int)
		begin
			insert into in_cargo(purchase_request_id) values (p_purchase_request_id);
		end$$
	create procedure update_in_cargo(in p_purchase_request_id int, in p_export_date datetime, in p_arrival_date datetime)
		begin
			update in_cargo
			set	export_date = p_export_date,
            arrival_date = p_arrival_date
            where purchase_request_id = p_purchase_request_id;
		end$$
	create procedure delete_in_cargo(in p_purchase_request_id int)
		begin
			delete from in_cargo where purchase_request_id = p_purchase_request_id;
		end$$
DELIMITER ;