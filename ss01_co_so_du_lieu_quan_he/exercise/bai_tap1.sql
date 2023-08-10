create database ss01;
use ss01;
create table teacher(
id int key auto_increment,
`name` varchar(50),
age int,
country varchar(50)
);

create table class(
id int key auto_increment,
`name` varchar(50)
);

insert into class(`name`)
value ("C0523G1");

insert into teacher(`name`, age, country)
value ("Trung DC", 19, "VN"),("Chanh TV", 20, "VN"), ("Quang NN", 18, "Laos");

select * from teacher;
select * from class;

