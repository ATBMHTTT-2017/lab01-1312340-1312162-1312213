-- T?o CSDL:
Create table user_data1.NhanVien_162_213_340(
  maNV varchar2(5), 
  hoTen varchar2(50),
  diaChi varchar2(100),
  dienThoai varchar2(20),
  email varchar2(30),
  maPhong varchar2(5),
  chiNhanh varchar2(5),
  luong number,
  
  Primary Key (maNV)
);

Create table user_data1.ChiNhanh_162_213_340(
  maCN varchar2(5), 
  tenCN varchar2(50),
  truongChiNhanh varchar2(5),

  Primary Key (maCN)
);

Create table user_data1.PhongBan_162_213_340 (
  maPhong varchar2(5),
  tenPhong varchar2(50),
  truongPhong varchar2(5),
  ngayNhanChuc date,
  soNhanVien number,
  chiNhanh varchar2(5),
  
  Primary Key (maPhong)
);

Create table user_data1.DuAn_162_213_340(
  maDA varchar2(5),
  tenDA varchar2(50),
  kinhphi number,
  phongChuTri varchar2(5),
  truongDA varchar2(5),
  
  Primary Key (maDA)
);

Create table user_data1.ChiTieu_162_213_340(
  maChiTieu varchar2(5),
  tenChiTieu varchar2(50),
  soTien number,
  duAn varchar2(5),
  
  Primary Key (maChiTieu)
);

Create table user_data1.PhanCong_162_213_340(
  maNV varchar2(5),
  duAn varchar2(5),
  vaiTro varchar2(50),
  phuCap number,
  
  Primary Key (maNV,duAn)
);

Alter table user_data1.NHANVIEN_162_213_340 add foreign key (maPhong) references user_data1.PhongBanh_162_213_340(maPhong);
Alter table user_data1.NHANVIEN_162_213_340 add foreign key (chiNhanh) references user_data1.ChiNhanh_162_213_340(maCN);
Alter table user_data1.ChiNhanh_162_213_340 add foreign key (truongChiNhanh) references user_data1.NHANVIEN_162_213_340(maNV);
Alter table user_data1.PhongBanh_162_213_340 add foreign key (truongPhong) references user_data1.NHANVIEN_162_213_340(maNV);
Alter table user_data1.PhongBanh_162_213_340 add foreign key (chiNhanh) references user_data1.ChiNhanh_162_213_340(maCN);
Alter table user_data1.DuAn_162_213_340 add foreign key (phongChuTri) references user_data1.PhongBan_162_213_340(maPhong);
Alter table user_data1.DuAn_162_213_340 add foreign key (truongDA) references user_data1.NHANVIEN_162_213_340(maNV);
Alter table user_data1.ChiTieu_162_213_340 add foreign key (duAn) references user_data1.DuAn_162_213_340(maDA);
Alter table user_data1.PhanCong_162_213_340 add foreign key (maNV) references user_data1.NHANVIEN_162_213_340(maNV);
Alter table user_data1.PhanCong_162_213_340 add foreign key (duAn) references user_data1.DuAn_162_213_340(maDA);

