--Policy DAC - 1312162
--01--Ch? tr�?ng ph?ng ��?c ph�p c?p nh?t v� th�m th�ng tin v�o d? �n (DAC).
--> Thuc hien gan quyen cho role truongphong
GRANT SELECT, INSERT, UPDATE ON DuAn_162_213_340 TO TRUONGPHONG;
--thucthi
GRANT TRUONGPHONG TO NV001;
---Test
connect NV001/123456;
select * from DuAn_162_213_340;