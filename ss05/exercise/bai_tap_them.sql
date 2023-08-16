use ss4_quan_ly_sinh_vien;
-- 1
alter table students add index index_name(student_name);
alter table students drop index index_name;

-- 2
create view studentsView as
select student_id, student_name
from students;
select * from studentsView;

-- 3
-- create procedure findByName();