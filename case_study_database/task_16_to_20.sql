use case_study_database;

-- Task 16
CREATE VIEW task16 AS
    SELECT 
        n.ma_nhan_vien
    FROM
        nhan_vien AS n
            LEFT JOIN
        hop_dong AS h ON n.ma_nhan_vien = h.ma_nhan_vien
    WHERE
        n.ma_nhan_vien NOT IN (SELECT 
                ma_nhan_vien
            FROM
                hop_dong
            WHERE
                YEAR(ngay_lam_hop_dong) BETWEEN 2019 AND 2021)
    GROUP BY n.ma_nhan_vien;

set sql_safe_updates = 0;
UPDATE nhan_vien 
SET 
    deleted = TRUE
WHERE
    ma_nhan_vien IN (SELECT 
            ma_nhan_vien
        FROM
            task16);
set sql_safe_updates = 1;

-- Task 17
CREATE VIEW task17 AS
    SELECT 
        k.ma_khach_hang, k.ho_ten, k.ma_loai_khach
    FROM
        khach_hang AS k
            JOIN
        loai_khach AS l ON k.ma_loai_khach = l.ma_loai_khach
            JOIN
        hop_dong AS h ON k.ma_khach_hang = h.ma_khach_hang
            JOIN
        dich_vu AS d ON h.ma_dich_vu = h.ma_dich_vu
            JOIN
        hop_dong_chi_tiet AS hdct ON h.ma_hop_dong = hdct.ma_hop_dong
            JOIN
        dich_vu_di_kem AS dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
    WHERE
        l.ten_loai_khach = 'Platininum'
    GROUP BY k.ma_khach_hang
    HAVING SUM(d.chi_phi_thue + IFNULL(so_luong * gia, 0)) > 10000000;

set sql_safe_updates = 0;
UPDATE loai_khach 
SET 
    ten_loai_khach = 'Platinum'
WHERE
    ten_loai_khach = 'Platininum';
set sql_safe_updates = 1;


UPDATE khach_hang 
SET 
    ma_loai_khach = 1
WHERE
    ma_khach_hang = (SELECT 
            ma_khach_hang
        FROM
            task17
            );


-- Task 18.
alter table khach_hang 
add column deleted boolean default false;

set sql_safe_updates = 0;
UPDATE khach_hang 
SET 
    deleted = TRUE
WHERE
    ma_khach_hang IN (SELECT 
            ma_khach_hang
        FROM
            hop_dong
        WHERE
            YEAR(ngay_lam_hop_dong) < 2021);
set sql_safe_updates = 1;

-- Task 19
CREATE VIEW temp AS
    SELECT 
        dvdk.ma_dich_vu_di_kem
    FROM
        dich_vu_di_kem AS dvdk
            JOIN
        hop_dong_chi_tiet AS hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
            JOIN
        hop_dong AS h ON hdct.ma_hop_dong = h.ma_hop_dong
    WHERE
        YEAR(h.ngay_lam_hop_dong) = 2020
    GROUP BY ma_hop_dong_chi_tiet
    HAVING SUM(so_luong) > 10;
    
RENAME TABLE temp 
TO task19;

UPDATE dich_vu_di_kem 
SET 
    gia = gia * 2
WHERE ma_dich_vu_di_kem = (
		SELECT 
           ma_dich_vu_di_kem
           from temp
);

-- Task 20
create view v_person_info as 
select ma_nhan_vien as 'ma so', ho_ten as 'ho ten', email, so_dien_thoai as 'so dien thoai', 
ngay_sinh as 'ngay sinh', dia_chi as 'dia chi'
from nhan_vien
union all
select ma_khach_hang, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang;
select * from v_person_info;


