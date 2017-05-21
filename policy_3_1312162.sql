--Policy DAC - 1312162
--01--Ch? trý?ng ph?ng ðý?c phép c?p nh?t và thêm thông tin vào d? án (DAC).
--> Thuc hien gan quyen cho role truongphong
GRANT SELECT, INSERT, UPDATE ON DuAn_162_213_340 TO TRUONGPHONG;
--thucthi
GRANT TRUONGPHONG TO NV001;
---Test
connect NV001/123456;
select * from DuAn_162_213_340;