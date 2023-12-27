package repository;

import model.BaiHoc;

import java.util.List;

public interface IBaiHocRepository {
    List<BaiHoc> hienThiBaiHoc();
    void themBaiHoc(BaiHoc baiHoc);
}