INSERT INTO user_data1.NHANVIEN_162_213_340 VALUES ('NV001','PHAM VAN A','Vo van tan street','0123456789','abc1@gmail.com',NULL,NULL,'8000' );
INSERT INTO user_data1.NHANVIEN_162_213_340 VALUES ('NV002','PHAM VAN B','Vo van Ngan street','0123456789','abc2@gmail.com',NULL,NULL,8000 );
INSERT INTO user_data1.NHANVIEN_162_213_340 VALUES ('NV003','PHAM VAN C','Nguyen Trai street','0123456789','abc3@gmail.com',NULL,NULL,7000 );
INSERT INTO user_data1.NHANVIEN_162_213_340 VALUES ('NV004','NGUYEN MANH A','Nguyen Van Cu street','0123456789','abc4@gmail.com',NULL,NULL,5000 );
INSERT INTO user_data1.NHANVIEN_162_213_340 VALUES ('NV005','NGUYEN MANH B','To Hien Thanh street','0123456789','abc5@gmail.com',NULL,NULL,5000 );
INSERT INTO user_data1.NHANVIEN_162_213_340 VALUES ('NV006','PHAM VAN D','Vo van tan street','0123456789','abc6@gmail.com',NULL,NULL,'8000' );
INSERT INTO user_data1.NHANVIEN_162_213_340 VALUES ('NV007','PHAM VAN E','Vo van Ngan street','0123456789','abc7@gmail.com',NULL,NULL,8000 );
INSERT INTO user_data1.NHANVIEN_162_213_340 VALUES ('NV008','PHAM VAN F','Nguyen Trai street','0123456789','abc8@gmail.com',NULL,NULL,7000 );
INSERT INTO user_data1.NHANVIEN_162_213_340 VALUES ('NV009','NGUYEN MANH D','Nguyen Van Cu street','0123456789','abc9@gmail.com',NULL,NULL,5000 );
INSERT INTO user_data1.NHANVIEN_162_213_340 VALUES ('NV010','NGUYEN MANH E','To Hien Thanh street','0123456789','abc10@gmail.com',NULL,NULL,5000 );


INSERT INTO user_data1.PHONGBAN_162_213_340 VALUES ('PB001','ph?ng 1','NV001',NULL,3,'CN001' );
INSERT INTO user_data1.PHONGBAN_162_213_340 VALUES ('PB002','ph?ng 2','NV002',NULL,3,'CN002' );
INSERT INTO user_data1.PHONGBAN_162_213_340 VALUES ('PB003','ph?ng 3','NV003',NULL,4,'CN003' );
INSERT INTO user_data1.PHONGBAN_162_213_340 VALUES ('PB004','ph?ng 4','NV004',NULL,5,'CN004' );
INSERT INTO user_data1.PHONGBAN_162_213_340 VALUES ('PB005','ph?ng 5','NV005',NULL,6,'CN005' );

  
INSERT INTO user_data1.DUAN_162_213_340 VALUES ('DA001','D? án 1', 5000, 'PB001','NV001');
INSERT INTO user_data1.DUAN_162_213_340 VALUES ('DA002','D? án 2', 5000, 'PB002','NV002');
INSERT INTO user_data1.DUAN_162_213_340 VALUES ('DA003','D? án 3', 6000, 'PB003','NV003');
INSERT INTO user_data1.DUAN_162_213_340 VALUES ('DA004','D? án 4', 7000, 'PB004','NV004');
INSERT INTO user_data1.DUAN_162_213_340 VALUES ('DA005','D? án 5', 8000, 'PB005','NV005');

INSERT INTO user_data1.CHITIEU_162_213_340 VALUES ('CT001','Chi Tieu 1', 5000, 'DA001' );
INSERT INTO user_data1.CHITIEU_162_213_340 VALUES ('CT002','Chi Tieu 2', 5000, 'DA002' );
INSERT INTO user_data1.CHITIEU_162_213_340 VALUES ('CT003','Chi Tieu 3', 5000, 'DA003' );
INSERT INTO user_data1.CHITIEU_162_213_340 VALUES ('CT004','Chi Tieu 4', 5000, 'DA004' );
INSERT INTO user_data1.CHITIEU_162_213_340 VALUES ('CT005','Chi Tieu 5', 5000, 'DA005' );


INSERT INTO user_data1.PHANCONG_162_213_340 VALUES ('NV001','DA001','Nhân Viên', 500);
INSERT INTO user_data1.PHANCONG_162_213_340 VALUES ('NV002','DA002','Nhân Viên', 500);
INSERT INTO user_data1.PHANCONG_162_213_340 VALUES ('NV003','DA001','Nhân Viên', 500);
INSERT INTO user_data1.PHANCONG_162_213_340 VALUES ('NV004','DA004','Qu?n l?', 1500);
INSERT INTO user_data1.PHANCONG_162_213_340 VALUES ('NV005','DA005','Qu?n l?', 1500);

