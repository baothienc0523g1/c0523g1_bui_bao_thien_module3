package repository;

import model.BaiHoc;
import model.LoaiBaiHoc;

import java.util.List;

public interface IBaiHocRepository {
    List<BaiHoc> danhSachBaiHoc();
    void suaBaiHoc(BaiHoc baiHoc);
    BaiHoc timBaiHoc(int maBaiHoc);
    void xoaBaiHoc(int maBaiHoc);
    void themBaiHoc(BaiHoc baiHoc);
    List<LoaiBaiHoc> danhSachTenBaiHoc();
    List<Integer> danhSachDoKho();
    List<Integer> danhSachModule();
}
