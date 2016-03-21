IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Admin_RapChieuPhim]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Admin] DROP CONSTRAINT [FK_Admin_RapChieuPhim]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_HangPhim_Phim]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [HangPhim] DROP CONSTRAINT [FK_HangPhim_Phim]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_KhachHang_Phim]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [KhachHang] DROP CONSTRAINT [FK_KhachHang_Phim]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_LichChieu_Phim]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [LichChieu] DROP CONSTRAINT [FK_LichChieu_Phim]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_LichChieu_PhongChieu]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [LichChieu] DROP CONSTRAINT [FK_LichChieu_PhongChieu]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_LoaiPhim_Phim]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [LoaiPhim] DROP CONSTRAINT [FK_LoaiPhim_Phim]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Phim_KhachHang]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Phim] DROP CONSTRAINT [FK_Phim_KhachHang]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Phim_LoaiPhim]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Phim] DROP CONSTRAINT [FK_Phim_LoaiPhim]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_PhongChieu_RapChieuPhim]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [PhongChieu] DROP CONSTRAINT [FK_PhongChieu_RapChieuPhim]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Ve_KhachHang]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Ve] DROP CONSTRAINT [FK_Ve_KhachHang]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Ve_LichChieu]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Ve] DROP CONSTRAINT [FK_Ve_LichChieu]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Admin]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Admin]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[HangPhim]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [HangPhim]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[KhachHang]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [KhachHang]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[LichChieu]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [LichChieu]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[LoaiPhim]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [LoaiPhim]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Phim]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Phim]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[PhongChieu]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [PhongChieu]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[RapChieuPhim]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [RapChieuPhim]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Ve]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Ve]
;

CREATE TABLE [Admin]
(
	[id_Admin] int NOT NULL,
	[QuyenAdmin] varchar(50) NOT NULL,
	[id_Rap] varchar
)
;

CREATE TABLE [HangPhim]
(
	[id_HangPhim] int NOT NULL,
	[TenHangPhim] varchar(50) NOT NULL,
	[id_Phim] int
)
;

CREATE TABLE [KhachHang]
(
	[id_KhachHang] varchar(50) NOT NULL,
	[TenKhachHang] varchar(50),
	[SDT] int NOT NULL,
	[CMND] int NOT NULL,
	[id_Phim] int
)
;

CREATE TABLE [LichChieu]
(
	[id_LichChieu] int NOT NULL,
	[NgayChieu] date NOT NULL,
	[SuatChieu] datetime NOT NULL,
	[GiaVe] money NOT NULL,
	[id_Phong] int,
	[id_Phim] int
)
;

CREATE TABLE [LoaiPhim]
(
	[id_LoaiPhim] int NOT NULL,
	[TenLoaiPhim] varchar(50) NOT NULL,
	[id_Phim] int
)
;

CREATE TABLE [Phim]
(
	[id_Phim] int NOT NULL,
	[TenPhim] varchar(50) NOT NULL,
	[ThoiLuong] time(7) NOT NULL,
	[id_KhachHang] varchar,
	[id_LoaiPhim] int
)
;

CREATE TABLE [PhongChieu]
(
	[id_Phong] int NOT NULL,
	[TenPhong] varchar(50) NOT NULL,
	[SoGheToiDa] varchar(50) NOT NULL,
	[GhiChu] varchar(50) NOT NULL,
	[id_Rap] varchar
)
;

CREATE TABLE [RapChieuPhim]
(
	[id_Rap] varchar(50) NOT NULL,
	[TenRap] varchar(50),
	[SoLuongPhongChieu] varchar(50) NOT NULL,
	[DiaChi] varchar(50) NOT NULL
)
;

CREATE TABLE [Ve]
(
	[id_Ve] int NOT NULL,
	[SoGhe] numeric(18) NOT NULL,
	[TenPhim] varchar(50),
	[id_KhachHang] varchar,
	[id_LichChieu] int
)
;

CREATE INDEX [IXFK_Admin_RapChieuPhim] 
 ON [Admin] ([id_Rap] ASC)
;

ALTER TABLE [Admin] 
 ADD CONSTRAINT [PK_Admin]
	PRIMARY KEY CLUSTERED ([id_Admin])
;

CREATE INDEX [IXFK_HangPhim_Phim] 
 ON [HangPhim] ([id_Phim] ASC)
;

ALTER TABLE [HangPhim] 
 ADD CONSTRAINT [PK_HangPhim]
	PRIMARY KEY CLUSTERED ([id_HangPhim])
;

