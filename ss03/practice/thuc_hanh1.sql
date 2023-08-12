create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;

create table class_room(
class_id int not null primary key auto_increment,
class_name varchar(60) not null,
start_date datetime not null,
status bit
);

create table student(
student_id int not null primary key auto_increment,
student_name varchar(30) not null,
address varchar(60),
phone varchar(20),
status bit,
class_id int not null,
foreign key (class_id) references class_room(class_id)
);

create table `subject`(
sub_id int not null primary key auto_increment,
sub_name varchar(30) not null,
credit tinyint not null default 1 check (credit >= 1),
status bit default 1
);

create table mark(
mark_id int not null primary key auto_increment,
sub_id int not null,
student_id int not null,
mark float default 0 check (mark between 0 and 100),
exam_times tinyint default 1,
unique (sub_id, student_id),
foreign key (sub_id) references `subject`(sub_id),
foreign key (student_id) references student(student_id)
);

insert into class_room(class_name,start_date,status)
values 
("A1","2008-12-20",1),
("A2","2008-12-22",1),
("B3",curdate(),1);

insert into student(student_name,address,phone,status,class_id)
value ("Hung","Ha noi","0912113113",1,1);

insert into student(student_name,address,status,class_id)
value ("Hoa","Hai phong",1,1);

insert into student(student_name,address,phone,status,class_id)
value ("Manh","HCM","0123123123",0,2);

insert into `subject`(sub_name, credit, status)
values
("CF", 5, 1),
("C", 6, 1),
("HDJ", 5, 1),
("RDBMS", 10, 1);

insert into mark(sub_id,student_id,mark,exam_times)
values
(1,1,8,1),
(1,2,10,2),
(2,1,12,1);

select * from student;

select * from student where status = 1;

select * from subject where credit < 10;

select s.student_id, s.student_name, c.class_name 
from student s join class_room c on s.class_id = c.class_id;

select s.student_id, s.student_name, c.class_name
from student s join class_room c on c.class_id = c.class_id
where c.class_name = "A1";

select s.student_id, s.student_name, sub.sub_name, m.mark
from student s join mark m on s.student_id = m.student_id join `subject` sub on m.sub_id = sub.sub_id
where sub.sub_name = "CF";
 