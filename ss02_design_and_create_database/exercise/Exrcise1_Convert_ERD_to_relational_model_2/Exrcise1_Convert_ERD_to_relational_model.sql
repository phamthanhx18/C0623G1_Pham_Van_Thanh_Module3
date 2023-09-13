create database quan_ly_ban_hang;

use quan_ly_ban_hang;

create table nha_cung_cap(
	ma_ncc int primary key auto_increment,
    ten_ncc varchar(50) not null unique,
    dia_chi varchar(256)
);

create table don_dh(
    ma_ncc int,
	so_dh int primary key auto_increment,
    ngay_dh date not null,
	foreign key(ma_ncc) references nha_cung_cap(ma_ncc)
);

create table vat_tu(
	ma_vt int primary key auto_increment,
    ten_vt varchar(50) not null
);

create table dh_detail(
	so_dh int not null,
    ma_vt int not null,
	foreign key(so_dh) references don_dh(so_dh),
	foreign key(ma_vt) references vat_tu(ma_vt),
    primary key(so_dh,ma_vt)
);

create table sdt(
	ma_ncc int primary key,
	foreign key(ma_ncc) references nha_cung_cap(ma_ncc),
    sdt_ncc int
);

create table phieu_nhap(
	so_pn int primary key auto_increment,
	ngay_nhap date
);

create table detail_phieu_nhap(
	don_gia_nhap int,
    sl_nhap int,
    so_pn int,
	foreign key(so_pn) references phieu_nhap(so_pn),
    ma_vt int,
	foreign key(ma_vt) references vat_tu(ma_vt),
    primary key(so_pn,ma_vt)
);

create table phieu_xuat(
	so_px int primary key auto_increment,
	ngay_xuat date
);

create table detail_phieu_xuat(
	don_gia_xuat int,
    sl_xuat int,
    so_px int,
    ma_vt int,
	foreign key(so_px) references phieu_xuat(so_px),
	foreign key(ma_vt) references vat_tu(ma_vt),
    primary key(so_px,ma_vt)
);
