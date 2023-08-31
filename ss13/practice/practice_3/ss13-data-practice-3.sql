create database ss13;
use ss13;

create table users(
id int(3) not null auto_increment,
`name` varchar(150) not null,
email varchar(150) not null,
country varchar(150),
primary key (id),
is_deleted boolean default false
);

insert into users(`name`,email,country)
values 
('Minh','minh@codegym.vn','Viet Nam'),
('Lien','mylien@codegym.vn','Viet Nam'),
('Hung','phuochung@codegym.vn','Viet Nam'),
('Lam','vanlam@codegym.vn','Viet Nam'),
('Kante','kante@codegym.vn','UK');


delimiter //
create procedure get_user_by_id(in user_id int)
begin
select users.name, users.email, users.country
from users
where users.id = user_id;
end //
delimiter ;

delimiter //
create procedure insert_user(in user_name varchar(50), in user_email varchar(50), in user_country varchar(50))
begin
insert into user(`name`,email,country) 
values
(user_name, user_email, user_country);
end //
delimiter ;


delimiter //
create procedure showList()
begin 
select *
from users
where is_deleted = false;
end //
delimiter ;

delimiter //
create procedure insert_user(new_name varchar(150), new_email varchar(150), new_country varchar(150))
begin 
insert into users(`name`, email, country)
values 
(new_name, new_email, new_country);
end //
delimiter ;

delimiter //
create procedure delete_user(delete_id int)
begin 
SET SQL_SAFE_UPDATES = 0;
update users 
set is_deleted = true
where id = delete_id;
SET SQL_SAFE_UPDATES = 1;
end //
delimiter ;

delimiter //
create procedure edit_user(delete_id int,new_name varchar(150), new_email varchar(150), new_country varchar(150))
begin 
SET SQL_SAFE_UPDATES = 0;
update users 
set 
`name` = new_name,
email = new_email,
country = new_country
where id = delete_id;
SET SQL_SAFE_UPDATES = 1;
end //
delimiter ;

delimiter //
create procedure select_by_id(search_id int)
begin 
select * from users
where id = search_id;
end //
delimiter ;


delimiter //
create procedure find_by_country(country_seacrh varchar(100))
begin 
select *
from users
where (country like country_seacrh) and (is_deleted = false);
end //
delimiter ;

delimiter //
create procedure sort_by_name()
begin 
select *
from users
where is_deleted = false
order by name;
end //
delimiter ;

create table employee(
id int not null primary key auto_increment,
name varchar(150) not null,
salary int(220) not null,
create_date datetime
);