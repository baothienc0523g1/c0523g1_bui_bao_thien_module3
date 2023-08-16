create database ss03_bai2;
use ss03_bai2;

create table customers(
customer_id int not null primary key auto_increment,
customer_name varchar(55),
customer_age int
);

create table orders(
order_id int not null primary key auto_increment,
customer_id int,
foreign key (customer_id) references customers(customer_id),
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
foreign key (order_id) references orders(order_id),
product_id int,
foreign key (product_id) references products(product_id),
order_quantity int,
primary key(order_id, product_id)
);

insert into customers(customer_name,customer_age)
values
("Minh Quan", 10),
("Ngoc Oanh", 20),
("Hong Ha", 50);

insert into orders(customer_id,order_day)
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

/*Hiển thị các thông tin  gồm 
oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order*/
select * from orders;

/*Hiển thị danh sách các khách hàng đã mua hàng,
 và danh sách sản phẩm được mua bởi các khách*/
 select c.customer_id, c.customer_name, p.product_name
 from customers as c
 join orders as o 
 on c.customer_id = o.customer_id
 join order_detail as detail 
 on o.order_id = detail.order_id
 join products as p 
 on detail.product_id = p.product_id;
 
 /*Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào*/
select c.customer_id,c.customer_name
from customers as c
left join orders as o
on c.customer_id = o.customer_id
where o.customer_id is null;
 
 /*Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
 (giá một hóa đơn được tính bằng tổng giá bán của
 từng loại mặt hàng xuất hiện trong hóa đơn. 
 Giá bán của từng loại được tính = odQTY*pPrice)*/
 select detail.order_id, o.order_day,
 sum(order_quantity * product_price) as total_price
 from order_detail as detail
 right join orders as o
 on detail.order_id = o.order_id
 join products as p
 on detail.product_id = p.product_id
 group by o.order_id;