use case_study_database;
/*Task 2*/
select * 
from nhan_vien 
where 
substring_index(ho_ten,' ', -1) like "H%" 
or substring_index(ho_ten,' ', -1) like "T%" 
or substring_index(ho_ten,' ', -1) like "K%"
and length(ho_ten) <= 15;

/*Task 3*/
select * from khach_hang
where (dia_chi like "%Đà Nẵng%" or dia_chi like "%Quảng Trị%")
and (timestampdiff(year, ngay_sinh, curdate()) > 18 
and timestampdiff(year, ngay_sinh, curdate()) < 50);

/*Task 4*/
select k.ho_ten, l.ten_loai_khach, count(k.ma_khach_hang) as "so lan thue phong"
from khach_hang as k
join hop_dong as h
on k.ma_khach_hang = h.ma_khach_hang
join loai_khach as l
on k.ma_loai_khach = l.ma_loai_khach
where l.ten_loai_khach = "Diamond"
group by k.ho_ten
order by count(k.ma_khach_hang);

/*Task 5 Hiển thị ma_khach_hang, ho_ten, 
ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong,
 ngay_ket_thuc, tong_tien
 (Với tổng tiền được tính theo công thức như sau: 
 Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá 
 là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng.
 (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).*/

select k.ma_khach_hang, k.ho_ten, l.ten_loai_khach, h.ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc,
if (hdct.so_luong is null, d.chi_phi_thue,d.chi_phi_thue + hdct.so_luong * dvdk.gia) as 'total'
from khach_hang as k
left join loai_khach as l on k.ma_loai_khach = l.ma_loai_khach
left join hop_dong as h on k.ma_khach_hang = h.ma_khach_hang
left join dich_vu as d on h.ma_dich_vu = d.ma_dich_vu
left join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = h.ma_hop_dong
left join dich_vu_di_kem as dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by h.ma_hop_dong
order by k.ma_khach_hang;


