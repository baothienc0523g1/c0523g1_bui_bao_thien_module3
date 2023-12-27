package service;

import model.BaiHoc;
import model.LoaiBaiHoc;
import repository.BaiHocRepository;
import repository.IBaiHocRepository;

import java.util.List;

public class BaiHocService implements IBaiHocService {
    private IBaiHocRepository repository = new BaiHocRepository();

    @Override
    public List<BaiHoc> danhSachBaiHoc() {
        return repository.danhSachBaiHoc();
    }

    public BaiHoc timBaiHoc(int maBaiHoc) {
        return repository.timBaiHoc(maBaiHoc);
    }

    @Override
    public void suaBaiHoc(BaiHoc baiHoc) {
        repository.suaBaiHoc(baiHoc);
    }

    @Override
    public void xoaBaiHoc(int maBaiHoc) {
        repository.xoaBaiHoc(maBaiHoc);
    }

    @Override
    public void themMoi(BaiHoc baiHoc) {
        repository.themBaiHoc(baiHoc);
    }

    @Override
    public List<LoaiBaiHoc> danhSachTenBaiHoc() {
        return repository.danhSachTenBaiHoc();
    }

    @Override
    public List<Integer> danhSachDoKho() {
        return repository.danhSachDoKho();
    }

    @Override
    public List<Integer> danhSachModule() {
        return repository.danhSachModule();
    }
}
