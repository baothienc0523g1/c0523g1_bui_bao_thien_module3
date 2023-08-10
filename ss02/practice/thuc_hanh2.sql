CREATE DATABASE ss02_practice_2;
use ss02_practice_2;

CREATE TABLE hoc_sinh (
    id INT AUTO_INCREMENT,
    ma_hs VARCHAR(20) PRIMARY KEY,
    ten_hs VARCHAR(50),
    ngay_sinh DATETIME,
    lop VARCHAR(20),
    gt VARCHAR(20)
);

CREATE TABLE giao_vien (
    id INT AUTO_INCREMENT,
    ma_gv VARCHAR(20) PRIMARY KEY,
    ten_gv VARCHAR(20),
    sdt VARCHAR(15)
);

CREATE TABLE mon_hoc (
    id INT AUTO_INCREMENT,
    ma_mh VARCHAR(20) PRIMARY KEY,
    ten_mh VARCHAR(20),
    ma_gv VARCHAR(20),
    FOREIGN KEY (ma_gv)
        REFERENCES giao_vien (ma_gv)
);

CREATE TABLE bang_diem (
    id INT AUTO_INCREMENT,
    ma_hs VARCHAR(20),
    ma_mh VARCHAR(20),
    diem_thi INT,
    ngay_kt DATETIME,
    PRIMARY KEY (ma_hs , ma_mh),
    FOREIGN KEY (ma_hs)
        REFERENCES hoc_sinh (ma_hs),
    FOREIGN KEY (ma_mh)
        REFERENCES mon_hoc (ma_mh)
);


insert into hoc_sinh(ma_hs, ten_hs, ngay_sinh, lop, gt)
values ("HV-0001", "My Lien", "1996-09-20", "C0523G1", "Other");

insert into hoc_sinh(ma_hs, ten_hs, ngay_sinh, lop, gt)
values
	   ("HV-0002", "Phuoc Hung", "1994-01-20", "C0523G1", "Nothing"),
	   ("HV-0003", "Huu Hau", "1998-01-20", "C0523G1", "Nah"),
	   ("HV-0004", "Van Lam", "2001-01-20", "C0523G1", "Nooo");

insert into giao_vien(ma_gv,ten_gv,sdt)
values 
		("GV-0001","Trung DC", "0909101010"),
		("GV-0002","Chanh TV", "0909101012"),
		("GV-0003","Hai TT", "0909101015"),
		("GV-0004","Cong NT", "0909101016");
        
insert into mon_hoc(ma_mh,ten_mh,ma_gv)
values
		("Module 1", "JavaScript", "GV-0001"),
		("Module 2", "Java", "GV-0002"),
		("Module 3", "Data Base", "GV-0003");
    
insert into bang_diem(ma_hs,ma_mh,diem_thi,ngay_kt)
values
		("HV-0001", "Module 1", 99, "2023-06-27"),
		("HV-0002", "Module 2", 99, "2023-07-27"),
		("HV-0003", "Module 3", 99, "2023-08-27");

select * from bang_diem



