package service;

import model.BaiHoc;
import model.LoaiBaiHoc;

import java.util.List;

public interface IBaiHocService {
    List<BaiHoc> danhSachBaiHoc();
    BaiHoc timBaiHoc(int maBaiHoc);
    void suaBaiHoc(BaiHoc baiHoc);
    void xoaBaiHoc(int maBaiHoc);
    void themMoi(BaiHoc baiHoc);
    List<LoaiBaiHoc> danhSachTenBaiHoc();
    List<Integer> danhSachDoKho();
    List<Integer> danhSachModule();
}
