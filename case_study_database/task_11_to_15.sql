use case_study_database;
-- Task 11
SELECT 
    dvdk.ma_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi
FROM
    dich_vu_di_kem AS dvdk
        JOIN
    hop_dong_chi_tiet AS hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
        JOIN
    hop_dong AS h ON hdct.ma_hop_dong = h.ma_hop_dong
        JOIN
    khach_hang AS k ON h.ma_khach_hang = k.ma_khach_hang
        JOIN
    loai_khach AS l ON k.ma_loai_khach = l.ma_loai_khach
WHERE
    l.ten_loai_khach = 'Diamond'
        AND (k.dia_chi LIKE '% Vinh'
        OR k.dia_chi LIKE '% Quảng Ngãi')
GROUP BY dvdk.ma_dich_vu_di_kem;

-- Task 12
SELECT 
    h.ma_hop_dong,
    n.ho_ten AS 'tên nhân viên',
    k.ho_ten 'tên khách hàng',
    k.so_dien_thoai 'sdt khách hàng',
    h.ma_dich_vu,
    d.ten_dich_vu,
    IFNULL(SUM(hdct.so_luong), 0) AS so_luong_dich_vu_di_kem,
    IFNULL(h.tien_dat_coc, 0) AS tien_dat_coc
FROM
    hop_dong AS h
        LEFT JOIN
    nhan_vien AS n ON h.ma_nhan_vien = n.ma_nhan_vien
        LEFT JOIN
    khach_hang AS k ON h.ma_khach_hang = k.ma_khach_hang
        LEFT JOIN
    dich_vu AS d ON h.ma_dich_vu = d.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet AS hdct ON h.ma_hop_dong = hdct.ma_hop_dong
WHERE
    YEAR(ngay_lam_hop_dong) = 2020
        AND QUARTER(ngay_lam_hop_dong) = 4
GROUP BY h.ma_hop_dong
HAVING h.ma_hop_dong NOT IN (SELECT 
        ma_hop_dong
    FROM
        hop_dong
    WHERE
        YEAR(ngay_lam_hop_dong) = 2021
            AND MONTH(ngay_lam_hop_dong) <= 6)
ORDER BY ma_hop_dong;

 -- Task 13
SELECT 
    dvdk.ma_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem,
    SUM(hdct.so_luong) AS so_luong_dich_vu_di_kem
FROM
    dich_vu_di_kem AS dvdk
        JOIN
    hop_dong_chi_tiet AS hdct 
    ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY dvdk.ma_dich_vu_di_kem
HAVING so_luong_dich_vu_di_kem = (SELECT 
        SUM(so_luong)
    FROM
        hop_dong_chi_tiet
    GROUP BY ma_hop_dong_chi_tiet
    ORDER BY SUM(so_luong) DESC
    LIMIT 1);
 
 -- Task 14
SELECT 
    h.ma_hop_dong,
    l.ten_loai_dich_vu,
    ten_dich_vu_di_kem,
    COUNT(hdct.ma_dich_vu_di_kem) AS so_lan_su_dung
FROM
    hop_dong AS h
        JOIN
    dich_vu AS dv ON h.ma_dich_vu = dv.ma_dich_vu
        JOIN
    loai_dich_vu AS l ON dv.ma_loai_dich_vu = l.ma_loai_dich_vu
        JOIN
    hop_dong_chi_tiet AS hdct ON h.ma_hop_dong = hdct.ma_hop_dong
        JOIN
    dich_vu_di_kem AS dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY dvdk.ma_dich_vu_di_kem
HAVING COUNT(hdct.ma_dich_vu_di_kem) = 1
ORDER BY h.ma_hop_dong;

-- Task 15
SELECT 
    n.ma_nhan_vien,
    n.ho_ten,
    trinh_do.ten_trinh_do,
    bo_phan.ten_bo_phan,
    n.so_dien_thoai,
    n.dia_chi,
    COUNT(h.ma_nhan_vien)
FROM
    nhan_vien AS n
        JOIN
    trinh_do ON n.ma_trinh_do = trinh_do.ma_trinh_do
        JOIN
    bo_phan ON n.ma_bo_phan = bo_phan.ma_bo_phan
        JOIN
    hop_dong AS h ON n.ma_nhan_vien = h.ma_nhan_vien
WHERE
    YEAR(ngay_lam_hop_dong) BETWEEN 2020 AND 2021
GROUP BY h.ma_nhan_vien
HAVING COUNT(h.ma_nhan_vien) < 4
ORDER BY n.ma_nhan_vien;