--Policy DAC - 1312162
--01--Ch? tr�?ng ph?ng ��?c ph�p c?p nh?t v� th�m th�ng tin v�o d? �n (DAC).
--> Thuc hien gan quyen cho role truongphong
GRANT SELECT, INSERT, UPDATE ON DuAn_162_213_340 TO TRUONGPHONG;

--03--Ch? tr�?ng ph?ng, tr�?ng chi nh�nh ��?c c?p quy?n th?c thi stored procedure c?p nh?t th�ng tin ph?ng ban c?a m?nh 
--> thuc hien t?o proce capnhatthongtin PB sau do cap quyen cho TP Truong Chi Nhanh
GRANT EXECUTE ON CAPNHATTHONGTIN_PB TO TRUONGPHONG;
GRANT EXECUTE ON CAPNHATTHONGTIN_CN TO TRUONGCHINHANH;


