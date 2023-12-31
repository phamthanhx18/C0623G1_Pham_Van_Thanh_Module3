CREATE DATABASE case_study_database;
USE case_study_database;
CREATE TABLE vi_tri (
    ma_vi_tri INT PRIMARY KEY AUTO_INCREMENT,
    ten_vi_tri VARCHAR(45)
);
CREATE TABLE trinh_do (
    ma_trinh_do INT PRIMARY KEY AUTO_INCREMENT,
    ten_trinh_do VARCHAR(45)
);
CREATE TABLE bo_phan (
    ma_bo_phan INT PRIMARY KEY AUTO_INCREMENT,
    ten_bo_phan VARCHAR(45)
);
CREATE TABLE nhan_vien (
    ma_nhan_vien INT PRIMARY KEY AUTO_INCREMENT,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL UNIQUE,
    luong DOUBLE NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL UNIQUE,
    email VARCHAR(45) UNIQUE,
    dia_chi VARCHAR(45),
    ma_vi_tri INT NOT NULL,
    ma_trinh_do INT NOT NULL,
    ma_bo_phan INT NOT NULL,
    FOREIGN KEY(ma_vi_tri) REFERENCES vi_tri(ma_vi_tri),
    FOREIGN KEY(ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
    FOREIGN KEY(ma_bo_phan) REFERENCES bo_phan(ma_bo_phan)
);
CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_khach VARCHAR(45)
);
CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY AUTO_INCREMENT,
    ma_loai_khach INT NOT NULL,
    FOREIGN KEY(ma_loai_khach) REFERENCES loai_khach(ma_loai_khach),
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    gioi_tinh BIT NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    dia_chi VARCHAR(45)
);
CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_dich_vu VARCHAR(45)
);
CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY AUTO_INCREMENT,
    ten_kieu_thue VARCHAR(45)
);
CREATE TABLE dich_vu (
    ma_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu VARCHAR(45) NOT NULL,
    dien_tich INT NOT NULL,
    chi_phi_thue INT NOT NULL,
	so_nguoi_toi_da INT NOT NULL,
    ma_kieu_thue INT NOT NULL,
    FOREIGN KEY(ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue),
    ma_loai_dich_vu INT NOT NULL,
    FOREIGN KEY(ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu),
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    dich_vu_mien_phi_di_kem TEXT
);
CREATE TABLE hop_dong (
    ma_hop_dong INT PRIMARY KEY AUTO_INCREMENT,
    ngay_lam_hop_dong DATETIME NOT NULL,
    ngay_ket_thuc DATETIME NOT NULL,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT NOT NULL,
    FOREIGN KEY(ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien),
    ma_khach_hang INT NOT NULL,
    FOREIGN KEY(ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
    ma_dich_vu INT NOT NULL,
    FOREIGN KEY(ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);
CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
    gia DOUBLE NOT NULL,
    don_vi VARCHAR(10) NOT NULL,
    trang_thai VARCHAR(45)
);
CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT PRIMARY KEY AUTO_INCREMENT,
    ma_hop_dong INT NOT NULL,
    FOREIGN KEY(ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
    ma_dich_vu_di_kem INT NOT NULL,
    FOREIGN KEY(ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem),
    so_luong INT NOT NULL
);

INSERT INTO vi_tri (ten_vi_tri)
VALUES
('Quản Lý'),
('Nhân Viên')
;

INSERT INTO trinh_do (ten_trinh_do)
VALUES
('Trung Cấp'),
('Cao Đẳng'),
('Đại Học'),
('Sau Đại Học')
;

INSERT INTO bo_phan (ten_bo_phan)
VALUES
('Sale-Marketing'),
('Hành chính'),
('Phục vụ'),
('Quản lý')
;

INSERT INTO nhan_vien (ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
VALUES
('Nguyễn Văn An', '1970-11-07', '456231786', '10000000', '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', '1', '3', '1'),
('Lê Văn Bình', '1997-04-09', '654231234', '7000000', '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', '1', '2', '2'), 
('Hồ Thị Yến', '1995-12-12', '999231723', '14000000', '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', '1', '3', '2'), 
('Võ Công Toản', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', '1', '4', '4'), 
('Nguyễn Bỉnh Phát', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', '2', '1', '1'), 
('Khúc Nguyễn An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', '2', '2', '3'), 
('Nguyễn Hữu Hà', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', '2', '3', '2'), 
('Nguyễn Hà Đông', '1989-09-03', '234414123', '9000000', '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', '2', '4', '4'), 
('Tòng Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', '2', '4', '4'), 
('Nguyễn Công Đạo', '1994-01-08', '755434343', '8000000', '0988767111','nguyencongdao12@gmail.com','6 Hoà Khánh, Đồng Nai','2','3','2');

INSERT INTO loai_khach (ten_loai_khach)
VALUES
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member')
;

INSERT INTO khach_hang (ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_loai_khach)
VALUES 
('Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng', 5),
('Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị', 3),
('Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh', 1),
('Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng', 1),
('Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai', 4),
('Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng', 4),
('Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh', 1),
('Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum', 3),
('Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi', 1),
('Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng', 2);

INSERT INTO kieu_thue (ten_kieu_thue)
VALUES
('year'),
('month'),
('day'),
('hour')
;

INSERT INTO loai_dich_vu (ten_loai_dich_vu)
VALUES
('Villa'),
('House'),
('Room')
;

INSERT INTO dich_vu (ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, dich_vu_mien_phi_di_kem, ma_kieu_thue, ma_loai_dich_vu)
VALUES
('Villa Beach Front','25000','1000000','10','vip','Có hồ bơi','500','4',null,'3','1'),
('House Princess 01','14000','5000000','7','vip','Có thêm bếp nướng',null,'3',null,'2','2'),
('Room Twin 01','5000','1000000','2','normal','Có tivi',null,null,'1 Xe máy, 1 Xe đạp','4','3'),
('Villa No Beach Front','22000','9000000','8','normal','Có hồ bơi','300','3',null,'3','1'),
('House Princess 02','10000','4000000','5','normal','Có thêm bếp nướng',null,'2',null,'3','2'),
('Room Twin 02','3000','900000','2','normal','Có tivi',null,null,'1 Xe máy','4','3')
;

INSERT INTO dich_vu_di_kem (ten_dich_vu_di_kem, gia, don_vi, trang_thai)
VALUES
('Karaoke','10000','giờ','tiện nghi , hiện tại'),
('Thuê xe máy','10000','chiếc','hỏng 1 xe'),
('Thuê xe đạp','20000','chiếc','tốt'),
('Buffet buổi sáng','15000','suất','đầy đủ đồ ăn , tráng miệng'),
('Buffet buổi trưa','90000','suất','đầy đủ đồ ăn , tráng miệng'),
('Buffet buổi tối','16000','suất','đầy đủ đồ ăn , tráng miệng')
;

INSERT INTO hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
VALUES
('2020-12-08','2020-12-08','0','3','1','3'),
('2020-07-14','2020-07-21','200000','7','3','1'),
('2021-03-15','2021-03-17','50000','3','4','2'),
('2021-01-14','2021-01-18','100000','7','5','5'),
('2021-07-14','2021-07-15','0','7','2','6'),
('2021-06-01','2021-06-03','0','7','7','6'),
('2021-09-02','2021-09-05','100000','7','4','4'),
('2021-06-17','2021-06-18','150000','3','4','1'),
('2020-11-19','2020-11-19','0','3','4','3'),
('2021-04-12','2021-04-14','0','10','3','5'),
('2021-04-25','2021-04-25','0','2','2','1'),
('2021-05-25','2021-05-27','0','7','10','1')
;

INSERT INTO hop_dong_chi_tiet (so_luong, ma_hop_dong, ma_dich_vu_di_kem)
VALUES
('5','2','4'),
('8','2','5'),
('15','2','6'),
('1','3','1'),
('11','3','2'),
('1','1','3'),
('2','1','2'),
('2','12','2')
;

-- 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT 
    *
FROM
    nhan_vien
WHERE
    SUBSTRING_INDEX(ho_ten, ' ', - 1) LIKE 'H%'
        OR SUBSTRING_INDEX(ho_ten, ' ', - 1) LIKE 'T%'
        OR SUBSTRING_INDEX(ho_ten, ' ', - 1) LIKE 'K%'
        AND LENGTH(ho_ten) <= 15;

-- 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT 
    *
FROM
    khach_hang
WHERE
    DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), ngay_sinh)),
            '%Y') BETWEEN 18 AND 50
        AND dia_chi LIKE '%Đà Nẵng'
        OR dia_chi LIKE '%Quảng Trị';
        
-- 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

SELECT 
    khach_hang.ma_khach_hang,
    khach_hang.ho_ten,
    loai_khach.ten_loai_khach,
    COUNT(hop_dong.ma_khach_hang) AS count
FROM
    khach_hang
        JOIN
    hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
        JOIN
    loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
WHERE
    loai_khach.ten_loai_khach = 'Diamond'
GROUP BY khach_hang.ma_khach_hang;

-- 5. Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    (IFNULL(dv.chi_phi_thue, 0) + SUM(IFNULL(hct.so_luong, 0) * IFNULL(dvdk.gia, 0))) AS tong_tien
FROM
    khach_hang kh
        JOIN
    loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
        LEFT JOIN
    hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
        LEFT JOIN
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet hct ON hd.ma_hop_dong = hct.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem dvdk ON hct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY hd.ma_hop_dong , kh.ma_khach_hang
ORDER BY kh.ma_khach_hang ASC , hd.ma_hop_dong DESC
;

-- 6. Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của 
-- tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
SELECT 
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu dv
        JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE
    dv.ma_dich_vu NOT IN (SELECT ma_dich_vu
FROM hop_dong
WHERE ngay_lam_hop_dong BETWEEN "2021-01-01" AND now()
);



-- 7. Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.


SELECT DISTINCT
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu dv
        JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
        JOIN
    hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
WHERE
    YEAR(hd.ngay_lam_hop_dong) = 2020
        AND dv.ma_dich_vu NOT IN (SELECT 
            ma_dich_vu
        FROM
            hop_dong
        WHERE
            YEAR(ngay_lam_hop_dong) = 2021)
;

-- 8. Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
SELECT DISTINCT ho_ten
FROM khach_hang;

-- Cách 2:

SELECT ho_ten
FROM khach_hang
GROUP BY ho_ten;

-- Cách 3:

SELECT ho_ten
FROM khach_hang
WHERE ma_khach_hang IN (
    SELECT DISTINCT ma_khach_hang
    FROM khach_hang
);

-- 9. Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT 
    MONTH(hd.ngay_lam_hop_dong) AS 'Tháng',
    COUNT(hd.ma_khach_hang) AS 'SL'
FROM
    hop_dong hd
        JOIN
    khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
WHERE
    YEAR(hd.ngay_lam_hop_dong) = 2021
GROUP BY MONTH(hd.ngay_lam_hop_dong)
ORDER BY MONTH(hd.ngay_lam_hop_dong) ASC;

-- 10. Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong,
-- ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

SELECT 
    hd.ma_hop_dong,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    hd.tien_dat_coc,
    SUM(hdct.so_luong)
FROM
    hop_dong hd
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
GROUP BY hd.ma_hop_dong
;

-- 11. Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

SELECT 
    dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
FROM
    hop_dong_chi_tiet hdct
        JOIN
    hop_dong hd ON hdct.ma_hop_dong = hd.ma_hop_dong
        JOIN
    khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
        JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
WHERE
    kh.ma_khach_hang IN (SELECT 
            kh.ma_khach_hang
        FROM
            khach_hang kh
                JOIN
            loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
        WHERE
            kh.dia_chi LIKE '%Vinh'
                OR kh.dia_chi LIKE '%Quảng Ngãi'
                AND lk.ten_loai_khach = 'Diamond');

-- 12. Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3
--  tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

SELECT 
    hd.ma_hop_dong,
    nv.ho_ten,
    kh.ho_ten,
    kh.so_dien_thoai,
    dv.ten_dich_vu,
    SUM(IFNULL(hdct.so_luong, 0)) AS 'SL'
FROM
    hop_dong hd
        JOIN
    nhan_vien nv ON hd.ma_nhan_vien = nv.ma_nhan_vien
        JOIN
    khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
        JOIN
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
WHERE
    MONTH(hd.ngay_lam_hop_dong) BETWEEN 10 AND 12
        AND YEAR(hd.ngay_lam_hop_dong) = 2020
        AND MONTH(hd.ngay_lam_hop_dong) NOT IN (SELECT 
            hd.ma_dich_vu
        FROM
            hop_dong hd
        WHERE
            MONTH(hd.ngay_lam_hop_dong) BETWEEN 1 AND 6
                AND YEAR(hd.ngay_lam_hop_dong) = 2021)
GROUP BY hd.ma_hop_dong;

-- 13. Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

SELECT 
    dvdk.ten_dich_vu_di_kem,
    SUM(hdct.so_luong) AS 'SL'
FROM
    dich_vu_di_kem dvdk
        JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY dvdk.ten_dich_vu_di_kem
HAVING SUM(hdct.so_luong) IN (SELECT 
        MAX(data.sum)
    FROM
        (SELECT 
            SUM(hdct.so_luong) AS sum
        FROM
            dich_vu_di_kem dvdk
        JOIN hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        GROUP BY hdct.ma_dich_vu_di_kem) AS data);
        
-- 14. Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
SET sql_mode = 0;
SELECT 
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    dvdk.ten_dich_vu_di_kem,
    COUNT(hdct.ma_dich_vu_di_kem) AS 'So Lan Da Su Dung'
FROM
    hop_dong hd
        JOIN
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY hdct.ma_dich_vu_di_kem
HAVING COUNT(hdct.ma_dich_vu_di_kem) = 1
ORDER BY hd.ma_hop_dong;

-- 15. Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.


SELECT 
    nv.ma_nhan_vien,
    nv.ho_ten,
    td.ten_trinh_do,
    bp.ten_bo_phan,
    nv.so_dien_thoai,
    nv.dia_chi,
    COUNT(hd.ma_nhan_vien) AS "SL"
FROM
    hop_dong hd
        JOIN
    nhan_vien nv ON hd.ma_nhan_vien = nv.ma_nhan_vien
        JOIN
    bo_phan bp ON nv.ma_bo_phan = bp.ma_bo_phan
        JOIN
    trinh_do td ON nv.ma_trinh_do = td.ma_trinh_do
WHERE
    YEAR(hd.ngay_lam_hop_dong) BETWEEN 2020 AND 2021
GROUP BY hd.ma_nhan_vien
HAVING COUNT(hd.ma_nhan_vien) <= 3
ORDER BY hd.ma_nhan_vien;

-- 16. Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
DELETE FROM nhan_vien 
WHERE
    ma_nhan_vien NOT IN (SELECT 
        hd.ma_nhan_vien
    FROM
        hop_dong hd
            JOIN
        nhan_vien nv ON hd.ma_nhan_vien = nv.ma_nhan_vien
    
    WHERE
        YEAR(hd.ngay_lam_hop_dong) BETWEEN 2019 AND 2021
    GROUP BY hd.ma_nhan_vien);
    
-- 17. Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 1.000.000 VNĐ.
-- (Chi Phí Thuê + Số Lượng * Giá)

UPDATE khach_hang kh 
SET 
    ma_loai_khach = (SELECT 
            ma_loai_khach
        FROM
            loai_khach
        WHERE
            ten_loai_khach = 'Diamond')
WHERE
    kh.ma_khach_hang IN (SELECT 
            custom.ma_khach_hang
        FROM
            (SELECT 
                kh.ma_khach_hang,
                    kh.ho_ten,
                    lk.ten_loai_khach,
                    (IFNULL(dv.chi_phi_thue, 0) + SUM(IFNULL(hdct.so_luong, 0) * IFNULL(dvdk.gia, 0))) AS tong_tien
            FROM
                khach_hang kh
            JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
            JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
            JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
            JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
            JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
            WHERE
                lk.ten_loai_khach = 'Platinium'
                    AND YEAR(hd.ngay_lam_hop_dong) = 2021
            GROUP BY kh.ma_khach_hang) AS custom
        WHERE
            custom.tong_tien > 1000000);
            
-- 18. Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS = 1;

DELETE FROM hop_dong
WHERE ma_khach_hang IN (
    SELECT kh.ma_khach_hang
    FROM (
        SELECT hd.ma_khach_hang
        FROM hop_dong hd
        WHERE YEAR(hd.ngay_lam_hop_dong) < 2021
    ) AS kh
);

DELETE FROM khach_hang
WHERE ma_khach_hang IN (
    SELECT kh.ma_khach_hang
    FROM (
        SELECT hd.ma_khach_hang
        FROM hop_dong hd
        WHERE YEAR(hd.ngay_lam_hop_dong) < 2021
    ) AS kh
);


SET SQL_SAFE_UPDATES = 1;
SET FOREIGN_KEY_CHECKS = 1;

-- 19. Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
UPDATE dich_vu_di_kem
SET gia = gia * 2
WHERE ma_dich_vu_di_kem IN (
    SELECT ma_dich_vu_di_kem
    FROM hop_dong_chi_tiet hdct
    JOIN hop_dong hd
    ON hdct.ma_hop_dong = hd.ma_hop_dong
    WHERE YEAR(ngay_lam_hop_dong) = 2020
    AND so_luong > 10
    GROUP BY ma_dich_vu_di_kem
);

-- Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
SELECT 
    ma_nhan_vien AS id,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM
    nhan_vien 
UNION
	SELECT 
    ma_khach_hang AS id,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM
    khach_hang;
    
-- 21. Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên
-- có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
CREATE VIEW v_nhan_vien AS
    SELECT 
        nv.ma_nhan_vien,
        nv.ho_ten,
        nv.email,
        nv.so_dien_thoai,
        nv.ngay_sinh,
        nv.dia_chi
    FROM
        nhan_vien nv
            JOIN
        hop_dong hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
    WHERE
        nv.dia_chi LIKE '%Đà Nẵng%'
            AND hd.ngay_lam_hop_dong = '2021-04-25'
            ;

DROP view v_nhan_vien;

SET SQL_SAFE_UPDATES = 0;
SELECT * FROM v_nhan_vien;

-- 22. Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành
--  “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
UPDATE v_nhan_vien 
SET 
    dia_chi = 'Liên Chiểu';
    
-- 23. Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với 
-- ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
DELIMITER //
CREATE PROCEDURE sp_xoa_khach_hang (
	ma_khach_hang VARCHAR(45)
)
BEGIN
	DELETE FROM khach_hang
    WHERE ma_khach_hang = ma_khach_hang;
END //
DELIMITER ;

-- 24. Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu
-- sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không
-- được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.

DELIMITER //
CREATE PROCEDURE sp_them_moi_hop_dong (
	ma_hd INT,
    ngay_lam_hd DATETIME,
    ngay_ket_thuc_hd DATETIME,
    tien_dat_coc_hd DOUBLE,
    ma_nhan_vien_hd INT,
    ma_khach_hang_hd INT,
    ma_dich_vu_hd INT
)
BEGIN
	IF(ma_hd IN (select ma_hop_dong from hop_dong)) 
	THEN  
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Ma hop dong da ton tai';
	END IF;
    
	IF(tien_dat_coc_hd < 0) 
	THEN  
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Tien dat coc khong duoc la so am';
	END IF;
    
	IF(ma_nhan_vien_hd NOT IN (select ma_nhan_vien from nhan_vien)) 
	THEN  
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'ID nhan vien khong dung';
	END IF;
    
	IF(ma_khach_hang_hd NOT IN (select ma_khach_hang from khach_hang)) 
	THEN  
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'ID khach hang khong dung';
	END IF;
    
	IF(ma_dich_vu_hd NOT IN (select ma_dich_vu from dich_vu)) 
	THEN  
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Dich vu nay khong co trong he thong';
	END IF;
    
    INSERT INTO hop_dong (ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
	VALUES (ma_hd, ngay_lam_hd, ngay_ket_thuc_hd, tien_dat_coc_hd, ma_nhan_vien_hd, ma_khach_hang_hd, ma_dich_vu_hd);
END //
DELIMITER ;
DROP PROCEDURE sp_them_moi_hop_dong;
call sp_them_moi_hop_dong(14,'2020-12-08','2020-12-08','5000','1','1','3');

-- 25. Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị 
-- tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.

DELIMITER //
CREATE TRIGGER tr_xoa_hop_dong
AFTER DELETE ON hop_dong
FOR EACH ROW
BEGIN
    DECLARE total_count INT;
    SELECT COUNT(*) INTO total_count FROM hop_dong;
    SET @message = CONCAT('Số lượng bản ghi còn lại bảng là: ', total_count);
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = @message;
END //
DELIMITER ;

DROP TRIGGER tr_xoa_hop_dong;

DELETE FROM hop_dong WHERE ma_hop_dong = 14;

