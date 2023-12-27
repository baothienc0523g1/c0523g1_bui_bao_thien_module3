package service;

import model.BaiHoc;

import java.util.List;

public interface IBaiHocService {
    void themBaiHoc(BaiHoc baiHoc);
    List<BaiHoc> hienThiBaiHoc();
}
