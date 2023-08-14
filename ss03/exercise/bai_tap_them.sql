/*bai tap ss3 txt*/
use ss2;

/*1*/
select *
from student as s
join class as c
on s.class_id = c.id;

/*2*/
select * 
from student as s
left join class as c
on s.class_id = c.id;

/*4*/
select * from student
where (`name` like "% Hai" or `name` like "% Huynh"); 

/*5*/
select * from student
where (`point` > 5)
order by `point`;

/*6*/
select * from student where (`name` like "Nguyen %");

/*7*/
select `point`, count(*) as "So luong"
from student group by `point` order by `point`;

/*8*/
select `point`, count(*) as "So luong"
from student
where (`point` > 5) 
group by `point`
order by `point` ; 

/*9*/
select `point`, count(*) as "So luong"
from student
where `point` > 5
group by `point`
having count(*) >= 2
order by `point`;

/*10*/
select *
from student as s
join class as c
where c.name = "C1121G1"
ORDER BY substring_index(s.name,' ', -1);
