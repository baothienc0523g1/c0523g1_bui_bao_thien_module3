create database ss4_quan_ly_sinh_vien;
use ss4_quan_ly_sinh_vien;

create table class_room(
class_id int not null primary key auto_increment,
class_name varchar(60) not null,
start_date datetime not null,
status bit
);

create table students(
student_id int not null primary key auto_increment,
student_name varchar(30) not null,
address varchar(60),
phone varchar(20),
status bit,
class_id int not null,
foreign key (class_id) references class_room(class_id)
);

create table subjects(
sub_id int not null primary key auto_increment,
sub_name varchar(30) not null,
credit tinyint not null default 1 check (credit >= 1),
status bit default 1
);

create table marks(
mark_id int not null primary key auto_increment,
sub_id int not null,
student_id int not null,
mark float default 0 check (mark between 0 and 100),
exam_times tinyint default 1,
unique (sub_id, student_id),
foreign key (sub_id) references subjects(sub_id),
foreign key (student_id) references students(student_id)
);

insert into class_room(class_name,start_date,status)
values 
("A1","2008-12-20",1),
("A2","2008-12-22",1),
("B3",curdate(),1);

insert into students(student_name,address,phone,status,class_id)
value ("Hung","Ha noi","0912113113",1,1);

insert into students(student_name,address,status,class_id)
value ("Hoa","Hai phong",1,1);

insert into students(student_name,address,phone,status,class_id)
value ("Manh","HCM","0123123123",0,2);

insert into subjects(sub_name, credit, status)
values
("CF", 5, 1),
("C", 6, 1),
("HDJ", 5, 1),
("RDBMS", 10, 1);

insert into marks(sub_id,student_id,mark,exam_times)
values
(1,1,8,1),
(1,2,10,2),
(2,1,12,1);

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select sub_id as "subjects id" , sub_name "subject name", max(credit) as "largest credit"
from subjects;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.sub_name, max(mark) 
from subjects as s 
join marks as m
on s.sub_id = m.sub_id;

/* Hiển thị các thông tin sinh viên và điểm trung bình 
của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần */
select s.student_id, s.student_name, s.class_id, avg(mark)
from students as s
join marks as m
on s.student_id = m.student_id
group by s.student_id
order by avg(mark) desc;
 