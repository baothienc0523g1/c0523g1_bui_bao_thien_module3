create database nuoi_em_db_test;
use nuoi_em_db_test;

create table tai_khoan(
ma_tai_khoan int primary key not null auto_increment,
ten_tai_khoan varchar(100),
mat_khau varchar(100),
trang_thai_xoa boolean default false,
`admin` boolean default false
);


create table khu_vuc(
ma_khu_vuc int primary key auto_increment,
ten_khu_vuc varchar(100)
);

create table nguoi_nuoi(
ma_nguoi_nuoi int primary key auto_increment,
ten_nguoi_nuoi varchar(100),
gioi_tinh int,
ma_tai_khoan int,
so_dien_thoai int,
email varchar(100),
foreign key (ma_tai_khoan) references tai_khoan(ma_tai_khoan)
);

create table nguoi_giam_ho(
ma_nguoi_giam_ho int primary key auto_increment,
ten_nguoi_giam_ho varchar (100),
gioi_tinh int,
ma_khu_vuc int,
so_dien_thoai int,
foreign key (ma_khu_vuc) references khu_vuc (ma_khu_vuc)
);

create table hinh_anh(
ma_hinh_anh int primary key auto_increment,
nguon_hinh_anh varchar(100)
);

create table tre_em (
ma_tre_em int primary key auto_increment,
ten_tre_em varchar (100),
gioi_tinh int,
ngay_sinh date,
trang_thai_nhan_nuoi int default 0,
mo_ta varchar(250),
ma_khu_vuc int,
ma_nguoi_giam_ho int,
ma_hinh_anh int,
is_delete int default 0,
foreign key (ma_khu_vuc) references khu_vuc (ma_khu_vuc), 
foreign key (ma_nguoi_giam_ho) references nguoi_giam_ho (ma_nguoi_giam_ho),
foreign key (ma_hinh_anh) references hinh_anh (ma_hinh_anh)
);

create table cam_ket(
ma_cam_ket int primary key auto_increment,
so_tien int,
ngay_nhan_nuoi date,
trang_thai int,
ma_tre_em int,
ma_nguoi_nuoi int,
foreign key (ma_tre_em) references tre_em (ma_tre_em),
foreign key (ma_nguoi_nuoi) references nguoi_nuoi (ma_nguoi_nuoi)
);

INSERT INTO khu_vuc (ten_khu_vuc) VALUES
("Hà Giang"),
("Cao Bằng"),
("Lào Cai"),
("Bắc Kạn"),
("Lạng Sơn"),
("Tuyên Quang"),
("Yên Bái"),
("Thái Nguyên"),
("Phú Thọ"),
("Bắc Giang"),
("Lai Châu"),
("Điện Biên"),
("Sơn La"),
("Hòa Bình");

INSERT INTO nguoi_giam_ho (ten_nguoi_giam_ho, gioi_tinh,so_dien_thoai, ma_khu_vuc) VALUES
("Nguyễn Văn Chính", 1, 0905549590, 1),
("Nguyễn Văn Nam", 1, 0905101596, 2),
("Hoàng Anh Kính", 1, 0345735733, 3),
("Võ Hùng Văn", 1, 0987494110, 4),
("Nguyễn Trần Kim My", 0, 0933316721, 5),
("Trần Thị Sáu", 0, 0352945630, 6),
("Nguyễn Lê Hùng", 1, 0962003727,7),
("Nguyễn Lê Kim Linh", 0, 0363001164,8),
("Trần Phi Hùng", 1, 0584168700,9),
("Nguyễn Thị Nhung", 0, 0399342064,10),
("Hoàng Kim Tuyến", 0, 0905525284,11),
("Trần An Thân", 1, 0905104761,12),
("Lê Hoàng Hải", 1, 0911200088,13),
("Nguyễn Viên Vy", 0, 0945493620,14);


