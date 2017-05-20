
--Tất cả nhân viên bình thường (trừ trưởng phòng, trưởng chi nhánh và các trưởng dự án)chỉ được phép xem thông tin nhân viên trong phòng của mình, chỉ được xem lương của bản thân (VPD)
--tạo package PROC_CHECK_OF_CTX(4 procs)

create or replace package PROC_CHECK_OF_CTX
as
    procedure SET_PHONGBAN;
    procedure CHECK_TRUONGPHONG;
    procedure CHECK_TRUONGCHINHANH;
    procedure CHECK_TRUONGDUAN;
end;
/
--tạo context NHANVIEN_CTX
CREATE OR REPLACE CONTEXT NHANVIEN_CTX USING PROC_CHECK_OF_CTX;
-- body package
create or replace package body PROC_CHECK_OF_CTX
as
  procedure SET_PHONGBAN
  as PHONGBAN varchar2(5);
  begin
    select TBMG.NhanVien_162_213_340.maPhong into PHONGBAN from TBMG.NhanVien_162_213_340 where TBMG.NhanVien_162_213_340.maNV = sys_context('userenv', 'session_user');
    dbms_session.set_context('NHANVIEN_CTX', 'PHONGBAN', PHONGBAN);
  end;
  
  procedure CHECK_TRUONGPHONG
  as ISTRUONGPB varchar2(5);
  begin
    select case 
        when exists(select maPhong  from tbmg.PhongBan_162_213_340 where truongPhong = sys_context('userenv', 'session_user'))
        then 'TRUE'
        else 'FALSE'
      end into ISTRUONGPB
    from dual;
    dbms_session.set_context('NHANVIEN_CTX', 'ISTRUONGPB', ISTRUONGPB);
  end;
  procedure CHECK_TRUONGCHINHANH
  as ISTRUONGCN varchar2(5);
  begin
    select case 
        when exists(select maCN  from tbmg.ChiNhanh_162_213_340 where truongChiNhanh = sys_context('userenv', 'session_user'))
        then 'TRUE'
        else 'FALSE'
      end into ISTRUONGCN
    from dual;
    dbms_session.set_context('NHANVIEN_CTX', 'ISTRUONGCN', ISTRUONGCN);
  end;
  procedure CHECK_TRUONGDUAN
  as ISTRUONGDA varchar2(5);
  begin
    select case 
        when exists(select maDA from tbmg.DuAn_162_213_340 where truongDA = sys_context('userenv', 'session_user'))
        then 'TRUE'
        else 'FALSE'
      end into ISTRUONGDA
    from dual;
    dbms_session.set_context('NHANVIEN_CTX', 'ISTRUONGDA', ISTRUONGDA);
  end;
end;


--tạo trigger để thực thi các proc trong package khi có user đăng nhập.
 create or replace trigger set_NHANVIEN_CTX_TRIGGER after logon on database
begin
    TBMG.PROC_CHECK_OF_CTX.SET_PHONGBAN;
    TBMG.PROC_CHECK_OF_CTX.CHECK_TRUONGPHONG;
    TBMG.PROC_CHECK_OF_CTX.CHECK_TRUONGCHINHANH;
    TBMG.PROC_CHECK_OF_CTX.CHECK_TRUONGDUAN;
end;


--chỉ được xem nhân viên chung phòng 
create or replace function FUNC_ROOMATE(object_schema in varchar2, object_name in varchar2)
return varchar2
as
  PHONGBAN varchar2(5);
  TEMP varchar2(20);
begin
  if sys_context('userenv', 'SESSION_USER') = 'TBMG' or sys_context('userenv', 'ISDBA') = 'TRUE' or sys_context('NHANVIEN_CTX', 'ISTRUONGPB') = 'TRUE' 
  or sys_context('NHANVIEN_CTX', 'ISTRUONGCN') = 'TRUE' or sys_context('NHANVIEN_CTX', 'ISTRUONGDA') = 'TRUE' then
    return '';
  else
    PHONGBAN := sys_context('NHANVIEN_CTX', 'PHONGBAN');
        TEMP :=  'MAPHONG = ''' || PHONGBAN || '''';
    return TEMP;
  end if;
end;


begin dbms_rls.add_policy(
  object_schema => 'tbmg',
  object_name => 'NhanVien_162_213_340',
    policy_name => 'POLICY_ROOMATE',
    function_schema => 'tbmg',
    policy_function => 'FUNC_ROOMATE',
  statement_types => 'select',
   POLICY_TYPE =>DBMS_RLS.DYNAMIC);
end;


--drop test

/*
begin dbms_rls.drop_policy(
  object_schema => 'tbmg',
  object_name => 'NhanVien_162_213_340',
  policy_name => 'POLICY_ROOMATE'); 
end;

    */                                       


--nhân viên chỉ xem được lương của chính mình
create or replace function FUNC_XEMLUONG(object_schema in varchar2, object_name in varchar2)
return varchar2
as
  USERNAME varchar2(10);
  TEMP varchar2(20);
begin
  if sys_context('userenv', 'SESSION_USER') = 'TBMG' or sys_context('userenv', 'ISDBA') = 'TRUE' or sys_context('NHANVIEN_CTX', 'ISTRUONGPB') = 'TRUE' 
  or sys_context('NHANVIEN_CTX', 'ISTRUONGCN') = 'TRUE' or sys_context('NHANVIEN_CTX', 'ISTRUONGDA') = 'TRUE' then
    return '';
  else
    USERNAME := sys_context('userenv', 'session_user');
    TEMP :=  'MANV = ''' || USERNAME || '''';
    return TEMP;
  end if;
end;

--add POLICY_XEM_LUONG_NHANVIEN_ITSELF policy
begin dbms_rls.add_policy(
  object_schema => 'tbmg',
  object_name => 'NhanVien_162_213_340',
  policy_name => 'POLICY_XEMLUONG',
  function_schema => 'tbmg',
  policy_function => 'FUNC_XEMLUONG',
  statement_types => 'SELECT',
  sec_relevant_cols => 'LUONG',
  sec_relevant_cols_opt => dbms_rls.ALL_ROWS );
end;

--drop test


/*
begin dbms_rls.drop_policy(
  object_schema => 'tbmg',
    object_name => 'NhanVien_162_213_340',
    policy_name => 'POLICY_XEMLUONG');
end;

