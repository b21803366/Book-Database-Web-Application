create schema if not exists BOOKSTORE; 
use BOOKSTORE;
  
create table if not exists Category(
	id int AUTO_INCREMENT PRIMARY KEY,
    title varchar(50)
);
    
create table if not exists Subcategory(
	id int AUTO_INCREMENT PRIMARY KEY,
    category_id int default null, 
    title varchar(255) , 
    foreign key(category_id) references Category(id) on update cascade on delete cascade
);

create table if not exists Book(  
	id int AUTO_INCREMENT PRIMARY KEY, 
    subcategory_id integer default 1, 
	author_name varchar(255),
	publish_year int,
    title varchar(255),
    isbn varchar(20),
    image_url varchar(2048),
    publisher_name varchar(255),
    added_date DateTime DEFAULT CURRENT_TIMESTAMP,
    subjects varchar(600),
    count int,
    price float(10,2),
    price_with_campaign float(10,2),
    foreign key(subcategory_id) references Subcategory(id) on update cascade on delete set null
);
    
    
create table if not exists Campaign(
	book_id int not null,
    discount_percentage float,
    note varchar(600),
    image_url varchar(2048),
    foreign key (book_id) references Book(id) on DELETE CASCADE on UPDATE CASCADE
);

create table if not exists Customer(
	id int AUTO_INCREMENT PRIMARY KEY,
    customer_name varchar(255),
    phone varchar(255),
    email varchar(255),
    customer_password varchar(300),
    address varchar(255)
);
 create table if not exists Page_Admin(
	id int AUTO_INCREMENT PRIMARY KEY,
    admin_password varchar(300),
    email varchar(255)
 );
 
 create table if not exists Mail(
	page_admin_id int,
    customer_id int,
    title varchar(255),
    content varchar(10000),
    send_date DateTime DEFAULT CURRENT_TIMESTAMP,
    foreign key (page_admin_id) references Page_Admin(id) on DELETE CASCADE on UPDATE CASCADE,
    foreign key (customer_id) references Customer(id) on DELETE CASCADE on UPDATE CASCADE
 );
 
 
create table if not exists Book_Comment(
	id int AUTO_INCREMENT PRIMARY KEY,
	book_id int,
    customer_id int,
    rate float,
    user_comment varchar(600),
    added_date DateTime DEFAULT CURRENT_TIMESTAMP,
	foreign key (book_id) references Book(id) on DELETE CASCADE on UPDATE CASCADE,
    foreign key (customer_id) references Book(id) on DELETE CASCADE on UPDATE CASCADE
);

create table if not exists Payment_Service(
	id int AUTO_INCREMENT PRIMARY KEY,
    payment_name varchar(255),
    account_number varchar(40)
);

create table if not exists Courier_Company(
	id int AUTO_INCREMENT PRIMARY KEY,
    url varchar(2048),
    phone varchar(15),
    company_name varchar(255),
    price float
);

create table if not exists Billing_Information(
	id int AUTO_INCREMENT PRIMARY KEY,
	customer_id int ,
    customer_name varchar(255),
    phone varchar(255),
    email varchar(255), 
    address varchar(255),
    foreign key (customer_id) references customer(id) on DELETE CASCADE on UPDATE CASCADE
);

create table if not exists Purchase_Request(
	id int AUTO_INCREMENT PRIMARY KEY,
    payment_service_id int,
    courier_company_id int, 
    billing_information_id int,
    purchase_date datetime DEFAULT CURRENT_TIMESTAMP,
    is_confirmed int,
    foreign key (payment_service_id) references Payment_Service(id) on DELETE CASCADE on UPDATE CASCADE,
    foreign key (courier_company_id) references Courier_Company(id) on DELETE CASCADE on UPDATE CASCADE,
    foreign key (billing_information_id) references billing_information(id) on DELETE CASCADE on UPDATE CASCADE
);


create table if not exists Cart(
	id int AUTO_INCREMENT PRIMARY KEY,
    book_id int,
    customer_id int,
    count int,
    purchase_request_id int,
    foreign key (book_id) references Book(id) on DELETE CASCADE on UPDATE CASCADE,
    foreign key (customer_id) references Book(id) on DELETE CASCADE on UPDATE CASCADE,
    foreign key (purchase_request_id) references purchase_request(id) on DELETE CASCADE on UPDATE CASCADE
);

create table if not exists In_Cargo(
    purchase_request_id int,
    export_date datetime,
    arrival_date datetime,
    foreign key (purchase_request_id) references Purchase_Request(id) on DELETE CASCADE on UPDATE CASCADE

);