CREATE INDEX [IXFK_KhachHang_Phim] 
 ON [KhachHang] ([id_Phim] ASC)
;

ALTER TABLE [KhachHang] 
 ADD CONSTRAINT [PK_KhachHang]
	PRIMARY KEY CLUSTERED ([id_KhachHang])
;

CREATE INDEX [IXFK_LichChieu_Phim] 
 ON [LichChieu] ([id_Phim] ASC)
;

CREATE INDEX [IXFK_LichChieu_PhongChieu] 
 ON [LichChieu] ([id_Phong] ASC)
;

ALTER TABLE [LichChieu] 
 ADD CONSTRAINT [PK_LichChieu]
	PRIMARY KEY CLUSTERED ([id_LichChieu])
;

CREATE INDEX [IXFK_LoaiPhim_Phim] 
 ON [LoaiPhim] ([id_Phim] ASC)
;

ALTER TABLE [LoaiPhim] 
 ADD CONSTRAINT [PK_LoaiPhim]
	PRIMARY KEY CLUSTERED ([id_LoaiPhim])
;

CREATE INDEX [IXFK_Phim_KhachHang] 
 ON [Phim] ([id_KhachHang] ASC)
;

CREATE INDEX [IXFK_Phim_LoaiPhim] 
 ON [Phim] ([id_LoaiPhim] ASC)
;

ALTER TABLE [Phim] 
 ADD CONSTRAINT [PK_Phim]
	PRIMARY KEY CLUSTERED ([id_Phim])
;

CREATE INDEX [IXFK_PhongChieu_RapChieuPhim] 
 ON [PhongChieu] ([id_Rap] ASC)
;

ALTER TABLE [PhongChieu] 
 ADD CONSTRAINT [PK_PhongChieu]
	PRIMARY KEY CLUSTERED ([id_Phong])
;

ALTER TABLE [RapChieuPhim] 
 ADD CONSTRAINT [PK_RapChieuPhim]
	PRIMARY KEY CLUSTERED ([id_Rap])
;

CREATE INDEX [IXFK_Ve_KhachHang] 
 ON [Ve] ([id_KhachHang] ASC)
;

CREATE INDEX [IXFK_Ve_LichChieu] 
 ON [Ve] ([id_LichChieu] ASC)
;

ALTER TABLE [Ve] 
 ADD CONSTRAINT [PK_Ve]
	PRIMARY KEY CLUSTERED ([id_Ve])
;

ALTER TABLE [Admin] ADD CONSTRAINT [FK_Admin_RapChieuPhim]
	FOREIGN KEY ([id_Rap]) REFERENCES [RapChieuPhim] ([id_Rap]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [HangPhim] ADD CONSTRAINT [FK_HangPhim_Phim]
	FOREIGN KEY ([id_Phim]) REFERENCES [Phim] ([id_Phim]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [KhachHang] ADD CONSTRAINT [FK_KhachHang_Phim]
	FOREIGN KEY ([id_Phim]) REFERENCES [Phim] ([id_Phim]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [LichChieu] ADD CONSTRAINT [FK_LichChieu_Phim]
	FOREIGN KEY ([id_Phim]) REFERENCES [Phim] ([id_Phim]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [LichChieu] ADD CONSTRAINT [FK_LichChieu_PhongChieu]
	FOREIGN KEY ([id_Phong]) REFERENCES [PhongChieu] ([id_Phong]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [LoaiPhim] ADD CONSTRAINT [FK_LoaiPhim_Phim]
	FOREIGN KEY ([id_Phim]) REFERENCES  () ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Phim] ADD CONSTRAINT [FK_Phim_KhachHang]
	FOREIGN KEY ([id_KhachHang]) REFERENCES [KhachHang] ([id_KhachHang]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Phim] ADD CONSTRAINT [FK_Phim_LoaiPhim]
	FOREIGN KEY ([id_LoaiPhim]) REFERENCES [LoaiPhim] ([id_LoaiPhim]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [PhongChieu] ADD CONSTRAINT [FK_PhongChieu_RapChieuPhim]
	FOREIGN KEY ([id_Rap]) REFERENCES [RapChieuPhim] ([id_Rap]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Ve] ADD CONSTRAINT [FK_Ve_KhachHang]
	FOREIGN KEY ([id_KhachHang]) REFERENCES [KhachHang] ([id_KhachHang]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Ve] ADD CONSTRAINT [FK_Ve_LichChieu]
	FOREIGN KEY ([id_LichChieu]) REFERENCES [LichChieu] ([id_LichChieu]) ON DELETE No Action ON UPDATE No Action
;
