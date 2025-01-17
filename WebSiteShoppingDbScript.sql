USE [master]
GO
/****** Object:  Database [WebSiteShoppingDb]    Script Date: 4/12/2024 8:47:54 PM ******/
CREATE DATABASE [WebSiteShoppingDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebSiteShoppingdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\WebSiteShoppingdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebSiteShoppingdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\WebSiteShoppingdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WebSiteShoppingDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebSiteShoppingDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebSiteShoppingDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebSiteShoppingDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebSiteShoppingDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebSiteShoppingDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebSiteShoppingDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebSiteShoppingDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebSiteShoppingDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebSiteShoppingDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebSiteShoppingDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebSiteShoppingDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebSiteShoppingDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebSiteShoppingDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebSiteShoppingDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebSiteShoppingDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebSiteShoppingDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebSiteShoppingDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebSiteShoppingDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebSiteShoppingDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebSiteShoppingDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebSiteShoppingDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebSiteShoppingDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebSiteShoppingDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebSiteShoppingDb] SET RECOVERY FULL 
GO
ALTER DATABASE [WebSiteShoppingDb] SET  MULTI_USER 
GO
ALTER DATABASE [WebSiteShoppingDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebSiteShoppingDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebSiteShoppingDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebSiteShoppingDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebSiteShoppingDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebSiteShoppingDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebSiteShoppingDb', N'ON'
GO
ALTER DATABASE [WebSiteShoppingDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [WebSiteShoppingDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WebSiteShoppingDb]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 4/12/2024 8:47:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[ID] [int] NOT NULL,
	[ID_Customer] [int] NULL,
	[Cost] [money] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill_Detail]    Script Date: 4/12/2024 8:47:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill_Detail](
	[Bill_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Count] [int] NULL,
	[Cost] [money] NULL,
 CONSTRAINT [PK_Bill_Detail] PRIMARY KEY CLUSTERED 
(
	[Bill_ID] ASC,
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/12/2024 8:47:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [int] NULL,
	[Address] [nvarchar](100) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/12/2024 8:47:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Price] [money] NULL,
	[Image] [nvarchar](200) NULL,
	[Color] [nvarchar](20) NULL,
	[Weight] [float] NULL,
	[Species] [nvarchar](50) NULL,
	[Gender] [nchar](10) NULL,
	[Info] [nvarchar](1000) NULL,
	[Stock] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 4/12/2024 8:47:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/12/2024 8:47:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Email] [nvarchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[Role] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Product] ([ID], [Name], [Price], [Image], [Color], [Weight], [Species], [Gender], [Info], [Stock]) VALUES (11, N'Shiba', 25000000.0000, N'shiba.png', N'vàng', 10, N'chó', N'đực       ', N'no info', 5)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Image], [Color], [Weight], [Species], [Gender], [Info], [Stock]) VALUES (12, N'Mực', 15000000.0000, N'muc.png', N'đen', 16, N'chó', N'đực       ', N'no info', 5)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Image], [Color], [Weight], [Species], [Gender], [Info], [Stock]) VALUES (13, N'Tôm', 20000000.0000, N'tom.png', N'cam', 4, N'chó', N'cái       ', N'no info', 5)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Image], [Color], [Weight], [Species], [Gender], [Info], [Stock]) VALUES (14, N'Bông', 23000000.0000, N'bong.png', N'trắng', 5, N'chó', N'cái       ', N'no info', 5)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Image], [Color], [Weight], [Species], [Gender], [Info], [Stock]) VALUES (21, N'Mun', 21000000.0000, N'mun.png', N'đen', 3, N'mèo', N'đực       ', N'no info', 5)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Image], [Color], [Weight], [Species], [Gender], [Info], [Stock]) VALUES (22, N'Momo', 21000000.0000, N'momo.png', N'trắng', 3, N'mèo', N'cái       ', N'no info', 5)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Image], [Color], [Weight], [Species], [Gender], [Info], [Stock]) VALUES (31, N'Bear', 40000000.0000, N'bear.png', N'nâu', 400, N'gấu', N'đực       ', N'no info', 5)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Image], [Color], [Weight], [Species], [Gender], [Info], [Stock]) VALUES (32, N'Koala', 30000000.0000, N'koala.png', N'xám', 16, N'gấu', N'đực       ', N'no info', 5)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Image], [Color], [Weight], [Species], [Gender], [Info], [Stock]) VALUES (41, N'Mamut', 70000000.0000, N'mamut.png', N'xám', 6500, N'voi', N'đực       ', N'no info', 5)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Image], [Color], [Weight], [Species], [Gender], [Info], [Stock]) VALUES (51, N'Naga', 6000000.0000, N'naga.png', N'xanh lục', 1.5, N'rắn', N'cái       ', N'no info', 5)
GO
INSERT [dbo].[User] ([Email], [Password], [Role]) VALUES (N'1', N'1', 1)
INSERT [dbo].[User] ([Email], [Password], [Role]) VALUES (N'2', N'1', 1)
INSERT [dbo].[User] ([Email], [Password], [Role]) VALUES (N'dh@gm.com', N'123', 99)
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Customer] FOREIGN KEY([ID_Customer])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Customer]
GO
ALTER TABLE [dbo].[Bill_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Detail_Bill] FOREIGN KEY([Bill_ID])
REFERENCES [dbo].[Bill] ([ID])
GO
ALTER TABLE [dbo].[Bill_Detail] CHECK CONSTRAINT [FK_Bill_Detail_Bill]
GO
ALTER TABLE [dbo].[Bill_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Detail_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Bill_Detail] CHECK CONSTRAINT [FK_Bill_Detail_Product]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_User] FOREIGN KEY([Email])
REFERENCES [dbo].[User] ([Email])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_User]
GO
USE [master]
GO
ALTER DATABASE [WebSiteShoppingDb] SET  READ_WRITE 
GO
