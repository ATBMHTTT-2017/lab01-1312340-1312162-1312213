-- Giám đốc được phép xem thông tin dự án gồm (mã dự án, tên dự án, kinh phí, tên phòng chủ trì, tên chi nhánh chủ trì, tên trưởng dự án và tổng chi) (DAC)
 
-- VIEW ĐỂ GIÁM ĐỐC XEM 
Create Or Replace View V_CHITIET_DuAn_162_213_340 AS 
	Select tbmg.DuAn_162_213_340.maDA, tbmg.DuAn_162_213_340.tenDA, tbmg.PhongBan_162_213_340.tenPhong, tbmg.ChiNhanh_162_213_340.tenCN, tbmg.NhanVien_162_213_340.hoTen AS TENTRUONGDA, tbmg.ChiTieu_162_213_340.soTien as TongChi
    FROM tbmg.PhongBan_162_213_340, tbmg.DuAn_162_213_340, tbmg.ChiNhanh_162_213_340, tbmg.NhanVien_162_213_340 , tbmg.ChiTieu_162_213_340
    WHERE tbmg.PhongBan_162_213_340.maPhong = tbmg.DuAn_162_213_340.phongChuTri
		AND tbmg.PhongBan_162_213_340.chiNhanh = tbmg.ChiNhanh_162_213_340.maCN
		AND tbmg.DuAn_162_213_340.truongDA = tbmg.NhanVien_162_213_340.maNV
		AND tbmg.ChiTieu_162_213_340.duAn = tbmg.DuAn_162_213_340.maDA;

grant select on tbmg.V_CHITIET_DuAn_162_213_340 TO GIAMDOC;

