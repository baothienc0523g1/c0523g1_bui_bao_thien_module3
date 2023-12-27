package model;

public class BaiHoc {
    private int maBaiHoc;
    private int maLoaiBaiHoc;
    private int doKho;
    private int module;
    private String tenBaiHoc;

    public BaiHoc(int maBaiHoc, int maLoaiBaiHoc, int doKho, int module, String tenBaiHoc) {
        this.maBaiHoc = maBaiHoc;
        this.maLoaiBaiHoc = maLoaiBaiHoc;
        this.doKho = doKho;
        this.module = module;
        this.tenBaiHoc = tenBaiHoc;
    }

    public BaiHoc(int maLoaiBaiHoc, int doKho, int module, String tenBaiHoc) {
        this.maLoaiBaiHoc = maLoaiBaiHoc;
        this.doKho = doKho;
        this.module = module;
        this.tenBaiHoc = tenBaiHoc;
    }

    public int getMaBaiHoc() {
        return maBaiHoc;
    }

    public void setMaBaiHoc(int maBaiHoc) {
        this.maBaiHoc = maBaiHoc;
    }

    public int getMaLoaiBaiHoc() {
        return maLoaiBaiHoc;
    }

    public void setMaLoaiBaiHoc(int maLoaiBaiHoc) {
        this.maLoaiBaiHoc = maLoaiBaiHoc;
    }

    public int getDoKho() {
        return doKho;
    }

    public void setDoKho(int doKho) {
        this.doKho = doKho;
    }

    public int getModule() {
        return module;
    }

    public void setModule(int module) {
        this.module = module;
    }

    public String getTenBaiHoc() {
        return tenBaiHoc;
    }

    public void setTenBaiHoc(String tenBaiHoc) {
        this.tenBaiHoc = tenBaiHoc;
    }
}
