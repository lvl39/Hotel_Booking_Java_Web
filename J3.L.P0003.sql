USE [master]
GO
/****** Object:  Database [J3.L.P0003]    Script Date: 12/8/2019 10:17:22 AM ******/
CREATE DATABASE [J3.L.P0003]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'J3.L.P0003', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\J3.L.P0003.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'J3.L.P0003_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\J3.L.P0003_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [J3.L.P0003] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [J3.L.P0003].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [J3.L.P0003] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [J3.L.P0003] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [J3.L.P0003] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [J3.L.P0003] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [J3.L.P0003] SET ARITHABORT OFF 
GO
ALTER DATABASE [J3.L.P0003] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [J3.L.P0003] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [J3.L.P0003] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [J3.L.P0003] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [J3.L.P0003] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [J3.L.P0003] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [J3.L.P0003] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [J3.L.P0003] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [J3.L.P0003] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [J3.L.P0003] SET  DISABLE_BROKER 
GO
ALTER DATABASE [J3.L.P0003] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [J3.L.P0003] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [J3.L.P0003] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [J3.L.P0003] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [J3.L.P0003] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [J3.L.P0003] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [J3.L.P0003] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [J3.L.P0003] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [J3.L.P0003] SET  MULTI_USER 
GO
ALTER DATABASE [J3.L.P0003] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [J3.L.P0003] SET DB_CHAINING OFF 
GO
ALTER DATABASE [J3.L.P0003] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [J3.L.P0003] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [J3.L.P0003] SET DELAYED_DURABILITY = DISABLED 
GO
USE [J3.L.P0003]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 12/8/2019 10:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAccount](
	[Email] [varchar](255) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Status] [varchar](25) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblAccount] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblArea]    Script Date: 12/8/2019 10:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblArea](
	[AreaId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblArea] PRIMARY KEY CLUSTERED 
(
	[AreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCoupon]    Script Date: 12/8/2019 10:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCoupon](
	[Code] [varchar](15) NOT NULL,
	[Value] [float] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Status] [varchar](15) NOT NULL,
 CONSTRAINT [PK_tblCoupon] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblHotel]    Script Date: 12/8/2019 10:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblHotel](
	[HotelId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Address] [varchar](255) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Photo] [varchar](255) NOT NULL,
	[AreaId] [int] NOT NULL,
	[Description] [varchar](max) NULL,
	[Status] [varchar](15) NOT NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_tblHotel] PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 12/8/2019 10:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrder](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Total] [float] NOT NULL,
	[CouponCode] [varchar](15) NULL,
	[CouponValue] [float] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Status] [varchar](15) NOT NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 12/8/2019 10:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CheckIn] [datetime] NOT NULL,
	[CheckOut] [datetime] NOT NULL,
	[SubTotal] [float] NOT NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 12/8/2019 10:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRole](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](15) NOT NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRoom]    Script Date: 12/8/2019 10:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRoom](
	[HotelId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[MaxPeople] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
 CONSTRAINT [PK_tblRoomType] PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC,
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblType]    Script Date: 12/8/2019 10:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblType](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblType] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUserInfo]    Script Date: 12/8/2019 10:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUserInfo](
	[Email] [varchar](255) NOT NULL,
	[Fullname] [varchar](255) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Address] [varchar](255) NOT NULL,
 CONSTRAINT [PK_tblUserInfo] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblAccount] ([Email], [Password], [RoleId], [Status], [CreatedDate]) VALUES (N'admin@admin.com', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1, N'Active', CAST(N'2019-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblAccount] ([Email], [Password], [RoleId], [Status], [CreatedDate]) VALUES (N'admin2@admin.com', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1, N'Active', CAST(N'2019-12-02 08:43:30.310' AS DateTime))
INSERT [dbo].[tblAccount] ([Email], [Password], [RoleId], [Status], [CreatedDate]) VALUES (N'admin3@admin.com', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1, N'Active', CAST(N'2019-12-02 08:45:27.967' AS DateTime))
INSERT [dbo].[tblAccount] ([Email], [Password], [RoleId], [Status], [CreatedDate]) VALUES (N'admin4@admin.com', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1, N'Active', CAST(N'2019-12-02 11:04:52.747' AS DateTime))
INSERT [dbo].[tblAccount] ([Email], [Password], [RoleId], [Status], [CreatedDate]) VALUES (N'khanhkk@gmail.com', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 2, N'Active', CAST(N'2019-12-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblAccount] ([Email], [Password], [RoleId], [Status], [CreatedDate]) VALUES (N'user@user.com', N'4f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb', 2, N'Active', CAST(N'2019-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblAccount] ([Email], [Password], [RoleId], [Status], [CreatedDate]) VALUES (N'user2@user.com', N'4f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb', 2, N'Active', CAST(N'2019-11-30 15:54:42.870' AS DateTime))
INSERT [dbo].[tblAccount] ([Email], [Password], [RoleId], [Status], [CreatedDate]) VALUES (N'user3@user.com', N'4f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb', 2, N'Active', CAST(N'2019-12-02 11:05:34.330' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblArea] ON 

INSERT [dbo].[tblArea] ([AreaId], [Name]) VALUES (1, N'District 1')
INSERT [dbo].[tblArea] ([AreaId], [Name]) VALUES (2, N'District 9')
INSERT [dbo].[tblArea] ([AreaId], [Name]) VALUES (3, N'Go Vap District')
INSERT [dbo].[tblArea] ([AreaId], [Name]) VALUES (4, N'Thu Duc District')
INSERT [dbo].[tblArea] ([AreaId], [Name]) VALUES (5, N'Tan Binh District')
SET IDENTITY_INSERT [dbo].[tblArea] OFF
INSERT [dbo].[tblCoupon] ([Code], [Value], [StartDate], [EndDate], [Status]) VALUES (N'AAA111', 35, CAST(N'2019-11-20 00:00:00.000' AS DateTime), CAST(N'2019-12-30 00:00:00.000' AS DateTime), N'Used')
INSERT [dbo].[tblCoupon] ([Code], [Value], [StartDate], [EndDate], [Status]) VALUES (N'AAA222', 50, CAST(N'2019-12-06 00:00:00.000' AS DateTime), CAST(N'2020-02-29 00:00:00.000' AS DateTime), N'Used')
INSERT [dbo].[tblCoupon] ([Code], [Value], [StartDate], [EndDate], [Status]) VALUES (N'AAA333', 55, CAST(N'2019-11-20 00:00:00.000' AS DateTime), CAST(N'2020-02-29 00:00:00.000' AS DateTime), N'NotUsed')
INSERT [dbo].[tblCoupon] ([Code], [Value], [StartDate], [EndDate], [Status]) VALUES (N'AAA444', 25, CAST(N'2019-11-20 00:00:00.000' AS DateTime), CAST(N'2020-02-29 00:00:00.000' AS DateTime), N'NotUsed')
INSERT [dbo].[tblCoupon] ([Code], [Value], [StartDate], [EndDate], [Status]) VALUES (N'AAA555', 30, CAST(N'2019-10-20 00:00:00.000' AS DateTime), CAST(N'2019-11-25 00:00:00.000' AS DateTime), N'NotUsed')
INSERT [dbo].[tblCoupon] ([Code], [Value], [StartDate], [EndDate], [Status]) VALUES (N'AAA666', 30, CAST(N'2019-11-20 00:00:00.000' AS DateTime), CAST(N'2019-12-30 00:00:00.000' AS DateTime), N'NotUsed')
SET IDENTITY_INSERT [dbo].[tblHotel] ON 

INSERT [dbo].[tblHotel] ([HotelId], [Name], [Address], [Phone], [Photo], [AreaId], [Description], [Status], [CreateDate]) VALUES (3, N'Palace Hotel', N'125 Bui Vien, District 1, Ho Chi Minh City', N'0988123321', N'assets/grand-hyatt-hotel-france-16232.jpg', 1, N'Good Hotel', N'Active', CAST(N'2019-05-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHotel] ([HotelId], [Name], [Address], [Phone], [Photo], [AreaId], [Description], [Status], [CreateDate]) VALUES (5, N'Silverland Sakyo & Spa', N'256 Pham Ngu Lao, Ho Chi Minh City', N'0988111222', N'assets/habitat-hotel-655.jpg', 1, N'Good Hotel', N'Active', CAST(N'2019-11-30 11:44:03.943' AS DateTime))
INSERT [dbo].[tblHotel] ([HotelId], [Name], [Address], [Phone], [Photo], [AreaId], [Description], [Status], [CreateDate]) VALUES (6, N'TTC Hotel Deluxe', N'Ward 8, District 9, Ho Chi Minh City', N'0988111333', N'assets/hotel-christopher-sunset-pool-6498.jpg', 2, N'Good Hotel', N'Active', CAST(N'2019-11-30 11:48:25.550' AS DateTime))
INSERT [dbo].[tblHotel] ([HotelId], [Name], [Address], [Phone], [Photo], [AreaId], [Description], [Status], [CreateDate]) VALUES (7, N'AHA Boutique Hotel', N'145 Nguyen Sy Sach, Tan Binh District, Ho Chi Minh City', N'0988111444', N'assets/indian-ocean-best-beaches-in-the-6138.jpg', 5, N'Good Hotel', N'Active', CAST(N'2019-11-30 11:51:22.927' AS DateTime))
INSERT [dbo].[tblHotel] ([HotelId], [Name], [Address], [Phone], [Photo], [AreaId], [Description], [Status], [CreateDate]) VALUES (8, N'Holiday Republic Saigon', N'18E Cong Hoa, Tan Binh, Ho Chi Minh City', N'0988111555', N'assets/maldives-1920x1080-hotel-4k-19257.jpg', 5, N'Good Hotel', N'Active', CAST(N'2019-11-30 11:52:28.150' AS DateTime))
INSERT [dbo].[tblHotel] ([HotelId], [Name], [Address], [Phone], [Photo], [AreaId], [Description], [Status], [CreateDate]) VALUES (9, N'Legend Hotel', N'13A, Le Van Chi, Thu Duc, Ho Chi Minh City', N'0988111666', N'assets/veli-resort-spa-3171.jpg', 4, N'Good Hotel', N'Active', CAST(N'2019-11-30 11:55:31.983' AS DateTime))
INSERT [dbo].[tblHotel] ([HotelId], [Name], [Address], [Phone], [Photo], [AreaId], [Description], [Status], [CreateDate]) VALUES (10, N'GOLF STAR HOTEL', N'848 QUANG TRUNG ST.,WARD 8, Go Vap, Ho Chi Minh City', N'0988111777', N'assets/indian-ocean-best-beaches-in-5312.jpg', 3, N'Good Hotel', N'Active', CAST(N'2019-11-30 11:57:19.360' AS DateTime))
INSERT [dbo].[tblHotel] ([HotelId], [Name], [Address], [Phone], [Photo], [AreaId], [Description], [Status], [CreateDate]) VALUES (11, N'Triip Mismo Airport Hotel', N'531 Nguyen Oanh Street, Ward 17, Go Vap, Ho Chi Minh City', N'0988111888', N'assets/habitat-hotel-655.jpg', 3, N'Good Hotel', N'Active', CAST(N'2019-11-30 11:59:09.257' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblHotel] OFF
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([OrderId], [Email], [Total], [CouponCode], [CouponValue], [CreatedDate], [Status]) VALUES (1, N'user@user.com', 500, NULL, NULL, CAST(N'2019-11-30 00:00:00.000' AS DateTime), N'Active')
INSERT [dbo].[tblOrder] ([OrderId], [Email], [Total], [CouponCode], [CouponValue], [CreatedDate], [Status]) VALUES (40, N'user@user.com', 804, NULL, NULL, CAST(N'2019-12-02 11:00:29.263' AS DateTime), N'Active')
INSERT [dbo].[tblOrder] ([OrderId], [Email], [Total], [CouponCode], [CouponValue], [CreatedDate], [Status]) VALUES (41, N'user@user.com', 475, N'AAA444', 25, CAST(N'2019-12-02 11:03:12.477' AS DateTime), N'Active')
INSERT [dbo].[tblOrder] ([OrderId], [Email], [Total], [CouponCode], [CouponValue], [CreatedDate], [Status]) VALUES (42, N'user@user.com', 3300, NULL, NULL, CAST(N'2019-12-02 11:14:43.737' AS DateTime), N'Active')
INSERT [dbo].[tblOrder] ([OrderId], [Email], [Total], [CouponCode], [CouponValue], [CreatedDate], [Status]) VALUES (43, N'user@user.com', 3150, NULL, NULL, CAST(N'2019-12-02 11:20:54.617' AS DateTime), N'Active')
INSERT [dbo].[tblOrder] ([OrderId], [Email], [Total], [CouponCode], [CouponValue], [CreatedDate], [Status]) VALUES (44, N'user@user.com', 815, N'AAA111', 35, CAST(N'2019-12-02 11:23:19.007' AS DateTime), N'Active')
INSERT [dbo].[tblOrder] ([OrderId], [Email], [Total], [CouponCode], [CouponValue], [CreatedDate], [Status]) VALUES (46, N'khanhkk@gmail.com', 30981, N'AAA222', 50, CAST(N'2019-12-06 08:17:06.277' AS DateTime), N'Active')
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [HotelId], [TypeId], [Quantity], [CheckIn], [CheckOut], [SubTotal]) VALUES (11, 1, 3, 2, 2, CAST(N'2019-11-29 00:00:00.000' AS DateTime), CAST(N'2019-12-02 00:00:00.000' AS DateTime), 150)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [HotelId], [TypeId], [Quantity], [CheckIn], [CheckOut], [SubTotal]) VALUES (12, 1, 3, 3, 1, CAST(N'2019-11-30 00:00:00.000' AS DateTime), CAST(N'2019-12-02 00:00:00.000' AS DateTime), 200)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [HotelId], [TypeId], [Quantity], [CheckIn], [CheckOut], [SubTotal]) VALUES (13, 1, 3, 4, 1, CAST(N'2019-11-30 00:00:00.000' AS DateTime), CAST(N'2019-12-02 00:00:00.000' AS DateTime), 200)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [HotelId], [TypeId], [Quantity], [CheckIn], [CheckOut], [SubTotal]) VALUES (69, 40, 3, 2, 4, CAST(N'2019-12-03 00:00:00.000' AS DateTime), CAST(N'2019-12-05 00:00:00.000' AS DateTime), 804)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [HotelId], [TypeId], [Quantity], [CheckIn], [CheckOut], [SubTotal]) VALUES (70, 41, 3, 4, 1, CAST(N'2019-12-02 00:00:00.000' AS DateTime), CAST(N'2019-12-03 00:00:00.000' AS DateTime), 500)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [HotelId], [TypeId], [Quantity], [CheckIn], [CheckOut], [SubTotal]) VALUES (71, 42, 3, 3, 2, CAST(N'2019-12-02 00:00:00.000' AS DateTime), CAST(N'2019-12-05 00:00:00.000' AS DateTime), 2400)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [HotelId], [TypeId], [Quantity], [CheckIn], [CheckOut], [SubTotal]) VALUES (72, 42, 6, 1, 2, CAST(N'2019-12-02 00:00:00.000' AS DateTime), CAST(N'2019-12-05 00:00:00.000' AS DateTime), 900)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [HotelId], [TypeId], [Quantity], [CheckIn], [CheckOut], [SubTotal]) VALUES (73, 43, 6, 2, 3, CAST(N'2019-12-02 00:00:00.000' AS DateTime), CAST(N'2019-12-05 00:00:00.000' AS DateTime), 1800)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [HotelId], [TypeId], [Quantity], [CheckIn], [CheckOut], [SubTotal]) VALUES (74, 43, 5, 2, 3, CAST(N'2019-12-02 00:00:00.000' AS DateTime), CAST(N'2019-12-05 00:00:00.000' AS DateTime), 1350)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [HotelId], [TypeId], [Quantity], [CheckIn], [CheckOut], [SubTotal]) VALUES (75, 44, 5, 2, 1, CAST(N'2019-12-02 00:00:00.000' AS DateTime), CAST(N'2019-12-03 00:00:00.000' AS DateTime), 150)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [HotelId], [TypeId], [Quantity], [CheckIn], [CheckOut], [SubTotal]) VALUES (76, 44, 5, 3, 2, CAST(N'2019-12-02 00:00:00.000' AS DateTime), CAST(N'2019-12-03 00:00:00.000' AS DateTime), 700)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [HotelId], [TypeId], [Quantity], [CheckIn], [CheckOut], [SubTotal]) VALUES (77, 46, 3, 3, 2, CAST(N'2019-12-24 00:00:00.000' AS DateTime), CAST(N'2020-01-24 00:00:00.000' AS DateTime), 24800)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [HotelId], [TypeId], [Quantity], [CheckIn], [CheckOut], [SubTotal]) VALUES (78, 46, 3, 2, 2, CAST(N'2019-12-24 00:00:00.000' AS DateTime), CAST(N'2020-01-24 00:00:00.000' AS DateTime), 6231)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([RoleId], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[tblRole] ([RoleId], [Name]) VALUES (2, N'Customer')
SET IDENTITY_INSERT [dbo].[tblRole] OFF
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (3, 2, 5, 100.5, 2, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (3, 3, 3, 400, 5, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (3, 4, 2, 500, 2, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (5, 1, 2, 100, 1, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (5, 2, 4, 150, 2, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (5, 3, 3, 350, 4, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (5, 4, 10, 800, 2, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (6, 1, 2, 150, 1, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (6, 2, 3, 200, 2, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (6, 3, 6, 300, 5, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (7, 1, 4, 200, 1, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (7, 2, 5, 350, 2, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (7, 3, 3, 500, 5, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (8, 1, 6, 175, 1, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (8, 2, 7, 250, 2, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (8, 3, 2, 350, 6, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (9, 1, 6, 245, 1, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (9, 2, 3, 350, 2, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (10, 1, 2, 150, 1, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (10, 2, 7, 200, 2, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (11, 2, 8, 345, 2, N'Active')
INSERT [dbo].[tblRoom] ([HotelId], [TypeId], [Quantity], [Price], [MaxPeople], [Status]) VALUES (11, 4, 3, 1000, 2, N'Active')
SET IDENTITY_INSERT [dbo].[tblType] ON 

INSERT [dbo].[tblType] ([TypeId], [Name]) VALUES (1, N'Single')
INSERT [dbo].[tblType] ([TypeId], [Name]) VALUES (2, N'Double')
INSERT [dbo].[tblType] ([TypeId], [Name]) VALUES (3, N'Family')
INSERT [dbo].[tblType] ([TypeId], [Name]) VALUES (4, N'Luxury')
SET IDENTITY_INSERT [dbo].[tblType] OFF
INSERT [dbo].[tblUserInfo] ([Email], [Fullname], [Phone], [Address]) VALUES (N'admin@admin.com', N'Admin 1', N'0988111222', N'HCMC')
INSERT [dbo].[tblUserInfo] ([Email], [Fullname], [Phone], [Address]) VALUES (N'admin2@admin.com', N'Admin 2', N'0988111222', N'HCMC')
INSERT [dbo].[tblUserInfo] ([Email], [Fullname], [Phone], [Address]) VALUES (N'admin3@admin.com', N'Admin 3', N'0988111333', N'HCMC')
INSERT [dbo].[tblUserInfo] ([Email], [Fullname], [Phone], [Address]) VALUES (N'admin4@admin.com', N'Admin 4', N'09888111444', N'HCMC')
INSERT [dbo].[tblUserInfo] ([Email], [Fullname], [Phone], [Address]) VALUES (N'khanhkk@gmail.com', N'Khanh Dai Ca', N'0988111111', N'HCMC')
INSERT [dbo].[tblUserInfo] ([Email], [Fullname], [Phone], [Address]) VALUES (N'user@user.com', N'User 1', N'0988222111', N'HCMC')
INSERT [dbo].[tblUserInfo] ([Email], [Fullname], [Phone], [Address]) VALUES (N'user2@user.com', N'User 2', N'0988333222', N'Ho Chi Minh City')
INSERT [dbo].[tblUserInfo] ([Email], [Fullname], [Phone], [Address]) VALUES (N'user3@user.com', N'User 3', N'09888222333', N'HCMC')
SET ANSI_PADDING ON

GO
/****** Object:  Index [Address_Unique_Key]    Script Date: 12/8/2019 10:17:22 AM ******/
ALTER TABLE [dbo].[tblHotel] ADD  CONSTRAINT [Address_Unique_Key] UNIQUE NONCLUSTERED 
(
	[Address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD  CONSTRAINT [FK_tblAccount_tblRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([RoleId])
GO
ALTER TABLE [dbo].[tblAccount] CHECK CONSTRAINT [FK_tblAccount_tblRole]
GO
ALTER TABLE [dbo].[tblHotel]  WITH CHECK ADD  CONSTRAINT [FK_tblHotel_tblArea] FOREIGN KEY([AreaId])
REFERENCES [dbo].[tblArea] ([AreaId])
GO
ALTER TABLE [dbo].[tblHotel] CHECK CONSTRAINT [FK_tblHotel_tblArea]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblCoupon] FOREIGN KEY([CouponCode])
REFERENCES [dbo].[tblCoupon] ([Code])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblCoupon]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUserInfo] FOREIGN KEY([Email])
REFERENCES [dbo].[tblUserInfo] ([Email])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUserInfo]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([OrderId])
REFERENCES [dbo].[tblOrder] ([OrderId])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblRoom1] FOREIGN KEY([HotelId], [TypeId])
REFERENCES [dbo].[tblRoom] ([HotelId], [TypeId])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblRoom1]
GO
ALTER TABLE [dbo].[tblRoom]  WITH CHECK ADD  CONSTRAINT [FK_tblRoomType_tblHotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[tblHotel] ([HotelId])
GO
ALTER TABLE [dbo].[tblRoom] CHECK CONSTRAINT [FK_tblRoomType_tblHotel]
GO
ALTER TABLE [dbo].[tblRoom]  WITH CHECK ADD  CONSTRAINT [FK_tblRoomType_tblType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[tblType] ([TypeId])
GO
ALTER TABLE [dbo].[tblRoom] CHECK CONSTRAINT [FK_tblRoomType_tblType]
GO
ALTER TABLE [dbo].[tblUserInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblUserInfo_tblAccount] FOREIGN KEY([Email])
REFERENCES [dbo].[tblAccount] ([Email])
GO
ALTER TABLE [dbo].[tblUserInfo] CHECK CONSTRAINT [FK_tblUserInfo_tblAccount]
GO
/****** Object:  StoredProcedure [dbo].[deleteTempTable]    Script Date: 12/8/2019 10:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteTempTable]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Select all available room group by room type
	IF OBJECT_ID('tempdb..#book_rooms') IS NOT NULL DROP TABLE #book_rooms

	END

GO
/****** Object:  StoredProcedure [dbo].[searchRoomAvailable]    Script Date: 12/8/2019 10:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[searchRoomAvailable] 
	-- Add the parameters for the stored procedure here
	@CheckIn AS DATETIME,
	@CheckOut AS DATETIME,
	@Quantity AS INT,
	@Area AS VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Select all available room group by room type

	;with Detail as(select SUM(Quantity) as Quantity, HotelId, TypeId from tblOrderDetail 
					where (CheckIn <= @CheckIn AND CheckOut >= @CheckIn) 
					OR (CheckIn < @CheckOut AND CheckOut >= @CheckOut) 
					OR (@CheckIn <= CheckIn AND @CheckOut >= CheckIn) group by HotelId, TypeId)
	,Available as(
		select tblRoom.HotelId, tblRoom.TypeId, 
		tblRoom.Quantity - (case when Detail.Quantity is null then 0 else Detail.Quantity end) as AvailableRoom, 
				Price, MaxPeople from tblRoom 
			left join Detail on tblRoom.HotelId = Detail.HotelId and tblRoom.TypeId = Detail.TypeId
			where Status ='Active')

	select  Available.HotelId, Available.TypeId ,tblHotel.Name as HotelName, Address, Photo, Price, MaxPeople, tblType.Name as TypeName, 
			AvailableRoom from tblHotel 
		inner join Available on Available.HotelId = tblHotel.HotelId
		inner join tblType on tblType.TypeId = Available.TypeId
		inner join tblArea on tblHotel.AreaId = tblArea.AreaId 
		where AvailableRoom > 0 and AvailableRoom >= @Quantity and tblArea.Name like '%'+@Area+'%'

	END

GO
/****** Object:  StoredProcedure [dbo].[searchRoomCheckout]    Script Date: 12/8/2019 10:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[searchRoomCheckout]
	-- Add the parameters for the stored procedure here
	@CheckIn AS DATETIME,
	@CheckOut AS DATETIME,
	@HotelId AS INT,
	@TypeId AS INT,
	@Quantity AS INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Select all available room group by room type
	IF OBJECT_ID('tempdb..#book_rooms') is null CREATE TABLE #book_rooms (
		HotelId INT,
		TypeId INT,
		Quantity INT,
		CheckIn DATETIME,
		CheckOut DATETIME
		);

	;with Temp as(select SUM(Quantity) as Quantity, HotelId, TypeId from #book_rooms
					where (CheckIn <= @CheckIn AND CheckOut >= @CheckIn) 
					OR (CheckIn < @CheckOut AND CheckOut >= @CheckOut) 
					OR (@CheckIn <= CheckIn AND @CheckOut >= CheckIn) group by HotelId, TypeId)

	,Detail as(select distinct case when (Temp.Quantity + tblOrderDetail.Quantity) is null then 0 else (Temp.Quantity + tblOrderDetail.Quantity) end as Quantity, tblOrderDetail.HotelId, tblOrderDetail.TypeId from tblOrderDetail full outer JOIN Temp on Temp.HotelId = tblOrderDetail.HotelId and Temp.TypeId = tblOrderDetail.TypeId
					where (CheckIn <= @CheckIn AND CheckOut >= @CheckIn) 
					OR (CheckIn < @CheckOut AND CheckOut >= @CheckOut) 
					OR (@CheckIn <= CheckIn AND @CheckOut >= CheckIn))

		select tblRoom.Quantity - (case when Detail.Quantity is null then 0 else Detail.Quantity end) as AvailableRoom, 
			Detail.HotelId, Detail.TypeId, tblHotel.Name as HotelName, tblType.Name as TypeName
			from tblRoom inner join Detail on tblRoom.HotelId = Detail.HotelId and tblRoom.TypeId = Detail.TypeId
				inner join tblHotel on tblHotel.HotelId = Detail.HotelId
				inner join tblType on tblType.TypeId = Detail.TypeId
			where tblRoom.Status ='Active' and tblRoom.HotelId=@HotelId
			and tblRoom.TypeId=@TypeId and (tblRoom.Quantity - (case when Detail.Quantity is null then 0 else Detail.Quantity end)) < @Quantity

			insert #book_rooms(HotelId, TypeId, Quantity, CheckIn, CheckOut) 
				values(@HotelId, @TypeId, @Quantity, @CheckIn, @CheckOut);
	END

GO
/****** Object:  StoredProcedure [dbo].[searchRoomQuantity]    Script Date: 12/8/2019 10:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[searchRoomQuantity] 
	-- Add the parameters for the stored procedure here
	@CheckIn AS DATETIME,
	@CheckOut AS DATETIME,
	@HotelId AS INT,
	@TypeId AS INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Select all available room group by room type

	;with Detail as(select SUM(Quantity) AS Quantity, HotelId, TypeId from tblOrderDetail 
					where (CheckIn <= @CheckIn AND CheckOut >= @CheckIn) 
					OR (CheckIn < @CheckOut AND CheckOut >= @CheckOut) 
					OR (@CheckIn <= CheckIn AND @CheckOut >= CheckIn) group by HotelId, TypeId)
		select tblRoom.Quantity - (case when Detail.Quantity is null then 0 else Detail.Quantity end) as AvailableRoom
			from tblRoom left join Detail on tblRoom.HotelId = Detail.HotelId and tblRoom.TypeId = Detail.TypeId
			where Status ='Active' and tblRoom.HotelId=@HotelId and tblRoom.TypeId=@TypeId
	END

GO
USE [master]
GO
ALTER DATABASE [J3.L.P0003] SET  READ_WRITE 
GO
