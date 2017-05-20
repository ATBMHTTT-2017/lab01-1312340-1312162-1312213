--Policy DAC - 1312162
--01--Ch? trý?ng ph?ng ðý?c phép c?p nh?t và thêm thông tin vào d? án (DAC).
--> Thuc hien gan quyen cho role truongphong
GRANT SELECT, INSERT, UPDATE ON DuAn_162_213_340 TO TRUONGPHONG;

--03--Ch? trý?ng ph?ng, trý?ng chi nhánh ðý?c c?p quy?n th?c thi stored procedure c?p nh?t thông tin ph?ng ban c?a m?nh 
--> thuc hien t?o proce capnhatthongtin PB sau do cap quyen cho TP Truong Chi Nhanh
GRANT EXECUTE ON CAPNHATTHONGTIN_PB TO TRUONGPHONG;
GRANT EXECUTE ON CAPNHATTHONGTIN_CN TO TRUONGCHINHANH;


