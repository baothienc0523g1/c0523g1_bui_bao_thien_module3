use case_study_database;
-- Task 6 
/*
select d.ma_dich_vu, d.ten_dich_vu, d.dien_tich, d.chi_phi_thue, l.ten_loai_dich_vu
from dich_vu as d
join loai_dich_vu as l on d.ma_loai_dich_vu = l.ma_loai_dich_vu
join hop_dong as h on d.ma_dich_vu = h.ma_dich_vu
where h.ma_dich_vu
(select ma_dich_vu from hop_dong
 month(ngay_lam_hop_dong) < 4 and year(ngay_lam_hop_dong) = 2021)
group by d.ma_dich_vu; */

-- Task 7
/*Hiển thị thông tin ma_dich_vu, ten_dich_vu,
 dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
 của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng
 trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.*/

-- Task 8 
-- *Cach 1
select distinct ho_ten from khach_hang;
-- *Cach 2
select ho_ten from khach_hang
group by ho_ten;
-- *Cach 3
select ho_ten from khach_hang
having count(ho_ten) > 1;

-- Task 9

