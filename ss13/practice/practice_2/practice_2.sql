CREATE DATABASE ss13_exercise_2;
USE ss13_exercise_2; 
create table users ( 
      id int(3) NOT NULL AUTO_INCREMENT, 
      name varchar(120) NOT NULL, 
      email varchar(220) NOT NULL, 
      country varchar(120), 
      PRIMARY KEY (id) 
);
insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kanteee','kante@che.uk','Kenia');

create table Permision(
      id int(11) primary key,
      name varchar(50)
);

create table User_Permision(
     permision_id int(11),
     user_id int(11)
);