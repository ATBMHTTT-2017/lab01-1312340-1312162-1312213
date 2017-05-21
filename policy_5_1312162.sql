--Policy 05 - DAC
-- chi truong phong, trý?ng chi nhánh ðý?c c?p quy?n th?c thi stored procedure c?p nh?t thông tin ph?ng ban c?a m?nh (DAC).
connect tbmg/123456;
-- cap quyen thuc thi stored procedure cho TRUONG PHONG VA TRUONG CHI NHANH
GRANT EXECUTE ON UPDATE_PB TO TRUONGPHONG;
GRANT EXECUTE ON UPDATE_CN TO TRUONGCHINHANH;
-- tao procedue
create or replace  procedure UPDATE_PB( TP01 in varchar2, SoNV01 in int)
AS
numcheck number;
maphong varchar2(5);
BEGIN 
    select count(*) into numcheck from tbmg.PhongBan_162_213_340 where truongPhong = sys_context('userenv', 'session_user');
    IF (numcheck >0) THEN 
    Select macn into maphong from PhongBan_162_213_340 where truongPhong = sys_context('userenv', 'session_user');
    update PhongBan set tenPhong = TP01, soNhanVien = SoNV01 where truongPhong = sys_context('userenv', 'session_user');
end;

-- procedue update CN
create or replace  procedure UPDATE_CN(maPB01 in varchar2, TP01 in varchar2, SoNV01 in int)
AS
numcheck number;
macn varchar2(5);
BEGIN 
    select count(*) into numcheck from tbmg.ChiNhanh_162_213_340 where truongChiNhanh  = sys_context('userenv', 'session_user');
    IF (numcheck >0) THEN 
    BEGIN
    Select macn into macn from ChiNhanh_162_213_340 where truongChiNhanh = sys_context('userenv', 'session_user');
    update PhongBan set tenPhong = TP01, soNhanVien = SoNV01 where chiNhanh = macn and maPhong = maPB01;
    END;
end;





