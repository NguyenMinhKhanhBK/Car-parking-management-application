USE [master]
GO
/****** Object:  Database [CarParkingLot]    Script Date: 12/07/2018 14:32:45 ******/
CREATE DATABASE [CarParkingLot] ON  PRIMARY 
( NAME = N'CarParkingLot', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\CarParkingLot.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CarParkingLot_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\CarParkingLot_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CarParkingLot] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarParkingLot].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarParkingLot] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [CarParkingLot] SET ANSI_NULLS OFF
GO
ALTER DATABASE [CarParkingLot] SET ANSI_PADDING OFF
GO
ALTER DATABASE [CarParkingLot] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [CarParkingLot] SET ARITHABORT OFF
GO
ALTER DATABASE [CarParkingLot] SET AUTO_CLOSE ON
GO
ALTER DATABASE [CarParkingLot] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [CarParkingLot] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [CarParkingLot] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [CarParkingLot] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [CarParkingLot] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [CarParkingLot] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [CarParkingLot] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [CarParkingLot] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [CarParkingLot] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [CarParkingLot] SET  ENABLE_BROKER
GO
ALTER DATABASE [CarParkingLot] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [CarParkingLot] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [CarParkingLot] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [CarParkingLot] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [CarParkingLot] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [CarParkingLot] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [CarParkingLot] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [CarParkingLot] SET  READ_WRITE
GO
ALTER DATABASE [CarParkingLot] SET RECOVERY SIMPLE
GO
ALTER DATABASE [CarParkingLot] SET  MULTI_USER
GO
ALTER DATABASE [CarParkingLot] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [CarParkingLot] SET DB_CHAINING OFF
GO
USE [CarParkingLot]
GO
/****** Object:  Table [dbo].[Block]    Script Date: 12/07/2018 14:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Block](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Block] ON
INSERT [dbo].[Block] ([ID], [DisplayName]) VALUES (1, N'Block 1')
INSERT [dbo].[Block] ([ID], [DisplayName]) VALUES (2, N'Block 2')
INSERT [dbo].[Block] ([ID], [DisplayName]) VALUES (3, N'Block 3')
INSERT [dbo].[Block] ([ID], [DisplayName]) VALUES (4, N'Block 4')
INSERT [dbo].[Block] ([ID], [DisplayName]) VALUES (5, N'Block 5')
INSERT [dbo].[Block] ([ID], [DisplayName]) VALUES (6, N'Block 6')
INSERT [dbo].[Block] ([ID], [DisplayName]) VALUES (7, N'Block 7')
INSERT [dbo].[Block] ([ID], [DisplayName]) VALUES (8, N'Block 8')
INSERT [dbo].[Block] ([ID], [DisplayName]) VALUES (9, N'Block 9')
INSERT [dbo].[Block] ([ID], [DisplayName]) VALUES (10, N'Block 10')
SET IDENTITY_INSERT [dbo].[Block] OFF
/****** Object:  Table [dbo].[BlackList]    Script Date: 12/07/2018 14:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlackList](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
	[LicensePlate] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BlackList] ON
INSERT [dbo].[BlackList] ([ID], [DisplayName], [LicensePlate], [PhoneNumber]) VALUES (2, N'Lê Văn B', N'67D2-12345', N'0909090909')
INSERT [dbo].[BlackList] ([ID], [DisplayName], [LicensePlate], [PhoneNumber]) VALUES (3, N'Lê Văn C', N'67D2-12346', N'0908080908')
INSERT [dbo].[BlackList] ([ID], [DisplayName], [LicensePlate], [PhoneNumber]) VALUES (4, N'Lê Văn D', N'67D2-12347', N'0907090909')
INSERT [dbo].[BlackList] ([ID], [DisplayName], [LicensePlate], [PhoneNumber]) VALUES (6, N'Nguyễn Văn F', N'67D1-20423', N'019191919')
INSERT [dbo].[BlackList] ([ID], [DisplayName], [LicensePlate], [PhoneNumber]) VALUES (7, N'Nguyễn Minh Khánh', N'60D1-22222', N'0909222222')
INSERT [dbo].[BlackList] ([ID], [DisplayName], [LicensePlate], [PhoneNumber]) VALUES (8, N'Lê Văn G', N'50D1-11111', N'2222222222')
INSERT [dbo].[BlackList] ([ID], [DisplayName], [LicensePlate], [PhoneNumber]) VALUES (15, N'Kim Tae Hee', N'59D1-12334', N'0918898989')
SET IDENTITY_INSERT [dbo].[BlackList] OFF
/****** Object:  Table [dbo].[BuildingInfo]    Script Date: 12/07/2018 14:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildingInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
	[Longtitude] [real] NULL,
	[Latitude] [real] NULL,
	[Url] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BuildingInfo] ON
INSERT [dbo].[BuildingInfo] ([ID], [DisplayName], [Location], [Longtitude], [Latitude], [Url]) VALUES (1, N'Quận 1', N'Đường Tự Do', 0, 0, NULL)
INSERT [dbo].[BuildingInfo] ([ID], [DisplayName], [Location], [Longtitude], [Latitude], [Url]) VALUES (2, N'Quận 2', N'Đường Dân Chủ', 1, 1, NULL)
INSERT [dbo].[BuildingInfo] ([ID], [DisplayName], [Location], [Longtitude], [Latitude], [Url]) VALUES (3, N'Quận 3', N'Đường Lam Sơn', 2, 2, NULL)
INSERT [dbo].[BuildingInfo] ([ID], [DisplayName], [Location], [Longtitude], [Latitude], [Url]) VALUES (4, N'Quận 4', N'Đường Quang Trung', 3, 3, NULL)
INSERT [dbo].[BuildingInfo] ([ID], [DisplayName], [Location], [Longtitude], [Latitude], [Url]) VALUES (5, N'Quận 5', N'Đường Tao Ngộ', 4, 4, NULL)
INSERT [dbo].[BuildingInfo] ([ID], [DisplayName], [Location], [Longtitude], [Latitude], [Url]) VALUES (6, N'Quận 6', N'Đường Hưng Đạo', 5, 5, NULL)
INSERT [dbo].[BuildingInfo] ([ID], [DisplayName], [Location], [Longtitude], [Latitude], [Url]) VALUES (7, N'Quận 7', N'Đường Lý Thường Kiệt', 6, 6, NULL)
INSERT [dbo].[BuildingInfo] ([ID], [DisplayName], [Location], [Longtitude], [Latitude], [Url]) VALUES (8, N'Quận 8', N'Đường Hồng Bàng', 7, 7, NULL)
INSERT [dbo].[BuildingInfo] ([ID], [DisplayName], [Location], [Longtitude], [Latitude], [Url]) VALUES (9, N'Quận 9', N'Đường Trưng Vương', 8, 8, NULL)
INSERT [dbo].[BuildingInfo] ([ID], [DisplayName], [Location], [Longtitude], [Latitude], [Url]) VALUES (10, N'Quận 10', N'Đường Lê Lợi', 9, 9, NULL)
INSERT [dbo].[BuildingInfo] ([ID], [DisplayName], [Location], [Longtitude], [Latitude], [Url]) VALUES (11, N'Quận 11', N'Đường Độc Lập', 10, 10, NULL)
INSERT [dbo].[BuildingInfo] ([ID], [DisplayName], [Location], [Longtitude], [Latitude], [Url]) VALUES (12, N'Quận 12', N'Đường Lê Quý Đôn', 11, 11, NULL)
SET IDENTITY_INSERT [dbo].[BuildingInfo] OFF
/****** Object:  Table [dbo].[FeeType]    Script Date: 12/07/2018 14:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeeType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FeeType] ON
INSERT [dbo].[FeeType] ([ID], [TypeName]) VALUES (1, N'Ngày thường')
INSERT [dbo].[FeeType] ([ID], [TypeName]) VALUES (2, N'Sự kiện')
INSERT [dbo].[FeeType] ([ID], [TypeName]) VALUES (3, N'Ngày lễ')
SET IDENTITY_INSERT [dbo].[FeeType] OFF
/****** Object:  Table [dbo].[FeeSession]    Script Date: 12/07/2018 14:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeeSession](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SessionName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FeeSession] ON
INSERT [dbo].[FeeSession] ([ID], [SessionName]) VALUES (1, N'Buổi sáng')
INSERT [dbo].[FeeSession] ([ID], [SessionName]) VALUES (2, N'Buổi chiều')
INSERT [dbo].[FeeSession] ([ID], [SessionName]) VALUES (3, N'Buổi tối')
SET IDENTITY_INSERT [dbo].[FeeSession] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 12/07/2018 14:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
	[Username] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Balance] [bigint] NULL,
	[Score] [int] NULL,
 CONSTRAINT [PK__Users__3214EC270EA330E9] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (1, N'Nguyễn Văn A', N'0123456789', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (2, N'Nguyễn Văn B', N'0123456710', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (3, N'Nguyễn Văn C', N'0123456711', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (4, N'Nguyễn Văn D', N'0123456712', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (5, N'Nguyễn Văn E', N'0123456713', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (6, N'Nguyễn Văn F', N'0123456714', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (7, N'Nguyễn Văn G', N'0123456715', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (8, N'Nguyễn Văn H', N'0123456716', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (9, N'Nguyễn Văn I', N'0123456717', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (10, N'Nguyễn Văn K', N'0123456718', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (11, N'Nguyễn Văn L', N'0123456719', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (12, N'Nguyễn Văn M', N'0123456720', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (13, N'Nguyễn Văn N', N'0123456721', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (14, N'Nguyễn Văn O', N'0123456722', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (15, N'Nguyễn Văn P', N'0123456723', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (16, N'Nguyễn Văn Q', N'0123456724', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (17, N'Nguyễn Văn R', N'0123456725', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (18, N'Nguyễn Văn S', N'0123456726', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (19, N'Nguyễn Văn T', N'0123456727', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (20, N'Nguyễn Văn U', N'0123456728', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (21, N'Nguyễn Văn W', N'0123456729', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (22, N'Nguyễn Văn V', N'0123456730', N'admin', 200000, 0)
INSERT [dbo].[Users] ([ID], [DisplayName], [Username], [Password], [Balance], [Score]) VALUES (23, N'Nguyễn Văn Y', N'0123456731', N'admin', 200000, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[PositionStatus]    Script Date: 12/07/2018 14:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PositionStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PositionStatus] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PositionStatus] ON
INSERT [dbo].[PositionStatus] ([ID], [PositionStatus]) VALUES (1, N'Available')
INSERT [dbo].[PositionStatus] ([ID], [PositionStatus]) VALUES (2, N'Booked')
INSERT [dbo].[PositionStatus] ([ID], [PositionStatus]) VALUES (3, N'Occupied')
INSERT [dbo].[PositionStatus] ([ID], [PositionStatus]) VALUES (4, N'Maintance')
SET IDENTITY_INSERT [dbo].[PositionStatus] OFF
/****** Object:  Table [dbo].[Pending]    Script Date: 12/07/2018 14:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pending](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BuildingID] [int] NULL,
	[NumberPhone] [nvarchar](50) NULL,
	[CarCount] [int] NULL,
	[LicensePlate] [nvarchar](50) NULL,
	[Times] [int] NULL,
	[TimeExpired] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fee]    Script Date: 12/07/2018 14:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NULL,
	[SessionID] [int] NULL,
	[Price] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Fee] ON
INSERT [dbo].[Fee] ([ID], [TypeID], [SessionID], [Price]) VALUES (1, 1, 1, 60009)
INSERT [dbo].[Fee] ([ID], [TypeID], [SessionID], [Price]) VALUES (2, 1, 2, 30088)
INSERT [dbo].[Fee] ([ID], [TypeID], [SessionID], [Price]) VALUES (3, 1, 3, 40000)
INSERT [dbo].[Fee] ([ID], [TypeID], [SessionID], [Price]) VALUES (4, 2, 1, 10000)
INSERT [dbo].[Fee] ([ID], [TypeID], [SessionID], [Price]) VALUES (5, 2, 2, 29000)
INSERT [dbo].[Fee] ([ID], [TypeID], [SessionID], [Price]) VALUES (6, 2, 3, 92000)
INSERT [dbo].[Fee] ([ID], [TypeID], [SessionID], [Price]) VALUES (7, 3, 1, 111000)
INSERT [dbo].[Fee] ([ID], [TypeID], [SessionID], [Price]) VALUES (8, 3, 2, 111000)
INSERT [dbo].[Fee] ([ID], [TypeID], [SessionID], [Price]) VALUES (9, 3, 3, 111000)
SET IDENTITY_INSERT [dbo].[Fee] OFF
/****** Object:  Table [dbo].[DataLogging]    Script Date: 12/07/2018 14:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataLogging](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BuildingID] [int] NULL,
	[BlockID] [int] NULL,
	[PositionID] [int] NULL,
	[LoggedTime] [datetime] NULL,
	[UserName] [nvarchar](max) NULL,
	[LicensePlate] [nvarchar](50) NULL,
	[ArrivalTime] [datetime] NULL,
	[LeavingTime] [datetime] NULL,
	[TotalServiceMinutes] [bigint] NULL,
	[Charge] [real] NULL,
 CONSTRAINT [PK__DataLogg__3214EC27412EB0B6] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DataLogging] ON
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (1, 1, 1, 1, CAST(0x0000A99D00000000 AS DateTime), N'0123456789', N'59D1-11111', CAST(0x0000A99D00A4CB80 AS DateTime), CAST(0x0000A99D00F73140 AS DateTime), 300, 100000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (2, 1, 1, 2, CAST(0x0000A99D00000000 AS DateTime), N'00000001', N'59D1-11112', CAST(0x0000A99D00AA49C0 AS DateTime), CAST(0x0000A99D00CB3F40 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (3, 1, 1, 3, CAST(0x0000A99D00000000 AS DateTime), N'00000002', N'59D1-11113', CAST(0x0000A99D00BAC480 AS DateTime), CAST(0x0000A99D00DBBA00 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (4, 1, 1, 4, CAST(0x0000A99D00000000 AS DateTime), N'00000003', N'59D1-11114', CAST(0x0000A99D00CB3F40 AS DateTime), CAST(0x0000A99D00EC34C0 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (5, 1, 1, 5, CAST(0x0000A99D00000000 AS DateTime), N'00000004', N'59D1-11115', CAST(0x0000A99D00DBBA00 AS DateTime), CAST(0x0000A99D00FCAF80 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (6, 1, 1, 6, CAST(0x0000A99D00000000 AS DateTime), N'00000005', N'59D1-11116', CAST(0x0000A99D00EC34C0 AS DateTime), CAST(0x0000A99D010D2A40 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (7, 1, 1, 7, CAST(0x0000A99D00000000 AS DateTime), N'00000006', N'59D1-11117', CAST(0x0000A99D00FCAF80 AS DateTime), CAST(0x0000A99D011DA500 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (8, 1, 1, 8, CAST(0x0000A99D00000000 AS DateTime), N'00000007', N'59D1-11118', CAST(0x0000A99D010D2A40 AS DateTime), CAST(0x0000A99D012E1FC0 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (9, 1, 1, 9, CAST(0x0000A99D00000000 AS DateTime), N'00000008', N'59D1-11119', CAST(0x0000A99D011DA500 AS DateTime), CAST(0x0000A99D013E9A80 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (10, 1, 1, 10, CAST(0x0000A99D00000000 AS DateTime), N'00000009', N'59D1-11120', CAST(0x0000A99D012E1FC0 AS DateTime), CAST(0x0000A99D014F1540 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (11, 1, 1, 11, CAST(0x0000A99D00000000 AS DateTime), N'00000010', N'59D1-11121', CAST(0x0000A99D013E9A80 AS DateTime), CAST(0x0000A99D015F9000 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (12, 1, 1, 12, CAST(0x0000A99D00000000 AS DateTime), N'00000011', N'59D1-11122', CAST(0x0000A99D014F1540 AS DateTime), CAST(0x0000A99E0015F900 AS DateTime), 500, 300000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (13, 1, 1, 1, CAST(0x0000A99D00000000 AS DateTime), N'00000012', N'59D1-11123', CAST(0x0000A99D0057E400 AS DateTime), CAST(0x0000A99D00DBBA00 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (14, 1, 1, 2, CAST(0x0000A99D00000000 AS DateTime), N'00000013', N'59D1-11124', CAST(0x0000A99D00685EC0 AS DateTime), CAST(0x0000A99D00DBBA00 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (15, 1, 1, 3, CAST(0x0000A99D00000000 AS DateTime), N'00000014', N'59D1-11125', CAST(0x0000A99D0078D980 AS DateTime), CAST(0x0000A99D00DBBA00 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (16, 1, 1, 4, CAST(0x0000A99D00000000 AS DateTime), N'00000015', N'59D1-11126', CAST(0x0000A99D00895440 AS DateTime), CAST(0x0000A99D00EC34C0 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (17, 1, 1, 5, CAST(0x0000A99D00000000 AS DateTime), N'00000016', N'59D1-11127', CAST(0x0000A99D0099CF00 AS DateTime), CAST(0x0000A99D00FCAF80 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (18, 1, 1, 6, CAST(0x0000A99D00000000 AS DateTime), N'00000017', N'59D1-11128', CAST(0x0000A99D0015F900 AS DateTime), CAST(0x0000A99D010D2A40 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (19, 1, 1, 7, CAST(0x0000A99D00000000 AS DateTime), N'000000018', N'59D1-11129', CAST(0x0000A99D002673C0 AS DateTime), CAST(0x0000A99D011DA500 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (20, 1, 1, 8, CAST(0x0000A99D00000000 AS DateTime), N'00000019', N'59D1-11130', CAST(0x0000A99D0036EE80 AS DateTime), CAST(0x0000A99D012E1FC0 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (21, 1, 1, 9, CAST(0x0000A99D00000000 AS DateTime), N'00000020', N'59D1-11131', CAST(0x0000A99D00476940 AS DateTime), CAST(0x0000A99D013E9A80 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (22, 1, 1, 10, CAST(0x0000A99D00000000 AS DateTime), N'00000021', N'59D1-11132', CAST(0x0000A99D0057E400 AS DateTime), CAST(0x0000A99D014F1540 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (23, 1, 1, 11, CAST(0x0000A99D00000000 AS DateTime), N'00000022', N'59D1-11133', CAST(0x0000A99D00685EC0 AS DateTime), CAST(0x0000A99D015F9000 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (24, 1, 1, 12, CAST(0x0000A99D00000000 AS DateTime), N'00000023', N'59D1-11134', CAST(0x0000A99D0078D980 AS DateTime), CAST(0x0000A99D0099CF00 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (25, 1, 1, 1, CAST(0x0000A99E00000000 AS DateTime), N'00000012', N'59D1-11123', CAST(0x0000A99E0057E400 AS DateTime), CAST(0x0000A99E00DBBA00 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (26, 1, 1, 2, CAST(0x0000A99E00000000 AS DateTime), N'00000013', N'59D1-11124', CAST(0x0000A99E00685EC0 AS DateTime), CAST(0x0000A99E00DBBA00 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (27, 1, 1, 3, CAST(0x0000A99E00000000 AS DateTime), N'00000014', N'59D1-11125', CAST(0x0000A99E0078D980 AS DateTime), CAST(0x0000A99E00DBBA00 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (28, 1, 1, 4, CAST(0x0000A99E00000000 AS DateTime), N'00000015', N'59D1-11126', CAST(0x0000A99E00895440 AS DateTime), CAST(0x0000A99E00EC34C0 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (29, 1, 1, 5, CAST(0x0000A99E00000000 AS DateTime), N'00000016', N'59D1-11127', CAST(0x0000A99E0099CF00 AS DateTime), CAST(0x0000A99E00FCAF80 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (30, 1, 1, 6, CAST(0x0000A99E00000000 AS DateTime), N'00000017', N'59D1-11128', CAST(0x0000A99E0015F900 AS DateTime), CAST(0x0000A99E010D2A40 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (31, 1, 1, 7, CAST(0x0000A99E00000000 AS DateTime), N'000000018', N'59D1-11129', CAST(0x0000A99E002673C0 AS DateTime), CAST(0x0000A99E011DA500 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (32, 1, 1, 8, CAST(0x0000A99E00000000 AS DateTime), N'00000019', N'59D1-11130', CAST(0x0000A99E0036EE80 AS DateTime), CAST(0x0000A99E012E1FC0 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (33, 1, 1, 9, CAST(0x0000A99E00000000 AS DateTime), N'00000020', N'59D1-11131', CAST(0x0000A99E00476940 AS DateTime), CAST(0x0000A99E013E9A80 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (34, 1, 1, 10, CAST(0x0000A99E00000000 AS DateTime), N'00000021', N'59D1-11132', CAST(0x0000A99E0057E400 AS DateTime), CAST(0x0000A99E014F1540 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (35, 1, 1, 11, CAST(0x0000A99E00000000 AS DateTime), N'00000022', N'59D1-11133', CAST(0x0000A99E00685EC0 AS DateTime), CAST(0x0000A99E015F9000 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (36, 1, 1, 12, CAST(0x0000A99E00000000 AS DateTime), N'00000023', N'59D1-11134', CAST(0x0000A99E0078D980 AS DateTime), CAST(0x0000A99E0099CF00 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (37, 1, 1, 1, CAST(0x0000A99E00000000 AS DateTime), N'00000012', N'59D1-11123', CAST(0x0000A99E0057E400 AS DateTime), CAST(0x0000A99F00DBBA00 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (38, 1, 1, 2, CAST(0x0000A99E00000000 AS DateTime), N'00000013', N'59D1-11124', CAST(0x0000A99E00685EC0 AS DateTime), CAST(0x0000A99F00DBBA00 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (39, 1, 1, 3, CAST(0x0000A99E00000000 AS DateTime), N'00000014', N'59D1-11125', CAST(0x0000A99E0078D980 AS DateTime), CAST(0x0000A99F00DBBA00 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (40, 1, 1, 4, CAST(0x0000A99E00000000 AS DateTime), N'00000015', N'59D1-11126', CAST(0x0000A99E00895440 AS DateTime), CAST(0x0000A99F00EC34C0 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (41, 1, 1, 5, CAST(0x0000A99E00000000 AS DateTime), N'00000016', N'59D1-11127', CAST(0x0000A99E0099CF00 AS DateTime), CAST(0x0000A99F00FCAF80 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (42, 1, 1, 6, CAST(0x0000A99E00000000 AS DateTime), N'00000017', N'59D1-11128', CAST(0x0000A99E0015F900 AS DateTime), CAST(0x0000A99F010D2A40 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (43, 1, 1, 7, CAST(0x0000A99E00000000 AS DateTime), N'000000018', N'59D1-11129', CAST(0x0000A99E002673C0 AS DateTime), CAST(0x0000A99F011DA500 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (44, 1, 1, 8, CAST(0x0000A99E00000000 AS DateTime), N'00000019', N'59D1-11130', CAST(0x0000A99E0036EE80 AS DateTime), CAST(0x0000A99F012E1FC0 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (45, 1, 1, 9, CAST(0x0000A99E00000000 AS DateTime), N'00000020', N'59D1-11131', CAST(0x0000A99E00476940 AS DateTime), CAST(0x0000A99F013E9A80 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (46, 1, 1, 10, CAST(0x0000A99E00000000 AS DateTime), N'00000021', N'59D1-11132', CAST(0x0000A99E0057E400 AS DateTime), CAST(0x0000A99F014F1540 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (47, 1, 1, 11, CAST(0x0000A99E00000000 AS DateTime), N'00000022', N'59D1-11133', CAST(0x0000A99E00685EC0 AS DateTime), CAST(0x0000A99F015F9000 AS DateTime), 120, 40000)
INSERT [dbo].[DataLogging] ([ID], [BuildingID], [BlockID], [PositionID], [LoggedTime], [UserName], [LicensePlate], [ArrivalTime], [LeavingTime], [TotalServiceMinutes], [Charge]) VALUES (48, 1, 1, 12, CAST(0x0000A99E00000000 AS DateTime), N'00000023', N'59D1-11134', CAST(0x0000A99E0078D980 AS DateTime), CAST(0x0000A99F0099CF00 AS DateTime), 120, 40000)
SET IDENTITY_INSERT [dbo].[DataLogging] OFF
/****** Object:  Table [dbo].[CarParkingLayout]    Script Date: 12/07/2018 14:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarParkingLayout](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BuildingID] [int] NULL,
	[BlockID] [int] NULL,
	[PositionID] [int] NULL,
	[StatusID] [int] NULL,
	[UserID] [bigint] NULL,
	[LicensePlate] [nvarchar](50) NULL,
	[ReservedTime] [datetime] NULL,
	[ArrivalTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CarParkingLayout] ON
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (1, 1, 1, 1, 1, NULL, N'', NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (2, 1, 1, 2, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (3, 1, 1, 3, 1, 3, N'59D1-20662', CAST(0x0000A99700C5C6DC AS DateTime), CAST(0x0000A99700C5C6DC AS DateTime))
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (4, 1, 1, 4, 2, NULL, N'', NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (5, 1, 1, 5, 1, 5, N'59D1-20664', CAST(0x0000A99700C5C6DC AS DateTime), NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (6, 1, 1, 6, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (7, 1, 1, 7, 1, 7, N'59D1-29999', CAST(0x0000A99700C5C6DC AS DateTime), CAST(0x0000A99700C5C6DC AS DateTime))
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (8, 1, 1, 8, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (9, 1, 1, 9, 1, 9, N'59D1-20668', CAST(0x0000A99700C5C6DC AS DateTime), NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (10, 1, 1, 10, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (11, 1, 1, 11, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (12, 1, 1, 12, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (14, 1, 2, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (15, 1, 2, 2, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (16, 1, 2, 3, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (17, 1, 2, 4, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (18, 1, 2, 5, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (19, 1, 2, 6, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (20, 1, 2, 7, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (21, 1, 2, 8, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (22, 1, 2, 9, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (23, 1, 2, 10, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (24, 1, 2, 11, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (25, 1, 2, 12, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (26, 2, 1, 1, 2, 19, N'59A-99999', CAST(0x0000A9A301576932 AS DateTime), NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (27, 2, 1, 2, 2, 19, N'67A-77777', CAST(0x0000A9A30157A58B AS DateTime), NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (28, 2, 1, 3, 3, 4, N'67D1-10001', CAST(0x0000A9A200C5C6DC AS DateTime), NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (29, 2, 1, 4, 2, 19, N'63T1-11111', CAST(0x0000A9A301664F24 AS DateTime), NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (30, 2, 1, 5, 2, 19, N'63T1-11111', CAST(0x0000A9A30157FFC5 AS DateTime), NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (31, 2, 1, 6, 2, 3, N'67D1-10002', CAST(0x0000A9A300A4D15C AS DateTime), NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (32, 2, 1, 7, 3, 5, N'67D1-10003', CAST(0x0000A9A20094569C AS DateTime), CAST(0x0000A9A300D6419C AS DateTime))
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (33, 2, 1, 8, 2, 19, N'63T1-22222', CAST(0x0000A9A301664F39 AS DateTime), NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (34, 2, 1, 9, 2, 19, N'63T1-33333', CAST(0x0000A9A301664F40 AS DateTime), NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (35, 2, 1, 10, 3, 6, N'67D1-10004', CAST(0x0000A99A0041F0DC AS DateTime), CAST(0x0000A99A0062E65C AS DateTime))
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (36, 2, 1, 11, 2, 7, N'67D1-10005', CAST(0x0000A99E00C5C6DC AS DateTime), NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (37, 2, 1, 12, 2, 19, N'63T1-11111', CAST(0x0000A9A3015838BB AS DateTime), NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (38, 2, 2, 1, 2, 19, N'63T1-11111', CAST(0x0000A9A30158D668 AS DateTime), NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (39, 2, 2, 2, 2, 19, N'63T1-22222', CAST(0x0000A9A30158D67B AS DateTime), NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (40, 2, 2, 3, 2, 19, N'63T1-33333', CAST(0x0000A9A30158D69E AS DateTime), NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (41, 2, 2, 4, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (42, 2, 2, 5, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (43, 2, 2, 6, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (44, 2, 2, 7, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (45, 2, 2, 8, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (46, 2, 2, 9, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (47, 2, 2, 10, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (48, 2, 2, 11, 2, 19, N'63T1-11111', CAST(0x0000A9A30167682F AS DateTime), NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (49, 2, 2, 12, 2, 19, N'63T1-22222', CAST(0x0000A9A3016770F6 AS DateTime), NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (50, 3, 1, 1, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (51, 3, 1, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (52, 3, 1, 3, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (53, 3, 1, 4, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (54, 3, 1, 5, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (55, 3, 1, 6, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (56, 3, 1, 7, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (57, 3, 1, 8, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (58, 3, 1, 9, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (59, 3, 1, 10, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (60, 3, 1, 11, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (61, 3, 1, 12, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (62, 3, 2, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (63, 3, 2, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (64, 3, 2, 3, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (65, 3, 2, 4, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (66, 3, 2, 5, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (67, 3, 2, 6, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (68, 3, 2, 7, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (69, 3, 2, 8, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (70, 3, 2, 9, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (71, 3, 2, 10, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (72, 3, 2, 11, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (73, 3, 2, 12, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (74, 4, 1, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (75, 4, 1, 2, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (76, 4, 1, 3, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (77, 4, 1, 4, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (78, 4, 1, 5, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (79, 4, 1, 6, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (80, 4, 1, 7, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (81, 4, 1, 8, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (82, 4, 1, 9, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (83, 4, 1, 10, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (84, 4, 1, 11, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (85, 4, 1, 12, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (86, 5, 2, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (87, 5, 2, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (88, 5, 2, 3, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (89, 5, 2, 4, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (90, 5, 2, 5, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (91, 5, 2, 6, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (92, 5, 2, 7, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (93, 5, 2, 8, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (94, 5, 2, 9, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (95, 5, 2, 10, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (96, 5, 2, 11, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (97, 5, 2, 12, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (98, 5, 1, 1, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (99, 5, 1, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (100, 5, 1, 3, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (101, 5, 1, 4, 1, NULL, NULL, NULL, NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (102, 5, 1, 5, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (103, 5, 1, 6, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (104, 5, 1, 7, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (105, 5, 1, 8, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (106, 5, 1, 9, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (107, 5, 1, 10, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (108, 5, 1, 11, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (109, 5, 1, 12, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (110, 4, 2, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (111, 4, 2, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (112, 4, 2, 3, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (113, 4, 2, 4, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (114, 4, 2, 5, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (115, 4, 2, 6, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (116, 4, 2, 7, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (117, 4, 2, 8, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (118, 4, 2, 9, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (119, 4, 2, 10, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (120, 4, 2, 11, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (121, 4, 2, 12, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CarParkingLayout] OFF
/****** Object:  Table [dbo].[Building]    Script Date: 12/07/2018 14:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building](
	[ID] [int] NOT NULL,
	[SumAvail] [int] NULL,
	[FP7Status] [nvarchar](max) NULL,
	[FP7Count] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Building] ([ID], [SumAvail], [FP7Status], [FP7Count]) VALUES (1, 5, N'121212121212121212121212', 2)
INSERT [dbo].[Building] ([ID], [SumAvail], [FP7Status], [FP7Count]) VALUES (2, 2, NULL, NULL)
INSERT [dbo].[Building] ([ID], [SumAvail], [FP7Status], [FP7Count]) VALUES (3, 10, NULL, NULL)
INSERT [dbo].[Building] ([ID], [SumAvail], [FP7Status], [FP7Count]) VALUES (4, 4, NULL, NULL)
INSERT [dbo].[Building] ([ID], [SumAvail], [FP7Status], [FP7Count]) VALUES (5, 5, NULL, NULL)
INSERT [dbo].[Building] ([ID], [SumAvail], [FP7Status], [FP7Count]) VALUES (6, 6, NULL, NULL)
INSERT [dbo].[Building] ([ID], [SumAvail], [FP7Status], [FP7Count]) VALUES (7, 7, NULL, NULL)
INSERT [dbo].[Building] ([ID], [SumAvail], [FP7Status], [FP7Count]) VALUES (8, 8, NULL, NULL)
INSERT [dbo].[Building] ([ID], [SumAvail], [FP7Status], [FP7Count]) VALUES (9, 9, NULL, NULL)
INSERT [dbo].[Building] ([ID], [SumAvail], [FP7Status], [FP7Count]) VALUES (10, 2, NULL, NULL)
INSERT [dbo].[Building] ([ID], [SumAvail], [FP7Status], [FP7Count]) VALUES (11, 10, NULL, NULL)
INSERT [dbo].[Building] ([ID], [SumAvail], [FP7Status], [FP7Count]) VALUES (12, 7, NULL, NULL)
/****** Object:  ForeignKey [FK__Pending__Buildin__5629CD9C]    Script Date: 12/07/2018 14:32:46 ******/
ALTER TABLE [dbo].[Pending]  WITH CHECK ADD FOREIGN KEY([BuildingID])
REFERENCES [dbo].[BuildingInfo] ([ID])
GO
/****** Object:  ForeignKey [FK__Fee__Price__30F848ED]    Script Date: 12/07/2018 14:32:46 ******/
ALTER TABLE [dbo].[Fee]  WITH CHECK ADD FOREIGN KEY([TypeID])
REFERENCES [dbo].[FeeType] ([ID])
GO
/****** Object:  ForeignKey [FK__Fee__SessionID__31EC6D26]    Script Date: 12/07/2018 14:32:46 ******/
ALTER TABLE [dbo].[Fee]  WITH CHECK ADD FOREIGN KEY([SessionID])
REFERENCES [dbo].[FeeSession] ([ID])
GO
/****** Object:  ForeignKey [FK__DataLoggi__Block__440B1D61]    Script Date: 12/07/2018 14:32:46 ******/
ALTER TABLE [dbo].[DataLogging]  WITH CHECK ADD  CONSTRAINT [FK__DataLoggi__Block__440B1D61] FOREIGN KEY([BlockID])
REFERENCES [dbo].[Block] ([ID])
GO
ALTER TABLE [dbo].[DataLogging] CHECK CONSTRAINT [FK__DataLoggi__Block__440B1D61]
GO
/****** Object:  ForeignKey [FK__DataLoggi__Build__4316F928]    Script Date: 12/07/2018 14:32:46 ******/
ALTER TABLE [dbo].[DataLogging]  WITH CHECK ADD  CONSTRAINT [FK__DataLoggi__Build__4316F928] FOREIGN KEY([BuildingID])
REFERENCES [dbo].[BuildingInfo] ([ID])
GO
ALTER TABLE [dbo].[DataLogging] CHECK CONSTRAINT [FK__DataLoggi__Build__4316F928]
GO
/****** Object:  ForeignKey [FK__CarParkin__Block__1FCDBCEB]    Script Date: 12/07/2018 14:32:46 ******/
ALTER TABLE [dbo].[CarParkingLayout]  WITH CHECK ADD FOREIGN KEY([BlockID])
REFERENCES [dbo].[Block] ([ID])
GO
/****** Object:  ForeignKey [FK__CarParkin__Build__1ED998B2]    Script Date: 12/07/2018 14:32:46 ******/
ALTER TABLE [dbo].[CarParkingLayout]  WITH CHECK ADD FOREIGN KEY([BuildingID])
REFERENCES [dbo].[BuildingInfo] ([ID])
GO
/****** Object:  ForeignKey [FK__CarParkin__Statu__20C1E124]    Script Date: 12/07/2018 14:32:46 ******/
ALTER TABLE [dbo].[CarParkingLayout]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[PositionStatus] ([ID])
GO
/****** Object:  ForeignKey [FK__CarParkin__UserI__239E4DCF]    Script Date: 12/07/2018 14:32:46 ******/
ALTER TABLE [dbo].[CarParkingLayout]  WITH CHECK ADD  CONSTRAINT [FK__CarParkin__UserI__239E4DCF] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[CarParkingLayout] CHECK CONSTRAINT [FK__CarParkin__UserI__239E4DCF]
GO
/****** Object:  ForeignKey [FK__Building__ID__1DE57479]    Script Date: 12/07/2018 14:32:46 ******/
ALTER TABLE [dbo].[Building]  WITH CHECK ADD FOREIGN KEY([ID])
REFERENCES [dbo].[BuildingInfo] ([ID])
GO
