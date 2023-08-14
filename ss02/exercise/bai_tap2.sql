create database ss02_bai2;
use ss02_bai2;

create table customers(
customer_id int not null primary key auto_increment,
customer_name varchar(55),
customer_age int
);

create table orders(
order_id int not null primary key auto_increment,
customer_id int,
foreign key (customer_id) references customer(customer_id),
order_day datetime,
order_total_price double
);

create table products(
product_id int not null primary key auto_increment,
product_name varchar(55),
product_price double
);

create table order_detail(
order_id int,
foreign key (order_id) references `order`(order_id),
product_id int,
foreign key (product_id) references product(product_id),
order_quantity int,
primary key(order_id, product_id)
);

insert into customers(customer_name,customer_age)
values
("Minh Quan", 10),
("Ngoc Oanh", 20),
("Hong Ha", 50);

insert into `order`(customer_id,order_day)
values
(1, "2006-03-21"),
(2, "2006-03-23"),
(1, "2006-03-16");

insert into products(product_name,product_price)
values 
("May Giat", 3),
("Tu Lanh",5),
("Dieu Hoa",7),
("Quat",1),
("Bep Dien",2);

insert into order_detail(order_id,product_id,order_quantity)
values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);
