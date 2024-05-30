USE [master]
GO
/****** Object:  Database [BookDataBase]    Script Date: 31/05/2024 12:22:21 SA ******/
CREATE DATABASE [BookDataBase] ON  PRIMARY 
( NAME = N'BookDataBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BookDataBase.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookDataBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BookDataBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookDataBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookDataBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookDataBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookDataBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookDataBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookDataBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookDataBase] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookDataBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookDataBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookDataBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookDataBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookDataBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookDataBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookDataBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookDataBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookDataBase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookDataBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookDataBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookDataBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookDataBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookDataBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookDataBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookDataBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookDataBase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookDataBase] SET  MULTI_USER 
GO
ALTER DATABASE [BookDataBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookDataBase] SET DB_CHAINING OFF 
GO
USE [BookDataBase]
GO
/****** Object:  Table [dbo].[carts]    Script Date: 31/05/2024 12:22:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[user_id] [int] NULL,
	[price] [decimal](18, 0) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_carts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 31/05/2024 12:22:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[slug] [varchar](200) NULL,
	[status] [int] NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NULL,
	[icon] [varchar](max) NULL,
	[isdetele] [int] NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contacts]    Script Date: 31/05/2024 12:22:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contacts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](250) NULL,
	[phone_number] [varchar](11) NULL,
	[note] [text] NULL,
	[status] [int] NULL,
	[created_at] [datetime2](7) NULL,
 CONSTRAINT [PK_contacts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[images]    Script Date: 31/05/2024 12:22:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NULL,
	[alt] [nvarchar](400) NULL,
	[status] [int] NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK_images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 31/05/2024 12:22:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[color] [nvarchar](500) NULL,
	[price] [decimal](18, 0) NULL,
	[quantity] [int] NULL,
	[size] [int] NULL,
 CONSTRAINT [PK_order_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 31/05/2024 12:22:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](250) NULL,
	[user_id] [int] NULL,
	[note] [nvarchar](500) NULL,
	[full_name] [nvarchar](150) NULL,
	[phone_number] [varchar](150) NULL,
	[review] [int] NULL,
	[payment] [int] NOT NULL,
	[status] [int] NULL,
	[total] [int] NULL,
	[fee_ship] [int] NULL,
	[created_at] [datetime2](7) NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[posts]    Script Date: 31/05/2024 12:22:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[posts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](250) NULL,
	[slug] [varchar](500) NULL,
	[avatar] [varchar](200) NULL,
	[content] [nvarchar](max) NULL,
	[short_content] [nvarchar](500) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[status] [int] NULL,
	[author] [int] NULL,
 CONSTRAINT [PK_posts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCart]    Script Date: 31/05/2024 12:22:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCart](
	[Id] [int] NOT NULL,
	[ProductId] [int] NULL,
	[CartId] [int] NULL,
 CONSTRAINT [PK_ProductCart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 31/05/2024 12:22:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[category_id] [int] NULL,
	[price_sell] [decimal](18, 0) NULL,
	[description] [nvarchar](max) NULL,
	[status] [int] NULL,
	[price_reduced] [decimal](18, 0) NULL,
	[horizontal] [int] NULL,
	[trademark] [nvarchar](500) NULL,
	[price_import] [decimal](18, 0) NULL,
	[trademarkId] [int] NULL,
	[ishidden] [int] NULL,
	[sizes] [varchar](max) NULL,
	[images] [varchar](max) NULL,
	[number_import] [int] NULL,
	[cover_type] [int] NULL,
	[total_sell] [int] NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reviews]    Script Date: 31/05/2024 12:22:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviews](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[created_at] [datetime] NULL,
	[comment] [nvarchar](max) NULL,
	[status] [int] NULL,
	[star] [int] NULL,
	[fullname] [nvarchar](max) NULL,
	[starOne] [int] NULL,
	[startTwo] [int] NULL,
	[startFour] [int] NULL,
	[startFive] [int] NULL,
	[startThree] [int] NULL,
 CONSTRAINT [PK_reviews] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 31/05/2024 12:22:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](250) NULL,
	[phone_number] [varchar](11) NULL,
	[email] [varchar](50) NULL,
	[avatar] [varchar](500) NULL,
	[code] [varchar](10) NULL,
	[address] [nvarchar](max) NULL,
	[role] [int] NULL,
	[password] [varchar](32) NULL,
	[status] [int] NULL,
	[register_date] [datetime2](7) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[carts] ON 

INSERT [dbo].[carts] ([id], [product_id], [user_id], [price], [quantity]) VALUES (15, 58, 6, CAST(658350 AS Decimal(18, 0)), 3)
INSERT [dbo].[carts] ([id], [product_id], [user_id], [price], [quantity]) VALUES (16, 59, 6, CAST(219450 AS Decimal(18, 0)), 1)
INSERT [dbo].[carts] ([id], [product_id], [user_id], [price], [quantity]) VALUES (23, 58, 2, CAST(219450 AS Decimal(18, 0)), 1)
INSERT [dbo].[carts] ([id], [product_id], [user_id], [price], [quantity]) VALUES (30, 58, 2, CAST(219450 AS Decimal(18, 0)), 1)
INSERT [dbo].[carts] ([id], [product_id], [user_id], [price], [quantity]) VALUES (55, 87, 3, CAST(120000 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[carts] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name], [slug], [status], [created_at], [updated_at], [icon], [isdetele]) VALUES (16, N'Sách Ngoại Văn', N'sách ngo?i van', 0, CAST(N'2024-03-27T23:47:30.1545557' AS DateTime2), CAST(N'2024-03-28T09:11:58.6557256' AS DateTime2), N'311000061_846469579687832_7412082279716284088_n.png', NULL)
INSERT [dbo].[categories] ([id], [name], [slug], [status], [created_at], [updated_at], [icon], [isdetele]) VALUES (17, N'Sách Thiếu Nhi', N'sách thi?u nhi', 0, CAST(N'2024-03-27T23:47:39.6677857' AS DateTime2), CAST(N'2024-03-28T09:10:56.1674637' AS DateTime2), N'311000061_846469579687832_7412082279716284088_n.png', NULL)
INSERT [dbo].[categories] ([id], [name], [slug], [status], [created_at], [updated_at], [icon], [isdetele]) VALUES (18, N'Sách Lịch Sử', N'sách l?ch s?', 0, CAST(N'2024-03-28T09:12:41.1813170' AS DateTime2), CAST(N'2024-05-25T00:40:06.5036050' AS DateTime2), N'311000061_846469579687832_7412082279716284088_n.png', NULL)
INSERT [dbo].[categories] ([id], [name], [slug], [status], [created_at], [updated_at], [icon], [isdetele]) VALUES (19, N'Sách Văn Học', N'sách van h?c', 0, CAST(N'2024-03-28T09:13:03.5426910' AS DateTime2), CAST(N'2024-05-25T00:40:04.3140125' AS DateTime2), N'311000061_846469579687832_7412082279716284088_n.png', NULL)
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[contacts] ON 

INSERT [dbo].[contacts] ([id], [full_name], [phone_number], [note], [status], [created_at]) VALUES (1, N'Thanh Trúc Lê 345', N'0948200702', N'fdasfadsfs', 0, CAST(N'2024-05-09T21:11:47.9544188' AS DateTime2))
SET IDENTITY_INSERT [dbo].[contacts] OFF
GO
SET IDENTITY_INSERT [dbo].[images] ON 

INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (1, N'sach2.jpg', NULL, NULL, 50)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (4, N'2.jpg', NULL, NULL, 52)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (5, N'1.jpg', NULL, NULL, 51)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (6, N'3.jpg', NULL, NULL, 53)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (7, N'4.jpg', NULL, NULL, 54)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (8, N'5.jpg', NULL, NULL, 55)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (9, N'6.jpg', NULL, NULL, 56)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (10, N'7.jpg', NULL, NULL, 57)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (11, N'8.jpg', NULL, NULL, 58)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (12, N'9.jpg', NULL, NULL, 59)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (13, N'10.jpg', NULL, NULL, 60)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (14, N't1.jpg', NULL, NULL, 61)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (15, N't2.jpg', NULL, NULL, 62)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (16, N't3.jpg', NULL, NULL, 63)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (17, N't4.jpg', NULL, NULL, 64)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (18, N't5.jpg', NULL, NULL, 65)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (19, N't6.jpg', NULL, NULL, 66)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (20, N't7.jpg', NULL, NULL, 67)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (21, N't8.jpg', NULL, NULL, 68)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (22, N's1.jpg', NULL, NULL, 69)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (23, N's2.jpg', NULL, NULL, 70)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (24, N's3.jpg', NULL, NULL, 71)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (25, N's4.jpg', NULL, NULL, 72)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (26, N's5.jpg', NULL, NULL, 73)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (27, N's6.jpg', NULL, NULL, 74)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (28, N's7.jpg', NULL, NULL, 75)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (29, N's8.jpg', NULL, NULL, 76)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (30, N'v1.jpg', NULL, NULL, 77)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (31, N'v2.jpg', NULL, NULL, 78)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (32, N'v3.jpg', NULL, NULL, 79)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (33, N'v4.jpg', NULL, NULL, 80)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (34, N'v5.jpg', NULL, NULL, 81)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (35, N'v6.jpg', NULL, NULL, 82)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (36, N'v7.jpg', NULL, NULL, 83)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (37, N'v8.jpg', NULL, NULL, 84)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (38, N't9.jpg', NULL, NULL, 85)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (39, N'11.jpg', NULL, NULL, 50)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (40, N'kim-dong-1515.jpg', NULL, NULL, 86)
INSERT [dbo].[images] ([id], [name], [alt], [status], [product_id]) VALUES (41, N'e1.jpg', NULL, NULL, 87)
SET IDENTITY_INSERT [dbo].[images] OFF
GO
SET IDENTITY_INSERT [dbo].[order_details] ON 

INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (17, 18, 59, NULL, CAST(219450 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (18, 19, 57, NULL, CAST(219450 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (19, 19, 50, NULL, CAST(532950 AS Decimal(18, 0)), 2, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (20, 20, 66, NULL, CAST(45000 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (21, 21, 71, NULL, CAST(256500 AS Decimal(18, 0)), 2, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (22, 22, 56, NULL, CAST(219450 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (23, 22, 73, NULL, CAST(233100 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (24, 22, 59, NULL, CAST(219450 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (25, 23, 78, NULL, CAST(112500 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (26, 24, 70, NULL, CAST(420000 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (27, 24, 74, NULL, CAST(735000 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (28, 25, 59, NULL, CAST(219450 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (29, 25, 58, NULL, CAST(219450 AS Decimal(18, 0)), 2, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (30, 26, 59, NULL, CAST(219450 AS Decimal(18, 0)), 3, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (31, 27, 57, NULL, CAST(219450 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (32, 28, 58, NULL, CAST(219450 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (33, 28, 59, NULL, CAST(219450 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (34, 29, 59, NULL, CAST(219450 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (35, 30, 59, NULL, CAST(219450 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (36, 31, 59, NULL, CAST(219450 AS Decimal(18, 0)), 3, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (37, 32, 59, NULL, CAST(219450 AS Decimal(18, 0)), 2, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (38, 33, 75, NULL, CAST(658000 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (39, 33, 60, NULL, CAST(219450 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (40, 34, 59, NULL, CAST(219450 AS Decimal(18, 0)), 2, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (41, 35, 59, NULL, CAST(219450 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (42, 36, 60, NULL, CAST(219450 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (43, 37, 59, NULL, CAST(219450 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (44, 38, 60, NULL, CAST(219450 AS Decimal(18, 0)), 2, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (45, 39, 87, NULL, CAST(120000 AS Decimal(18, 0)), 110, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (46, 40, 85, NULL, CAST(49500 AS Decimal(18, 0)), 12, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (47, 41, 59, NULL, CAST(219450 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (48, 41, 60, NULL, CAST(219450 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (49, 42, 59, NULL, CAST(219450 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (50, 43, 87, NULL, CAST(120000 AS Decimal(18, 0)), 2, NULL)
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [color], [price], [quantity], [size]) VALUES (51, 43, 60, NULL, CAST(219450 AS Decimal(18, 0)), 3, NULL)
SET IDENTITY_INSERT [dbo].[order_details] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (18, N'MDH001', 7, NULL, N'Nguyễn Thị Trúc', N'0345801925', NULL, 0, 1, 219450, NULL, CAST(N'2024-04-06T22:00:20.8548934' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (19, N'MDH002', 2, NULL, N'Nguyễn Văn Hưng', N'0345801982', NULL, 0, 2, 1285350, NULL, CAST(N'2024-04-05T22:12:21.1392070' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (20, N'MDH003', 2, NULL, N'Nguyễn Văn Hưng', N'0345801982', NULL, 0, 1, 45000, NULL, CAST(N'2024-04-05T22:13:00.5547444' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (21, N'MDH004', 2, NULL, N'Nguyễn Văn Hưng', N'0345801982', NULL, 0, 1, 513000, NULL, CAST(N'2024-04-06T22:13:52.2567493' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (22, N'MDH005', 3, NULL, N'Lê Thị Hạnh', N'0345801984', NULL, 0, 2, 672000, NULL, CAST(N'2024-04-05T22:16:08.4754374' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (23, N'MDH006', 3, NULL, N'Lê Thị Hạnh', N'0345801984', NULL, 0, 1, 112500, NULL, CAST(N'2024-04-07T22:16:30.6413409' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (24, N'MDH007', 3, NULL, N'Lê Thị Hạnh', N'0345801984', NULL, 0, 2, 1155000, NULL, CAST(N'2024-04-07T22:18:26.4203708' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (25, N'MDH008', 6, NULL, N'Nguyễn Văn Mạnh', N'0345801988', NULL, 0, 1, 658350, NULL, CAST(N'2024-04-07T22:25:52.2921441' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (26, N'MDH009', 2, NULL, N'Nguyễn Văn Hưng', N'0345801982', NULL, 0, 2, 658350, NULL, CAST(N'2024-04-17T23:49:56.5681090' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (27, N'MDH010', 3, NULL, N'Lê Thị Hạnh', N'0345801984', NULL, 0, 2, 219450, NULL, CAST(N'2024-05-09T00:29:31.9652663' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (28, N'MDH011', 3, NULL, N'Lê Thị Hạnh', N'0345801984', NULL, 0, 2, 438900, NULL, CAST(N'2024-05-11T22:29:51.4209814' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (29, N'MDH012', 3, NULL, N'Lê Thị bình', N'0345801984', NULL, 0, 2, 219450, NULL, CAST(N'2024-05-11T22:54:54.5392041' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (30, N'MDH013', 3, NULL, N'Lê Thị Hạnh', N'0345801984', NULL, 0, 2, 219450, NULL, CAST(N'2024-05-14T20:08:28.4336089' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (31, N'MDH014', 7, NULL, N'Nguyễn Thị Trúc', N'0345801925', NULL, 0, 0, 658350, NULL, CAST(N'2024-05-15T20:52:43.5801974' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (32, N'MDH015', 3, NULL, N'Lê Thị Hạnh', N'0345801984', NULL, 0, 2, 438900, NULL, CAST(N'2024-05-16T20:54:23.8623325' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (33, N'MDH016', 3, NULL, N'Lê Thị Hạnh', N'0345801984', NULL, 0, 2, 877450, NULL, CAST(N'2024-05-16T22:55:21.4305653' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (34, N'MDH017', 3, NULL, N'Lê Thị Hạnh', N'0345801984', NULL, 0, 0, 438900, NULL, CAST(N'2024-05-17T21:30:06.7235140' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (35, N'MDH018', 3, NULL, N'Lê Thị Hạnh', N'0345801984', NULL, 0, 2, 219450, NULL, CAST(N'2024-05-23T21:52:19.4071999' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (36, N'MDH019', 3, NULL, N'Lê Thị Hạnh', N'0345801984', NULL, 0, 2, 219450, NULL, CAST(N'2024-05-24T22:08:19.0406619' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (37, N'MDH020', 3, NULL, N'Lê Thị Hạnh', N'0345801984', NULL, 0, 0, 219450, NULL, CAST(N'2024-05-25T00:27:42.8708839' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (38, N'MDH021', 3, NULL, N'Lê Thị Hạnh', N'0345801984', NULL, 1, 1, 438900, NULL, CAST(N'2024-05-25T12:49:50.3918535' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (39, N'MDH022', 3, NULL, N'Lê Thị Hạnh', N'0345801984', NULL, 1, 2, 13200000, NULL, CAST(N'2024-05-25T16:44:35.9318754' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (40, N'MDH023', 3, NULL, N'Lê Thị Hạnh', N'0345801984', NULL, 1, 1, 594000, NULL, CAST(N'2024-05-27T13:25:28.7859519' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (41, N'MDH024', 15, NULL, N'Lê Thanh Trúc', N'0948200902', NULL, 1, 2, 438900, NULL, CAST(N'2024-05-28T00:19:43.8845675' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (42, N'MDH025', 15, NULL, N'Lê Thanh Trúc', N'0948200902', NULL, 1, 0, 219450, NULL, CAST(N'2024-05-28T00:22:14.4319279' AS DateTime2))
INSERT [dbo].[orders] ([id], [code], [user_id], [note], [full_name], [phone_number], [review], [payment], [status], [total], [fee_ship], [created_at]) VALUES (43, N'MDH026', 15, NULL, N'Lê Thanh Trúc', N'0948200902', NULL, 1, 0, 898350, NULL, CAST(N'2024-05-28T14:10:32.4307226' AS DateTime2))
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[posts] ON 

INSERT [dbo].[posts] ([id], [title], [slug], [avatar], [content], [short_content], [created_at], [updated_at], [status], [author]) VALUES (6, N'Ra mắt tác phẩm "Tiếng thét câm lặng" của nhà văn Oe Kenzaburo', N'ra-m?t-tác-ph?m-"ti?ng-thét-câm-l?ng"-c?a-nhà-van-oe-kenzaburo', N'1.jpg', N'<div class="rte">
						
						<p dir="ltr">Là một trong những nhân vật kiệt xuất của nền văn học Nhật Bản, Oe Kenzaburo là tác giả của hơn 20 tiểu thuyết và nhiều tập truyện được dịch và phát hành rộng rãi trên thế giới. "Tiếng thét câm lặng" là tác phẩm tiêu biểu, cũng là một trong năm tác phẩm được dẫn chứng cho giải Nobel Văn chương năm 1994 của ông.</p>
<p dir="ltr">Đầu tháng 4 năm 2024, Nhã Nam hân hạnh tổ chức buổi ra mắt bản dịch tiếng Việt của tác phẩm "Tiếng thét câm lặng" với sự tham gia của nhà văn, dịch giả, nhà nghiên cứu Nhật Chiêu.</p>

<p dir="ltr" style="text-align: justify;">Với "Tiếng thét câm lặng", Oe Kenzaburo mang đến cho người đọc một cái nhìn sâu sắc vào sự thay đổi văn hoá và xã hội của Nhật Bản trong thời kỳ chuyển giao văn hoá. Cuốn sách được phát hành lần đầu vào năm 1967 và đặt trong bối cảnh Nhật Bản sau Thế chiến thứ hai, một thời kỳ chính trị và xã hội đầy biến động.</p>
<p dir="ltr" style="text-align: justify;">Mặc dù có nền văn hoá và lịch sử làm nền tảng, tác phẩm không ngần ngại khám phá những chủ đề phức tạp như tình bạn, tình yêu và mối quan hệ giữa con người. Oe Kenzaburo đã khéo léo thể hiện những thay đổi của xã hội Nhật Bản trong thời kỳ này thông qua câu chuyện về một ngôi làng xa xôi, nơi mà những mâu thuẫn, bí ẩn và sự bất công bắt nguồn từ sâu thẳm tâm hồn con người.</p>

<p dir="ltr"><strong>THÔNG TIN SỰ KIỆN:</strong></p>
<p dir="ltr">- Thời gian: 9h30 - 11h30, ngày 06/4/2024</p>
<p dir="ltr">- Địa điểm: GEEK Hub, 244/31 Huỳnh Văn Bánh, Phường 11, Quận Phú Nhuận, TP HCM</p>
<p dir="ltr">- Với sự tham dự của nhà văn, dịch giả, nhà nghiên cứu Nhật Chiêu</p>
<p dir="ltr">&nbsp;</p>
<p dir="ltr"><strong>VỀ TÁC GIẢ:</strong></p>
<p dir="ltr">Oe Kenzaburo được xem là nhà văn hiện đại đầu tiên của Nhật Bản. Với những tác phảm của ông, dòng chảy văn học Nhật đã trở nên mới mẻ, tân kỳ hơn. Oe là gương mặt đại diện cho một nhà văn nhập cuộc, can dự xã hội một cách mạnh mẽ nên các tác phẩm của ông luôn gắn chặt với xã hội và thời đại.</p>

<p dir="ltr">Oe Kenzaburo là nhà văn Nhật Bản thứ hai sau Kawabata Yasunari được nhận giải thưởng Nobel Văn chương danh giá vào năm 1994. Ông đã "tạo ra một thế giới nhuốm màu tưởng tượng bằng thi ca, ở đó đời người và thần thoại hoà quyện làm một." Tên tuổi của ông được biết đến như một nhà văn Nhật tiên phong và đặc trưng nhất của thời hậu chiến.</p>
<p dir="ltr">&nbsp;</p>
					</div>', N'Đầu tháng 4 năm 2024, Nhã Nam hân hạnh tổ chức buổi ra mắt bản dịch tiếng Việt của tác phẩm "Tiếng thét câm lặng" với sự tham gia của nhà văn, dịch giả, nhà nghiên cứu Nhật Chiêu.', CAST(N'2024-04-07T10:19:26.1416981' AS DateTime2), NULL, 0, 1)
INSERT [dbo].[posts] ([id], [title], [slug], [avatar], [content], [short_content], [created_at], [updated_at], [status], [author]) VALUES (7, N'Cơ hội gặp gỡ một trong những nhà văn Pháp đương đại nổi tiếng nhất', N'co-h?i-g?p-g?-m?t-trong-nh?ng-nhà-van-pháp-duong-d?i-n?i-ti?ng-nh?t', N'2.jpg', N'<div class="rte">
						
						<p style="text-align: justify;">Với 15 triệu bản sách đã bán ra trên toàn thế giới, Bernard Werber là một trong những nhà văn Pháp đương đại nổi tiếng nhất. Danh tiếng của ông gắn liền với bộ tiểu thuyết “Kiến” gồm 3 cuốn: Kiến - Ngày của kiến - Cách mạng kiến . Bộ tiểu thuyết đã đưa tên tuổi Werber vượt ra ngoài ranh giới nước Pháp. Đến nay, bộ “Kiến” đã được dịch ra hơn 30 thứ tiếng.</p>
<p style="text-align: justify;">Bằng tư duy của một nhà báo khoa học lâu năm, kết hợp với một tâm hồn văn chương, Bernard Werber đã đưa vào bộ ba tiểu thuyết “Kiến” một cốt truyện hấp dẫn, ly kỳ cùng những kiến thức khoa học mạch lạc và nhiều tầng ý nghĩa. Không chỉ có vậy, bộ tiểu thuyết đồ sộ này còn là tổng hòa của triết học, tâm linh, kinh dị, thần thoại và ý thức.</p>


<p style="text-align: justify;"><span style="color:#000000;"><strong>Thời gian: </strong>15h, thứ Bảy, ngày 16 tháng 3 năm 2024.</span></p>
<p style="text-align: justify;"><span style="color:#000000;"><strong>Địa điểm: </strong>Thư viện Quốc gia Hà Nội - 31 Tràng Thi, Hoàn Kiếm, Hà Nội.</span></p>
<p style="text-align: justify;"><span style="color:#000000;">Với sự tham gia của các vị khách mời:</span></p>
<p style="text-align: justify;"><span style="color:#000000;">- Nhà văn Bernard Werber.</span></p>
<p style="text-align: justify;"><span style="color:#000000;">- Tiến sĩ văn học Nguyễn Quyên.</span></p>
<p style="text-align: justify;"><span style="color:#000000;">Để ban tổ chức sắp xếp được chu đáo, mời các anh, chị, các bạn đăng ký tham dự sự kiện tại&nbsp;</span><a href="https://forms.gle/TyTAdMAVhumap3oVA"><span style="color:#000000;">đây</span></a><span style="color:#000000;">.</span></p>
<p style="text-align: justify;"><strong>VỀ TÁC GIẢ:</strong></p>
<p style="text-align: justify;">Sinh năm 1961 tại Toulouse, Pháp. Sau khi tốt nghiệp Đại học Toulouse chuyên ngành Luật và trường Báo chí Quốc gia, Bernard Werber dành hơn mười năm làm nhà báo khoa học và từng cộng tác với rất nhiều tờ có tên tuổi khác như Le Point, Ça m''intéresse.</p>
<p style="text-align: justify;"><br>
Werber đặc biệt nổi tiếng với bộ ba tiểu thuyết về kiến. Ngay từ tiểu thuyết đầu tay, Kiến, độc giả đã thấy được phong cách viết độc đáo của Bernard Werber: sự pha trộn giữa truyện phiêu lưu, khoa học viễn tưởng và triết lý. Bộ ba Kiến, Ngày của Kiến và Cách mạng kiến đã được dịch ra hơn 30 thứ tiếng.</p>
<p style="text-align: justify;"><br>
Không chỉ thành công về mặt thương mại, bộ ba tác phẩm này còn nhận được nhiều giải thưởng của Pháp. Tập một Kiến đã giành giải thưởng của độc giả tờ Khoa học và Tương lai (Sciences et Avenir). Cuốn thứ hai trong bộ ba tiểu thuyết về kiến, Ngày của kiến ra đời ngay sau đó, đã nhận giải thưởng lớn của độc giả tờ Elle.</p>
<p style="text-align: justify;"><br>
Các tác phẩm của Bernard Werber đã được dịch ra hơn 35 thứ tiếng. Với 15 triệu bản sách bán được trên toàn thế giới, Bernard Werber là một trong những nhà văn Pháp đương đại nổi tiếng nhất.</p>
<p style="text-align: justify;"><br>
Ngoài tiểu thuyết, Bernard Werber còn được biết đến với truyện ngắn, truyện tranh, kịch và phim.</p>

<p style="text-align: justify;">Thân mời các bạn độc giả yêu thích văn học Pháp nói chung và khoa học giả tưởng nói riêng tới tham dự sự kiện và gặp gỡ tác giả.&nbsp;</p>
					</div>', N'Bằng tư duy của một nhà báo khoa học lâu năm, kết hợp với một tâm hồn văn chương, Bernard Werber đã đưa vào bộ ba tiểu thuyết “Kiến” một cốt truyện hấp dẫn, ly kỳ cùng những kiến thức khoa học mạch lạc và nhiều tầng ý nghĩa. Không chỉ có vậy, bộ tiểu thuyết đồ sộ này còn là tổng hòa của triết học, tâm linh, kinh dị, thần thoại và ý thức.', CAST(N'2024-04-07T10:21:41.2224683' AS DateTime2), NULL, 0, 1)
INSERT [dbo].[posts] ([id], [title], [slug], [avatar], [content], [short_content], [created_at], [updated_at], [status], [author]) VALUES (8, N'Tin bản quyền: Until August - Tác phẩm chưa xuất bản của tác giả "Trăm năm cô đơn"', N'tin-b?n-quy?n:-until-august---tác-ph?m-chua-xu?t-b?n-c?a-tác-gi?-"tram-nam-cô-don"', N'3.jpg', N'<div class="rte">
						
						<p style="text-align: justify;"><span style="color:#000000;"><em><strong>Until August</strong>, tác phẩm chưa xuất bản của tác giả “Trăm năm cô đơn”, đã được Nhã Nam mua bản quyền.</em></span></p>

<p dir="ltr" style="text-align: justify;"><span style="color:#000000;">Mười năm sau khi nhà văn Gabriel García Márquez qua đời, <em><strong>“Until August”</strong></em> (tên tiếng Tây Ban Nha: <em>En agosto nos vemos</em>) - tác phẩm chưa xuất bản của tác giả <em><strong>“Trăm năm cô đơn”</strong></em>, dự kiến sẽ được lên kệ tại nhiều quốc gia như Mỹ, Pháp, Ý, Thổ Nhĩ Kỳ,... vào ngày 6 tháng 3 tới.</span></p>

<p dir="ltr" style="text-align: justify;"><span style="color:#000000;">Tác phẩm dày&nbsp;hơn 100&nbsp;trang là kết quả của những nỗ lực sáng tác cuối đời&nbsp;của Gabriel García Márquez.&nbsp;<em><strong>"Until August"</strong></em>&nbsp;kể về&nbsp;câu chuyện của&nbsp;Ana Magdalena Bach, người phụ nữ trung niên có&nbsp;cuộc&nbsp;hôn nhân viên mãn&nbsp;và ngôi nhà&nbsp;luôn tràn ngập âm nhạc. Hằng năm,&nbsp;vào ngày 16 tháng 8, Ana lại&nbsp;đến thăm một hòn đảo ở Caribe,&nbsp;nơi mẹ cô được chôn cất.&nbsp;Những chuyến đi này, dù chỉ một đêm, sẽ&nbsp;thay đổi Ana và giúp cô&nbsp;khám phá những góc khác trong thế giới nội tâm của mình.</span></p>
<p dir="ltr" style="text-align: justify;"><span style="color:#000000;">Được viết với&nbsp;phong cách hấp dẫn và không thể trộn&nbsp;lẫn của một trong những cây bút&nbsp;vĩ đại nhất của văn học Mỹ Latinh,&nbsp;<em><strong>"Until August" </strong></em>là cuốn tiểu thuyết giàu cảm xúc mãnh liệt&nbsp;đem đến cho độc giả những&nbsp;suy ngẫm sâu sắc về tự do, sự hối tiếc, thay đổi bản thân và những bí ẩn của tình yêu.</span></p>
<p dir="ltr" style="text-align: justify;"><span style="color:#000000;"><strong>Gabriel García Márquez</strong> là nhà văn huyền thoại người Colombia. Ông nổi tiếng với phong cách viết hiện thực huyền ảo và được xem là một trong những tác giả vĩ đại nhất của thế kỷ 20. <strong><em>“Trăm năm cô đơn” </em></strong>là tác phẩm nổi tiếng nhất của ông.</span></p>

					</div>', N'Bằng tư duy của một nhà báo khoa học lâu năm, kết hợp với một tâm hồn văn chương, Bernard Werber đã đưa vào bộ ba tiểu thuyết “Kiến” một cốt truyện hấp dẫn, ly kỳ cùng những kiến thức khoa học mạch lạc và nhiều tầng ý nghĩa. Không chỉ có vậy, bộ tiểu thuyết đồ sộ này còn là tổng hòa của triết học, tâm linh, kinh dị, thần thoại và ý thức.', CAST(N'2024-04-07T10:33:29.9348387' AS DateTime2), NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[posts] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (50, N'A YEAR IN NATURE: A CAROUSEL BOOK OF THE SEASONS (POP-UP) 343', 16, CAST(532950 AS Decimal(18, 0)), N'<div class="pro-tabcontent" id="protab1" style="display:block">
<div class="mg-bottom-30 tab_list_product">
<table>
	<tbody>
		<tr>
			<td>M&atilde; h&agrave;ng:</td>
			<td>9781786273055</td>
		</tr>
		<tr>
			<td>Nh&agrave; xuất bản:</td>
			<td>Laurence King</td>
		</tr>
		<tr>
			<td>T&aacute;c giả:</td>
			<td>Hazel Maskell</td>
		</tr>
		<tr>
			<td>Năm xuất bản:</td>
			<td>2018</td>
		</tr>
		<tr>
			<td>Số trang:</td>
			<td>8</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước:</td>
			<td>276 x 246 x 15 mm</td>
		</tr>
	</tbody>
</table>
</div>

<p>&nbsp;</p>

<h1>A Year in Nature: A Carousel Book of the Seasons (Pop-Up)</h1>

<p>A Year in Nature is a beautiful- unique introduction to the seasons. The book opens out into a stunning four-part carousel- revealing intricately detailed pop-up scenes of spring- summer- autumn and winter. Follow a family of foxes as the tiny cubs grow up through the year- and explore the woodland scenes to discover animals- trees- plants and flowers. The woodland is vividly brought to life by Eleanor Taylor&rsquo;s rich- distinctive illustrations.</p>
</div>
', 1, CAST(1000 AS Decimal(18, 0)), NULL, N'Đông Á', CAST(32950 AS Decimal(18, 0)), 2, 0, NULL, NULL, 301, 1, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (51, N'ENDLESS FIELD', 16, CAST(121500 AS Decimal(18, 0)), N'<div class="pro-tabcontent" id="protab1" style="display:block">
<div class="mg-bottom-30 tab_list_product">
<table>
	<tbody>
		<tr>
			<td><strong>M&atilde; h&agrave;ng: </strong></td>
			<td><strong>8934974164456</strong></td>
		</tr>
		<tr>
			<td><strong>Nh&agrave; xuất bản: </strong></td>
			<td><strong>NXB Trẻ</strong></td>
		</tr>
		<tr>
			<td><strong>T&aacute;c giả: </strong></td>
			<td><strong>Nguyễn Ngọc Tư</strong></td>
		</tr>
		<tr>
			<td><strong>Năm xuất bản: </strong></td>
			<td><strong>2019</strong></td>
		</tr>
		<tr>
			<td><strong>Số trang: </strong></td>
			<td><strong>102</strong></td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước: </strong></td>
			<td><strong>13 x 20 cm</strong></td>
		</tr>
	</tbody>
</table>
</div>

<div>&nbsp;</div>

<h1 style="text-align:justify"><strong>Endless Field</strong></h1>

<div>
<p style="text-align:justify">Endless Field is a tale of Mekong Delta natives, marking Nguyễn Ngọc Tư&rsquo;s perceptive insight and sympathy for farmers (and people in general). Love, revenge, nostalgia, regret, and exposure of dark corners of souls permeate the whole story, the characters being thus more real.</p>

<p style="text-align:justify">Endless Field, made into the 2010 film titled The Floating Lives, has already been translated and published in Korea, China, France, Germany, and Sweden, where it has received much praise.<br />
---<br />
&ldquo;Perfect and strict in form&hellip; Kind of wistful images of how fate or chance knocks man to the ground.&rdquo; - Stefan Jonsson, a Swedish critic</p>

<p style="text-align:justify"><br />
C&aacute;nh đồng bất tận l&agrave; c&acirc;u chuyện về những mảnh đời mải mốt b&ecirc;n d&ograve;ng M&ecirc; K&ocirc;ng, đ&aacute;nh dấu sự thấu hiểu v&agrave; cảm th&ocirc;ng s&acirc;u sắc của Nguyễn Ngọc Tư với người n&ocirc;ng d&acirc;n (v&agrave; con người n&oacute;i chung). B&agrave;ng bạc khắp truyện l&agrave; t&igrave;nh y&ecirc;u thương, sự th&ugrave; hận, nỗi nhớ nhung, niềm &acirc;n hận, v&agrave; sự b&oacute;c trần những g&oacute;c khuất tăm tối trong t&acirc;m hồn khiến cho nh&acirc;n vật trong đ&oacute; trở n&ecirc;n &ldquo;đời&rdquo; hơn bao giờ hết.</p>

<p style="text-align:justify">C&aacute;nh đồng bất tận, được chuyển thể th&agrave;nh phim năm 2010 với t&ecirc;n gọi The Floating Lives, đ&atilde; được dịch v&agrave; xuất bản ở H&agrave;n Quốc, Trung Quốc, Ph&aacute;p, Đức, Thụy Điển, v&agrave; nhận được nhiều lời khen ngợi.<br />
---<br />
&ldquo;Kết cấu chặt chẽ v&agrave; ho&agrave;n hảo&hellip; Nhiều h&igrave;nh ảnh gợi buồn về nỗi con người bị số phận hay ch&iacute;nh cơ hội quật ng&atilde;.&rdquo; - Nh&agrave; ph&ecirc; b&igrave;nh Thụy Điển Stefan Jonsson</p>
</div>
</div>
', 1, CAST(135000 AS Decimal(18, 0)), NULL, N'Đông Á', CAST(21500 AS Decimal(18, 0)), 2, 0, NULL, NULL, 60, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (52, N'FANTASTIC BEASTS: THE CRIMES OF GRINDELWALD - THE ORIGINAL SCREENPLAY (HARDBACK)', 16, CAST(557650 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>9781338263893</td>
										</tr>
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>Scholastic Inc</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>J. K. Rowling</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2018</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>304</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>3.0 x 22.0 x 13.0</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div>&nbsp;</div><h1 style="text-align: justify;"><strong>Fantastic Beasts: The Crimes of Grindelwald - The Original Screenplay</strong></h1><div><p style="text-align: justify;">At the end of Fantastic Beasts and Where to Find Them, the powerful Dark wizard Gellert Grindelwald was captured in New York with the help of Newt Scamander. But, making good on his threat, Grindelwald escapes custody and sets about gathering followers, most unsuspecting of his true agenda: to raise pure-blood wizards up to rule over all non-magical beings.</p><p style="text-align: justify;">In an effort to thwart Grindelwald’s plans, Albus Dumbledore enlists Newt, his former Hogwarts student, who agrees to help once again, unaware of the dangers that lie ahead. Lines are drawn as love and loyalty are tested, even among the truest friends and family, in an increasingly divided wizarding world.</p><p style="text-align: justify;">This second original screenplay from J.K. Rowling, illustrated with stunning line art from MinaLima, expands on earlier events that helped shaped the wizarding world, with some surprising nods to the Harry Potter stories that will delight fans of both the books and films.</p></div>
							</div>', 2, CAST(587000 AS Decimal(18, 0)), NULL, N'NXB Trẻ ', CAST(157650 AS Decimal(18, 0)), 1, 0, NULL, NULL, 60, 1, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (53, N'A YEAR IN NATURE: A CAROUSEL BOOK OF THE SEASONS (POP-UP)', 16, CAST(532950 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;">
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>9781786273055</td>
										</tr>
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>Laurence King</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Hazel Maskell</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2018</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>8</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>276 x 246 x 15 mm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								<p></p><h1>A Year in Nature: A Carousel Book of the Seasons (Pop-Up)</h1><p>A Year in Nature is a beautiful- unique introduction to the seasons. The book opens out into a stunning four-part carousel- revealing intricately detailed pop-up scenes of spring- summer- autumn and winter. Follow a family of foxes as the tiny cubs grow up through the year- and explore the woodland scenes to discover animals- trees- plants and flowers. The woodland is vividly brought to life by Eleanor Taylor’s rich- distinctive illustrations.</p>
							</div>', 1, CAST(561000 AS Decimal(18, 0)), NULL, N'Đông Á', CAST(332950 AS Decimal(18, 0)), 2, 0, NULL, NULL, 90, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (54, N'HEADS UP MONEY', 16, CAST(313500 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;">
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>9780241228425</td>
										</tr>
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>DK Publishing</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Dorling Kindersley</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2017</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>160</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>233 x 183 mm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								<p></p><h1>Heads Up Money</h1><p>Does money make the world go round? Can money buy happiness? What would happen if a bank simply printed more money? Heads Up Money introduces economic theories to everyday life for young adults. From the pennies in our pocket to the global financial boom, Heads Up Money puts theory into practice and explains the important issues surrounding all areas of economics including the market, supply and demand, currencies, spending and saving. Using bright illustrations, big ideas, and economic and personal finance, Heads Up Money will help young adults understand the financial world around them.</p>
							</div>', 2, CAST(330000 AS Decimal(18, 0)), NULL, N'Nhà Xuất Bản Kim Đồng ', CAST(113500 AS Decimal(18, 0)), 3, 0, NULL, NULL, 80, 1, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (55, N'DIARY OF A WIMPY KID 11: DOUBLE DOWN (PAPERBACK)', 16, CAST(219450 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>9780141376660</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>Penguin Random House</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Jeff Kinney</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2018</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>240</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>198 x 129 x 15 mm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><h1 style="text-align: justify;"><strong>Diary of a Wimpy Kid 11: Double Down</strong></h1><p style="text-align: justify;">THE ONE WITH THE HALLOWEEN CANDY *The eleventh laugh-out-loud- fully illustrated bestselling Wimpy Kid book!* The pressure''s really piling up on Greg Heffley. His mum thinks video games are turning his brain to mush- so she wants her son to put down the controller and explore his ''creative side''. As if that''s not scary enough- Halloween''s just around the corner and the frights are coming at Greg from every angle. So- when Greg discovers a bag of gummy worms- it sparks an idea. Can he get his mom off his back by making a movie . . . and will he become rich and famous in the process? Or will doubling down on this plan just double Greg''s troubles? ABOUT DIARY OF A WIMPY KID: 50% words- 50% cartoons- 100% hilarious! Hilarious stories that all readers can''t wait to get their hands on Laughter guaranteed 200 million copies sold worldwide ''Kinney is right up there with J K Rowling as one of the bestselling children''s authors on the planet'' - Independent *Don''t miss Diary of an Awesome Friendly Kid­­- to read Greg''s best friend Rowley''s side of the story!*</p>
							</div>', 1, CAST(231000 AS Decimal(18, 0)), NULL, N'Nhà Xuất Bản Kim Đồng ', CAST(119450 AS Decimal(18, 0)), 3, 0, NULL, NULL, 80, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (56, N'DIARY OF A WIMPY KID 10: OLD SCHOOL (PAPERBACK)', 16, CAST(219450 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>9780141377094</td>
										</tr>
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>Penguin Random House</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Jeff Kinney</td>
										</tr>
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2017</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>240</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>198 x 129 x 15 mm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><h1 style="text-align: justify;"><strong>Diary Of A Wimpy Kid 10: Old School</strong></h1><p style="text-align: justify;">THE ONE WITH THE SCARY SCHOOL TRIP *The tenth laugh-out-loud- fully illustrated bestselling Wimpy Kid book!* Greg Heffley''s parents are convinced life was better back in the old days. But Greg isn''t convinced that a life without electronics- central heating and working plumbing sounds all that good. And so- despite his best efforts- he is sent off to Hardscrabble Farm to learn about hard work and the great outdoors. Will Greg be able to survive a week out in the wild? Or will his school trip be a complete DISASTER? ABOUT DIARY OF A WIMPY KID: 50% words- 50% cartoons- 100% hilarious! Hilarious stories that all readers can''t wait to get their hands on Laughter guaranteed 200 million copies sold worldwide ''Kinney is right up there with J K Rowling as one of the bestselling children''s authors on the planet'' - Independent *Don''t miss Diary of an Awesome Friendly Kid­­- to read Greg''s best friend Rowley''s side of the story!*</p>
							</div>', 2, CAST(231000 AS Decimal(18, 0)), NULL, N'Nhà Xuất Bản Kim Đồng ', CAST(119450 AS Decimal(18, 0)), 3, 0, NULL, NULL, 90, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (57, N'DIARY OF A WIMPY KID 07: THE THIRD WHEEL (PAPERBACK)', 16, CAST(219450 AS Decimal(18, 0)), N'<div class="pro-tabcontent" id="protab1" style="display:block">
<div class="mg-bottom-30 tab_list_product">
<table>
	<tbody>
		<tr>
			<td>M&atilde; h&agrave;ng:</td>
			<td>9780141345741</td>
		</tr>
		<tr>
			<td>Nh&agrave; xuất bản:</td>
			<td>Penguin Random House</td>
		</tr>
		<tr>
			<td>T&aacute;c giả:</td>
			<td>Jeff Kinney</td>
		</tr>
		<tr>
			<td>Năm xuất bản:</td>
			<td>2014</td>
		</tr>
		<tr>
			<td>Số trang:</td>
			<td>240</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước:</td>
			<td>198 x 129 x 15 mm</td>
		</tr>
	</tbody>
</table>
</div>

<p>&nbsp;</p>

<h1>Diary Of A Wimpy Kid 07: The Third Wheel</h1>

<div>
<p>Love is in the air - but what does that mean for Greg Heffley?</p>

<p>A Valentine&#39;s Day dance at Greg&#39;s middle school has turned Greg&#39;s world upside down. As Greg scrambles to find a date, he&#39;s worried he&#39;ll be left out in the cold on the big night. His best friend, Rowley, doesn&#39;t have any prospects either, but that&#39;s small consolation.</p>

<p>Then an unexpected twist gives Greg a partner for the dance and leaves Rowley the odd man out. But a lot can happen in one night, and in the end you never know who&#39;s going to be lucky in love . . .</p>
</div>
</div>
', 1, CAST(231000 AS Decimal(18, 0)), NULL, N'Việt Tinh Anh', CAST(119450 AS Decimal(18, 0)), 4, 0, NULL, NULL, 90, 1, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (58, N'DIARY OF A WIMPY KID 09: THE LONG HAUL (PAPERBACK)', 16, CAST(219450 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;">
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>9780141354224</td>
										</tr>
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>Penguin Random House</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Jeff Kinney</td>
										</tr>
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2016</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>240</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>198 x 129 x 15 mm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								<p></p><h1>Diary Of A Wimpy Kid 09: The Long Haul&nbsp;</h1><p>THE ONE WITH THE FAMILY ROAD TRIP *The ninth laugh-out-loud- fully illustrated bestselling Wimpy Kid book!* This time- the Heffley''s are off on a road trip! The chances of survival are... quite small to be honest. Greg''s idea of a good summer is air conditioning and lounging in front of the television. But his mum has different plans. So- they''re off on an ''authentic'' summer- trapped together on a road trip. And Greg''s soon battling petrol-station bathrooms- crazed seagulls- a fender bender and a runaway pig. It looks like he was right to be worried. ABOUT DIARY OF A WIMPY KID: 50% words- 50% cartoons- 100% hilarious! Hilarious stories that all readers can''t wait to get their hands on Laughter guaranteed 200 million copies sold worldwide ''Kinney is right up there with J K Rowling as one of the bestselling children''s authors on the planet'' - Independent *Don''t miss Diary of an Awesome Friendly Kid­­- to read Greg''s best friend Rowley''s side of the story!*</p>
							</div>', 1, CAST(231000 AS Decimal(18, 0)), NULL, N'Thiên Long Hoàn Cầu', CAST(119450 AS Decimal(18, 0)), 5, 0, NULL, NULL, 100, 1, 0)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (59, N'DIARY OF A WIMPY KID 08: HARD LUCK (PAPERBACK)', 16, CAST(219450 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>9780141355481</td>
										</tr>
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>Penguin Random House</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Jeff Kinney</td>
										</tr>
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2014</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>240</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>198 x 129 x 15 mm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><h1 style="text-align: justify;"><strong>Diary Of A Wimpy Kid 08: Hard Luck</strong></h1><p style="text-align: justify;">THE ONE WHERE GREG NEEDS A NEW FRIEND *The eighth laugh-out-loud- fully illustrated bestselling Wimpy Kid book!* Things haven''t been going all that well for Greg Heffley recently. For one thing- his best friend Rowley has a GIRLFRIEND- so now Greg is in the market for a new best friend. But after he''s spent so long training him to be the perfect best friend- finding a ''new Rowley'' won''t be easy. And to top it off- his family (including his feral cousins) are coming to stay. Can Greg improve his luck before it''s too late? ABOUT DIARY OF A WIMPY KID: 50% words- 50% cartoons- 100% hilarious! Hilarious stories that all readers can''t wait to get their hands on Laughter guaranteed 200 million copies sold worldwide ''Kinney is right up there with J K Rowling as one of the bestselling children''s authors on the planet'' - Independent *Don''t miss Diary of an Awesome Friendly Kid­­- to read Greg''s best friend Rowley''s side of the story!*</p>
							</div>', 1, CAST(251000 AS Decimal(18, 0)), NULL, N'Nhã Nam  ', CAST(119450 AS Decimal(18, 0)), 6, 0, NULL, NULL, 80, 2, 2)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (60, N'DIARY OF A WIMPY KID 06: CABIN FEVER (PAPERBACK)', 16, CAST(219450 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>9780141343006</td>
										</tr>
										
										
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>Penguin Random House</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Jeff Kinney</td>
										</tr>
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2013</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>240</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>198 x 129 x 15 mm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><h1 style="text-align: justify;"><strong>Diary of a Wimpy Kid 06: Cabin Fever</strong></h1><p style="text-align: justify;">THE ONE WITH THE CRAZY SNOW STORM *The sixth laugh-out-loud- fully illustrated bestselling Wimpy Kid book!* A snowstorm SHOULD bring nothing but fun. Hours in front of the TV- cuddling up with a blanket and NO SCHOOL... But not for Greg Heffley. Being trapped inside with his family is bad enough- but it''s even worse when the POLICE are trying to track him down. School property has been damaged- and Greg''s the prime suspect. But he''s INNOCENT! Sort of. Is time finally up for Greg Heffley? ABOUT DIARY OF A WIMPY KID: 50% words- 50% cartoons- 100% hilarious! Hilarious stories that all readers can''t wait to get their hands on Laughter guaranteed 200 million copies sold worldwide ''Kinney is right up there with J K Rowling as one of the bestselling children''s authors on the planet'' - Independent *Don''t miss Diary of an Awesome Friendly Kid­­- to read Greg''s best friend Rowley''s side of the story!*</p>
							</div>', 1, CAST(319450 AS Decimal(18, 0)), NULL, N'Thiên Long Hoàn Cầu', CAST(119450 AS Decimal(18, 0)), 5, 0, NULL, NULL, 60, 2, 0)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (61, N'NHẬT KÝ CỦA PINK', 17, CAST(62100 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>8935082600263</td>
										</tr>
										
										
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>NXB Văn Hoá Thông Tin</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Wazza Pink</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2014</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>112</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>13x20.5cm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div>&nbsp;</div><h1 style="text-align: justify;"><strong>Nhật Ký Của Pink</strong></h1><div><p style="text-align: justify;"><strong>&nbsp;“<em>Nhật ký của Pink</em>”</strong>&nbsp;là tập truyện tranh gồm những mẩu chuyện hồn nhiên, với cách nhìn vừa đáng yêu, vừa mới lạ về tuổi thơ, về xe cộ, về mùa thu Hà Nội… Những điều tưởng chừng rất đời thường, hiển nhiên mà ai trong mỗi chúng ta đều đã từng trải qua, chỉ đến khi được tái hiện trên trang giấy với nét vẽ ngộ nghĩnh, đáng yêu của Pink – chúng ta mới chợt nhận ra rằng “Ồ thì ra những điều ngớ ngẩn vô cùng ấy chính là hạnh phúc!”</p><p style="text-align: justify;">“Tuổi thơ – quãng thời gian mà những người hơn ta chục tuổi tự cho mình cái quyền gọi ta là “trẻ con”… là những ngày lê la chơi ô ăn quan, đánh chắt đánh chuyền hay những chiều rong ruổi ngoài đồng…”</p><p style="text-align: justify;">Ôi những ngày tháng “ngớ ngẩn” và hạnh phúc!</p></div>
							</div>', 1, CAST(69000 AS Decimal(18, 0)), NULL, N'NXB Trẻ ', CAST(12100 AS Decimal(18, 0)), 1, 0, NULL, NULL, 50, 1, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (62, N'PHÁT MINH PHI THƯỜNG - PHƯƠNG TIỆN DI CHUYỂN: TỪ BÁNH XE ĐẾN PHI THUYỀN', 17, CAST(36000 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>8934974166993</td>
										</tr>
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>NXB Trẻ</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Matt Turner</td>
										</tr>
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2020</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>32</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>19 x 26 cm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div>&nbsp;</div><h1><strong>Phát Minh Phi Thường - Phương Tiện Di Chuyển: Từ Bánh Xe Đến Phi Thuyền</strong></h1><div style="text-align: justify;">Tập sách&nbsp;<em>Thế giới &nbsp;hiện đại</em>&nbsp;giới thiệu những phát minh thú vị từ lúc con người phải dùng sức người và gia súc để lao động tạo ra thực phẩm đến khi khám ra những cách thức hiện đại hơn ứng dụng vào cuộc sống, sáng tạo ra những thiết bị máy móc hiện đại giúp cuộc sống càng ngày càng đơn giản, tiện nghi hơn. Tập sách nằm trong bộ&nbsp;<em>Phát minh phi thường&nbsp;</em>gồm 4 tựa:&nbsp;<em>Ánh sáng, Thế giới hiện đại, Phương tiện giao tiếp, Phương tiện di chuyển,</em>&nbsp;giới thiệu những phát minh không ngừng nghỉ của các nhà khoa học, nhờ sự bền bỉ tìm tòi sáng tạo của họ mà cuộc sống của chúng ta đầy tiện ích và dễ dàng kết nối với thế giới.</div>
							</div>', 2, CAST(40000 AS Decimal(18, 0)), NULL, N'NXB Trẻ ', CAST(26000 AS Decimal(18, 0)), 1, 0, NULL, NULL, 60, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (63, N'ĐẾN THĂM THÀNH PHỐ CỦA EM (CUỐN LẺ)', 17, CAST(22500 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>8934974201328</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>NXB Trẻ</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Nhiều Tác Giả</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2024</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>24</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Trọng lượng: </td> <td>100g</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>24 x 19 x 0.2 cm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div style="text-align: justify;">&nbsp;</div><h1 style="text-align: justify;"><strong>Đến thăm thành phố của em (Cuốn lẻ)</strong></h1><div style="text-align: justify;"><strong>Bộ sách bao gồm 4 chủ đề:&nbsp;</strong></div><ul><li style="text-align: justify;"><strong>Đến thăm thành phố của em: Đà Nẵng - Thành phố đáng sống</strong></li><li style="text-align: justify;"><strong>Đến thăm thành phố của em: Đắk Lắk- Hương vị cà phê</strong></li><li style="text-align: justify;"><strong>Đến thăm thành phố của em: Hà Nội rồng bay</strong></li><li style="text-align: justify;"><strong>Đến thăm thành phố của em: Hải Phòng - Thành phố hoa phượng đỏ</strong></li></ul><div><p style="text-align: justify;"><strong>1.&nbsp;</strong><strong>Đến Thăm Thành Phố Của Em - Đà Nẵng-Thành Phố Đáng Sống</strong></p><p style="text-align: justify;">Đà Nẵng, nơi có bán đảo Sơn Trà, bãi biển Mỹ Khê, đỉnh Bà Nà, cầu quay, và cả những chú Voọc nằm trong sách đỏ. Thành phố lớn nhất miền Trung nước ta sẽ gây thương nhớ với bạn như thế nào? Hãy cùng Minh, cậu bạn ở Đà Nẵng làm một chuyến vòng quanh thành phố sôi động này nha.</p><p style="text-align: justify;">Đà Nẵng - Thành phố đáng sống, nằm trong series sách "Đến thăm thành phố của em". Đây sẽ là một cẩm nang vô cùng thú vị cho các em học sinh lứa tuổi tiểu học tìm hiểu về phong cảnh, con người, văn hóa nghệ thuật, ẩm thực đặc trưng của từng thành phố.&nbsp;</p><p style="text-align: justify;">Hy vọng, bộ sách sẽ góp phần tăng thêm lòng tự hào, giáo dục lòng yêu nước bằng việc yêu nơi mình đang sống.</p><p style="text-align: justify;"><strong>2.&nbsp;Đến Thăm Thành Phố Của Em - Đắk Lắk- Hương Vị Cà Phê</strong></p><p style="text-align: justify;">Đắk Lắk - một tỉnh nằm ở trung tâm vùng Tây Nguyên nước ta, nơi mà nghe nói đến, bạn sẽ nghĩ ngay đến những điệu múa cồng chiêng, voi, cà phê. Chúng mình cùng gặp bạn Mai Khôi, để xem bạn ấy kể về thành phố nơi mình đang sống như thế nào nha.</p><p style="text-align: justify;">Đắk Lắk - Hương vị cà phê, nằm trong series sách "Đến thăm thành phố của em". Đây sẽ là một cẩm nang vô cùng thú vị cho các em học sinh lứa tuổi tiểu học tìm hiểu về phong cảnh, con người, văn hóa nghệ thuật, ẩm thực đặc trưng của từng thành phố. Hy vọng, bộ sách sẽ góp phần tăng thêm lòng tự hào, giáo dục lòng yêu nước bằng việc yêu và hiểu rõ nơi mình đang sống.</p><p style="text-align: justify;"><strong>3.&nbsp;</strong><strong>Đến Thăm Thành Phố Của Em - Hà Nội Rồng Bay</strong></p><p style="text-align: justify;">Bạn nhỏ học địa lý, hẳn đã biết Hà Nội là thủ đô của nước ta rồi phải không? Bao nhiêu câu chuyện về lịch sử, học thuật, văn hóa... gần như đều bắt nguồn từ thủ đô ngàn năm văn hiến này.</p><p style="text-align: justify;">Hai bạn Mai và Ben sẽ đưa tụi mình khám phá những địa điểm nào, ăn gì, xem gì ở Hà Nội? Cùng theo chân các bạn ấy, để hiểu rõ hơn về thủ đô Hà Nội, vừa sôi động, vừa trầm lắng, vừa xinh đẹp vừa lãng mạn với bốn mùa Xuân, Hạ, Thu, Đông đông rõ rệt.</p><p style="text-align: justify;">Hà Nội rồng bay, nằm trong series sách "Đến thăm thành phố của em". Đây sẽ là một cẩm nang vô cùng thú vị cho các em học sinh lứa tuổi tiểu học tìm hiểu về phong cảnh, con người, văn hóa nghệ thuật, ẩm thực đặc trưng của từng thành phố. Hy vọng, bộ sách sẽ góp phần tăng thêm lòng tự hào, giáo dục lòng yêu nước bằng việc yêu và hiểu rõ nơi mình đang sống.</p><p style="text-align: justify;"><strong>4.&nbsp;</strong><strong>Đến Thăm Thành Phố Của Em - Hải Phòng-Thành Phố Hoa Phượng Đỏ</strong></p><p style="text-align: justify;">Hẳn em đã từng nghe đến tên gọi Thành phố hoa phượng đỏ đúng không? Đó chính là Hải Phòng, một thành phố xinh đẹp, lấy loài hoa của mùa hè làm biểu tượng cho mình. Chưa hết đâu, Hải Phòng còn là thành phố Cảng và là một trong 5 thành phố thuộc trung ương của nước ta đó.</p><p style="text-align: justify;">Để có bài thuyết trình về thành phố nơi mình đang sống, Long và chú mèo Sushi bèn làm một chuyến khám phá Hải Phòng. Tụi mình cùng theo chân Long và mèo Sushi nào.</p><p style="text-align: justify;">Hải Phòng - Thành phố hoa phượng đỏ, nằm trong series sách "Đến thăm thành phố của em". Đây sẽ là một cẩm nang vô cùng thú vị cho các em học sinh lứa tuổi tiểu học tìm hiểu về phong cảnh, con người, văn hóa nghệ thuật, ẩm thực đặc trưng của từng thành phố. Hy vọng, bộ sách sẽ góp phần tăng thêm lòng tự hào, giáo dục lòng yêu nước bằng việc yêu và hiểu rõ nơi mình đang sống.</p></div>
							</div>', 2, CAST(25000 AS Decimal(18, 0)), NULL, N'NXB Trẻ ', CAST(12500 AS Decimal(18, 0)), 1, 0, NULL, NULL, 60, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (64, N'BÍ MẬT CỦA MILTON', 17, CAST(80100 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>8938539539253</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>NXB Dân Trí</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Eckhart Tolle &amp; Robert S. Friedman &amp; Frank Riccio</td>
										</tr>
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2023</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>42</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>25 x 17 x 0.2 cm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div style="text-align: justify;">&nbsp;</div><h1 style="text-align: justify;"><strong>Bí mật của Milton</strong></h1><div><p style="text-align: justify;">Milton có một bí mật tuyệt diệu. Ngay lúc này bạn cũng có thể khám phá bí mật đó! Milton là một cậu bé vui vẻ và đầy hứng khởi cho đến khi cậu gặp một kẻ hay bắt nạt ở trường, gã đó đã làm xáo trộn cuộc sống của cậu. Bây giờ Milton luôn lo lắng gã kia sẽ làm gì cậu khi cậu ở trường.</p><p style="text-align: justify;">Milton phải đối mặt với một số tình huống buồn tủi và rắc rối nhưng qua đó cậu đã học được những bài học hữu ích, và một bài học rất đặc biệt đến từ chú mèo Snuggles. Milton nhận ra: ́ ̂́ đ̂̉ ̂ ̀ ̂́ ̣̂ ̣.</p><p style="text-align: justify;">Bí mật của Milton sẽ truyền cảm hứng và giúp đỡ những trẻ em đang gặp phải những khó khăn ở trường học, ở nhà cũng như ở bất cứ nơi đâu.</p><p style="text-align: justify;">"Bí Mật Của Milton" là một cuốn truyện tranh truyền tải toàn bộ cuốn sách của tác giả Eckhart Tolle - SỨC MẠNH CỦA HIỆN TẠI giúp trẻ em có thể nhận ra thông điệp mà người lớn không dễ nhận ra. Gieo hạt giống thức tỉnh tâm linh trong trẻ.</p><p style="text-align: justify;">Dành cho phụ huynh:</p><p style="text-align: justify;">Là phụ huynh ai cũng mong muốn những điều tốt đẹp nhất cho con em mình, nhưng điều tốt đẹp nhất đứa trẻ có thể có thì không ai - không phụ huynh nào có thể trao tặng. Thứ có giá trị nhất với đứa trẻ phải do chúng khám phá ở trong chính mình. Đó chính là sự tỉnh thức.</p><p style="text-align: justify;">Eckhart Tolle vị thầy tâm linh có ảnh hưởng bậc nhất thế giới đã lan toả sự tỉnh thức đến với nhân loại thông qua các tác phẩm như: Sức Mạnh Của Hiện Tại, Đi Vào Thực Tại, Thức Tỉnh Mục Đích Sống, Những tác phẩm đó đã làm rung chuyển tâm thức nhân loại, tuy nhiên hầu hết đều là sách dành cho người lớn. Bí Mật Của Milton là một cuốn truyện tranh dành cho thiếu niên nhưng có năng lực đánh thức, năng lượng chuyển hoá tâm hồn. Cuốn sách truyền tải bí mật lớn nhất của nhân loại - bí mật về Sức mạnh của Hiện tại để trẻ có thể tiếp cận và nhận ra giá trị tâm linh tối hậu ngay trong chính mình. Đây là một điều quá đỗi diệu kỳ!</p><p style="text-align: justify;">Nếu bố mẹ là người quan tâm tới sự thức tỉnh tâm linh thì cuốn sách có thể là món quà vô giá dành cho con em mình.</p><p style="text-align: justify;"><strong><em>Trần Đức</em></strong></p><p style="text-align: justify;"><strong><em>Sáng lập cộng đồng Sức mạnh Hiện tại</em></strong></p><p style="text-align: justify;">Tác giả:</p><p style="text-align: justify;">- Eckhart Tolle là tác giả của cuốn sách tâm linh bán chạy hàng đầu thế giới - Sức mạnh của hiện tại (The power of now). Năm 2011, ông cùng với đức Đạt Lai Lạt Ma được nhà xuất bản Watkins Books của Anh quốc bình chọn là người có ảnh hưởng tâm linh nhất thế giới. Năm 2008, một bài viết của The New York Times đã gọi Eckhart Tolle là "Tác giả về tâm linh nổi tiếng nhất nước Mỹ". Sự hiện diện của ông đã góp phần to lớn vào sự chuyển hoá tâm thức trên hành tinh này. Tần số tỉnh thức từ một người vô danh - Eckhart đã lay động nhân loại một cách mạnh mẽ. Những lời chia sẻ sâu sắc nhưng đơn giản của Eckhart đã giúp vô số người trên khắp thế giới tìm thấy sự bình yên trong nội tâm và có được cuộc sống viên mãn hơn. Cốt lõi của những chia sẻ từ ông là vượt qua suy tư, là thức tỉnh tâm linh, ông coi đó là bước tiếp theo trong quá trình tiến hóa của nhân loại. Một khía cạnh thiết yếu của sự tỉnh thức này bao gồm việc vượt qua trạng thái ý thức dựa trên bản ngã của chúng ta. Đây là một điều kiện tiên quyết không chỉ cho hạnh phúc cá nhân mà còn để chấm dứt xung đột bạo lực trên hành tinh này.</p><p style="text-align: justify;">- Robert S. Friedman, người sáng lập Rainbow Ridge Books đơn vị xuất bản lâu năm các tác phẩm về tâm linh và siêu hình học. Ông là một doanh nhân hoạt động trong lĩnh vực xuất bản nhưng cũng là một nhà văn, là đồng tác giả cùng với Eckhart Tolle trong sách Bí Mật Của Milton, một cuốn sách dành cho trẻ em được xuất bản vào năm 2008</p><p style="text-align: justify;">- Frank Joseph Riccio II, là một nghệ sĩ và họa sĩ minh họa, Frank đã minh họa nhiều cuốn sách dành cho trẻ em, các tác phẩm của ông cũng đã xuất hiện trên các tạp chí Gourmet và Sports Illustrated.</p></div>
							</div>', 1, CAST(89000 AS Decimal(18, 0)), NULL, N'Nhà Xuất Bản Kim Đồng ', CAST(10100 AS Decimal(18, 0)), 3, 0, NULL, NULL, 90, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (65, N'PHÁT MINH PHI THƯỜNG - PHƯƠNG TIỆN GIAO TIẾP: TỪ CHỮ VIẾT ĐẦU TIÊN ĐẾN INTERNET', 17, CAST(36000 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>8934974167013</td>
										</tr>
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>NXB Trẻ</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Matt Turner</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2020</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>32</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>19 x 26 cm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div>&nbsp;</div><h1 style="text-align: justify;"><strong>Phát Minh Phi Thường - Phương Tiện Giao Tiếp: Từ Chữ Viết Đầu Tiên Đến Internet</strong></h1><div style="text-align: justify;">Tập sách&nbsp;<em>Thế giới&nbsp;hiện đại</em>&nbsp;giới thiệu những phát minh thú vị từ lúc con người phải dùng sức người và gia súc để lao động tạo ra thực phẩm đến khi khám ra những cách thức hiện đại hơn ứng dụng vào cuộc sống, sáng tạo ra những thiết bị máy móc hiện đại giúp cuộc sống càng ngày càng đơn giản, tiện nghi hơn. Tập sách nằm trong bộ&nbsp;<em>Phát minh phi thường&nbsp;</em>gồm 4 tựa:&nbsp;<em>Ánh sáng, Thế giới hiện đại, Phương tiện giao tiếp, Phương tiện di chuyển,</em>&nbsp;giới thiệu những phát minh không ngừng nghỉ của các nhà khoa học, nhờ sự bền bỉ tìm tòi sáng tạo của họ mà cuộc sống của chúng ta đầy tiện ích và dễ dàng kết nối với thế giới.</div>
							</div>', 1, CAST(40000 AS Decimal(18, 0)), NULL, N'Đông Á', CAST(16000 AS Decimal(18, 0)), 2, 0, NULL, NULL, 60, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (66, N'BÀ NGOẠI TRÊN CÂY TÁO', 17, CAST(45000 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>8935352603086</td>
										</tr>
										
										
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>NXB Kim Đồng</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Mira Lobe &amp; Susi Weigel</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2024</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>148</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Trọng lượng: </td> <td>200g</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>20.5 x 14.5 x 0.7 cm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div style="text-align: justify;">&nbsp;</div><h1 style="text-align: justify;"><strong>Bà ngoại trên cây táo</strong></h1><div><p style="text-align: justify;">Cậu bé Andi buồn chán vì mình là đứa nhóc duy nhất trong khu phố không có bà, trong khi các bạn khác đều có bà.</p><p style="text-align: justify;">Thế rồi bỗng vào buổi chiều nọ, một bà ngoại bất ngờ xuất hiện trên cây táo – nơi ẩn nấp bí mật của riêng cậu bé.</p><p style="text-align: justify;">Bà ngoại dẫn Andi chu du khắp các miền đất mới lạ, từ rừng núi đến đại dương, chơi đủ các trò chơi kì thú, để Andi lái một chiếc ô tô xanh siêu “ngầu” và thậm chí là đi săn hổ ở Ấn Độ!</p><p style="text-align: justify;">Cùng lúc ấy, Andi cũng làm quen với bà Fink – người hàng xóm già mới chuyển đến và đỡ đần, chăm lo cho bà trong những công việc thường ngày.</p><p style="text-align: justify;">Một câu chuyện trong trẻo, dễ thương về ước mong, khát khao chinh phục những điều lớn lao của trẻ nhỏ cũng như tình thân và sự thấu hiểu giữa các thành viên trong gia đình.</p><p style="text-align: justify;"><strong>TÁC PHẨM ĐOẠT GIẢI THƯỞNG SÁCH DÀNH CHO THIẾU NHI VÀ THANH THIẾU NIÊN ÁO NĂM 1965.</strong></p><p style="text-align: justify;">---</p><p style="text-align: justify;"><strong>Mira Lobe&nbsp;</strong>(1913-1995) là tác giả người Áo nổi tiếng thế giới với hơn 100 tác phẩm sáng tác cho thiếu nhi và thanh thiếu niên. Nhiều tác phẩm của bà đoạt giải thưởng quốc gia và quốc tế, tiêu biểu như “Die Omama im Apfelbaum”&nbsp;<em>(Bà ngoại trên cây táo),&nbsp;</em>“Das Städtchen drumherum”&nbsp;<em>(Thành phố quanh vòng quanh),&nbsp;</em>“Das kleine Ich bin Ich”&nbsp;<em>(Tôi là tôi bé nhỏ),&nbsp;</em>“Komm, sagte die Katze”&nbsp;<em>(“Lại đây nào!” Mèo bảo)…</em></p><p style="text-align: justify;">Tác phẩm của bà được dịch sang hơn 30 thứ tiếng khác nhau, xuất bản ở nhiều quốc gia và đồng hành với tuổi thơ nhiều độc giả thiếu nhi trên khắp thế giới.</p><p style="text-align: justify;"><strong>Susi Weigel</strong>&nbsp;(1914-1990) là họa sĩ đồ họa, minh họa người Áo. Từ năm 1929 đến 1934 bà học trường công nghiệp nghệ thuật Viên. Các tác phẩm của Mira Lobe được bà vẽ minh họa đều trở nên sinh động, cuốn hút với nhiều thế hệ độc giả.</p><p style="text-align: justify;">Nhà thơ, dịch giả&nbsp;<strong>CHU THU PHƯƠNG&nbsp;</strong>(Đan Phong Diệp)</p><p style="text-align: justify;">Hội viên Hội Nhà văn Việt Nam, Ủy viên Hội đồng văn học dịch Hội Nhà văn Hà Nội. Các tác phẩm tiêu biểu của cô bao gồm:</p><p style="text-align: justify;">Sáng tác thơ:&nbsp;<em>Lá phong đỏ&nbsp;</em>(2008),&nbsp;<em>Lạc giữa thu và hạ&nbsp;</em>(2018).</p><p style="text-align: justify;">Tác phẩm dịch: Tập thơ&nbsp;<em>Khúc đệm trữ tình&nbsp;</em>(Heinrich Heine);&nbsp;<em>Truyện cổ Grimm</em>; tổ khúc&nbsp;<em>Hành trình mùa đông&nbsp;</em>(Franz Schubert) cùng Ngô Tự Lập; tập thơ&nbsp;<em>Tóc rối&nbsp;</em>(Yosano Akiko)...</p></div>
							</div>', 1, CAST(50000 AS Decimal(18, 0)), NULL, N'NXB Trẻ ', CAST(25000 AS Decimal(18, 0)), 1, 0, NULL, NULL, 60, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (67, N'THÀNH PHỐ QUANH VÒNG QUANH', 17, CAST(58500 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>8935352603079</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>NXB Kim Đồng</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Mira Lobe &amp; Susi Weigel</td>
										</tr>
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2024</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>56</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Trọng lượng: </td> <td>100g</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>26 x 20 x 0.2 cm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div style="text-align: justify;">&nbsp;</div><h1 style="text-align: justify;"><strong>Thành phố quanh vòng quanh</strong></h1><div><p style="text-align: justify;">Ngài Thị trưởng đáng kính muốn chặt phá cánh rừng, lấp ao hồ để mở rộng thị trấn bé nhỏ thành một đô thị to lớn hiện đại như ý tưởng ngài ấp ủ từ lâu.</p><p style="text-align: justify;">Vậy nhưng muôn loài động vật than khóc, trẻ nhỏ bực dọc và người già rầu rĩ. Bà tiên rừng Hullewulle cũng bất bình thay. Bà đã gieo những giấc mơ kì quái khiến ngài Thị trưởng sợ hãi, từ đó giúp ngài ngộ ra cách xây dựng thành phố mà không tổn hại đến rừng xanh.</p><p style="text-align: justify;">---</p><p style="text-align: justify;"><strong>Mira Lobe&nbsp;</strong>(1913-1995)là tác giả người Áo nổi tiếng thế giới với hơn 100 tác phẩm sáng tác cho thiếu nhi và thanh thiếu niên. Nhiều tác phẩm của bà đoạt giải thưởng quốc gia và quốc tế, tiêu biểu như “Die Omama im Apfelbaum”&nbsp;<em>(Bà ngoại trên cây táo),&nbsp;</em>“Das Städtchen drumherum”&nbsp;<em>(Thành phố quanh vòng quanh),&nbsp;</em>“Das kleine Ich bin Ich”&nbsp;<em>(Tôi là tôi bé nhỏ),&nbsp;</em>“Komm, sagte die Katze”&nbsp;<em>(“Lại đây nào!” Mèo bảo)…</em></p><p style="text-align: justify;">Tác phẩm của bà được dịch sang hơn 30 thứ tiếng khác nhau, xuất bản ở nhiều quốc gia và đồng hành với tuổi thơ nhiều độc giả thiếu nhi trên khắp thế giới.</p><p style="text-align: justify;"><strong>Susi Weigel</strong>&nbsp;(1914-1990) là họa sĩ đồ họa, minh họa người Áo. Từ năm 1929 đến 1934 bà học trường công nghiệp nghệ thuật Viên. Các tác phẩm của Mira Lobe được bà vẽ minh họa đều trở nên sinh động, cuốn hút với nhiều thế hệ độc giả.</p><p style="text-align: justify;">Nhà thơ, dịch giả&nbsp;<strong>CHU THU PHƯƠNG&nbsp;</strong>(Đan Phong Diệp)</p><p style="text-align: justify;">Hội viên Hội Nhà văn Việt Nam, Ủy viên Hội đồng văn học dịch Hội Nhà văn Hà Nội. Các tác phẩm tiêu biểu của cô bao gồm:</p><p style="text-align: justify;">Sáng tác thơ:&nbsp;<em>Lá phong đỏ&nbsp;</em>(2008),&nbsp;<em>Lạc giữa thu và hạ&nbsp;</em>(2018).</p><p style="text-align: justify;">Tác phẩm dịch: Tập thơ&nbsp;<em>Khúc đệm trữ tình&nbsp;</em>(Heinrich Heine);&nbsp;<em>Truyện cổ Grimm</em>; tổ khúc&nbsp;<em>Hành trình mùa đông&nbsp;</em>(Franz Schubert) cùng Ngô Tự Lập; tập thơ&nbsp;<em>Tóc rối&nbsp;</em>(Yosano Akiko)...</p></div>
							</div>', 2, CAST(65000 AS Decimal(18, 0)), NULL, N'Việt Tinh Anh', CAST(28500 AS Decimal(18, 0)), 4, 0, NULL, NULL, 60, 1, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (68, N'TÔI LÀ TÔI BÉ NHỎ', 17, CAST(45000 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>8935352603062</td>
										</tr>
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>NXB Kim Đồng</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Mira Lobe &amp; Susi Weigel</td>
										</tr>
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2024</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>40</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Trọng lượng: </td> <td>100g</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>26 x 20 x 0.2 cm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div style="text-align: justify;">&nbsp;</div><h1 style="text-align: justify;"><strong>Tôi là tôi bé nhỏ</strong></h1><div><p style="text-align: justify;">“Tôi là tôi bé nhỏ cũng là cuốn sách được yêu thích nhất của Mira Lobe. Câu chuyện xoay quanh một con vật tác giả tưởng tượng, toàn thân đủ các sắc màu sặc sỡ, mà độc giả có thể cắt dán thủ công theo hướng dẫn kèm theo trong sách. Một chú ếch tò mò hỏi con vật vui vẻ ấy nó là con gì, và con vật đó không thể trả lời nổi câu hỏi này. Cảm thấy hoang mang, nó lên đường tìm hiểu xem mình là giống loài gì, nhưng vẫn bế tắc như trước. Mãi cho đến khi nó tự chấp nhận bản thân “Tôi là tôi”, nó mới nhận được sự tôn trọng của các loài vật khác. Trẻ em học được từ câu chuyện này việc cần phải chấp nhận bản thân mình như vốn có, chỉ khi ấy chúng mới có được sự tự tin trong cuộc sống. Họa sĩ minh họa Susi Weigel đã sáng tạo ra những bức tranh thật sinh động và ấm lòng. Nhờ đó, cuốn sách trở thành tác phẩm giàu nghệ thuật thị giác cho trẻ em.”</p><p style="text-align: justify;">-&nbsp;<strong>PATRICK HORVATH</strong></p><p style="text-align: justify;"><strong><em>Tổng thư kí nhóm chuyên gia cố vấn WIWIPOL — Nhóm làm việc về chính sách kinh tế khoa học có trụ sở tại thành phố Viên, Áo</em></strong></p><p style="text-align: justify;">---</p><p style="text-align: justify;"><strong>Mira Lobe&nbsp;</strong>(1913-1995)là tác giả người Áo nổi tiếng thế giới với hơn 100 tác phẩm sáng tác cho thiếu nhi và thanh thiếu niên. Nhiều tác phẩm của bà đoạt giải thưởng quốc gia và quốc tế, tiêu biểu như “Die Omama im Apfelbaum”&nbsp;<em>(Bà ngoại trên cây táo),&nbsp;</em>“Das Städtchen drumherum”&nbsp;<em>(Thành phố quanh vòng quanh),&nbsp;</em>“Das kleine Ich bin Ich”&nbsp;<em>(Tôi là tôi bé nhỏ),&nbsp;</em>“Komm, sagte die Katze”&nbsp;<em>(“Lại đây nào!” Mèo bảo)…</em></p><p style="text-align: justify;">Tác phẩm của bà được dịch sang hơn 30 thứ tiếng khác nhau, xuất bản ở nhiều quốc gia và đồng hành với tuổi thơ nhiều độc giả thiếu nhi trên khắp thế giới.</p><p style="text-align: justify;"><strong>Susi Weigel</strong>&nbsp;(1914-1990) là họa sĩ đồ họa, minh họa người Áo. Từ năm 1929 đến 1934 bà học trường công nghiệp nghệ thuật Viên. Các tác phẩm của Mira Lobe được bà vẽ minh họa đều trở nên sinh động, cuốn hút với nhiều thế hệ độc giả.</p><p style="text-align: justify;">Nhà thơ, dịch giả&nbsp;<strong>CHU THU PHƯƠNG&nbsp;</strong>(Đan Phong Diệp)</p><p style="text-align: justify;">Hội viên Hội Nhà văn Việt Nam, Ủy viên Hội đồng văn học dịch Hội Nhà văn Hà Nội. Các tác phẩm tiêu biểu của cô bao gồm:</p><p style="text-align: justify;">Sáng tác thơ:&nbsp;<em>Lá phong đỏ&nbsp;</em>(2008),&nbsp;<em>Lạc giữa thu và hạ&nbsp;</em>(2018).</p><p style="text-align: justify;">Tác phẩm dịch: Tập thơ&nbsp;<em>Khúc đệm trữ tình&nbsp;</em>(Heinrich Heine);&nbsp;<em>Truyện cổ Grimm</em>; tổ khúc&nbsp;<em>Hành trình mùa đông&nbsp;</em>(Franz Schubert) cùng Ngô Tự Lập; tập thơ&nbsp;<em>Tóc rối&nbsp;</em>(Yosano Akiko)...</p></div>
							</div>', 2, CAST(50000 AS Decimal(18, 0)), NULL, N'NXB Trẻ ', CAST(15000 AS Decimal(18, 0)), 1, 0, NULL, NULL, 60, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (69, N'A HISTORY OF VIETNAM IN PICTURE (IN COLOUR, BÌA MỀM) - BẢN TIẾNG ANH (LỰA CHỌN THEO CHỦ ĐỀ)', 18, CAST(67500 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>8934974190196</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>NXB Trẻ</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Nhiều tác giả</td>
										</tr>
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2023</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>Tùy cuốn</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Trọng lượng: </td> <td>150g</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>15.5x23cm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><p>&nbsp;</p><h1 style="text-align: justify;"><strong>A History of Vietnam in Picture (In colour, bìa mềm) - Bản tiếng anh (Lựa chọn theo chủ đề)</strong></h1><div><p style="text-align: justify;">The series "A History of Vietnam in Pictures" presents the history of Vietnam in a brief, interesting and systematic style through concise tales and beautiful pictures.</p><p style="text-align: justify;">Our very first kings were the Hùng kings. They built the foundation for the nation of Văn Lang - the very first page in our country’s history. This was also the time of beautiful stories which were first told by our ancestors before the start of writing. These stories give us our ancestors’ thoughts and dreams. Most of the stories, as you can guess, are legends. Nonetheless they teach us about a time so long ago.</p><p style="text-align: justify;"><strong>The series "A History of Vietnam in Pictures" include 16 topics:</strong></p><ol><li style="text-align: justify;">A History of Vietnam in Picture: Trần Hưng Đạo (In colour)</li><li style="text-align: justify;">A History of Vietnam in Pictures: Born of Dragons and Fairies (In colour)</li><li style="text-align: justify;">A History of Vietnam in Pictures: Emperor Lê Đại Hành (In colour)</li><li style="text-align: justify;">A History of Vietnam in Pictures: Lê Quý Đôn (In colour)</li><li style="text-align: justify;">A History of Vietnam in Pictures: Lý Thánh Tông and Đại Việt (In colour)</li><li style="text-align: justify;">A History of Vietnam in Pictures: Lý Thường Kiệt (In colour)</li><li style="text-align: justify;">A History of Vietnam in Pictures: Ngô Quyền defeats the Southern Han Army (In colour)</li><li style="text-align: justify;">A History of Vietnam in Pictures: Nguyễn Hoàng the Good Lord (In colour)</li><li style="text-align: justify;">A History of Vietnam in Pictures: Nguyễn Trãi (In colour)</li><li style="text-align: justify;">A History of Vietnam in Pictures: The Beginning of the Trịnh (In colour)</li><li style="text-align: justify;">A History of Vietnam in Pictures: The Collapse of the Lê sơ (In colour)</li><li style="text-align: justify;">A History of Vietnam in Pictures: The Dawn of Thăng Long (In colour)</li><li style="text-align: justify;">A History of Vietnam in Pictures: The Lam Sơn Uprising (In colour)</li><li style="text-align: justify;">A History of Vietnam in Pictures: The Second Victory against the Mongols (In colour)</li><li style="text-align: justify;">A History of Vietnam in Pictures: The Trưng Sisters (In colour)</li><li style="text-align: justify;">A History of Vietnam in Pictures: The Victorious Pampas King (In colour)</li></ol></div>
							</div>', 1, CAST(77500 AS Decimal(18, 0)), NULL, N'NXB Trẻ ', CAST(47500 AS Decimal(18, 0)), 1, 0, NULL, NULL, 60, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (70, N'BỘ CÁC NỀN VĂN MINH THẾ GIỚI (COMBO 5 CUỐN)', 18, CAST(420000 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>5001010008173</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>	NXB Dân Trí</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Nhiều tác giả</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>64 trang/ tập</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Trọng lượng: </td> <td>3500gr</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>	30 x 23 x 0.5 cm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><h1><strong>Bộ Các Nền Văn Minh Thế Giới (Combo 5 cuốn)</strong></h1><p><strong>Nội dung sách:</strong></p><p><em><span>Các nền văn minh thế giới - Lịch sử cổ đại,&nbsp;</span></em><span>gồm 5 tập:</span></p><ol><li><p><em><span>Nhật Bản cổ đại</span></em></p></li><li><p><em><span>Trung Quốc cổ đại</span></em></p></li><li><p><em><span>Ai Cập cổ đại</span></em></p></li><li><p><em><span>Hy Lạp cổ đại</span></em></p></li><li><p><em><span>La Mã cổ đại</span></em></p></li></ol><p style="text-align: justify;"><span>Mỗi tập sách sẽ giúp các em quay trở về quá khứ để tìm hiểu những nền văn minh cổ đại: Nhật Bản, Trung Quốc, Ai Cập, Hy Lạp và La Mã. Mỗi tập có hơn 350 tranh ảnh, hình minh họa và bản đồ lịch sử.</span></p><p style="text-align: justify;"><span>Đặc biệt, trong mỗi cuốn sách có hướng dẫn các em chơi 15 trò thủ công thú vị và dễ làm, giúp các em tự tạo ra những món đồ mô phỏng thời xưa, như:<strong>&nbsp;</strong>làm diều hình rồng,&nbsp;</span><span>xây kim tự tháp, chơi cờ kiểu La Mã, làm cờ cá chép…</span></p>
							</div>', 1, CAST(600000 AS Decimal(18, 0)), NULL, N'Đông Á', CAST(120000 AS Decimal(18, 0)), 2, 0, NULL, NULL, 60, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (71, N'CÂY CAO SU Ở VIỆT NAM DƯỚI GÓC NHÌN LỊCH SỬ - SINH THÁI (1897 - 1975)', 18, CAST(256500 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>9786045898048</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>Tổng Hợp</td>
										</tr>
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Michitake Aso</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2023</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>594</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Trọng lượng: </td> <td>600gr</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>16x24 cm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div>&nbsp;</div><h1 style="text-align: justify;"><strong>Cây cao su ở Việt Nam dưới góc nhìn Lịch sử - Sinh thái (1897 - 1975)</strong></h1><div><p style="text-align: justify;">Kể từ cuối thế kỷ XIX khi được trồng thử nghiệm thành công cho đến ngày nay, cây cao su đã gắn bó mật thiết, trở thành một phần quan trọng trong lịch sử Việt Nam. Từ thành công bước đầu ở các vườn bách thảo và trạm thực nghiệm, cây cao su đã được trồng rộng khắp ở nhiều nơi thuộc vùng Đông Nam Bộ, kể cả ở đảo Phú Quốc. Dưới tán rừng cao su, những đồn điền được thành lập, đội ngũ công nhân cao su được hình thành và ngày càng lớn mạnh.</p><p style="text-align: justify;">Dưới bóng mát của cây cao su, bao nhiêu phận đời, bao nhiêu sự kiện, biến cố đã xảy ra. Không những thế, cây cao su còn “phủ bóng” lên đời sống kinh tế, chính trị, xã hội ở bên ngoài phạm vi các đồn điền, góp phần tạo nên những chuyển biến mạnh mẽ.</p><p style="text-align: justify;">Trong những thập niên vừa qua, đã có nhiều cuốn sách và công trình nghiên cứu về cây cao su ở Việt Nam. Những ấn phẩm này chủ yếu tập trung vào sự thành lập và cơ chế vận hành đầy tai tiếng của các đồn điền cao su cùng nguồn lợi nhuận khổng lồ mà tư bản Pháp đã thu được từ đây, về đời sống cơ cực và những phong trào đấu tranh của công nhân cao su trong hai cuộc kháng chiến chống Pháp và chống Mỹ… Những thông tin mang tính khoa học về nghiên cứu, trồng và khai thác cây cao su, chế biến các sản phẩm từ mủ cao su, mối liên hệ giữa ngành cao su Việt Nam với quốc tế… cũng được đề cập rải rác ở một số sách báo, trong đó, tiêu biểu là cuốn 100 năm cao su ở Việt Nam của tác giả Đặng Văn Vinh.</p><p style="text-align: justify;">Cuốn sách Cây cao su ở Việt Nam dưới góc nhìn Lịch sử - Sinh thái (1897 – 1975) mà bạn đọc đang cầm trên tay có cách tiếp cận khác. Trong ấn phẩm này, tác giả Michitake Aso đã xem xét cây cao su ở Việt Nam dưới góc nhìn Lịch sử gắn liền với Sinh thái học. Trong đó, cây cao su, với tư cách là một giống thực vật ngoại lai, khi được du nhập và trồng trên diện rộng ở Việt Nam đã chịu tác động của những điều kiện về thổ nhưỡng, khí hậu, lao động, sức khỏe, điều kiện kinh tế, quan niệm chính trị… của nước ta. Ở chiều ngược lại, khi được trồng thành công ở Việt Nam, cây cao su đã tạo ra những biến đổi sâu sắc về môi trường tự nhiên, đời sống chính trị, kinh tế, xã hội... và có những ảnh hưởng mạnh mẽ đến tình hình chiến sự trong và ngoài lãnh thổ Việt Nam, tác động sâu sắc đến đời sống và phong trào đấu tranh của công nhân ở các đồn điền cao su nước ta. Cuốn sách đã cho thấy rõ tác động qua lại giữa cây cao su và môi trường nơi nó sinh sống, đời sống của cây cao su xoắn bện với đời sống của con người, sự phát triển của cây cao su gắn chặt với từng chặng đường phát triển của lịch sử Việt Nam.</p><p style="text-align: justify;">Trong quá trình thực hiện công trình nghiên cứu này, Tiến sĩ Michitake Aso đã có nhiều chuyến đi tới văn khố Việt Nam, Pháp, Mỹ, Campuchia… gặp gỡ với các chuyên gia về cao su, phỏng vấn trực tiếp những cựu công nhân từng làm việc trong các đồn điền trước và sau năm 1945… để có được nguồn tài liệu tham khảo vô cùng phong phú. Ông đã sử dụng tri thức khoa học liên ngành, có thể kể đến như địa chất học, địa lý học, nhân chủng học, chính trị học, kinh tế học, y học… để làm rõ mối tác động qua lại giữa cây cao su và mọi mặt đời sống ở Việt Nam. Vốn tri thức và nguồn tài liệu phong phú mà tác giả sử dụng đã góp phần quan trọng làm nên thành công của tác phẩm. Cuốn sách được trao Giải thưởng Henry A. Wallace vào năm 2018 của Hội Lịch sử Nông nghiệp (Mỹ) và Giải thưởng Charles A. Weyerhaeuser vào năm 2019 của Hội Lịch sử Rừng (Mỹ).</p></div>
							</div>', 2, CAST(285000 AS Decimal(18, 0)), NULL, N'Nhà Xuất Bản Kim Đồng ', CAST(156500 AS Decimal(18, 0)), 3, 0, NULL, NULL, 60, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (72, N'CHÂN LẠP PHONG THỔ KÝ', 18, CAST(81000 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>8935207001241</td>
										</tr>
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>NXB Thế Giới</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Chu Đạt Quan</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2017</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>158</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Trọng lượng: </td> <td>260g</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>16 x 23 cm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div style="text-align: justify;">&nbsp;</div><h1 style="text-align: justify;"><strong>Chân Lạp Phong Thổ Ký</strong></h1><p style="text-align: justify;">Chân Lạp Phong Thổ Ký của Chu Đạt Quan là một tác phẩm mà từ khi giới thiệu sang phương Tây vào cuối thế kỷ XIX đầu thế kỷ XX, hầu như không ai nghiên cứu về lịch sử và văn hóa Chân Lạp, cũng như về Đông Nam Á lục địa, không sử dụng và đánh giá cao giá trị tư liệu của cuốn sách. Tác phẩm này đã được nhà Thanh sưu tập và đưa vào trong hai bộ tùng thư lớn là Cổ kim đồ thư tập thành và Khâm định tứ khố toàn thư. Tác phẩm đã được dịch ra nhiều thứ tiếng trên thế giới.</p><p style="text-align: justify;">Chân Lạp Phong Thổ Ký của Chu Đạt Quan bản chữ Hán có 8.500 chữ, ngoài Tổng tự, chia làm 40 đề mục. Các đề mục không ghi thứ tự nhưng sắp xếp theo trình tự như sau: 1. Thành quách; 2. Cung thất; 3. Phục sức; 4. Quan thuộc; 5. Tam giáo; 6. Nhân vật; 7. Sản phụ; 8. Con gái; 9. Nô tỳ; 10. Ngôn ngữ; 11. Dã nhân; 12. Văn tự; 13. Năm tháng ngày giờ; 14. Tranh tụng; 15. Bệnh hủi; 16. Tử vong; 17. Cày cấy; 18. Núi sông; 19. Sản phẩm; 20. Mậu dịch; 21. Muốn được hàng hóa; 22. Cỏ cây Trung Quốc; 23. Chim; 24. Thú; 25. Rau dưa; 26. Cá, bò sát; 27. Ủ rượu; 28. Muối, dấm, tương, miến; 29. Tằm tang; 30. Đồ dùng; 31. Xe kiệu; 32. Thuyền và mái chèo; 33. Thuộc quận; 34. Thôn xóm; 35. Lấy mật; 36. Việc lạ; 37. Tắm gội; 38. Lưu ngụ; 39. Quân mã; 40. Quốc chủ ra vào.</p><p style="text-align: justify;">Qua các đề mục và nội dung từng đề mục, tác giả cung cấp một khối lượng thông tin tuy vắn tắt nhưng rất phong phú, đa dạng, phản ánh khá toàn diện về kiến trúc cung đình, tổ chức nhà nước, điều kiện tự nhiên cùng các sản vật, các hoạt động kinh tế, đời sống văn hóa cùng các phong tục, tập quán, tín ngưỡng, văn tự, lịch pháp của Chân Lạp mà tác giả quan sát và ghi nhận vào những năm 1296-1297.</p>
							</div>', 2, CAST(90000 AS Decimal(18, 0)), NULL, N'Đông Á', CAST(11000 AS Decimal(18, 0)), 2, 0, NULL, NULL, 100, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (73, N'CHÌM NỔI Ở SÀI GÒN', 18, CAST(233100 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>8935270703851</td>
										</tr>
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>Tổng Hợp</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Haydon Cherry</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2024</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>428</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Trọng lượng: </td> <td>440</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>24 x 16 x 2.1 cm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div style="text-align: justify;">&nbsp;</div><h1 style="text-align: justify;"><strong>Chìm nổi ở Sài Gòn</strong></h1><div><p style="text-align: justify;">“Có ba điểm tạo nên giá trị đặc sắc cho Chìm nổi ở Sài Gòn: chủ đề độc đáo – đây là cuốn sách đầu tiên và duy nhất lấy chủ đề trung tâm là thân phận người nghèo Sài Gòn thời thuộc địa, sự nghiên cứu xuất sắc và văn xuôi tao nhã của Haydon Cherry.” – Peter B. Zinoman, Đại học California, Berkeley</p><p style="text-align: justify;">Tác phẩm “Chìm nổi ở Sài Gòn” - cuốn sách đầu tiên và duy nhất lấy chủ đề trung tâm là thân phận người nghèo đã cung cấp cho người đọc cái nhìn sâu sắc về tình cảnh lịch sử và những biến đổi ở Sài Gòn thời thuộc địa trong khoảng 4 thập niên đầu thế kỷ XX.</p><p style="text-align: justify;">Cuốn sách này bắt đầu từ thời điểm năm 1904, vào đêm trước một cơn bão làm hư hại mùa màng, khiến cho việc buôn bán lúa gạo rơi vào hỗn loạn, gây ra cảnh khốn cùng ở Sài Gòn và các tỉnh khác. Chương một đặt lịch sử Sài Gòn vào bối cảnh của ngành buôn bán lúa gạo trong khu vực, giải thích bối cảnh phát triển giúp Sài Gòn trở thành điểm đến đầy hứa hẹn cho người tìm cơ hội đổi đời vào giai đoạn này. Sau đó 6 chương còn lại vén màn về cảnh đời bần cùng của những người nghèo thành thị.</p><p style="text-align: justify;">Nương theo mạch tường thuật chuyện đời và những biến cố của họ - Lương Thị Lắm, một gái mại dâm đến từ tỉnh Biên Hòa, cô tha hương cầu thực và chạy trốn chánh quyền thuộc địa; Trần Dưỡng, một thợ đá người Khách Gia [Hakka - Hà Cá] xuất thân từ miền Nam Trung Hoa, bị chủ cũ của mình buộc tội gia nhập hội kín Thiên Địa Hội; Aimée Lahaye, một cô gái trẻ lớn lên trong viện dục anh của Hội Thánh nhi (Holy Childhood Association), về sau nhận ra bản thân mồ côi thêm một lần nữa giữa dòng đời; một “ngựa người” tự xưng tên Nguyễn Văn Thủ, làm phu xe rong ruổi trên khắp đường phố Sài Gòn; một người khuyết tật tên Trần Văn Chinh, phải vật lộn với tình trạng tật nguyền; và Félix Colonna d’Istria, một người Pháp nghèo khổ, luôn là nạn nhân của sự bất cẩn của chính mình. Tác giả Haydon Cherry đã khéo léo lồng ghép để vẽ nên một bức tranh thuộc địa Sài Gòn và Nam kỳ dưới tác động của thời cuộc, từ sự kiện di dân cho đến tình hình kinh tế thế giới biến động.</p><p style="text-align: justify;">Xuyên suốt cuốn sách, độc giả sẽ có cơ hội được thấy lại Sài Gòn một thuở thịnh vượng nhờ sản xuất và xuất khẩu lúa gạo, trở thành “miền đất hứa” cho nhiều người ở các xứ bảo hộ kề cận; nhưng đồng thời cũng chứng kiến cảnh cuộc đời người nghèo chịu ảnh hưởng ra sao, nhất là khi một viên chức chánh quyền người Pháp cũng có thể rơi vào cảnh bần cùng. Là cuốn sách đầu tiên mô tả rất chi tiết đủ loại cảnh nghèo - bần cùng, cách viết của “Chìm nổi ở Sài Gòn” làm người đọc không khỏi cảm thấy xót xa cho phận đời cùng khổ của một nhóm người ngày xưa.</p><p style="text-align: justify;">Tác giả cũng làm sáng tỏ những góc khuất khác như cách chánh quyền thuộc địa đã quản lý và có chế tài thế nào khi nghề mại dâm từng được hợp pháp hóa ở Sài Gòn và Chợ Lớn, hay khi người ta tìm cách vu vạ một thành viên trong cộng đồng là Thiên Địa Hội để trả thù - cho thấy nỗi ám ảnh mà hội kín này gây ra cho chánh quyền thuộc địa, nhất là sau khởi nghĩa do Phan Xích Long dẫn đầu.</p><p style="text-align: justify;">Ngoài ra, cuốn sách còn giúp độc giả khám phá các khía cạnh xã hội thời kỳ này như chuyện về thẻ căn cước kiêm thẻ đóng thuế và nộp phạt, hoạt động của các hội từ thiện, hội cứu tế… đồng thời đóng vai trò như một cuốn địa chí, cung cấp thông tin về một số địa danh ở Sài Gòn.</p><p style="text-align: justify;">Cuốn sách được viết dựa trên nguồn tư liệu phong phú, bao gồm số liệu thống kê đã xuất bản, thư truyền giáo, các báo cáo chính thức, lời kể của những du khách, các phóng sự và những nghiên cứu khoa học xã hội thuộc địa,.. với phần ghi chú kỹ lưỡng giúp độc giả có thể dễ dàng tiếp cận vấn đề khi đọc.</p></div>
							</div>', 1, CAST(259000 AS Decimal(18, 0)), NULL, N'Nhà Xuất Bản Kim Đồng ', CAST(133100 AS Decimal(18, 0)), 3, 0, NULL, NULL, 50, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (74, N'COMBO 2 CUỐN: BÁCH KHOA LỊCH SỬ THẾ GIỚI + NHỮNG TRẬN CHIẾN THAY ĐỔI LỊCH SỬ', 18, CAST(735000 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>5001010008944</td>
										</tr>
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>NXB Dân Trí</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Nhiều tác giả</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2022</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>416+256</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><h1 style="text-align: justify;"><strong>Combo 2 cuốn: Bách khoa lịch sử thế giới + Những trận chiến thay đổi lịch sử</strong></h1><p style="text-align: justify;"><strong>1. The Usbone - Bách khoa lịch sử thế giới (Encyclopedia of world history)</strong></p><p style="text-align: justify;"><strong>THÔNG TIN ẤN PHẨM:</strong></p><ul><li style="text-align: justify;">Tác giả: Jane Bingham, Fiona Chandler và Sam Taplin</li><li style="text-align: justify;">Dịch giả: Lê Thị Oanh</li><li style="text-align: justify;">Kích thước: 21,5 x 27,5cm</li><li style="text-align: justify;">Số trang: 416</li><li style="text-align: justify;">Hình thức: Bìa cứng, có bìa áo, in màu toàn bộ</li><li style="text-align: justify;">Giá bìa: 550.000đ</li><li style="text-align: justify;">Khối lượng: 420&nbsp;gr</li><li style="text-align: justify;">Mã ISBN: 978-604-344-161-1</li><li style="text-align: justify;">Mã sản phẩm: 8936203360936</li><li style="text-align: justify;">Sách do Công ty Cổ phần Văn hóa Đông A và NXB Dân trí liên kết ấn hành</li><li style="text-align: justify;">Phát hành: 03/2022</li></ul><p style="text-align: justify;"><strong>NỘI DUNG SÁCH:</strong></p><p style="text-align: justify;">Bách khoa Lịch sử thế giới&nbsp;là ấn phẩm thuộc tủ sách&nbsp;Bách khoa tri thức&nbsp;của Đông A. Cuốn sách chứa đựng lượng kiến thức khổng lồ về thế giới từ trước đến nay với hơn 200 chủ đề nằm trong 4 phần chính:&nbsp;Thế giới Tiền sử,&nbsp;Thế giới Cổ đại, Thế giới Trung cổ&nbsp;và&nbsp;500 năm gần đây.</p><p style="text-align: justify;">Cuốn sách đã vẽ nên bức tranh rộng lớn tái hiện cuộc sống của các dân tộc trước đây, giới thiệu về các nền văn minh nổi tiếng nhân loại, những nhân vật biến đổi thế giới, những sự kiện thay đổi tiến trình lịch sử… Với hàng nghìn minh họa ấn tượng và các bản đồ chi tiết,&nbsp;bạn đọc sẽ dễ dàng&nbsp;hình dung chủ đề đang được đề cập.</p><p style="text-align: justify;">Bách khoa Lịch sử thế giới&nbsp;được Đông A mua bản quyền của NXB&nbsp;Usborne.&nbsp;Là NXB có tuổi đời trẻ trung tại Anh,&nbsp;Usborne tiên phong trong việc ứng dụng công nghệ mới vào lĩnh vực xuất bản. Chính vì vậy, nội dung cuốn sách này liên kết tới hơn 200 website uy tín giúp người đọc tra cứu thêm về vấn đề mình quan tâm. Tại các website đó, bạn có thể tra cứu thông tin, xem các đoạn video hay tải các hình ảnh và bản đồ.</p><p style="text-align: justify;">Bách khoa Lịch sử thế giới&nbsp;– một cái nhìn toàn cảnh về quá khứ và hiện tại.</p><p style="text-align: justify;"><strong>2. Những trận chiến thay đổi lịch sử</strong></p><p style="text-align: justify;"><strong>THÔNG TIN ẤN PHẨM:&nbsp;</strong></p><ul><li style="text-align: justify;">Tác giả: DK</li><li style="text-align: justify;">Dịch giả: Nguyễn Minh</li><li style="text-align: justify;">Kích thước: 25,2 x 30,1 cm</li><li style="text-align: justify;">Số trang: 256</li><li style="text-align: justify;">Hình thức: Bìa cứng, in màu toàn bộ</li><li style="text-align: justify;">Giá bìa: 500.000đ</li><li style="text-align: justify;">Mã ISBN: 978-604-314-736-0</li><li style="text-align: justify;">Mã sản phẩm: 8936203362640</li><li style="text-align: justify;">Sách do Công ty Cổ phần Văn hóa Đông A và NXB Dân trí liên kết ấn hành</li><li style="text-align: justify;">Phát hành: 12/2022</li></ul><p style="text-align: justify;"><strong>NỘI DUNG SÁCH:</strong></p><p style="text-align: justify;">Những trận chiến thay đổi lịch sử là tuyển tập hơn 90 trận giao tranh quan trọng nhất thế giới, từ thời cổ đại cho đến kỷ nguyên nguyên tử. Được minh họa sống động bằng bản đồ, tranh vẽ, vật chứng và ảnh chụp, mỗi chương sách giúp tái hiện những trận chiến quan trọng của thời đại, cho thấy cách mà những thời khắc then chốt và những quyết định mang tính chiến lược đã thay đổi tiến trình lịch sử như thế nào.</p><p style="text-align: justify;">“Có bao nhiêu trận chiến đã làm thay đổi tiến trình lịch sử? Đó là một câu hỏi hay. Mỗi khi đọc về cách bày binh bố trận trên một chiến trường xưa, ta thường chỉ nghĩ đây là thông tin lịch sử thú vị chứ không cho rằng cuộc giao tranh ấy vẫn còn ý nghĩa đến tận ngày nay.&nbsp;</p><p style="text-align: justify;">Nhưng trên thực tế, cái đã định hình nên quốc gia, đế quốc, nền văn minh và cuộc sống của mỗi người chúng ta chính là kết quả của những trận chiến lưu danh sử sách. Các quốc gia châu Âu đã sinh ra từ trong lò luyện chiến tranh. Tương tự như thế, tại các vùng đồi núi, sa mạc phương Đông, những cuộc đối đầu, tranh chấp từ ngàn xưa đã vạch ra biên giới và nhào nặn nên văn hóa theo những cách mà mãi cho tới hiện nay vẫn giữ vị trí trung tâm trong đời sống người dân. Dưới quyền Thành Cát Tư Hãn, sự bành trướng của Đế quốc Mông Cổ đã thay đổi diện mạo của một vùng đất bao la trên thế giới, trải dài khắp Trung Á. Ở Nam Mỹ, việc sử dụng tiếng Tây Ban Nha như ngôn ngữ chung bắt nguồn từ công cuộc chinh phạt của Cortés vào Tenochtitlán&nbsp; – kinh đô Đế chế Aztec, trong khi phần lớn di sản chính trị và văn hóa Mỹ có thể được truy nguyên từ hai cuộc chiến: Chiến tranh Độc lập và Nội chiến Hoa Kỳ. Gần đây hơn, những giao thiệp đằng sau hậu trường trong thời kỳ Chiến tranh Lạnh đã gây ảnh hưởng cực lớn lên các vấn đề địa chính trị đương đại và chiến tranh hiện đại.</p><p style="text-align: justify;">&nbsp;Đã đành, mỗi trận chiến như trên đều là những khoảnh khắc vĩ đại làm nên lịch sử, nhưng song song đó, nó còn là một bức ảnh cô đọng chụp lại bối cảnh lịch sử và văn hóa của thời đại. Sự giận dữ, thất vọng, nỗi kinh hoàng của người dân địa phương; trang phục và vũ khí của các bên giao chiến; những quyết định mang tính định mệnh của giới lãnh đạo quân sự và dân sự – tất cả đều được phản ánh và minh họa rõ ràng trong các cuộc tương tranh. Dù không phải là một bản tóm lược toàn diện về chiến tranh trên toàn cầu hay một cẩm nang binh pháp, cuốn sách này đặt mục tiêu đưa ra một cái nhìn đại cương về bối cảnh thế giới rộng lớn nơi mỗi trận chiến quan trọng diễn ra, cũng như về những cách mà lịch sử đã hình thành tại một thời điểm cụ thể.&nbsp;</p><p style="text-align: justify;">Cuối cùng, khi nhìn lại sự kiện lịch sử, đừng chỉ xem nó như âm vang ly kỳ, hấp dẫn của những năm tháng đã qua, mà hãy nhớ đến sự hy sinh của những người đã ngã xuống. Lịch sử quân sự không chỉ được hun đúc bởi lòng dũng cảm mà còn bởi những sinh mạng. Hãy tâm niệm điều ấy khi trông về những cuộc chiến trong quá khứ”. - Lời nói đầu của Sir Tony Robinson.</p>
							</div>', 1, CAST(1050000 AS Decimal(18, 0)), NULL, N'Đông Á', CAST(235000 AS Decimal(18, 0)), 2, 0, NULL, NULL, 60, 1, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (75, N'COMBO 2 CUỐN: THIÊN HOÀNG MINH TRỊ (BÌA CỨNG) + NAPOLÉON BONAPARTE', 18, CAST(658000 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>5001010009507</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>Dân Trí + Văn Học</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Nhiều tác giả</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>2028</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>16x24cm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div style="text-align: justify;">&nbsp;</div><h1 style="text-align: justify;"><strong>Combo 2 cuốn: Thiên Hoàng Minh Trị (Bìa Cứng) + Napoléon Bonaparte</strong></h1><h3 style="text-align: justify;"><a href="https://cachep.vn/products/thien-hoang-minh-tri-bia-cung/"><strong>1.&nbsp;Thiên Hoàng Minh Trị (Bìa Cứng)</strong></a></h3><div><p style="text-align: justify;">Triều đại Minh Trị là giai đoạn khai sinh ra nước Nhật mới, chuyển từ quốc gia phong kiến lạc hậu sang một xã hội công nghiệp lập hiến hiện đại, tạo nên một cuộc duy tân thần kì mà cho đến nay vẫn là mô hình châu Á lôi cuốn. Mô tả từ bên trong công cuộc khai sinh này với những nhân vật lịch sử liên quan, tác phẩm Thiên hoàng Minh Trị sẽ dắt chúng ta đi qua những giai đoạn cuộc đời của vị hoàng đế này, từ những năm tháng ấu thơ được giáo dục theo truyền thống đến khi thiết triều giải quyết chính sự, từ cuộc hôn nhân với hoàng hậu đến mối quan hệ với các trắc thất, từ ảnh hưởng của tư tưởng Nho giáo cho đến lúc khoác lên mình bộ quân phục châu Âu...<br><br>Qua đó, bức tranh toàn diện về cả Thiên hoàng lẫn những biến động mạnh mẽ trong thời kì lịch sử quan trọng của Nhật Bản hiện lên sống động trước mắt độc giả. Thiên hoàng Minh Trị là tác phẩm nổi bật của Donald Keene - một học giả khổng lồ về Nhật Bản. Bản in lần này có thêm Lời nói đầu dành cho độc giả Việt Nam của tác giả và Dẫn nhập của TS. Nguyễn Xuân Xanh.<br><br>Vài nét về tác giả:<br><br>Donald Keene là một học giả khổng lồ về Nhật Bản, người đã xuất bản hàng chục đầu sách bằng cả tiếng Anh lẫn tiếng Nhật về lịch sử, văn hóa và văn học Nhật Bản, góp phần làm cho văn hóa Nhật Bản được giới thiệu mạnh mẽ ra thế giới, đồng thời cũng trở nên sống động hơn trong ý thức người Nhật.<br>Trong nhiều năm, Donald Keene đã chia thời gian sống của mình giữa Manhattan và Tokyo.</p><h3 style="text-align: justify;"><a href="https://cachep.vn/products/napoleon-bonaparte/"><strong>2.&nbsp;Napoléon Bonaparte</strong></a></h3></div><div><p style="text-align: justify;">“Nhìn từ tất cả mọi mặt, Napoléon là một sản phẩm của thời đại mình; xét ở nhiều khía cạnh, ông là hiện thân của giai đoạn lịch sử này. Để hiểu được ông và những điều ông làm, ta cần phải đặt ông vào bối cảnh lịch sử. Để làm được điều đó, ta phải vứt bỏ hết những quan điểm đã được công nhận rộng rãi cùng với những định kiến dân tộc chủ nghĩa, và phải thật vô tư xem xét những điều kiện lịch sử với mọi nguy cơ và triển vọng lớn lao mà thời đại này mang đến.</p><p style="text-align: justify;">Vào thập niên 1790, thế giới mà Napoléon dấn thân vào là một thế giới đang trong thời kỳ chiến tranh, thời điểm mà chính cái nền tảng căn cơ nhất của xã hội loài người đang bị đưa ra suy xét lại. Đây là một cuộc tranh giành bá quyền và là một cuộc chiến sống còn, khi tất cả nhà nước ở châu Âu Lục địa đều đưa lợi ích của dân tộc mình lên trên hết, sẵn sàng trơ tráo phá bỏ hiệp ước, phản bội đồng minh. Các quân vương, chính trị gia và tướng lĩnh ở mọi phe đều cho thấy cùng một mức độ hung hãn, tham lam, nhẫn tâm và tàn bạo. Gán sự ưu nhiệm đạo đức cho bất kỳ nhà nước nào cũng là một trò bịp phản lịch sử, và ngược lại, lên án thói tham lam quyền lực thì cũng như phủ nhận bản chất con người và sự cần thiết của nó trong thuật chính trị.”</p><p style="text-align: justify;">Adam Zamoyski</p><p style="text-align: justify;"><strong><u>Thông tin tác giả:</u></strong></p><p style="text-align: justify;">Adam Zamoyski (1949) là sử gia người Anh, xuất thân trong một gia đình quý tộc Ba Lan cũ. Ông tốt nghiệp ngành Lịch sử và Ngôn ngữ hiện đại tại The Queen''s College, và có thể nói được năm thứ tiếng Anh, Ba Lan, Pháp, Ý, Nga.</p><p style="text-align: justify;">Adam Zamoyski trước tác nhiều cuốn sách về lịch sử Ba Lan và châu Âu nói chung, cũng như say mê nghiên cứu tiểu sử của các danh nhân như nhạc sĩ Chopin, nghệ sĩ dương cầm Paderewski và hoàng đế Napoléon Bonaparte. Trong số đó, ông dành sự quan tâm đặc biệt đối với vị hoàng đế Pháp, và viết nên 3 tác phẩm đồ sộ là&nbsp;<em>Napoléon Bonaparte</em>&nbsp;(Napoleon: A Life),&nbsp;<em>1812 - Chiến dịch chết chóc của Napoléon ở Moscow</em>,&nbsp;<em>Nghi lễ hòa bình - Sự sụp đổ của đế chế Napoléon và Hội nghị Vienna</em>. Các tác phẩm của ông được dịch ra phần lớn ngôn ngữ châu Âu và cả Nga, Trung, Nhật… Ông cũng là cây bút quen thuộc trên nhiều tờ báo và tạp chí như&nbsp;<em>Times</em>&nbsp;(London),&nbsp;<em>Times Literary Supplement</em>&nbsp;và&nbsp;<em>Guardian</em>.</p><p style="text-align: justify;">Hiện ông tham gia công tác giảng dạy tại Anh, Mỹ và châu Âu.</p></div>
							</div>', 1, CAST(940000 AS Decimal(18, 0)), NULL, N'Đông Á', CAST(158000 AS Decimal(18, 0)), 2, 0, NULL, NULL, 60, 1, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (76, N'CÁCH MẠNG THÁNG TÁM 1945 - THẮNG LỢI VĨ ĐẠI ĐẦU TIÊN CỦA DÂN TỘC VIỆT NAM TRONG THẾ KỶ XX', 18, CAST(139500 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>9786045882214</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>NXB Tổng Hợp TPHCM</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>GS TS NGND Trịnh Nhu</td>
										</tr>
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2020</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>442</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Trọng lượng: </td> <td>462</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>20.5 x 14.5 x 2 cm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div>&nbsp;</div><h1><strong>Cách Mạng Tháng Tám 1945 - Thắng Lợi Vĩ Đại Đầu Tiên Của Dân Tộc Việt Nam Trong Thế Kỷ XX</strong></h1><p style="text-align: justify;">Đến nay, đã có nhiều công trình nghiên cứu của nhiều tác giả trong nước và nước ngoài về Cách mạng tháng Tám năm 1945. Tuy nhiên, với tầm vóc, ý nghĩa to lớn, ảnh hưởng lan tỏa sâu rộng và giá trị lâu bền, Cách mạng tháng Tám vẫn còn chứa đựng nhiều sự kiện cần được tái hiện, nhiều vấn đề lịch sử cần được luận giải thấu đáo, nhiều kinh nghiệm lịch sử cần được đúc kết và vận dụng cho hiện tại và tương lai.</p><p style="text-align: justify;">Từ những nhận thức trên đây, nhóm tác giả biên soạn tác phẩm<strong>&nbsp;<em>Cách mạng tháng Tám 1945 - thắng lợi vĩ đại đầu tiên của dân tộc Việt Nam trong thế kỷ XX&nbsp;</em></strong>để phản ánh và làm sáng rõ hơn một số vấn đề lịch sử trong toàn bộ tiến trình vận động Cách mạng tháng Tám khởi đầu bằng thời điểm cuộc Chiến tranh thế giới lần thứ hai nổ ra (tháng 9-1939), Đảng Cộng sản Đông Dương đặt nhiệm vụ giải phóng dân tộc lên hàng trước tiên, huy động tối đa sức mạnh dân tộc chuẩn bị lực lượng mọi mặt và chớp thời cơ tiến hành cuộc Tổng khởi nghĩa giành chính quyền, đến ngày 2-9-1945.&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</p>
							</div>', 1, CAST(155000 AS Decimal(18, 0)), NULL, N'Nhà Xuất Bản Kim Đồng ', CAST(39500 AS Decimal(18, 0)), 3, 0, NULL, NULL, 60, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (77, N'GIẾT CON CHIM NHẠI (BÌA MỀM)', 19, CAST(108000 AS Decimal(18, 0)), N'<div class="grid__item large--nine-twelfths medium--one-whole small--one-whole"><strong>
						</strong><div class="product-description-wrapper"><strong>
							<div class="tab clearfix">
								
								<button class="pro-tablinks active" onclick="openProTabs(event, ''protab1'')" id="defaultOpenProTabs">Mô tả</button>
								
								
																
																
								<button class="pro-tablinks" onclick="openProTabs(event, ''proCom'')">Bình luận</button>
															
							</div>
							
							</strong><div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>8935235220423</td>
										</tr>
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>NXB Hội Nhà Văn</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Harper Lee</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2019</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>419</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Trọng lượng: </td> <td>430g</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>14 x 20.5 x 2</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div>&nbsp;</div><h1><strong>Giết Con Chim Nhại (Bìa mềm)</strong></h1><p style="text-align: justify;">Nào, hãy mở cuốn sách này ra. Bạn phải làm quen ngay với bố Atticus của hai anh em - Jem và Scout, ông bố luật sư có một cách riêng, để những đứa trẻ của mình cứng cáp và vững vàng hơn khi đón nhận những bức xúc không sao hiểu nổi trong cuộc sống. Bạn sẽ nhớ rất lâu người đàn ông thích trốn trong nhà Boo Radley, kẻ bị đám đông coi là lập dị đã chọn một cách rất riêng để gửi những món quà nhỏ cho Jem và Scout, và khi chúng lâm nguy, đã đột nhiên xuất hiện để che chở. Và tất nhiên, bạn không thể bỏ qua anh chàng Tom Robinson, kẻ bị kết án tử hình vì tội hãm hiếp một cô gái da trắng, sự thật thà và suy nghĩ quá đỗi đơn giản của anh lại dẫn đến một cái kết hết sức đau lòng, chỉ vì lý do anh là một người da đen.<br><br>Cho dù được kể dưới góc nhìn của một cô bé, cuốn sách&nbsp;Giết con chim nhạikhông né tránh bất kỳ&nbsp;vấn đề nào, gai góc hay lớn lao, sâu xa hay phức tạp: nạn phân biệt chủng tộc, những định kiến khắt khe, sự trọng nam khinh nữ… Góc nhìn trẻ thơ là một dấu ấn đậm nét và cũng là đặc sắc trong&nbsp;<em>Giết con chim nhại</em>. Trong sáng, hồn nhiên và đầy cảm xúc, những câu chuyện tưởng như chẳng có gì to tát gieo vào người đọc hạt mầm yêu thương.<br><br>Gần 50 năm từ ngày đầu ra&nbsp;mắt,<em>&nbsp;Giết con chim nhại</em>,&nbsp;tác phẩm đầu tay và cũng là cuối cùng của nữ nhà văn Mỹ Harper Lee vẫn đầy sức hút với độc giả ở nhiều lứa tuổi. Thông điệp yêu thương trải khắp các chương sách là một trong những lý do khiến&nbsp;<em>Giết con chim nhại</em>&nbsp;giữ sức&nbsp;sống lâu bền của mình trong trái tim độc giả ở nhiều quốc gia, nhiều thế hệ. Những độc giả nhí tìm cho mình các trò nghịch ngợm và cách nhìn dí dỏm về thế giới xung quanh. Người lớn lại tìm ra điều thú vị sâu xa trong tình cha con nhà Atticus, và đặc biệt là tình người trong cuộc sống, như bé Scout quả quyết nói “em nghĩ chỉ có một hạng người. Đó là người”.</p>
							</div>
							
							
							
							
							<div id="proCom" class="pro-tabcontent" style="display: none;">
								<div class="fb-comments" data-href="https://cachep.vn/products/giet-con-chim-nhai-bia-mem" data-width="100%" data-numposts="5"></div>
							</div>
							
						</div>
					</div>', 1, CAST(120000 AS Decimal(18, 0)), NULL, N'NXB Trẻ ', CAST(98000 AS Decimal(18, 0)), 1, 0, NULL, NULL, 60, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (78, N'KHÚC THỤY DU', 19, CAST(112500 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>8936144200025</td>
										</tr>
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>NXB Hội Nhà Văn</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Du Tử Lê</td>
										</tr>
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2018</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>160</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>18 x 18 x 1.1 cm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div>&nbsp;</div><h1 style="text-align: justify;"><strong>Khúc Thụy Du</strong></h1><div style="text-align: justify;"><strong><em>Khúc thụy du&nbsp;</em></strong>là tập thơ đánh dấu sự trở lại của tiếng thơ Du Tử Lê. 50 bài thơ tình, thơ thế sự đã được phổ nhạc, rất phổ biến của Du Tử Lê trong nửa thế kỷ qua đã được tuyển chọn trong tập thơ này với một sự sàng lọc kỹ lưỡng của chính tác giả và những người làm sách tâm huyết.</div><div><p style="text-align: justify;"><strong>VỀ TÁC PHẨM</strong></p><p style="text-align: justify;">Thơ Du Tử Lê,&nbsp;<em>loài thơ</em>&nbsp;được tạo nên bởi phẩm tính thi sĩ mạnh mẽ tới mức, chúng dẫu có mang những khuôn thức, thì nội tại cũng luôn quẫy đạp để tìm cái vô hạn; xác chữ dẫu có khoác vào khái niệm thì cũng chỉ để hướng tới cái tình ý ngoài lời. Và trên đơn vị bài thơ, dẫu được xác định tọa độ bằng những hệ tứ xuyên suốt thì đó cũng chỉ là những tọa độ hư ảo.</p><p style="text-align: justify;">Những bài thơ tụng ca nhân tình, quê xứ, yêu đương trong tập thơ này đã là chất men phiêu lãng cất cánh thành ca từ trong những sáng tác nổi tiếng của các nhạc sĩ tài hoa: Phạm Duy, Phạm Đình Chương, Anh Bằng, Đăng Khánh, Trần Duy Đức…</p><p style="text-align: justify;">Tập thơ gói lại rất nhiều sáng tác nổi tiếng của Du Tử Lê:&nbsp;<em>Khúc Thụy Du, Khi tôi chết hãy đem tôi ra biển, Ta tiếc thiên đường mới lập xong, Người từ phương Đông qua,…</em>&nbsp;và cập nhật sáng tác mới nhất của ông:&nbsp;<em>Nuôi người, trang sách thơm.</em></p><p style="text-align: justify;">Thơ Du Tử Lê sống động, khiêm cung và bao dung trong lòng công chúng, hóa giải trước muôn trùng định kiến, bay trên những đứt gãy thế cuộc lẫn đời riêng.</p><p style="text-align: justify;">Tuyển thơ&nbsp;<em>Khúc Thụy Du</em>&nbsp;(thuộc tủ sách Tinh hoa Sài Gòn do Phanbook tổ chức) là một kết tinh tương thích với lối đọc thơ, sống thơ của ngày hôm nay!</p></div>
							</div>', 1, CAST(125000 AS Decimal(18, 0)), NULL, N'Thiên Long Hoàn Cầu', CAST(12500 AS Decimal(18, 0)), 5, 0, NULL, NULL, 60, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (79, N'GIỮ ĐỜI CHO NHAU', 19, CAST(125100 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>8936144200148</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>NXB Đà Nẵng</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Du Tử Lê</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2018</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>304</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>13 x 20.5 cm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div>&nbsp;</div><h1 style="text-align: justify;"><strong>Giữ Đời Cho Nhau</strong></h1><div><p style="text-align: justify;">Hai tháng sau khi xuất bản tuyển thơ&nbsp;<strong>Khúc Thụy Du</strong>&nbsp;(Phanbook &amp; NXB Hội Nhà Văn) được độc giả nhiệt tình đón nhận, Phanbook xin tiếp tục giới thiệu đến độc giả tuyển tùy bút&nbsp;<strong>Giữ Đời Cho Nhau</strong>&nbsp;của tác giả&nbsp;<strong>Du Tử Lê</strong>.</p><p style="text-align: justify;">Ngoài tư cách nhà thơ nổi tiếng,&nbsp;<strong>Du Tử Lê</strong>&nbsp;còn được biết đến là một cây bút truyện ngắn, tùy bút khá đặc sắc của văn chương Sài Gòn trước 1975; là một chân dung đáng chú ý của dòng chảy văn học Việt Nam ly hương. Vẫn với một tâm hồn đa cảm, duy tình và phóng khoáng, những trang văn của Du Tử Lê đã trổ ngõ mà chảy vào trái tim người cùng thời, cùng cảnh ngộ, khơi gợi những giá trị thiện lành, nhân cảm trong một đời sống, một lịch sử quá nhiều bất trắc.</p><p style="text-align: justify;">Tuyển tùy bút&nbsp;<strong>Giữ Đời Cho Nhau&nbsp;</strong>là tập hợp 10 bài tùy bút trong quyển&nbsp;<strong>Mùa Hoa Móng Tay</strong>&nbsp;do Tạp chí Văn, ấn hành năm 1972 và 16 bài tùy bút mới được tác giả viết sau này, trong đó, bài mới nhất (Những “địa đạo” đêm Sài Gòn xưa) được viết vào đầu 2018.</p><p style="text-align: justify;">Tuyển tùy bút này có hai phần chính: Ngày tháng tôi và Hương kỷ niệm, đi theo một mạch xuyên suốt: chuyển từ những xúc cảm, chuyện kể thuộc đời riêng đến những ký ức về văn hóa Sài Gòn qua những chân dung nhân vật một thời: Từ Mẫn, Phạm Đình Chương, Trần Phong Giao, Lê Tài Điển… hay những hiện tượng văn nghệ Sài Gòn như: sinh hoạt phòng trà, làm tạp chí, xuất bản, sinh hoạt mỹ thuật,...</p><p style="text-align: justify;">Phía sau những nhân vật dù cụ thể hay phiếm chỉ, các tùy bút của&nbsp;<strong>Du Tử Lê</strong>&nbsp;đều tỏa ra một thứ ánh sáng của tin yêu, một sự gắn bó tốt đẹp, một tinh thần cởi mở và niềm tín thác vào nhân gian không toan tính.</p><p style="text-align: justify;">Những tùy bút giàu mỹ cảm đó, bên cạnh những bài thơ lãng mạn và giàu suy tư của ông đã hướng đến một sự nhất quán tinh tế, lạ lùng.</p><p style="text-align: justify;">Nhưng nếu những bài thơ thơ gói gọn trong một giới hạn với đặc thù ngôn ngữ và nhạc tính riêng, thì tùy bút cho phép&nbsp;<strong>Du Tử Lê</strong>&nbsp;có không gian để diễn giải và triển khai một cách tự do các ấn tượng cá nhân phía sau mỗi tình tiết. Sự tự do của một người viết giữ được lửa ấm của trái tim tự tại mà chan hòa.</p><p style="text-align: justify;"><strong>Giữ Đời Cho Nhau</strong>&nbsp;đem lại cho người đọc hôm nay những khoảnh khắc thưởng lãm vẻ đẹp bay bổng của thứ văn xuôi tiệm cận phẩm tính thi ca.</p><p style="text-align: justify;">Trân trọng giới thiệu cùng bạn đọc!</p></div>
							</div>', 1, CAST(139000 AS Decimal(18, 0)), NULL, N'Nhà Xuất Bản Kim Đồng ', CAST(25100 AS Decimal(18, 0)), 3, 0, NULL, NULL, 60, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (80, N'CÒN CHÚT GÌ ĐỂ NHỚ (2022)', 19, CAST(99000 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>8934974177944</td>
										</tr>
										
										
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>NXB Trẻ</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Nguyễn Nhật Ánh</td>
										</tr>
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2022</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>216</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>20 x 13 x 1</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div>&nbsp;</div><h1 style="text-align: justify;"><strong>Còn Chút Gì Để Nhớ (2022)</strong></h1><div><p style="text-align: justify;">Đó là những kỷ niệm thời đi học của Chương, lúc mới bước chân vào Sài Gòn và làm quen với cuộc sống đô thị. Là những mối quan hệ bạn bè tưởng chừng hời hợt thoảng qua nhưng gắn bó suốt cuộc đời. Cuộc sống đầy biến động đã xô dạt mỗi người mỗi nơi, nhưng trải qua hàng mấy chục năm, những kỷ niệm ấy vẫn luôn níu kéo Chương về với một thời để nhớ.</p></div>
							</div>', 1, CAST(110000 AS Decimal(18, 0)), NULL, N'NXB Trẻ ', CAST(19000 AS Decimal(18, 0)), 1, 0, NULL, NULL, 60, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (81, N'NHỮNG CÔ EM GÁI (TÁI BẢN 2022)', 19, CAST(94500 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>8934974177968</td>
										</tr>
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>NXB Trẻ</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Nguyễn Nhật Ánh</td>
										</tr>
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2022</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>204</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>20 x 13 x 1</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div>&nbsp;</div><h1 style="text-align: justify;"><strong>Những Cô Em Gái (Tái Bản 2022)</strong></h1><div style="text-align: justify;">Khoa từ quê ra thành phố học, tấp tểnh làm thơ được đăng báo và bắt đầu nổi tiếng trong giới học sinh. Nhờ thế, Khoa được các bạn trai trong lớp hâm mộ, nhờ làm thơ tặng em gái mình, thực tế là dùng thơ ấy tặng bạn gái hoặc người yêu. Run rủi thế nào, những bài thơ ấy được truyền tay qua một con đường vòng nào đó lại đến tay Quyên, cô gái mà Khoa thầm yêu trộm nhớ và những bài thơ làm giùm bạn bè ấy đã lấy cảm tưởng thật từ mối tình chưa ngỏ với Quyên. Sự việc ấy gây nhiều hiểu lầm và nuôi trong Khoa niềm hy vọng trước khi Khoa đối diện với sự thật.</div>
							</div>', 1, CAST(105000 AS Decimal(18, 0)), NULL, N'Nhà Xuất Bản Kim Đồng ', CAST(34500 AS Decimal(18, 0)), 3, 0, NULL, NULL, 60, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (82, N'THƯƠNG NHỚ TRÀ LONG (TÁI BẢN 2019)', 19, CAST(70200 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>8934974162155</td>
										</tr>
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>NXB Trẻ</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Nguyễn Nhật Ánh</td>
										</tr>
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2019</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>211</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>13 x 20 x 1</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div>&nbsp;</div><h1 style="text-align: justify;"><strong>Thương Nhớ Trà Long (Tái Bản 2019)</strong></h1><div style="text-align: justify;">Một cuốn sách lãng mạn, trong từng con chữ đầy ắp tình yêu với mưa, với lá, với ngôi nhà cũ, cuốn sách xưa, cùng nỗi nhớ quê và những kỷ niệm thuở nhỏ... Có thể thấy mùi vị của những món ăn mẹ nấu, màu sắc trái cây mẹ mua, những trò chơi của con nhà nghèo…, từ ký ức tác giả đã vẽ ra cho người đọc cả một miền quê với hình ảnh, bối cảnh, không gian, con người của thời ấy, chân thực và tinh tế.</div>
							</div>', 2, CAST(78000 AS Decimal(18, 0)), NULL, N'NXB Trẻ ', CAST(40200 AS Decimal(18, 0)), 1, 0, NULL, NULL, 60, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (83, N'CON CHÓ NHỎ MANG GIỎ HOA HỒNG (TÁI BẢN 2020)', 19, CAST(85500 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>8934974166122</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Nguyễn Nhật Ánh</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2020</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>252</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>13 x 20 cm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div>&nbsp;</div><h1 style="text-align: justify;"><strong>Con Chó Nhỏ Mang Giỏ Hoa Hồng (Tái Bản 2020)</strong></h1><div><p style="text-align: justify;">Cái tựa sách quả là có sức gợi tò mò.</p><p style="text-align: justify;">Tại sao lại là con chó mang giỏ hoa hồng? Nó mang cho bạn nó, hay cho những ai biết yêu thương nó?&nbsp;&nbsp;</p><p style="text-align: justify;">Câu chuyện về 5 chú chó đầy thú vị và cũng không kém cảm xúc lãng mạn- tác phẩm mới nhất&nbsp;của nhà văn bestseller Nguyễn Nhật Ánh sẽ khiến bạn thay đổi nhiều trong cách nhìn về loài thú cưng số 1 thế giới này.</p></div>
							</div>', 1, CAST(95000 AS Decimal(18, 0)), NULL, N'Đông Á', CAST(75500 AS Decimal(18, 0)), 2, 0, NULL, NULL, 60, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (84, N'PHÒNG TRỌ BA NGƯỜI (TÁI BẢN 2022)', 19, CAST(99000 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>8934974177982</td>
										</tr>
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>NXB Trẻ</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>	Nguyễn Nhật Ánh</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2022</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>240</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>20 x 13 cm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div>&nbsp;</div><h1 style="text-align: justify;"><strong>Phòng Trọ Ba Người (Tái Bản 2022)</strong></h1><div style="text-align: justify;">Phòng trọ ba người là nơi dành cho ba chàng sinh viên Chuyên, Nhiệm, và Mẫn trú ngụ, là nơi họ chia sẻ việc học hành, những trò nghịch ngợm và chia sẻ cả những buồn vui trong đời sống tình cảm. Mẫn, chàng trai nhút nhát vốn quan niệm tình yêu là thứ “ xa xỉ phẩm”, đến lúc phải dựng lên vở kịch tình yêu với sự trợ sức của Thu Thảo, cô học trò tinh nghịch của anh. Trò chơi tưởng chỉ để góp vào không khí sôi động của căn gác trọ ấy, không ngờ đã thực sự cuốn hút chàng trai chuyên “dị ứng với phụ nữ” ấy. Khi buộc lòng phải chấm dứt với trò chơi, cũng là lúc Mẫn cảm thấy bâng khuâng như phải chia tay với tình cảm thực sự.</div>
							</div>', 2, CAST(110000 AS Decimal(18, 0)), NULL, N'NXB Trẻ ', CAST(59000 AS Decimal(18, 0)), 1, 0, NULL, NULL, 80, 2, 0)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (85, N'THƠ HAY VIẾT CHO THIẾU NHI - HOA VỪA ĐI VỪA NỞ', 17, CAST(49500 AS Decimal(18, 0)), N'<div id="protab1" class="pro-tabcontent" style="display: block;"><strong>
								<div class="tab_list_product mg-bottom-30">

									<table>
										<tbody><tr>
											<td>Mã hàng: </td><td>8935352605165</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Nhà xuất bản: </td><td>NXB Kim Đồng</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Tác giả: </td><td>Trần Mạnh Hảo</td>
										</tr>
										
										
										
										
                
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
                
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Năm xuất bản: </td> <td>2024</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Số trang: </td> <td>44</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Trọng lượng: </td> <td>100g</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										<tr>
											<td>Kích thước: </td> <td>20.5 x 18.5 x 0.2 cm</td>
										</tr>
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
									</tbody></table>

								</div>
								</strong><div style="text-align: justify;">&nbsp;</div><h1 style="text-align: justify;"><strong>Thơ Hay Viết Cho Thiếu Nhi - Hoa Vừa Đi Vừa Nở</strong></h1><div><p style="text-align: justify;">Thơ Trần Mạnh Hảo rất lạ, rất đặc biệt, như những hạt sương nhỏ nhoi đứng trước mặt trời vĩ đại. Mặt trời không mang nổi dù một hạt sương rơi, nhưng hạt sương lại có thể phản chiếu, mang bao nhiêu mặt trời thu trong ảnh trong hình của mình.</p><p style="text-align: justify;">---</p><p style="text-align: justify;">Nhà thơ&nbsp;<strong>TRẦN MẠNH HẢO</strong></p><p style="text-align: justify;">Sinh năm 1949</p><p style="text-align: justify;">Quê quán: Nghĩa Phú, Nghĩa Hưng, Nam Định. Hiện ở tại quận Phú Nhuận, TP. Hồ Chí Minh. Ông hoạt động trong nhiều lĩnh vực: thơ, văn, báo chí nhưng được biết đến nhiều nhất như một nhà thơ.</p><p style="text-align: justify;"><strong><em>Giải thưởng:</em></strong></p><p style="text-align: justify;">• Tặng thưởng của Hội đồng thơ Hội Nhà văn Việt Nam, năm 1995.</p><p style="text-align: justify;">• Tặng thưởng của Ban Văn học thiếu nhi Hội Nhà văn Việt Nam, năm 1995.</p><p style="text-align: justify;">• Giải thưởng Ban Văn học An ninh – Quốc phòng Hội Nhà văn Việt Nam 1994-1995.</p><p style="text-align: justify;">• Giải thưởng Hội Nhà văn Việt Nam năm 2003. Và nhiều giải thưởng khác</p><p style="text-align: justify;"><strong><em>Tác phẩm chính:</em></strong></p><p style="text-align: justify;">• Trường Sơn của bé (1974)</p><p style="text-align: justify;">• Tiếng chim gõ cửa (1976)</p><p style="text-align: justify;">• Hoa vừa đi vừa nở (1981)</p><p style="text-align: justify;">• Mặt trời trong lòng đất (1981)</p><p style="text-align: justify;">• Ba cặp núi và một hòn núi lẻ (1986)</p><p style="text-align: justify;">• Từ chiếc ô trời của mẹ (1989)</p><p style="text-align: justify;">• Mình anh trong một thế giới (1991)</p><p style="text-align: justify;">• Đất nước hình tia chớp (1994)</p><p style="text-align: justify;">• Chuồn chuồn cắn rốn (1995)</p><p style="text-align: justify;">• Thơ tứ tuyệt (1995)</p></div>
							</div>', 2, CAST(55000 AS Decimal(18, 0)), NULL, N'Nhà Xuất Bản Kim Đồng ', CAST(19500 AS Decimal(18, 0)), 3, 0, NULL, NULL, 60, 2, 12)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (86, N'HOÀNG TỬ BÉ', 17, CAST(170000 AS Decimal(18, 0)), N'<p>Xuất bản lần đầu năm 1943 tại New York (Mỹ),&nbsp;<em>Ho&agrave;ng tử b&eacute;&nbsp;</em>được y&ecirc;u th&iacute;ch tr&ecirc;n to&agrave;n cầu cho tới ng&agrave;y nay. Trong 80 năm qua, đ&acirc;y l&agrave; một trong những cuốn s&aacute;ch b&aacute;n chạy nhất của nh&acirc;n loại với 200 triệu bản dịch ra 250 ng&ocirc;n ngữ kh&aacute;c nhau (bao gồm cả phương ngữ).&nbsp;<em>Ho&agrave;ng tử b&eacute;&nbsp;</em>được b&igrave;nh chọn l&agrave; t&aacute;c phẩm hay nhất thế kỷ 20 ở Ph&aacute;p.&nbsp;</p>

<p>Ở Việt Nam, s&aacute;ch đ&atilde; xuất bản từ năm 1966 với hai bản dịch của B&ugrave;i Gi&aacute;ng, Trần Thiện Đạo v&agrave; c&oacute; th&ecirc;m những lần in mới với một số dịch giả kh&aacute;c.&nbsp;</p>

<p>Trong khi&nbsp;<em>Ho&agrave;ng tử b&eacute;&nbsp;</em>trở n&ecirc;n nổi tiếng khắp thế giới th&igrave; sự biến mất của t&aacute;c giả Antoine Saint-Exup&eacute;ry v&agrave;o năm 1944 vẫn l&agrave; một b&iacute; ẩn. &Ocirc;ng ra đi m&atilde;i m&atilde;i ở tuổi 44 m&agrave; chưa hề nhận được nhuận b&uacute;t cho t&aacute;c phẩm của m&igrave;nh.&nbsp;</p>

<p>&ldquo;Ch&iacute;nh tại chỗ n&agrave;y ho&agrave;ng tử b&eacute; đ&atilde; hiện ra tr&ecirc;n Tr&aacute;i Đất rồi biến mất. Nếu bạn c&oacute; đi qua đ&oacute;, t&ocirc;i cầu mong bạn đừng vội v&atilde;. H&atilde;y đợi một l&uacute;c ngay dưới v&igrave; sao. Sau đ&oacute;, nếu khi ấy c&oacute; một cậu b&eacute; con đến b&ecirc;n bạn&hellip; h&atilde;y mau viết thư, b&aacute;o cho t&ocirc;i rằng em đ&atilde; trở lại&rdquo;, tr&iacute;ch đoạn&nbsp;<em>Ho&agrave;ng tử b&eacute;</em>.&nbsp;</p>

<p><strong>Chuyến bay hụt tới Việt Nam v&agrave; sự ra đời của &#39;Ho&agrave;ng tử b&eacute;&#39;</strong></p>

<p>Cuốn s&aacute;ch được Saint-Exup&eacute;ry viết v&agrave; vẽ tranh minh họa khi &ocirc;ng đang lưu vong tại Mỹ. Đ&oacute; l&agrave; c&acirc;u chuyện kể về một ho&agrave;ng tử nhỏ từ một tiểu cầu đến thăm nhiều h&agrave;nh tinh, gặp gỡ đủ kiểu người. Khi tới Tr&aacute;i đất, ho&agrave;ng tử b&eacute; đ&atilde; gặp t&aacute;c giả, một phi c&ocirc;ng bị rơi m&aacute;y bay xuống sa mạc. T&aacute;c phẩm mang phong c&aacute;ch s&aacute;ch thiếu nhi &ldquo;ẩn giấu một triết l&yacute; qu&aacute; đỗi nhẹ nh&agrave;ng v&agrave; thi vị&rdquo; (<em>New York Times</em>) về bản chất con người, sự c&ocirc; đơn, t&igrave;nh bạn, t&igrave;nh y&ecirc;u v&agrave; sự mất m&aacute;t.&nbsp;</p>

<p>Bối cảnh c&acirc;u chuyện li&ecirc;n hệ với một sự cố khi bay của t&aacute;c giả v&agrave;o 2h45 s&aacute;ng 30/12/1935. Sau 19 giờ 44 ph&uacute;t bay tr&ecirc;n kh&ocirc;ng, Saint-Exup&eacute;ry, c&ugrave;ng với người đồng h&agrave;nh Andr&eacute; Pr&eacute;vot, bị rơi tr&ecirc;n sa mạc Libya, trong nỗ lực ph&aacute; kỷ lục tốc độ từ Paris đến S&agrave;i G&ograve;n để gi&agrave;nh giải thưởng 150.000 franc.&nbsp;</p>

<p>Cả Saint-Exup&eacute;ry v&agrave; Pr&eacute;vot đều sống s&oacute;t một c&aacute;ch thần kỳ sau vụ tai nạn nhưng phải đối mặt với t&igrave;nh trạng mất nước nhanh ch&oacute;ng trong sa mạc n&oacute;ng gay gắt. Bị lạc giữa những đụn c&aacute;t, họ chỉ c&ograve;n một v&agrave;i quả nho, hai quả cam, một chiếc b&aacute;nh ngọt, c&agrave; ph&ecirc; đựng trong chiếc b&igrave;nh đ&atilde; cũ, nửa l&iacute;t rượu vang trắng v&agrave; &iacute;t thuốc men.&nbsp;</p>

<p>Đến ng&agrave;y thứ hai v&agrave; thứ ba, hai người mất nước đến mức ngừng đổ mồ h&ocirc;i. V&agrave;o ng&agrave;y thứ tư, một người d&acirc;n b&aacute;n du mục cưỡi lạc đ&agrave; đ&atilde; ph&aacute;t hiện v&agrave; cứu sống họ.</p>

<p>Trải nghiệm cận kề c&aacute;i chết được đưa v&agrave;o cuốn hồi k&yacute; năm 1939 của Saint-Exup&eacute;ry,&nbsp;<em>Gi&oacute;, c&aacute;t v&agrave; c&aacute;c v&igrave; sao</em>.&nbsp;<em>Ho&agrave;ng tử b&eacute;</em>&nbsp;cũng bắt đầu với cảnh một phi c&ocirc;ng bị mắc kẹt trong sa mạc.</p>

<p>Sinh ng&agrave;y 29/6/1900 tại Lyon (Ph&aacute;p), Antoine Saint-Exup&eacute;ry được biết đến nhiều với tư c&aacute;ch nh&agrave; văn c&ugrave;ng một số t&aacute;c phẩm như&nbsp;<em>Phi c&ocirc;ng, Thư phương Nam, Bay đ&ecirc;m, Xứ con người, Gi&oacute;, c&aacute;t v&agrave; c&aacute;c v&igrave; sao.&nbsp;</em></p>

<p>Saint-Ex, như c&aacute;ch gọi của bạn b&egrave;, cũng l&agrave; một phi c&ocirc;ng thương mại t&agrave;i ba suốt nhiều năm, ti&ecirc;n phong trong c&aacute;c tuyến đường h&agrave;ng kh&ocirc;ng khắp ch&acirc;u &Acirc;u, ch&acirc;u Phi v&agrave; Nam Mỹ. Khi chiến tranh nổ ra v&agrave;o năm 1939, &ocirc;ng gia nhập Lực lượng Kh&ocirc;ng qu&acirc;n Ph&aacute;p v&agrave; thực hiện c&aacute;c nhiệm vụ trinh s&aacute;t cho đến khi Ph&aacute;p đ&igrave;nh chiến với Đức v&agrave;o năm 1940.&nbsp;</p>

<p>Trong khoảng thời gian v&agrave;i năm ở Mỹ, &ocirc;ng s&aacute;ng t&aacute;c&nbsp;<em>Ho&agrave;ng tử b&eacute;</em>. Trở lại qu&ecirc; hương, Saint-Ex tiếp tục tham gia cuộc chiến với tư c&aacute;ch l&agrave; phi c&ocirc;ng thuộc lực lượng dự bị.&nbsp;</p>

<p>Năm 1943, &ocirc;ng được giao nhiệm vụ l&aacute;i chiếc P-38 Lightning kh&ocirc;ng vũ trang. Do sự cố động cơ, m&aacute;y bay rơi v&agrave; Saint-Ex bị đ&igrave;nh chỉ hoạt động trong 8 th&aacute;ng. Sức khỏe tinh thần v&agrave; thể chất suy kiệt, trầm trọng hơn do &ocirc;ng uống nhiều rượu.&nbsp;</p>

<p>Sau đ&oacute;, Saint-Ex được bay trở lại. 8h45 ng&agrave;y 31/7/1944, &ocirc;ng cất c&aacute;nh khỏi Corsica (h&ograve;n đảo thuộc Ph&aacute;p) để chụp ảnh trinh th&aacute;m, sau đ&oacute; mất t&iacute;ch, nhiều khả năng bị đối phương bắn hạ.&nbsp;</p>

<p>Suốt nhiều thập kỷ qua, vẫn chưa c&oacute; c&ocirc;ng bố ch&iacute;nh thức về điều g&igrave; đ&atilde; xảy ra với phi c&ocirc;ng - nh&agrave; văn nổi tiếng.&nbsp;</p>

<p>Năm 1998, một ngư d&acirc;n t&igrave;m thấy chiếc v&ograve;ng tay khắc t&ecirc;n Saint-Exup&eacute;ry trong lưới của m&igrave;nh khi đ&aacute;nh c&aacute; ngo&agrave;i khơi Marseille. Ph&aacute;t hiện đ&atilde; thu h&uacute;t sự ch&uacute; &yacute; của thế giới, đặc biệt l&agrave; một người đ&agrave;n &ocirc;ng lớn tuổi người Đức, Horst Rippert. M&aacute;y bay của Saint-Ex, x&aacute;c nhận bằng số seri (2743L), cũng được t&igrave;m thấy gần đ&oacute;.&nbsp;</p>

<p>Rippert cho biết, ng&agrave;y 31/7/1944, đ&atilde; bắn rơi một chiếc P-38 gần vị tr&iacute; t&igrave;m thấy mảnh vỡ. Lu&ocirc;n thần tượng Saint-Ex, &ocirc;ng đ&atilde; ch&ocirc;n giấu b&iacute; mật của m&igrave;nh hơn nửa thế kỷ.&nbsp;</p>

<p>Tuy nhi&ecirc;n, c&aacute;c nh&agrave; điều tra kh&ocirc;ng t&igrave;m thấy dấu vết đạn bắn trong những mảnh s&oacute;t lại v&agrave; kh&ocirc;ng c&oacute; bằng chứng n&agrave;o kh&aacute;c cho tuy&ecirc;n bố của &ocirc;ng Rippert. Họ chỉ c&oacute; thể x&aacute;c định, chiếc m&aacute;y bay đ&atilde; lao xuống nước theo phương thẳng đứng với vận tốc khoảng 800km/h.&nbsp;</p>

<p>&ldquo;B&ocirc;ng hồng của t&ocirc;i quan trọng hơn tất cả c&aacute;c c&ocirc;, bởi lẽ ch&iacute;nh n&agrave;ng đ&atilde; được t&ocirc;i tưới nước cho. Bởi lẽ ch&iacute;nh n&agrave;ng đ&atilde; được t&ocirc;i chắn b&igrave;nh phong cho. Bởi lẽ ch&iacute;nh n&agrave;ng đ&atilde; được t&ocirc;i bắt s&acirc;u cho. Bởi lẽ ch&iacute;nh từ n&agrave;ng m&agrave; t&ocirc;i đ&atilde; nghe ph&agrave;n n&agrave;n hoặc khoe khoang hoặc thậm ch&iacute; đ&ocirc;i khi chẳng n&oacute;i chẳng rằng. Bởi lẽ đấy l&agrave; b&ocirc;ng hồng của t&ocirc;i&rdquo;<em>,&nbsp;</em>tr&iacute;ch dẫn<em>&nbsp;</em>từ&nbsp;<em>Ho&agrave;ng tử b&eacute;</em>.&nbsp;</p>

<p>&ldquo;Giống như ho&agrave;ng tử b&eacute; y&ecirc;u mến b&ocirc;ng hồng của m&igrave;nh, thế giới y&ecirc;u mến Antoine de Saint-Exup&eacute;ry. Nỗ lực suốt nhiều năm để t&igrave;m hiểu về sự mất t&iacute;ch của &ocirc;ng l&agrave; minh chứng cho điều đ&oacute;. Bất kể điều g&igrave; đ&atilde; xảy ra v&agrave;o ng&agrave;y h&ocirc;m ấy, di sản của &ocirc;ng sẽ lu&ocirc;n l&agrave; niềm vinh dự v&agrave; cảm hứng cho ch&uacute;ng ta&rdquo;, tạp ch&iacute;&nbsp;<em>Plane and Pilot&nbsp;</em>đ&aacute;nh gi&aacute;.</p>
', 1, CAST(155000 AS Decimal(18, 0)), NULL, N'MCBooks ', CAST(150000 AS Decimal(18, 0)), 6, 0, NULL, NULL, 500, 2, NULL)
INSERT [dbo].[products] ([id], [name], [category_id], [price_sell], [description], [status], [price_reduced], [horizontal], [trademark], [price_import], [trademarkId], [ishidden], [sizes], [images], [number_import], [cover_type], [total_sell]) VALUES (87, N'Nếp gấp thời gian', 17, CAST(120000 AS Decimal(18, 0)), N'<p><strong>PHI&Ecirc;N BẢN CHUYỂN THỂ TRUYỆN TRANH&nbsp;MỘT TRONG NHỮNG KIỆT T&Aacute;C CỦA MADELEINE L&#39;ENGLE!</strong></p>

<p>Đ&oacute; l&agrave; một đ&ecirc;m gi&ocirc;ng b&atilde;o mịt m&ugrave;ng. Meg Murry c&ugrave;ng em trai nhỏ Charles Wallace v&agrave; mẹ đang ở trong bếp th&igrave; một vị kh&aacute;ch rầy r&agrave; nhất trần đời xuất hiện.</p>

<p>&quot;Những đ&ecirc;m b&atilde;o l&agrave; ta kho&aacute;i lắm đấy,&quot; người lạ kỳ cục bảo ba mẹ con. &quot;Chỉ c&oacute; điều ta bị luồng gi&oacute; cuốn phăng đi, rồi bị thổi trệch cả đường... Ta sẽ ngồi xuống một l&aacute;t, đi ủng v&agrave;o v&agrave; sau đ&oacute; l&ecirc;n đường. N&oacute;i đến chuyện đường x&aacute;, nh&acirc;n đ&acirc;y,&nbsp;<em>c&oacute;</em>&nbsp;tồn tại c&aacute;i vật gọi l&agrave; khối lập phương bốn chiều, cưng ạ.&quot;</p>

<p>Bố của Meg trong khi đang thử nghiện du h&agrave;nh xuy&ecirc;n thời gian ở chiều thứ năm, đột nhi&ecirc;n biến mất v&ocirc; c&ugrave;ng b&iacute; ẩn. Giờ đ&acirc;y đ&atilde; đến l&uacute;c cho Meg, Calvin bạn c&ocirc;, c&ugrave;ng Charles Wallace l&ecirc;n đường giải cứu &ocirc;ng, đối mặt với Quyền lực B&oacute;ng tối, trong cuộc h&agrave;nh tr&igrave;nh xuy&ecirc;n qua kh&ocirc;ng gian bao la đ&atilde; được tr&iacute; tưởng tượng kỳ diệu của nh&agrave; văn ban cho những chiều k&iacute;ch mới.</p>
', 1, CAST(115000 AS Decimal(18, 0)), NULL, N'Thiên Long Hoàn Cầu', CAST(100000 AS Decimal(18, 0)), 5, 0, NULL, NULL, 90, 1, 3)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[reviews] ON 

INSERT [dbo].[reviews] ([id], [product_id], [created_at], [comment], [status], [star], [fullname], [starOne], [startTwo], [startFour], [startFive], [startThree]) VALUES (1, 58, CAST(N'2024-04-25T20:39:32.703' AS DateTime), N'11111', NULL, 4, N'nguyễn văn hải', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[reviews] ([id], [product_id], [created_at], [comment], [status], [star], [fullname], [starOne], [startTwo], [startFour], [startFive], [startThree]) VALUES (2, 60, CAST(N'2024-05-10T21:46:55.373' AS DateTime), N'tốt', NULL, 5, N'lê thị hạnh', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[reviews] ([id], [product_id], [created_at], [comment], [status], [star], [fullname], [starOne], [startTwo], [startFour], [startFive], [startThree]) VALUES (3, 60, CAST(N'2024-05-10T21:47:11.560' AS DateTime), N'tốt', NULL, 3, N'lê thị hạnh', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[reviews] ([id], [product_id], [created_at], [comment], [status], [star], [fullname], [starOne], [startTwo], [startFour], [startFive], [startThree]) VALUES (4, 60, CAST(N'2024-05-17T15:42:30.380' AS DateTime), N'tốt', NULL, 3, N'lê thị hạnh', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[reviews] ([id], [product_id], [created_at], [comment], [status], [star], [fullname], [starOne], [startTwo], [startFour], [startFive], [startThree]) VALUES (5, 86, CAST(N'2024-05-17T15:44:43.553' AS DateTime), N'tốt', NULL, 2, N'lê thị hạnh', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[reviews] ([id], [product_id], [created_at], [comment], [status], [star], [fullname], [starOne], [startTwo], [startFour], [startFive], [startThree]) VALUES (6, 86, CAST(N'2024-05-17T15:45:03.607' AS DateTime), N'tốt', NULL, 1, N'lê thị hạnh', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[reviews] ([id], [product_id], [created_at], [comment], [status], [star], [fullname], [starOne], [startTwo], [startFour], [startFive], [startThree]) VALUES (7, 77, CAST(N'2024-05-18T12:09:41.750' AS DateTime), N'rewewrew', NULL, 3, N'ewrew', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[reviews] ([id], [product_id], [created_at], [comment], [status], [star], [fullname], [starOne], [startTwo], [startFour], [startFive], [startThree]) VALUES (8, 77, CAST(N'2024-05-18T12:10:38.453' AS DateTime), N'tốt', NULL, 5, N'lê thị hạnh', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[reviews] ([id], [product_id], [created_at], [comment], [status], [star], [fullname], [starOne], [startTwo], [startFour], [startFive], [startThree]) VALUES (9, 77, CAST(N'2024-05-18T12:11:12.777' AS DateTime), N'fdasfsd', NULL, 2, N'fdsfds', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[reviews] ([id], [product_id], [created_at], [comment], [status], [star], [fullname], [starOne], [startTwo], [startFour], [startFive], [startThree]) VALUES (10, 55, CAST(N'2024-05-18T13:26:11.383' AS DateTime), N'tốt', NULL, 3, N'lê thị hạnh', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[reviews] ([id], [product_id], [created_at], [comment], [status], [star], [fullname], [starOne], [startTwo], [startFour], [startFive], [startThree]) VALUES (11, 55, CAST(N'2024-05-18T13:28:29.717' AS DateTime), N'tốt', NULL, 5, N'lê thị hạnh', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[reviews] ([id], [product_id], [created_at], [comment], [status], [star], [fullname], [starOne], [startTwo], [startFour], [startFive], [startThree]) VALUES (12, 55, CAST(N'2024-05-18T13:29:23.423' AS DateTime), N'fdasfsd', NULL, 1, N'lê thị hạnh', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[reviews] ([id], [product_id], [created_at], [comment], [status], [star], [fullname], [starOne], [startTwo], [startFour], [startFive], [startThree]) VALUES (13, 58, CAST(N'2024-05-24T22:03:58.053' AS DateTime), N'tốt', NULL, 1, N'lê thị hạnh', 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [full_name], [phone_number], [email], [avatar], [code], [address], [role], [password], [status], [register_date]) VALUES (1, N'Lê Thị Thanh Trúc ', N'0345801986', N'lethanhtruc@gmail.com', NULL, NULL, N'Hà Nội', 0, N'12345678', 0, NULL)
INSERT [dbo].[users] ([id], [full_name], [phone_number], [email], [avatar], [code], [address], [role], [password], [status], [register_date]) VALUES (2, N'Nguyễn Văn Hưng', N'0345801982', N'nguyenvanhung@gmail.com', N'high-heels.png', N'757332', N'Hà Nội', 1, N'1234567890', 0, CAST(N'2023-01-08T23:12:38.7417512' AS DateTime2))
INSERT [dbo].[users] ([id], [full_name], [phone_number], [email], [avatar], [code], [address], [role], [password], [status], [register_date]) VALUES (3, N'Lê Thị Hạnh', N'0345801984', N'lethihanh@gmail.com', NULL, N'', N'Thanh Xuân hà nội ', 1, N'123456789', 0, CAST(N'2023-01-10T09:52:08.2503595' AS DateTime2))
INSERT [dbo].[users] ([id], [full_name], [phone_number], [email], [avatar], [code], [address], [role], [password], [status], [register_date]) VALUES (4, N'Nguyễn văn Hào', N'0345806579', N'nguyenvanhao@gmail.com', NULL, N'', N'hà nội', 1, N'123456789', 0, CAST(N'2023-01-10T17:05:33.0150696' AS DateTime2))
INSERT [dbo].[users] ([id], [full_name], [phone_number], [email], [avatar], [code], [address], [role], [password], [status], [register_date]) VALUES (5, N'Nguyễn Văn Định', N'0345801950', N'nguyenvandinh@gmail.com', NULL, NULL, N'Thanh Xuân Hà Nội', 1, N'12345678', 0, CAST(N'2023-01-28T16:54:03.9956241' AS DateTime2))
INSERT [dbo].[users] ([id], [full_name], [phone_number], [email], [avatar], [code], [address], [role], [password], [status], [register_date]) VALUES (6, N'Nguyễn Văn Mạnh', N'0345801988', N'nguyenvanmanh@gmail.com', NULL, NULL, N'Nguyễn Trãi Thanh Xuân Hà Nội', 1, N'12345678', 0, CAST(N'2024-04-07T15:42:20.1456273' AS DateTime2))
INSERT [dbo].[users] ([id], [full_name], [phone_number], [email], [avatar], [code], [address], [role], [password], [status], [register_date]) VALUES (7, N'Nguyễn Thị Trúc', N'0345801925', N'nguyenthitruc@gmail.com', N'11.jpg', NULL, N'thanh xuân hà nội', 1, N'12345678', 0, CAST(N'2024-04-07T21:59:27.2968052' AS DateTime2))
INSERT [dbo].[users] ([id], [full_name], [phone_number], [email], [avatar], [code], [address], [role], [password], [status], [register_date]) VALUES (9, N'Thanh Trúc Lê ', N'0345777456', N'thanhtrucle@gmail.com', NULL, NULL, N'thanh hóa', 1, N'11111111', 0, CAST(N'2024-04-25T23:30:48.3186850' AS DateTime2))
INSERT [dbo].[users] ([id], [full_name], [phone_number], [email], [avatar], [code], [address], [role], [password], [status], [register_date]) VALUES (11, N'Bùi Quang Khái', N'0967333345', N'buiquangkhai@gmail.com', NULL, NULL, NULL, 1, N'11111111', 0, CAST(N'2024-05-08T22:45:09.1391285' AS DateTime2))
INSERT [dbo].[users] ([id], [full_name], [phone_number], [email], [avatar], [code], [address], [role], [password], [status], [register_date]) VALUES (13, N'Đặng Nhật Minh', N'0923456277', N'dangnhatminh@gmail.com', NULL, NULL, N'Hà Nội ', 1, N'44444444', 0, CAST(N'2024-05-13T16:24:38.5247669' AS DateTime2))
INSERT [dbo].[users] ([id], [full_name], [phone_number], [email], [avatar], [code], [address], [role], [password], [status], [register_date]) VALUES (15, N'Lê Thanh Trúc', N'0948200902', N'thanhtruc@gmail.com', NULL, NULL, NULL, 1, N'12345678', 0, CAST(N'2024-05-27T13:35:32.9966083' AS DateTime2))
SET IDENTITY_INSERT [dbo].[users] OFF
GO
/****** Object:  Index [IX_carts_product_id]    Script Date: 31/05/2024 12:22:22 SA ******/
CREATE NONCLUSTERED INDEX [IX_carts_product_id] ON [dbo].[carts]
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_details_order_id]    Script Date: 31/05/2024 12:22:22 SA ******/
CREATE NONCLUSTERED INDEX [IX_order_details_order_id] ON [dbo].[order_details]
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_details_product_id]    Script Date: 31/05/2024 12:22:22 SA ******/
CREATE NONCLUSTERED INDEX [IX_order_details_product_id] ON [dbo].[order_details]
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_orders_user_id]    Script Date: 31/05/2024 12:22:22 SA ******/
CREATE NONCLUSTERED INDEX [IX_orders_user_id] ON [dbo].[orders]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_products_category_id]    Script Date: 31/05/2024 12:22:22 SA ******/
CREATE NONCLUSTERED INDEX [IX_products_category_id] ON [dbo].[products]
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD  CONSTRAINT [FK_carts_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[carts] CHECK CONSTRAINT [FK_carts_users]
GO
ALTER TABLE [dbo].[images]  WITH CHECK ADD  CONSTRAINT [FK_images_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[images] CHECK CONSTRAINT [FK_images_products]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK_order_details_orders_order_id] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK_order_details_orders_order_id]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK_order_details_products_product_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK_order_details_products_product_id]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users_user_id]
GO
ALTER TABLE [dbo].[posts]  WITH CHECK ADD  CONSTRAINT [FK_posts_users] FOREIGN KEY([author])
REFERENCES [dbo].[users] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[posts] CHECK CONSTRAINT [FK_posts_users]
GO
ALTER TABLE [dbo].[ProductCart]  WITH CHECK ADD  CONSTRAINT [FK_ProductCart_carts] FOREIGN KEY([CartId])
REFERENCES [dbo].[carts] ([id])
GO
ALTER TABLE [dbo].[ProductCart] CHECK CONSTRAINT [FK_ProductCart_carts]
GO
ALTER TABLE [dbo].[ProductCart]  WITH CHECK ADD  CONSTRAINT [FK_ProductCart_products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[ProductCart] CHECK CONSTRAINT [FK_ProductCart_products]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_categories_category_id] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_categories_category_id]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FK_reviews_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FK_reviews_products]
GO
USE [master]
GO
ALTER DATABASE [BookDataBase] SET  READ_WRITE 
GO
