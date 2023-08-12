create database bai_tap_1;
use bai_tap_1;

create table phieu_xuat(
so_phieu_xuat int not null primary key auto_increment,
ngay_xuat datetime
);

create table phieu_nhap(
so_phieu_nhap int not null primary key auto_increment,
ngay_nhap datetime
);

create table vat_tu(
ma_vat_tu int not null primary key auto_increment,
ten_vat_tu varchar(75)
);

create table don_dat_hang(
so_don_hang int not null primary key auto_increment,
ngay_dat_hang datetime
);

create table so_dien_thoai(
id_sdt int not null primary key auto_increment,
so_dien_thoai int
);

create table nha_cung_cap(
ma_nha_cung_cap int not null primary key auto_increment,
ten_nha_cung_cap varchar(55),
dia_chia varchar(75),
so_dien_thoai int,
foreign key (so_dien_thoai) references so_dien_thoai(id_sdt)
);

create table chi_tiet_phieu_xuat(
so_phieu_xuat int,
foreign key (so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
don_gia_xuat double not null,
so_luong_xuat int not null,
ma_vat_tu int,
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
primary key(so_phieu_xuat, ma_vat_tu)
);

create table chi_tiet_phieu_nhap(
so_phieu_nhap int,
foreign key (so_phieu_nhap) references phieu_nhap(so_phieu_nhap),
don_gia_nhap double not null,
so_luong_nhap int not null,
ma_vat_tu int,
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
primary key(so_phieu_nhap, ma_vat_tu)
);

create table chi_tiet_don_dat_hang(
so_don_hang int,
foreign key (so_don_hang) references don_dat_hang(so_don_hang),
ma_vat_tu int,
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
primary key(so_don_hang, ma_vat_tu)
);
