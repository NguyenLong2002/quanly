CREATE DATABASE QLNhanVien
go

USE QLNhanVien
GO
--nhân viên
--đơn vị
--bảng lương
create table DONVI
(
MaDV nvarchar(4) not null primary key,
TenDV nvarchar(50)
)
go
create table NHANVIEN
(
MaNV nvarchar(8) not null primary key,
hoten nvarchar(30) not null,
congviec nvarchar(50),
luong int,
MaDV nvarchar(4) not null,
MaPT nvarchar(8)
FOREIGN KEY(MaDV) REFERENCES DONVI(MaDV)
)
go

create table BACLUONG
(
Maban nvarchar(50) not null primary key,
Baccao int,
bacthap int,
)
go
INSERT dbo.DONVI
(
MaDV,
TenDV)
VALUES (N'0001',N'KHTN'),
(N'0002',N'DHTL'),
(N'0003',N'DHQL')
go
select *from donvi
INSERT INTO NHANVIEN

VALUES
(
	N'NV001',
	N'Nguyễn Thành Long',
	N'Giám Đốc',
	1000,
	N'0001',
	N''
),
(	N'NV002',
	N'Nguyễn Văn Thành',
	N'Phó Giám Đốc',
	800,
	N'0001',
	N''
),
(	N'NV003',
	N'Nguyễn Thị Mai',
	N'Giáo viên',
	300,
	N'0002',
	N''
),
(	N'NV004',
	N'Nguyễn Thu Trang',
	N'Giáo viên',
	400,
	N'0002',
	N''
),
(	N'NV005',
	N'Mai Văn Thông',
	N'Giáo viên',
	100,
	N'0003',
	N''
)

SELECT*from NHANVIEN --Câu 6:Đưa ra thông tin của nhân viên
INSERT dbo.BACLUONG
(
Maban ,
bacthap,
baccao
)
VALUES
(
	N'1',
	400,
	500
),
(
	N'2',
	501,
	600
),
(
	N'3',
	601,
	800
)

SELECT*From BACLUONG --Đưa ra thông tin của bảng lương

SELECT hoten,congviec,luong From[NHANVIEN]--Câu 7

SELECT Distinct congviec From NHANVIEN--Câu 8

SELECT HoTen,Luong*3 FROM dbo.NHANVIEN --Câu 9

SELECT HoTen,Luong from NHANVIEN--Câu 10:Sắp xếp lương tăng dần
ORDER BY luong ASC
SELECT HoTen,Luong from NHANVIEN --Sắp xếp lương giảm dần
ORDER BY luong DESC

SELECT HoTen,Luong from NHANVIEN--Câu 11
WHERE Luong>300

SELECT HoTen,Luong FROM dbo.NHANVIEN-- Câu 12
where CongViec = 'Giáo Viên' and Luong>300

SELECT HoTen FROM dbo.NHANVIEN--Câu 13
Where luong=200 or luong=300 or luong=600

SELECT HoTen FROM dbo.NHANVIEN--Câu 14
Where 300 < luong and luong<1000

SELECT hoten as"NV có họ Nguyễn",congviec from nhanvien--Câu 15
where hoten like N'Nguyễn%'

SELECT max(luong) as"Lương lớn nhất " from NHANVIEN --Câu 16
SELECT min(luong) as"Lương nhỏ nhất"from NHANVIEN
SELECT AVG(luong) as"Lương trung bình"FROM NHANVIEN

SELECT congviec,AVG(luong) as"Lương TB của CV" --Câu 17
FROM NHANVIEN 
GROUP BY congviec

SELECT congviec,AVG(luong) as"Lương TB của CV" --Câu 18
From NHANVIEN
where luong>200
GROUP BY congviec

Select MaDV, congviec, sum(luong) as"Tổng lương"--Câu 19:Tổng lương của từng công việc 
from nhanvien										-----trong từng đơn vị.
group by congviec,MaDV

Select congviec ,AVG(luong) as"Lương TB" --Câu 20
from nhanvien
where luong>=300
group by congviec

Select TenDV,max(luong) as"Lương lớn nhất"--Câu 21 
from DONVI,NHANVIEN
where (Donvi.MaDV=nhanvien.MaDV) and luong>=300
group by TenDV


Select hoten,congviec,TenDV --Câu 22
from nhanvien,donvi
where (Donvi.MaDV=nhanvien.MaDV)

SELECT HoTen, CongViec,TenDV--Câu 23:KQ chạy giống câu 22
FROM NHANVIEN NV, DONVI DV
WHERE NV.MaDV= DV.MaDV;

Select HoTen, Congviec, TenDV --Câu 24
FROM NHANVIEN NV, DONVI DV
WHERE NV.MaDV= DV.MaDV and luong>=500

SELECT NV.MaNV, NV.Hoten, PT.MaNV, PT.Hoten--Câu 25
FROM NHANVIEN NV, NHANVIEN PT
WHERE (NV.MaNV=PT.MaPT) AND (NV.Luong>PT.Luong);

Select congviec from nhanvien --Câu 27
where Madv like N'0001%' or Madv like N'0002%'


Select hoten, TenDV, congviec,luong --Câu 28
from nhanvien nv, donvi dv 
where(nv.madv=dv.madv) and( luong > (select avg(luong) from nhanvien))

Select hoten from nhanvien 
where (luong > (select max(luong) from nhanvien,DONVI)) (nhanvien.madv=donvi.madv) and (tendv=N'DHTL'))