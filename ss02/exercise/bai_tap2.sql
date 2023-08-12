create database ss01_bai2;
use ss01_bai2;

create table customer(
customer_id int not null primary key auto_increment,
customer_name varchar(55),
customer_age int
);

create table `order`(
order_id int not null primary key auto_increment,
customer_id int,
foreign key (customer_id) references customer(customer_id),
order_day datetime,
order_total_price double
);

create table product(
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