INSERT INTO user_data1.CHINHANH_162_213_340 VALUES ('CN001', 'Chi Nhánh 1', NULL);
INSERT INTO user_data1.CHINHANH_162_213_340 VALUES ('CN002', 'Chi Nhánh 2', NULL);
INSERT INTO user_data1.CHINHANH_162_213_340 VALUES ('CN003', 'Chi Nhánh 3', NULL);
INSERT INTO user_data1.CHINHANH_162_213_340 VALUES ('CN004', 'Chi Nhánh 4', NULL);
INSERT INTO user_data1.CHINHANH_162_213_340 VALUES ('CN005', 'Chi Nhánh 5', NULL);

UPDATE user_data1.NHANVIEN_162_213_340 SET MAPHONG = 'PB001' WHERE MANV= 'NV001';
UPDATE user_data1.NHANVIEN_162_213_340 SET MAPHONG = 'PB002' WHERE MANV= 'NV002';
UPDATE user_data1.NHANVIEN_162_213_340 SET MAPHONG = 'PB003' WHERE MANV= 'NV003';
UPDATE user_data1.NHANVIEN_162_213_340 SET MAPHONG = 'PB004' WHERE MANV= 'NV004';
UPDATE user_data1.NHANVIEN_162_213_340 SET MAPHONG = 'PB005' WHERE MANV= 'NV005';
UPDATE user_data1.NHANVIEN_162_213_340 SET MAPHONG = 'PB001' WHERE MANV= 'NV006';
UPDATE user_data1.NHANVIEN_162_213_340 SET MAPHONG = 'PB002' WHERE MANV= 'NV007';
UPDATE user_data1.NHANVIEN_162_213_340 SET MAPHONG = 'PB003' WHERE MANV= 'NV008';
UPDATE user_data1.NHANVIEN_162_213_340 SET MAPHONG = 'PB004' WHERE MANV= 'NV009';
UPDATE user_data1.NHANVIEN_162_213_340 SET MAPHONG = 'PB005' WHERE MANV= 'NV010';


UPDATE user_data1.NHANVIEN_162_213_340 SET CHINHANH = 'CN001' WHERE MANV= 'NV001';
UPDATE user_data1.NHANVIEN_162_213_340 SET CHINHANH = 'CN002' WHERE MANV= 'NV002';
UPDATE user_data1.NHANVIEN_162_213_340 SET CHINHANH = 'CN003' WHERE MANV= 'NV003';
UPDATE user_data1.NHANVIEN_162_213_340 SET CHINHANH = 'CN004' WHERE MANV= 'NV004';
UPDATE user_data1.NHANVIEN_162_213_340 SET CHINHANH = 'CN005' WHERE MANV= 'NV005';
UPDATE user_data1.NHANVIEN_162_213_340 SET CHINHANH = 'CN001' WHERE MANV= 'NV006';
UPDATE user_data1.NHANVIEN_162_213_340 SET CHINHANH = 'CN002' WHERE MANV= 'NV007';
UPDATE user_data1.NHANVIEN_162_213_340 SET CHINHANH = 'CN003' WHERE MANV= 'NV008';
UPDATE user_data1.NHANVIEN_162_213_340 SET CHINHANH = 'CN004' WHERE MANV= 'NV009';
UPDATE user_data1.NHANVIEN_162_213_340 SET CHINHANH = 'CN005' WHERE MANV= 'NV010';


 UPDATE user_data1.CHINHANH_162_213_340 SET TRUONGCHINHANH = 'NV001' WHERE MACN ='CN001';
 UPDATE user_data1.CHINHANH_162_213_340 SET TRUONGCHINHANH = 'NV002' WHERE MACN ='CN002';
 UPDATE user_data1.CHINHANH_162_213_340 SET TRUONGCHINHANH = 'NV003' WHERE MACN ='CN003';
 UPDATE user_data1.CHINHANH_162_213_340 SET TRUONGCHINHANH = 'NV004' WHERE MACN ='CN004';
 UPDATE user_data1.CHINHANH_162_213_340 SET TRUONGCHINHANH = 'NV005' WHERE MACN ='CN005';

