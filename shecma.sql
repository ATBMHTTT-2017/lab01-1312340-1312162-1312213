-- Tao user : 
CREATE USER TBMG  IDENTIFIED BY 123456 ;
--- Gan quyen admin cho user TBMG
GRANT CONNECT to TBMG;
-- Gan quyen admin cho TBMG
GRANT ALL PRIVILEGES to TBMG  IDENTIFIED BY 123456 ;
-- Tao CSDL:
Create table TBMG.NhanVien_162_213_340(
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

Create table TBMG.ChiNhanh_162_213_340(
  maCN varchar2(5), 
  tenCN varchar2(50),
  truongChiNhanh varchar2(5),

  Primary Key (maCN)
);

Create table TBMG.PhongBan_162_213_340 (
  maPhong varchar2(5),
  tenPhong varchar2(50),
  truongPhong varchar2(5),
  ngayNhanChuc date,
  soNhanVien number,
  chiNhanh varchar2(5),
  
  Primary Key (maPhong)
);

Create table TBMG.DuAn_162_213_340(
  maDA varchar2(5),
  tenDA varchar2(50),
  kinhphi number,
  phongChuTri varchar2(5),
  truongDA varchar2(5),
  
  Primary Key (maDA)
);

Create table TBMG.ChiTieu_162_213_340(
  maChiTieu varchar2(5),
  tenChiTieu varchar2(50),
  soTien number,
  duAn varchar2(5),
  
  Primary Key (maChiTieu)
);

Create table TBMG.PhanCong_162_213_340(
  maNV varchar2(5),
  duAn varchar2(5),
  vaiTro varchar2(50),
  phuCap number,
  
  Primary Key (maNV,duAn)
);

Alter table TBMG.NHANVIEN_162_213_340 add foreign key (maPhong) references TBMG.PhongBan_162_213_340(maPhong);
Alter table TBMG.NHANVIEN_162_213_340 add foreign key (chiNhanh) references TBMG.ChiNhanh_162_213_340(maCN);
Alter table TBMG.ChiNhanh_162_213_340 add foreign key (truongChiNhanh) references TBMG.NHANVIEN_162_213_340(maNV);
Alter table TBMG.PhongBanh_162_213_340 add foreign key (truongPhong) references TBMG.NHANVIEN_162_213_340(maNV);
Alter table TBMG.PhongBanh_162_213_340 add foreign key (chiNhanh) references TBMG.ChiNhanh_162_213_340(maCN);
Alter table TBMG.DuAn_162_213_340 add foreign key (phongChuTri) references TBMG.PhongBan_162_213_340(maPhong);
Alter table TBMG.DuAn_162_213_340 add foreign key (truongDA) references TBMG.NHANVIEN_162_213_340(maNV);
Alter table TBMG.ChiTieu_162_213_340 add foreign key (duAn) references TBMG.DuAn_162_213_340(maDA);
Alter table TBMG.PhanCong_162_213_340 add foreign key (maNV) references TBMG.NHANVIEN_162_213_340(maNV);
Alter table TBMG.PhanCong_162_213_340 add foreign key (duAn) references TBMG.DuAn_162_213_340(maDA);

