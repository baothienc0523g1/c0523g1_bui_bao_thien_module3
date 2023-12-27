package repository;

import model.BaiHoc;
import model.LoaiBaiHoc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BaiHocRepository implements IBaiHocRepository{
    private static final String DANH_SACH_BAI_HOC = "select * from bai_hoc where trang_thai_xoa = false;";
    private static final String TIM_BAI_HOC = "select * from bai_hoc where ma_bai_hoc = ?;";
    private static final String SUA_BAI_HOC = "update bai_hoc set do_kho = ?, module = ?, ten_bai_hoc = ?, " +
            "ma_loai_bai_hoc = ? where ma_bai_hoc = ?";
    private static final String XOA_BAI_HOC = "update bai_hoc set trang_thai_xoa = true " +
            "where ma_bai_hoc = ?;";
    private static final String THEM_BAI_HOC = "insert into bai_hoc(ma_loai_bai_hoc, do_kho, module, ten_bai_hoc) " +
            "values (?,?,?,?);";
    private static final String TEN_LOAI_BAI_HOC = "select * from loai_bai_hoc;";
    private static final String DO_KHO = "select do_kho from bai_hoc;";
    private static final String MODULE = "select `module` from bai_hoc;";
    @Override
    public List<BaiHoc> danhSachBaiHoc() {
        Connection connection = BaseRepository.getConnection();
        List<BaiHoc> baiHoc = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DANH_SACH_BAI_HOC);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int maBaiHoc = resultSet.getInt(1);
                int maLoaiBaiHoc = resultSet.getInt(2);
                int doKho = resultSet.getInt(3);
                int module = resultSet.getInt(4);
                String tenBaiHoc = resultSet.getString(5);
                baiHoc.add(new BaiHoc(maBaiHoc, maLoaiBaiHoc, doKho, module, tenBaiHoc));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return baiHoc;
    }


    @Override
    public void suaBaiHoc(BaiHoc baiHoc) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SUA_BAI_HOC);
            preparedStatement.setInt(1, baiHoc.getDoKho());
            preparedStatement.setInt(2, baiHoc.getModule());
            preparedStatement.setString(3, baiHoc.getTenBaiHoc());
            preparedStatement.setInt(4, baiHoc.getMaLoaiBaiHoc());
            preparedStatement.setInt(5, baiHoc.getMaBaiHoc());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public BaiHoc timBaiHoc(int maBaiHoc) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(TIM_BAI_HOC);
            preparedStatement.setInt(1, maBaiHoc);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int maBaiHocTonTai = resultSet.getInt(1);
                int maLoaiBaiHoc = resultSet.getInt(2);
                int doKho = resultSet.getInt(3);
                int module = resultSet.getInt(4);
                String tenBaiHoc = resultSet.getString(5);
                return new BaiHoc(maBaiHocTonTai, maLoaiBaiHoc, doKho, module, tenBaiHoc);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public void xoaBaiHoc(int maBaiHoc) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(XOA_BAI_HOC);
            preparedStatement.setInt(1, maBaiHoc);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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

    @Override
    public List<LoaiBaiHoc> danhSachTenBaiHoc() {
        List<LoaiBaiHoc> danhSachTenBaiHoc = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(TEN_LOAI_BAI_HOC);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int maLoaiBaiHoc = resultSet.getInt(1);
                String tenBaiHoc = resultSet.getString(2);
                danhSachTenBaiHoc.add(new LoaiBaiHoc(maLoaiBaiHoc, tenBaiHoc));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return danhSachTenBaiHoc;
    }

    @Override
    public List<Integer> danhSachDoKho() {
        List<Integer> danhSachDoKho = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DO_KHO);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Integer doKho = resultSet.getInt(1);
                if (!danhSachDoKho.contains(doKho)) {
                    danhSachDoKho.add(doKho);
                };
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return danhSachDoKho;
    }

    @Override
    public List<Integer> danhSachModule() {
        List<Integer> danhSachModule = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(MODULE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Integer module = resultSet.getInt(1);
                if (!danhSachModule.contains(module)) {
                    danhSachModule.add(module);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return danhSachModule;
    }
}