INSERT INTO tre_em (ten_tre_em, gioi_tinh, ngay_sinh, mo_ta, ma_khu_vuc, ma_nguoi_giam_ho) VALUES
('Giàng Thị Hoa', 0, '2010-02-13', 'hộ nghèo, cha mất sớm, thiếu kinh phí đến trường', 1, 1),
('Vòng Thị Diễm Thương', 0, '2010-02-13', 'mồ côi, thiếu kinh phí đến trường', 1, 2),
('Vòng Thị Nhung', 0, '2010-02-13', 'mồ côi, thiếu kinh phí đến trường', 1, 3),
('Giàng Thị Nòng', 0, '2010-02-13', 'hộ nghèo, ba mẹ mất khả năng lao động, điều kiện sống kém', 1, 3),
('Giàng Thị Mặc', 0, '2010-02-13', 'mồ côi, thiếu kinh phí đến trường', 1, 2),
('Giàng A Lưới', 1, '2010-02-13', 'mồ côi, thiếu kinh phí đến trường', 1, 1),
('Giàng Út', 0, '2010-02-13', 'mồ côi, thiếu kinh phí đến trường', 1, 4),
('Giàng Văn Nhật', 1, '2010-02-13', 'mồ côi, thiếu kinh phí đến trường', 1, 5),
('Giàng A Tuân', 1, '2010-02-13', 'hộ nghèo, ba mẹ mất khả năng lao động, điều kiện sống kém', 1, 5),
('Giàng Kim Thi', 0, '2010-02-13', 'vùng sâu vùng xa, con đông, không có nước sạch và điện', 1, 9),
('Giàng Thị Sáu', 0, '2010-02-13', 'mồ côi, thiếu kinh phí đến trường', 1, 9),
('Giàng A Tùng', 1, '2010-02-13', 'mồ côi, thiếu kinh phí đến trường', 1, 8),
('Giàng Thị Gầu', 0, '2010-02-13', 'mồ côi, thiếu kinh phí đến trường', 1, 6),
('Giàng Thị Vui', 0, '2010-02-13', 'mồ côi, thiếu kinh phí đến trường', 1, 7),
('Giàng Mạnh Tuấn', 1, '2010-02-13', 'hộ nghèo, cha mất sớm, thiếu kinh phí đến trường', 1, 10),
('Vòng Thị Vi', 0, '2010-02-13', 'vùng sâu vùng xa, con đông, không có nước sạch và điện', 1, 11),
('Vòng A Dia', 1, '2010-02-13', 'hộ nghèo, ba mẹ mất khả năng lao động, điều kiện sống kém', 1, 11),
('Vòng Thị Hương', 0, '2010-02-13', 'hộ nghèo, ba mẹ mất khả năng lao động, điều kiện sống kém', 1, 1),
('Vòng A Lương', 1, '2010-02-13', 'vùng sâu vùng xa, con đông, không có nước sạch và điện', 1, 1),
('Vòng Thị Ngọc Linh', 0, '2010-02-13', 'vùng sâu vùng xa, con đông, không có nước sạch và điện', 1, 1);

INSERT INTO tai_khoan (ten_tai_khoan, mat_khau)
VALUES
("huongnt","zyxwvu"),
("ductv","defghi"),
("maint","plmnko"),
("tuanpv","ihgfed"),
( "lannt","cbazyx"),
("namhv","uvwxyz"),
("anvt","klmnop"),
("hungdv","rstuvw"),
("ngatt","ghijkl"),
("longnv","vwxyza");

INSERT INTO nguoi_nuoi(ten_nguoi_nuoi, gioi_tinh, ma_tai_khoan, so_dien_thoai, email)
VALUES
('Nguyễn Thị Hương', 0, 1, 123456789, 'huongnt@gmail.com'),
('Trần Văn Đức', 1, 2, 987654321, 'ductv@gmail.com'),
('Lê Thị Mai', 0, 3, 456789123, 'mailt@gmail.com'),
('Phạm Văn Tuấn', 1, 4, 456789801, 'tuanpv@gmail.com'),
('Ngô Thị Lan', 0, 5, 321654987, 'lannt@gmail.com'),
('Hoàng Văn Nam', 1, 6, 654987321,'namhv@gmail.com'),
('Vũ Thị An', 0, 7, 246813579, 'anvt@gmail.com'),
('Đinh Văn Hùng', 1, 8, 135792468,'hungdv@gmail.com'),
('Trần Thị Nga', 0, 9, 987123654,'ngatt@gmail.com'),
('Nguyễn Văn Long', 1, 10, 369852147,'hulongnv@gmail.com');

INSERT INTO cam_ket(so_tien,ngay_nhan_nuoi ,trang_thai ,ma_tre_em ,ma_nguoi_nuoi)
VALUES 
(500000,'2023-08-28',1,1,1),
(500000,'2023-08-28',1,2,2),
(500000,'2023-08-28',1,3,3),
(500000,'2023-08-28',1,4,4),
(500000,'2023-08-28',1,5,5),
(500000,'2023-08-28',1,6,6),
(500000,'2023-08-28',1,7,7);


delimiter //
create procedure them_moi(ten_tai_khoan_moi varchar(100),
mat_khau_moi varchar(100),
ten_nguoi_nuoi_moi varchar(100),
gioi_tinh_moi int,
ma_tai_khoan_moi int,
so_dien_thoai_moi int,
email_moi varchar(100)
)
begin
declare ma_tai_khoan_moi int;
    set ma_tai_khoan_moi = (select MAX(ma_nguoi_nuoi) + 1 from nguoi_nuoi);
insert into tai_khoan(ten_tai_khoan, mat_khau)
values 
(ten_tai_khoan_moi, mat_khau_moi);
insert into nguoi_nuoi(ten_nguoi_nuoi,
gioi_tinh ,
ma_tai_khoan ,
so_dien_thoai ,
email
)
values 
(ten_nguoi_nuoi_moi,
gioi_tinh_moi,
ma_tai_khoan_moi,
so_dien_thoai_moi,
email_moi);
end //

delimiter ;