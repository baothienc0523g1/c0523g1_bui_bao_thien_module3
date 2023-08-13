/*bai tap ss3 txt*/
use ss2;

/*1*/
select *
from student as s
left join class as c
on s.class_id = c.id
where class_id is not null;

/*2*/
select * 
from student as s
left join class as c
on s.class_id = c.id;
select * from student; 

/*4*/
select * from student where (`name` like "%Hai" or `name` like "%Huynh"); 

/*5*/
select * from student where (`point` > 5);

/*6*/
select * from student where (`name` like "Nguyen%");

/*7*/
select `point`, `name` from student group by `name`;

/*8*/
select * from student  where (`point` > 5) group by `point` order by `point` ; 
select count(*) from student where (`point` > 5);
/*9*/

/*10*/