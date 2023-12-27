package service;

import model.BaiHoc;
import repository.BaiHocRepository;
import repository.IBaiHocRepository;

import java.util.List;

public class BaiHocService implements IBaiHocService{
    private IBaiHocRepository repository = new BaiHocRepository();
    @Override
    public void themBaiHoc(BaiHoc baiHoc) {
        this.repository.themBaiHoc(baiHoc);
    }

    @Override
    public List<BaiHoc> hienThiBaiHoc() {
        return repository.hienThiBaiHoc();
    }
}
