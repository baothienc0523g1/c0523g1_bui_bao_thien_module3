use ss2;
-- 1 Hiện thị danh sách các lớp có học viên theo học và số lượng học viên của mỗi lớp
select c.id as "class ID" , c.name as "class name", count(s.class_id) as "number of students"
from student as s
join class as c
on s.class_id = c.id
group by c.id; -- ? tac dung cu the cua groupby o line nay ?

-- 2 Tính điểm lớn nhất của mỗi lớp
select max(`point`) as "max point", c.name as "class name"
from student as s
join class as c
on s.class_id = c.id
group by c.id;

-- 3 Tình điểm trung bình  của từng lớp
select c.id as "class id", c.name as "class name", format(avg(`point`),2) as "average point"
from student as s
join class as c
on s.class_id = c.id
group by c.name;

-- 4 Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym. Lưu ý: sử dụng union
select `name` as "name", birthday
from student
union all
select `name`, birthday
from instructor;

-- 5 Lấy ra top 3 học viên có điểm cao nhất của trung tâm.
select s.id, s.name, `point` as "point"
from student as s
order by `point` desc
limit 3;

-- 6 Lấy ra các học viên có điểm số cao nhất của trung tâm.

select `name`, `point`
from student
where `point` in (
select max(`point`) from student);