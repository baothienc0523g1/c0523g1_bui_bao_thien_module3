package repository;

import model.BaiHoc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class BaiHocRepository implements IBaiHocRepository {
    private static final String THEM_BAI_HOC = "insert into bai_hoc (ma_loai_bai_hoc, do_kho, module, link) " +
    "values (?,?,?,?);";
    private static final String HIEN_THI_DANH_SACH = "select * from bai_hoc;";
    @Override
    public List<BaiHoc> hienThiBaiHoc() {
        List<BaiHoc> danhSachBaiHoc = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(HIEN_THI_DANH_SACH);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int maBaiHoc = resultSet.getInt(1);
                int maLoaiBaiHoc = resultSet.getInt(2);
                int doKho = resultSet.getInt(3);
                int module = resultSet.getInt(4);
                String link = resultSet.getString(5);
                danhSachBaiHoc.add(new BaiHoc(maBaiHoc, maLoaiBaiHoc, doKho, module, link));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return danhSachBaiHoc;
    }

    @Override
    public void themBaiHoc(BaiHoc baiHoc) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(THEM_BAI_HOC);
            preparedStatement.setInt(1, baiHoc.getMaLoaiBaiHoc());
            preparedStatement.setInt(2, baiHoc.getDoKho());
            preparedStatement.setInt(3, baiHoc.getModule());
            preparedStatement.setString(4, baiHoc.getTenBaiHoc());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
