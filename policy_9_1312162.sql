--Not working
--policy--9--:M?i d? án trong công ty có các m?c ð? nh?y c?m ðý?c ðánh d?u bao g?m “Thông thý?ng”, “Gi?i h?n”, “Bí m?t”, “Bí m?t cao”.
--M?i d? án có th? thu?c quy?n qu?n l? c?a t?ng công ty ho?c c?a 1 trong 3 chi nhánh “Tp.H? Chí Minh”, “Hà N?i”,
--“Ðà N?ng”. M?i d? án có th? liên quan ð?n các ph?ng ban: “Nhân s?”, “K? toán”, “K? ho?ch” (OLS).

-- Cap quyen cho user quan tri SYSADMIN
-- quyen tao ra các thành phan cua lable:
GRANT EXECUTE ON SA_COMPONENTS TO SYSADMIN;

--Quyen tao ra các lable:
GRANT EXECUTE ON SA_LABLE_ADMIN TO SYSADMIN;

--Quyen gán POLICY CHO CAC BANG:
GRANT EXECUTE ON SA_POLICY_ADMIN TO SYSADMIN;

--Quyen gán lable cho tài kho?n:
GRANT EXECUTE ON SA_USER_ADMIN TO SYSADMIN;

--Chuyen chu?i thành su cua lable:
GRANT EXECUTE ON CHAR_TO_LABEL TO SYSADMIN;


-- T?o chính sách OLS
EXECUTE SA_SYSDBA.CREATE_POLICY ('TRUYXUAT_DA','OLS_DA');
-- G?n quy?n qu?n l? cho SYS
GRANT TRUYXUAT_DA TO SYSADMIN;

-- Tao LEVEL
-- Level Bí m?t cao:
EXEC SA_COMPONENENTS.CREATE_LEVEL('TRUYXUAT_DA',9000, 'BMC', 'BÍ MẬT CAO' );
--Level Bí M?t:
EXEC SA_COMPONENENTS.CREATE_LEVEL('TRUYXUAT_DA',7000, 'BM', 'BÍ MẬT');
--Level Gi?i h?n:
EXEC SA_COMPONENENTS.CREATE_LEVEL('TRUYXUAT_DA',5000, 'GH', 'GIỚI HẠN');
--Level Thông thý?ng:
EXEC SA_COMPONENENTS.CREATE_LEVEL('TRUYXUAT_DA',3000, 'TT', 'THÔNG THƯỜNG');

-- T?o COMPARMENTS:
--CP HÀ N?i
EXEC SA_COMPONENENTS.CREATE_COMPARMENT('TRUYXUAT_DA',3000, 'HN', 'HÀ NỘI');
--CP ÐÀ N?NG
EXEC SA_COMPONENENTS.CREATE_COMPARMENT('TRUYXUAT_DA',4000, 'DN', 'ÐÀ NẴNG');
--CP TP.HCM
EXEC SA_COMPONENENTS.CREATE_COMPARMENT('TRUYXUAT_DA',5000, 'TPHCM', 'TP. HỒ CHÍ MINH');

--T?o GROUP:
--GR CÔNG TY
EXEC SA_COMPONENENTS.CREATE_GROUP('TRUYXUAT_DA', 1, 'CT', 'CÔNG TY', NULL);
--GR NHÂN S?
EXEC SA_COMPONENENTS.CREATE_GROUP('TRUYXUAT_DA', 2, 'NS', 'NHÂN SỰ', 'CT');
--GR K? TOÁN
EXEC SA_COMPONENENTS.CREATE_GROUP('TRUYXUAT_DA', 3, 'KT', 'KẾ TOÁN', 'CT');
--GR K? HO?CH
EXEC SA_COMPONENENTS.CREATE_GROUP('TRUYXUAT_DA', 2, 'KH', 'KẾ HOẠCH', 'CT');

--T?o Nh?n:
--Nhan ch? ch?a level
EXEC SA_LABLE_ADMIN.CREATE_LABLE('TRUYXUAT_DA',1 , 'HS');
--Nh?n ch?a level và comparment
EXEC SA_LABLE_ADMIN.CREATE_LABLE('TRUYXUAT_DA',300 , 'HS:HN,DN,TPHCM');
--Nh?n  ch?a level, compartment, group
EXEC SA_LABLE_ADMIN.CREATE_LABLE('TRUYXUAT_DA',300 , 'HS:HN,NS');

--Gán chính sách cho các b?ng:
EXEC SA_POLICY_ADMIN.APPLY_TABLE_POLICY(
'TRUYXUAT' ,'SYSADMIN','USER_DATA1.DUAN_162_169','NO_CONTROL' );
-- Gán du lieu cho bang:
-- c?p quy?n cho SYSADMIN
GRANT SELECT,INSERT,UPDATE ON USER_DATA1 TO SYSADMIN;
-- gán nhan cho dang gi lieu ða tao:
UPDATE SYSADMIN.DUAN
SET OLS_DUAN = CHAR_TO_LABLE('TRUYXUAT','HS');
-- Gán các nhsn cho nhung tài khoan
SA_USER_ADMIN.SET_LEVELS('TRUYXUAT', 'BMC', 
                          'DUAN1',                      
                          );
SA_USER_ADMIN.SET_LEVELS('TRUYXUAT', 'BM', 
                          'DUAN2',                      
                          ) ;                         
SA_USER_ADMIN.SET_LEVELS('TRUYXUAT', 'GH', 
                          'DUAN3',                      
                          )  ;                       
-- Gán compartment cho tài khoan:
SA_USER_ADMIN.SET_COMPARTMENT('TRUYXUAT',
                              'HN',
                              'TRUONGPHONG',
                              );