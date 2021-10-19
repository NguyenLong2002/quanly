CREATE DATABASE CSDL_QLnhahang
GO

USE CSDL_QLnhahang
GO



--Tạo bảng NHANVIEN
create table NHANVIEN
(
Ma_NV char (8) not null primary key,
Ten_NV varchar (30),
Diachi_NV varchar (50),
DienThoai_NV int,
ChucVu varchar (30),
NgaySinh date
)
GO
--Tạo bảng LUONG
create table LUONG
(
Ma_L char (10) not null primary key,
Ma_NV char (8),
ThanhToan int,
foreign Key (Ma_NV) references NHANVIEN ( Ma_NV)
)
Go
--Tạo bảng MENU
create table MENU
(
Ma_MN char (5) not null primary key,
Ten_M varchar (30),
DonGai int
)
GO
--Tạo bảng KHACH
create table KHACH
(
Ma_K char (8) not null primary key,
Ten_K varchar (30),
DiaChi_K varchar (50),
DienThoai_K int,
Ma_NV char (8) not null,
Ma_MN char (5) not null,
foreign key (Ma_NV) references NHANVIEN (Ma_NV),
foreign key (Ma_MN) references MENU ( Ma_MN)
)
GO
--Tạo bảng HOADON
create table HOADON
(
Ma_HD char (5) not null primary key,
Ngay date,
T_tien varchar (50),
Ma_NV char (8) not null,
Ma_K char (8) not null,
foreign key (Ma_NV) references NHANVIEN (Ma_NV),
foreign key (Ma_K) references KHACH (Ma_K)
)
Go
--Tạo bảng KHACH
create table THUCPHAM
(
Ma_TP char (8) not null primary key,
Ten_TP varchar (30),
Donvi_TP char (10),
Ngay_N date,--ngày nhập
Ngay_HH date,--ngày hết hạn
Ma_NCC char (8) not null,
foreign key (Ma_NCC) references NHA_CC (Ma_NCC)
)
GO
--Tạo bảng NHACC
create table NHA_CC
(
Ma_NCC char (8) not null primary key,
Ten_NC varchar (30),
Dia_C varchar (30),
DienThoai_NCC int, 
Nam_HT date ,     --Năm hợp tác
Ma_NV char (8) not null,
Ma_TP char (8) not null,
foreign key (Ma_NV) references NHANVIEN (Ma_NV),
foreign key (Ma_TP) references THUCPHAM(Ma_TP)
)
Go





