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

-- FIND ALL PRODUCT
delimiter //
create procedure f_find_all_product()
begin
select id, product_code, product_name, product_price, 
product_amount, product_description, product_status
from products;
end //
delimiter ;
call find_all_product();

-- ADD NEW PRODUCT
delimiter //
create procedure f_add_product(
    input_code VARCHAR(10),
    input_name VARCHAR(50),
    input_price DOUBLE,
    input_amount DOUBLE,
    input_description VARCHAR(155),
    input_status BIT(1))
begin
insert into products(product_code, product_name, product_price, product_amount,
product_description, product_status)
value (input_code, input_name, input_price, input_amount, input_description, input_status);
end //
delimiter ;

-- EDIT PRODUCT
delimiter //
create procedure f_edit_product(
	input_id int,
	input_code VARCHAR(10),
    input_name VARCHAR(50),
    input_price DOUBLE,
    input_amount DOUBLE,
    input_description VARCHAR(155),
    input_status BIT(1))
begin
update products
set 
product_code = input_code,
product_name = input_name,
product_price = input_price,
product_amount = input_amount,
product_description = input_description,
product_status = input_status
where id = input_id;
end //
delimiter ;
select id, product_name, product_price,product_amount,product_description
from products;

call f_edit_product(1, 'BBB','But bi bi', 3500, 500, 'But bi Long Thien',1);

select id, product_name, product_price,product_amount,product_description
from products;

-- REMOVE PRODUCT
delimiter //
create procedure f_remove_product(input_id int)
begin
delete from products
where id = input_id;
end //
delimiter ;
call f_remove_product(5);
select id, product_name, product_price,product_amount,product_description
from products;

