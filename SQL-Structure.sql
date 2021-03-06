USE [master]
GO
/****** Object:  Database [CarParkingLot]    Script Date: 11/17/2018 01:56:39 ******/
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
/****** Object:  Table [dbo].[Block]    Script Date: 11/17/2018 01:56:39 ******/
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
/****** Object:  Table [dbo].[BlackList]    Script Date: 11/17/2018 01:56:39 ******/
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
/****** Object:  Table [dbo].[BuildingInfo]    Script Date: 11/17/2018 01:56:39 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 11/17/2018 01:56:39 ******/
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
/****** Object:  Table [dbo].[PositionStatus]    Script Date: 11/17/2018 01:56:39 ******/
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
/****** Object:  Table [dbo].[FeeType]    Script Date: 11/17/2018 01:56:39 ******/
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
/****** Object:  Table [dbo].[FeeSession]    Script Date: 11/17/2018 01:56:39 ******/
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
/****** Object:  Table [dbo].[Fee]    Script Date: 11/17/2018 01:56:39 ******/
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
INSERT [dbo].[Fee] ([ID], [TypeID], [SessionID], [Price]) VALUES (1, 1, 1, 30000)
INSERT [dbo].[Fee] ([ID], [TypeID], [SessionID], [Price]) VALUES (2, 1, 2, 40000)
INSERT [dbo].[Fee] ([ID], [TypeID], [SessionID], [Price]) VALUES (3, 1, 3, 50000)
INSERT [dbo].[Fee] ([ID], [TypeID], [SessionID], [Price]) VALUES (4, 2, 1, 40000)
INSERT [dbo].[Fee] ([ID], [TypeID], [SessionID], [Price]) VALUES (5, 2, 2, 50000)
INSERT [dbo].[Fee] ([ID], [TypeID], [SessionID], [Price]) VALUES (6, 2, 3, 60000)
INSERT [dbo].[Fee] ([ID], [TypeID], [SessionID], [Price]) VALUES (7, 3, 1, 80000)
INSERT [dbo].[Fee] ([ID], [TypeID], [SessionID], [Price]) VALUES (8, 3, 2, 80000)
INSERT [dbo].[Fee] ([ID], [TypeID], [SessionID], [Price]) VALUES (9, 3, 3, 80000)
SET IDENTITY_INSERT [dbo].[Fee] OFF
/****** Object:  Table [dbo].[DataLogging]    Script Date: 11/17/2018 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataLogging](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BuildingID] [int] NULL,
	[BlockID] [int] NULL,
	[PositionID] [int] NULL,
	[LoggedDate] [date] NULL,
	[UserName] [nvarchar](max) NULL,
	[LicensePlate] [nvarchar](50) NULL,
	[ArrivalTime] [datetime] NULL,
	[LeavingTime] [datetime] NULL,
	[TotalServiceTime] [datetime] NULL,
	[Charge] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarParkingLayout]    Script Date: 11/17/2018 01:56:39 ******/
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
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (1, 1, 1, 1, 4, NULL, N'', NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (2, 1, 1, 2, 1, 2, N'59D1-20661', CAST(0x0000A99700C5C6DC AS DateTime), NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (3, 1, 1, 3, 3, 3, N'59D1-20662', CAST(0x0000A99700C5C6DC AS DateTime), CAST(0x0000A99700C5C6DC AS DateTime))
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (4, 1, 1, 4, 1, NULL, N'', NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (5, 1, 1, 5, 1, 5, N'59D1-20664', CAST(0x0000A99700C5C6DC AS DateTime), NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (6, 1, 1, 6, 1, 6, N'59D1-20665', CAST(0x0000A99700C5C6DC AS DateTime), CAST(0x0000A99700C5C6DC AS DateTime))
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (7, 1, 1, 7, 3, 7, N'59D1-29999', CAST(0x0000A99700C5C6DC AS DateTime), CAST(0x0000A99700C5C6DC AS DateTime))
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (8, 1, 1, 8, 4, NULL, N'', NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (9, 1, 1, 9, 1, 9, N'59D1-20668', CAST(0x0000A99700C5C6DC AS DateTime), NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (10, 1, 1, 10, 2, 10, N'59D1-20669', CAST(0x0000A99700C5C6DC AS DateTime), CAST(0x0000A99700C5C6DC AS DateTime))
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (11, 1, 1, 11, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarParkingLayout] ([ID], [BuildingID], [BlockID], [PositionID], [StatusID], [UserID], [LicensePlate], [ReservedTime], [ArrivalTime]) VALUES (12, 1, 1, 12, 4, NULL, N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[CarParkingLayout] OFF
/****** Object:  Table [dbo].[Building]    Script Date: 11/17/2018 01:56:39 ******/
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
INSERT [dbo].[Building] ([ID], [SumAvail], [FP7Status], [FP7Count]) VALUES (1, 12, NULL, NULL)
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
/****** Object:  ForeignKey [FK__Fee__Price__30F848ED]    Script Date: 11/17/2018 01:56:39 ******/
ALTER TABLE [dbo].[Fee]  WITH CHECK ADD FOREIGN KEY([TypeID])
REFERENCES [dbo].[FeeType] ([ID])
GO
/****** Object:  ForeignKey [FK__Fee__SessionID__31EC6D26]    Script Date: 11/17/2018 01:56:39 ******/
ALTER TABLE [dbo].[Fee]  WITH CHECK ADD FOREIGN KEY([SessionID])
REFERENCES [dbo].[FeeSession] ([ID])
GO
/****** Object:  ForeignKey [FK__DataLoggi__Block__440B1D61]    Script Date: 11/17/2018 01:56:39 ******/
ALTER TABLE [dbo].[DataLogging]  WITH CHECK ADD FOREIGN KEY([BlockID])
REFERENCES [dbo].[Block] ([ID])
GO
/****** Object:  ForeignKey [FK__DataLoggi__Build__4316F928]    Script Date: 11/17/2018 01:56:39 ******/
ALTER TABLE [dbo].[DataLogging]  WITH CHECK ADD FOREIGN KEY([BuildingID])
REFERENCES [dbo].[BuildingInfo] ([ID])
GO
/****** Object:  ForeignKey [FK__CarParkin__Block__1FCDBCEB]    Script Date: 11/17/2018 01:56:39 ******/
ALTER TABLE [dbo].[CarParkingLayout]  WITH CHECK ADD FOREIGN KEY([BlockID])
REFERENCES [dbo].[Block] ([ID])
GO
/****** Object:  ForeignKey [FK__CarParkin__Build__1ED998B2]    Script Date: 11/17/2018 01:56:39 ******/
ALTER TABLE [dbo].[CarParkingLayout]  WITH CHECK ADD FOREIGN KEY([BuildingID])
REFERENCES [dbo].[BuildingInfo] ([ID])
GO
/****** Object:  ForeignKey [FK__CarParkin__Statu__20C1E124]    Script Date: 11/17/2018 01:56:39 ******/
ALTER TABLE [dbo].[CarParkingLayout]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[PositionStatus] ([ID])
GO
/****** Object:  ForeignKey [FK__CarParkin__UserI__239E4DCF]    Script Date: 11/17/2018 01:56:39 ******/
ALTER TABLE [dbo].[CarParkingLayout]  WITH CHECK ADD  CONSTRAINT [FK__CarParkin__UserI__239E4DCF] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[CarParkingLayout] CHECK CONSTRAINT [FK__CarParkin__UserI__239E4DCF]
GO
/****** Object:  ForeignKey [FK__Building__ID__1DE57479]    Script Date: 11/17/2018 01:56:39 ******/
ALTER TABLE [dbo].[Building]  WITH CHECK ADD FOREIGN KEY([ID])
REFERENCES [dbo].[BuildingInfo] ([ID])
GO
