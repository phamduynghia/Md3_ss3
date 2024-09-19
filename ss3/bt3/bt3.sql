CREATE table PhieuXuat(
soPX int primary key auto_increment,
ngayXuat datetime
);

create table VatTu(
maVT int primary key auto_increment,
tenVT varchar(255)
);

create table PhieuXuatChiTiet(
soPx int,
foreign key (soPx) references PhieuXuat(soPX),
maVt int,
foreign key (maVt) references VatTu(maVT),
donGiaXuat double,
soLuongXuat int
);

create table PhieuNhap(
soPn int primary key auto_increment,
ngayNhap datetime
);

create table PhieuNhapChiTiet(
soPn int,
foreign key (soPn) references PhieuNhap(soPn),
maVt int,
foreign key (maVt) references VatTu(maVT),
donGiaNhap double,
soLuongNhap int
);

create table NgaCungCap(
maNCC int primary key auto_increment,
tenNCC varchar(255),
diaChi varchar(255),
soDienThoai varchar(11)
);

create table chiTietDonDatHang(
maVT int ,
foreign key (maVT) references VatTu(maVT),
soDH int primary key auto_increment
);

create table DonDatHang(
soDH int ,
foreign key (soDH) references chiTietDonDatHang(soDH),
maNCC int ,
foreign key (maNCC) references NgaCungCap(maNCC),
ngayDH datetime
);

insert into PhieuXuat (soPX,ngayXuat) values (1,'2019-01-10 00:00:00'),(2,'2020-02-12 00:00:00'),(3,'2021-03-13 00:00:00'),(4,'2022-04-14 00:00:00'),(5,'2023-05-15 00:00:00');
insert into VatTu (maVT,tenVT) values (1,'gach'),(2,'da'),(3,'soi'),(4,'cat'),(5,'ximang');
insert into PhieuXuatChiTiet (soPx,maVt,donGiaXuat,soLuongXuat) 
values (1,1,100000,12),(2,2,200000,22),(3,3,300000,32),(4,4,400000,42),(5,5,500000,52);
insert into PhieuNhap (soPn,ngayNhap)
values (1,'2019-01-10 00:00:00'),(2,'2019-02-10 00:00:00'),(3,'2019-03-10 00:00:00'),(4,'2019-04-10 00:00:00'),(5,'2019-05-10 00:00:00');
insert into PhieuNhapChiTiet (soPn,maVt,donGiaNhap,soLuongNhap)
values (1,1,100000,12),(2,2,200000,22),(3,3,300000,32),(4,4,400000,42),(5,5,500000,52);
insert into NgaCungCap (maNCC,tenNCC,diaChi,soDienThoai)
values (1,'TTQ','Ha Noi',0987654321),
(2,'BBQ','Ha Nam',0987654321),(3,'NTQ','Nga',0987654321),
(4,'SVM','Nam Dinh',0987654321),(5,'STT','Hai PHong',0987654321);
insert into chiTietDonDatHang (maVT,soDH)
values (1,1),(2,2),(3,3),(4,4),(5,5);
insert into DonDatHang (soDH,maNCC,ngayDH)
values (1,1,'2019-01-10 00:00:00'),(2,2,'2021-01-10 00:00:00'),(3,3,'2022-01-10 00:00:00'),(4,4,'2023-01-10 00:00:00'),(5,5,'2024-01-10 00:00:00');

select vattu.tenVT, sum(phieuxuatchitiet.soLuongXuat) as max from PhieuXuat
left join PhieuXuatChiTiet on phieuxuat.soPX = phieuxuatchitiet.soPx
left join vattu on phieuxuatchitiet.maVt = vattu.maVT
group by vattu.tenVT
order by max desc
limit 1;

select vattu.tenVT,sum(phieunhapchitiet.soLuongNhap) as remaining from phieunhap
left join phieunhapchitiet on phieunhap.soPn = phieunhapchitiet.soPn
left join vattu on phieunhapchitiet.maVt = vattu.maVT
group by vattu.tenVT
order by remaining desc
limit 1;

select NgaCungCap.tenNCC, DonDatHang.ngayDH from DonDatHang
inner join NgaCungCap on DonDatHang.maNCC = NgaCungCap.maNCC
where DonDatHang.ngayDH between '2024-02-12' and '2024-02-22';

select vattu.tenVT , NgaCungCap.tenNCC,DonDatHang.ngayDH from DonDatHang
left join chiTietDonDatHang on DonDatHang.soDH = chitietdondathang.soDH
left join NgaCungCap on dondathang.maNCC = ngacungcap.maNCC
left join vattu on chitietdondathang.maVT = vattu.maVT
where dondathang.ngayDH between '2024-01-11' and '2024-02-22';