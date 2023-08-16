create database demo;
use demo;

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_code VARCHAR(10),
    product_name VARCHAR(50),
    product_price DOUBLE,
    product_amount DOUBLE,
    product_description VARCHAR(155),
    product_status BIT(1)
);

insert into products(product_code, product_name, product_price, product_amount,
product_description, product_status)
values
('BB1', "But bi", 3000, 500, "But bi Thien Long", 1),
('BC1', "But chi", 200, 100, "But chi xin xo", 1),
('BL1', "But long", 5000, 600, "But long vit", 1),
('BM1', "But may", 10000, 800, "Not mean machine pen", 1),
('BK1', "But kim", 8000, 500, "But kim may", 1);

explain select product_name, product_price,product_amount,product_description
from products where product_name = 'But kim';
/* possible key: null, key: null
row = 5 (vi tri cuoi cung trong table) */

create unique index code_index on products(product_code);
create index name_price_index on products(product_name, product_price);

explain select product_name, product_price,product_amount,product_description
from products where product_name = 'But kim';
/* possible key: name_price_index, key: name_price_index
row = 1 (sau khi gan chi muc Index thi MySQL truy van truc tiep du lieu thong qua Index) */

create view v_product_info as
select product_code,product_name,product_price,product_status
from products;

select * from v_product_info;

create or replace view v_product_info as
select product_code,product_name,product_price,product_description
FROM products where product_name = 'But bi';

select * from v_product_info;
drop view v_product_info;


delimiter //
create procedure findAllProduct()
begin
select id, product_code, product_name, product_price, 
product_amount, product_description, product_status
from products;
end //
delimiter ;
call findAllProduct();


delimiter //
create procedure editProduct(id int)
begin
end //
delimiter ;

delimiter //
create procedure removeProduct(int input_id)
begin
delete from products
where id = input_id;
end;
delimiter ;


