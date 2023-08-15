use case_study_database;
-- Task 6 
SELECT 
    d.ma_dich_vu,
    d.ten_dich_vu,
    d.dien_tich,
    d.chi_phi_thue,
    l.ten_loai_dich_vu
FROM
    dich_vu AS d
        JOIN
    loai_dich_vu AS l ON d.ma_loai_dich_vu = l.ma_loai_dich_vu
        JOIN
    hop_dong AS h ON d.ma_dich_vu = h.ma_dich_vu
WHERE
    h.ma_dich_vu NOT IN (SELECT 
            h.ma_dich_vu
        FROM
            hop_dong AS h
        WHERE
            YEAR(h.ngay_lam_hop_dong) >= 2021
                AND MONTH(h.ngay_lam_hop_dong) < 4)
GROUP BY h.ma_dich_vu;

-- Task 7
SELECT 
    d.ma_dich_vu,
    d.ten_dich_vu,
    d.dien_tich,
    d.so_nguoi_toi_da,
    d.chi_phi_thue,
    l.ten_loai_dich_vu
FROM
    dich_vu AS d
        JOIN
    loai_dich_vu AS l ON d.ma_loai_dich_vu = l.ma_loai_dich_vu
        JOIN
    hop_dong AS h ON d.ma_dich_vu = h.ma_dich_vu
WHERE
    YEAR(h.ngay_lam_hop_dong) = 2020
GROUP BY d.ma_dich_vu
HAVING d.ma_dich_vu NOT IN (SELECT 
        ma_dich_vu
    FROM
        hop_dong
    WHERE
        YEAR(ngay_lam_hop_dong) = 2021)
ORDER BY d.ma_dich_vu;


-- Task 8 
-- *Cach 1
SELECT DISTINCT
    ho_ten
FROM
    khach_hang;
-- *Cach 2
SELECT 
    ho_ten
FROM
    khach_hang
GROUP BY ho_ten;
-- *Cach 3
SELECT 
    ho_ten
FROM
    khach_hang
HAVING COUNT(ho_ten);

-- Task 9
SELECT 
    MONTH(ngay_lam_hop_dong) AS `Month`,
    COUNT(ma_khach_hang) AS `Contracts`
FROM
    hop_dong
WHERE
    YEAR(ngay_lam_hop_dong) = 2021
GROUP BY MONTH(ngay_lam_hop_dong)
ORDER BY MONTH(ngay_lam_hop_dong);

-- Task 10
 SELECT 
    h.ma_hop_dong,
    h.ngay_lam_hop_dong,
    h.ngay_ket_thuc,
    h.tien_dat_coc,
    SUM(hdct.so_luong) AS so_luong_dich_vu_di_kem
FROM
    hop_dong AS h
        LEFT JOIN
    hop_dong_chi_tiet AS hdct ON h.ma_hop_dong = hdct.ma_hop_dong
GROUP BY h.ma_hop_dong
ORDER BY h.ma_hop_dong;