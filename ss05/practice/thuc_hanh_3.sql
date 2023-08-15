use classicmodels;
 /*IN: Đây là chế độ mặc định (nghĩa là nếu 
 bạn không định nghĩa loại nào thì nó sẽ hiểu là IN).*/
delimiter //
create procedure getCusById (in cusNum int(11))
begin
select * from customers where customerNumber = cusNum;
end //
delimiter ;
call getCusById(175);

/* Khi truyền tham số dạng OUT mục đích là lấy dữ liệu 
trong Proedure và sử dụng ở bên ngoài.
Khi truyền tham số vào dạng OUT phải có chữ @ đằng trước biến
Hoạt động giống tham chiếu nên biến truyền vào dạng OUT không 
cần định nghĩa trước, chính vì vậy khởi đầu nó có giá trị NULL*/
delimiter //
create procedure GetCustomersCountByCity(
in in_city varchar(50),
out total int
)
begin
select count(customerNumber)
into total
from customers
where city = in_city;
end //
delimiter ;

call GetCustomersCountByCity('Lyon',@total);
select @total;

-- INOUT là sự kết hợp giữa IN và OUT
delimiter //
create procedure SetCounter(
inout counter int,
in inc int
)
begin
set counter = counter + inc;
end //
delimiter ;

set @counter = 1;
call SetCounter(@counter, 1);
