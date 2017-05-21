
--08--- Tr�?ng ph?ng ch? ��?c ph�p �?c th�ng tin chi ti�u c?a d? �n trong ph?ng ban m?nh qu?n l?. 
--V?i nh?ng d? �n kh�ng thu?c ph?ng ban c?a m?nh c�c tr�?ng ph?ng ��?c ph�p xem th�ng tin chi ti�u nh�ng kh�ng ��?c ph�p xem s? ti?n c? th? (VPD). (MSSV)
--
connect tbmg/123456;
-- tao policy  
CREATE or replace  FUNCTION TRUONGPHG_func2 (object_schema  varchar2, object_name  varchar2)
RETURN varchar2
AS
USERNAME varchar2(10);
r_MaDA varchar2(10);
numcheck number;
BEGIN 
    select count(*) into numcheck from tbmg.PhongBan_162_213_340 where truongPhong = sys_context('userenv', 'session_user');
    IF (numcheck >0) THEN
       BEGIN
        select maDA INTO r_MaDA from DuAn_162_213_340 where phongChuTri in 
                                        (select maPhong from PhongBan_162_213_340 where truongPhong = sys_context('userenv', 'session_user'));
         RETURN 'duAn='|| q'[']' || r_MaDA || q'[']';
       END;    
     END IF;
    EXCEPTION
      WHEN OTHERS THEN RETURN '1 = 0';
END;
-- Them chinh sach
begin dbms_rls.add_policy(
  object_schema => 'tbmg',
  object_name => 'ChiTieu_162_213_340',
  policy_name => 'TRUONGPHG_policy',
  function_schema => 'tbmg',
  policy_function => 'TRUONGPHG_func2',
  statement_types => 'SELECT',
  sec_relevant_cols => 'KINHPHI',
  sec_relevant_cols_opt => dbms_rls.ALL_ROWS );
end;

--test
begin dbms_rls.drop_policy(
  object_schema => 'tbmg',
    object_name => 'DuAn_162_213_340',
    policy_name => 'TRUONGPHG_policy');
end;

connect NV001/123456;
select * from ChiTieu_162_213_340;