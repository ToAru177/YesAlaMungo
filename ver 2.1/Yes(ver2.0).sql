USE [master]
GO
/****** Object:  Database [YesAlaMungo]    Script Date: 2019-06-25 오후 9:42:17 ******/
CREATE DATABASE [YesAlaMungo]

ALTER DATABASE [YesAlaMungo] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YesAlaMungo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YesAlaMungo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YesAlaMungo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YesAlaMungo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YesAlaMungo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YesAlaMungo] SET ARITHABORT OFF 
GO
ALTER DATABASE [YesAlaMungo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YesAlaMungo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YesAlaMungo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YesAlaMungo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YesAlaMungo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YesAlaMungo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YesAlaMungo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YesAlaMungo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YesAlaMungo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YesAlaMungo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YesAlaMungo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YesAlaMungo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YesAlaMungo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YesAlaMungo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YesAlaMungo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YesAlaMungo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YesAlaMungo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YesAlaMungo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [YesAlaMungo] SET  MULTI_USER 
GO
ALTER DATABASE [YesAlaMungo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YesAlaMungo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YesAlaMungo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YesAlaMungo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [YesAlaMungo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [YesAlaMungo] SET QUERY_STORE = OFF
GO
USE [YesAlaMungo]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [YesAlaMungo]
GO
/****** Object:  User [adad]    Script Date: 2019-06-25 오후 9:42:17 ******/

/****** Object:  Table [dbo].[Buy]    Script Date: 2019-06-25 오후 9:42:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buy](
	[BuyID] [int] IDENTITY(1,1) NOT NULL,
	[BuyerID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[SubAddress] [nvarchar](500) NOT NULL,
	[InvoiceState] [int] NOT NULL,
 CONSTRAINT [PK_Buy] PRIMARY KEY CLUSTERED 
(
	[BuyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuyUsedBook]    Script Date: 2019-06-25 오후 9:42:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuyUsedBook](
	[UsedBookID] [int] NOT NULL,
	[Dummy] [bit] NULL,
	[BuyID] [int] NOT NULL,
 CONSTRAINT [PK_BuyUsedBook] PRIMARY KEY CLUSTERED 
(
	[UsedBookID] ASC,
	[BuyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2019-06-25 오후 9:42:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[LoginID] [nvarchar](100) NOT NULL,
	[PassWord] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](1000) NOT NULL,
	[Email] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2019-06-25 오후 9:42:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[LoginID] [nvarchar](100) NOT NULL,
	[PassWord] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetaDataBook]    Script Date: 2019-06-25 오후 9:42:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetaDataBook](
	[MetaDataBookID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](1000) NOT NULL,
	[Writer] [nvarchar](1000) NOT NULL,
	[Publisher] [nvarchar](1000) NOT NULL,
	[Price] [int] NOT NULL,
	[Image] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_MetaDataBook] PRIMARY KEY CLUSTERED 
(
	[MetaDataBookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sell]    Script Date: 2019-06-25 오후 9:42:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sell](
	[SellID] [int] IDENTITY(1,1) NOT NULL,
	[SellerID] [int] NOT NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Checked] [bit] NOT NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[SellID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellUsedBook]    Script Date: 2019-06-25 오후 9:42:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellUsedBook](
	[SellID] [int] NOT NULL,
	[Dummy] [bit] NULL,
	[UsedBookID] [int] NOT NULL,
 CONSTRAINT [PK_SaleUsedBook] PRIMARY KEY CLUSTERED 
(
	[SellID] ASC,
	[UsedBookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsedBook]    Script Date: 2019-06-25 오후 9:42:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsedBook](
	[UsedBookID] [int] IDENTITY(1,1) NOT NULL,
	[MetaDataID] [int] NOT NULL,
	[Quality] [nvarchar](50) NOT NULL,
	[IsSell] [bit] NOT NULL,
 CONSTRAINT [PK_UsedBook] PRIMARY KEY CLUSTERED 
(
	[UsedBookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Buy] ON 

INSERT [dbo].[Buy] ([BuyID], [BuyerID], [OrderDate], [Address], [SubAddress], [InvoiceState]) VALUES (1, 13, CAST(N'2016-10-23T00:00:00.000' AS DateTime), N'부산광역시 남구 대연동 514-8', N'해피빌 103호', 0)
INSERT [dbo].[Buy] ([BuyID], [BuyerID], [OrderDate], [Address], [SubAddress], [InvoiceState]) VALUES (2, 15, CAST(N'2016-12-24T00:00:00.000' AS DateTime), N'경상남도 창원시 진해구 풍호동 305-17', N'210호', 0)
INSERT [dbo].[Buy] ([BuyID], [BuyerID], [OrderDate], [Address], [SubAddress], [InvoiceState]) VALUES (3, 20, CAST(N'2017-07-15T00:00:00.000' AS DateTime), N'부산광역시 부산진구 가야동 296-1', N'가야1동주민센터', 0)
INSERT [dbo].[Buy] ([BuyID], [BuyerID], [OrderDate], [Address], [SubAddress], [InvoiceState]) VALUES (4, 9, CAST(N'2017-11-26T00:00:00.000' AS DateTime), N'서울특별시 송파구 장지동 847', N'603동 1층 106호', 1)
INSERT [dbo].[Buy] ([BuyID], [BuyerID], [OrderDate], [Address], [SubAddress], [InvoiceState]) VALUES (5, 9, CAST(N'2018-02-23T00:00:00.000' AS DateTime), N'서울특별시 송파구 장지동 847', N'603동 1층 106호', 0)
INSERT [dbo].[Buy] ([BuyID], [BuyerID], [OrderDate], [Address], [SubAddress], [InvoiceState]) VALUES (6, 30, CAST(N'2018-10-28T00:00:00.000' AS DateTime), N'경상남도 하동군 하동읍 비파리 611-53', N'흥한로얄맨션', 1)
INSERT [dbo].[Buy] ([BuyID], [BuyerID], [OrderDate], [Address], [SubAddress], [InvoiceState]) VALUES (7, 21, CAST(N'2019-03-29T00:00:00.000' AS DateTime), N'경상북도 포항시 남구 연일읍 유강리 594-3', N'대림한숲타운3단지아파트', 2)
INSERT [dbo].[Buy] ([BuyID], [BuyerID], [OrderDate], [Address], [SubAddress], [InvoiceState]) VALUES (8, 2, CAST(N'2019-06-20T00:00:00.000' AS DateTime), N'부산광역시 해운대구 우동 1500', N'산업협력관', 0)
INSERT [dbo].[Buy] ([BuyID], [BuyerID], [OrderDate], [Address], [SubAddress], [InvoiceState]) VALUES (9, 13, CAST(N'2019-06-23T00:00:00.000' AS DateTime), N'부산광역시 남구 대연동 514-8', N'해피빌 103호', 2)
INSERT [dbo].[Buy] ([BuyID], [BuyerID], [OrderDate], [Address], [SubAddress], [InvoiceState]) VALUES (10, 1, CAST(N'2019-06-24T23:29:53.220' AS DateTime), N'부산광역시 남구 대연동', N'럭키빌 101호', 0)
INSERT [dbo].[Buy] ([BuyID], [BuyerID], [OrderDate], [Address], [SubAddress], [InvoiceState]) VALUES (11, 1, CAST(N'2019-06-24T23:31:21.323' AS DateTime), N'경상남도 진주시 칠암동', N'154-88', 0)
INSERT [dbo].[Buy] ([BuyID], [BuyerID], [OrderDate], [Address], [SubAddress], [InvoiceState]) VALUES (12, 1, CAST(N'2019-06-24T23:33:36.737' AS DateTime), N'대한민국 어딘가', N'111-1', 0)
INSERT [dbo].[Buy] ([BuyID], [BuyerID], [OrderDate], [Address], [SubAddress], [InvoiceState]) VALUES (13, 1, CAST(N'2019-06-25T20:05:21.373' AS DateTime), N'해남', N'땅끝마울', 1)
INSERT [dbo].[Buy] ([BuyID], [BuyerID], [OrderDate], [Address], [SubAddress], [InvoiceState]) VALUES (14, 1, CAST(N'2019-06-25T20:07:16.177' AS DateTime), N'부산', N'레고마을', 0)
INSERT [dbo].[Buy] ([BuyID], [BuyerID], [OrderDate], [Address], [SubAddress], [InvoiceState]) VALUES (15, 1, CAST(N'2019-06-25T20:09:36.530' AS DateTime), N'부산', N'레고마을', 1)
SET IDENTITY_INSERT [dbo].[Buy] OFF
INSERT [dbo].[BuyUsedBook] ([UsedBookID], [Dummy], [BuyID]) VALUES (1, NULL, 8)
INSERT [dbo].[BuyUsedBook] ([UsedBookID], [Dummy], [BuyID]) VALUES (2, NULL, 2)
INSERT [dbo].[BuyUsedBook] ([UsedBookID], [Dummy], [BuyID]) VALUES (3, NULL, 1)
INSERT [dbo].[BuyUsedBook] ([UsedBookID], [Dummy], [BuyID]) VALUES (6, NULL, 3)
INSERT [dbo].[BuyUsedBook] ([UsedBookID], [Dummy], [BuyID]) VALUES (8, NULL, 6)
INSERT [dbo].[BuyUsedBook] ([UsedBookID], [Dummy], [BuyID]) VALUES (10, NULL, 4)
INSERT [dbo].[BuyUsedBook] ([UsedBookID], [Dummy], [BuyID]) VALUES (11, NULL, 5)
INSERT [dbo].[BuyUsedBook] ([UsedBookID], [Dummy], [BuyID]) VALUES (12, NULL, 7)
INSERT [dbo].[BuyUsedBook] ([UsedBookID], [Dummy], [BuyID]) VALUES (13, NULL, 15)
INSERT [dbo].[BuyUsedBook] ([UsedBookID], [Dummy], [BuyID]) VALUES (15, NULL, 9)
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (1, N'admin', N'1q2w3e', N'010-4568-7854', N'부산광역시 서구 아미동2가 10-3 아미1동경로당', N'luisg@embraer.com.br')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (2, N'star', N'9j86fb', N'010-1235-4586', N'부산광역시 기장군 장안읍 392-0', N'leonekohler@surfeu.de')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (3, N'moon', N'zt0mmc', N'010-4152-2100', N'부산광역시 기장군 일광면 이천리 719-2 삼덕연립주택', N'ftremblay@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (4, N'seed', N'09pcrm', N'010-0112-1154', N'부산광역시 기장군 일광면 신평리 50 칠암마을회관', N'bjorn.hansen@yahoo.no')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (5, N'jlpt', N'9xhkyf', N'010-8562-1478', N'부산광역시 기장군 일광면 학리 197-2 학리회관', N'frantisekw@jetbrains.com')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (6, N'phyfs', N'6af5vx', N'010-8856-3365', N'부산광역시 부산진구 가야동 296-1 가야1동주민센터', N'hholy@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (7, N'pagoda', N'92eq58', N'010-1234-5678', N'서울특별시 송파구 장지동 847,  603동 1층 106호', N'astrid.gruber@apple.at')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (8, N'maxim', N'39q0md', N'010-9856-4125', N'서울특별시 송파구 잠실동 22    250동', N'daan_peeters@apple.be')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (9, N'topbold', N'1kycxj', N'010-4568-6523', N'대전광역시 중구 태평2동 408-1 삼부아파트', N'kara.nielsen@jubii.dk')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (10, N'imshy', N'5u1jy2', N'010-2254-8856', N'대전광역시 중구 태평2동 389-5 파라곤아파트', N'eduardo@woodstock.com.br')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (11, N'adven', N'kny070', N'010-2533-4586', N'대전광역시 중구 산성동 78-5 한밭가든아파트', N'alero@uol.com.br')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (12, N'kkanu', N'yt7k0c', N'010-1152-7748', N'경상남도 하동군 하동읍 비파리 611-53 흥한로얄맨션', N'roberto.almeida@riotur.gov.br')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (13, N'kakako', N'3tb59p', N'010-4554-1598', N'경상남도 하동군 금성면 궁항리 744-7 공항노인정', N'fernadaramos4@uol.com.br')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (14, N'bbananan', N'lflv23', N'010-2001-2336', N'경기도 남양주시 다산동 4338-45(성지프라자 203호)', N'mphilips12@shaw.ca')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (15, N'popori', N'9sprah', N'010-1563-1226', N'전라남도 여수시 신월동 60 신월금호아파트', N'jenniferp@rogers.ca')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (16, N'mochimochi', N'u3f30q', N'010-5562-6698', N'전라남도 여수시 여서동 489-1 현대건설아파트', N'fharris@google.com')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (17, N'hamus', N's7r3ty', N'010-4451-8854', N'경상북도 포항시 남구 연일읍 오천리 170 대우네오빌프리미엄', N'jacksmith@microsoft.com')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (18, N'loss', N'0vmn35', N'010-2568-4521', N'경상북도 포항시 남구 연일읍 유강리 594-3 대림한숲타운3단지아파트', N'michelleb@aol.com')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (19, N'uno', N'l9xgcx', N'010-9965-3636', N'경상북도 포항시 남구 연일읍 유강리 594 유강청구아파트', N'tgoyer@apple.com')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (20, N'arduino', N'l2wfni', N'011-8695-1567', N'경상북도 포항시 남구 연일읍 생지리 57-5 명성강변맨션2차', N'dmiller@comcast.com')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (21, N'orangepi', N'6yr1u3', N'011-8546-5557', N'대전광역시 서구 둔산1동 1388 한마루아파트', N'kachase@hotmail.com')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (22, N'rasp', N'32hab6', N'010-3459-8865', N'대전광역시 서구 둔산1동 1509 크로바아파트', N'hleacock@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (23, N'kali', N'v4m8bf', N'010-3365-0021', N'경산남도 감해시 삼계동 1504-1 106동', N'johngordon22@yahoo.com')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (24, N'ubuntu', N'33a1ve', N'010-9566-1818', N'경상남도 김해시 내동 1132-5', N'fralston@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (25, N'mint', N'7cwnhl', N'010-1818-8181', N'경상남도 김해시 삼계동 1155-9', N'vstevens@yahoo.com')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (26, N'centos', N'714rzb', N'010-6778-1102', N'부산광역시 남구 용소로 45', N'ricunningham@hotmail.com')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (27, N'win10', N'n8f4zt', N'010-9485-6615', N'부산광역시 남구 신신로 365', N'patrick.gray@aol.com')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (28, N'vs2017', N'591g3u', N'011-2565-5551', N'부산광역시 해운대구 중동 1411-4', N'jubarnett@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (29, N'vs2019', N'sl76qe', N'010-9966-6633', N'부산광역시 해운대구 우동 1496', N'robbrown@shaw.ca')
INSERT [dbo].[Customer] ([CustomerID], [LoginID], [PassWord], [PhoneNumber], [Address], [Email]) VALUES (30, N'mssql', N'709b5u', N'010-1212-9191', N'부산광역시 해운대구 우동 1500', N'edfrancis@yachoo.ca')
SET IDENTITY_INSERT [dbo].[Customer] OFF
INSERT [dbo].[Employee] ([EmployeeID], [LoginID], [PassWord], [PhoneNumber], [Email]) VALUES (1, N'admin', N'1q2w3e', N'010-4856-8854', N'4646@gmail.com')
SET IDENTITY_INSERT [dbo].[MetaDataBook] ON 

INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (1, N'총균쇠', N'다이아몬드', N'문학사상사', 28000, N'D:\MetaBookImage\총균쇠.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (2, N'다시 태어난다면, 한국에서 살겠습니까', N'이재열', N'21세기북스', 16000, N'D:\MetaBookImage\다시_태어난다면_한국에서_살겠습니까.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (3, N'여행의 이유', N'김영하', N'문학동네', 13500, N'D:\MetaBookImage\여행의_이유.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (4, N'축구를 하며 생각한 것들', N'손흥민', N'브레인스토어', 18000, N'D:\MetaBookImage\축구를_하며_생각한_것들.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (5, N'잊기 좋은 이름', N'김애란', N'열림원', 13500, N'D:\MetaBookImage\잊기_좋은_이름.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (6, N'박막례, 이대로 죽을 순 없다', N'박막례', N'위즈덤하우스', 14800, N'D:\MetaBookImage\박막례_이대로_죽을_순_없다.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (7, N'좀비고등학교 코믹스 13', N'유대영', N'겜툰', 9800, N'D:\MetaBookImage\좀비고등학교_코믹스_13.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (8, N'천년의 질문 1', N'조정래', N'해냄', 14800, N'D:\MetaBookImage\천년의_질문_1.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (9, N'인생의 마지막 순간에서', N'샐리 티스데일', N'비잉', 16500, N'D:\MetaBookImage\인생의_마지막_순간에서.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (10, N'죽음 1', N'베르나르 베르베르', N'열린책들', 14000, N'D:\MetaBookImage\죽음_1.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (11, N'죽음 2', N'베르나르 베르베르', N'열린책들', 14000, N'D:\MetaBookImage\죽음_2.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (12, N'천년의 질문 2', N'조정래', N'해냄', 14800, N'D:\MetaBookImage\천년의_질문_2.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (13, N'숨', N'테드 창', N'엘리', 16500, N'D:\MetaBookImage\숨.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (14, N'아이 마음에 상처 주지 않는 습관', N'이다랑', N'길벗', 15000, N'D:\MetaBookImage\아이_마음에_상처_주지_않는_습관')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (15, N'천년의 질문 3', N'조정래', N'해냄', 14800, N'D:\MetaBookImage\천년의_질문_3.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (16, N'늑대가 온다', N'최현명', N'양철북', 16000, N'D:\MetaBookImage\늑대가_온다.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (17, N'흔한남매 1', N'흔한남매', N'아이세움', 11000, N'D:\MetaBookImage\흔한남매_1.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (18, N'연의 편지', N'조현아', N'손봄북스', 15000, N'D:\MetaBookImage\연의_편지.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (19, N'공부머리 독서법', N'최승필', N'책구루', 16500, N'D:\MetaBookImage\공부머리_독서법.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (20, N'진이, 지니', N'정유정', N'은행나무', 14000, N'D:\MetaBookImage\진이_지니.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (21, N'설민석의 세계사 대모험 2', N'설민석, 잼 스토리', N'단꿈아이', 12000, N'D:\MetaBookImage\설민석의_세계사_대모험_2.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (22, N'빨강 머리 앤', N'루시 모드 몽고메리', N'더모던', 16800, N'D:\MetaBookImage\빨강_머리_앤.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (23, N'해커스 토익 기출 보카', N'David Cho', N'해커스어학연구소', 12900, N'D:\MetaBookImage\해커스_토익_기출_보카.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (24, N'명탐정 코난 96', N'아오야마 고쇼', N'서울미디어코믹스', 4500, N'D:\MetaBookImage\명탐정_코난_96.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (25, N'50대 사건으로 보는 돈의 역사', N'홍춘욱', N'로크미디어', 17800, N'D:\MetaBookImage\50대_사건으로_보는_돈의_역사.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (26, N'아주 작은 습관의 힘', N'제임스 클리어', N'비즈니스북스', 16000, N'D:\MetaBookImage\아주_작은_습관의_힘.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (27, N'한자와 나오키 1', N'이케이도 준', N'인플루엔결(주)', 15000, N'D:\MetaBookImage\한자와_나오키_1.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (28, N'역사의 쓸모', N'최태성', N'다산초당(다산북스)', 15000, N'D:\MetaBookImage\역사의_쓸모.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (29, N'포노 사피엔스', N'최재붕', N'쌤앤파커스', 16800, N'D:\MetaBookImage\포노_사피엔스.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (30, N'사일런트 페이션트', N'알렉스 마이클리디스', N'해냄', 15800, N'D:\MetaBookImage\사일런트_페이션트.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (31, N'그것만 있을 리가 없잖아', N'요시타케 신스케', N'주니어김영사', 12000, N'D:\MetaBookImage\그것만_있을_리가_없잖아.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (32, N'우리가 빛의 속도로 갈 수 없다면', N'김초엽', N'허블', 14000, N'D:\MetaBookImage\우리가_빛의_속도로_갈_수_없다면.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (33, N'안드로이드는 전기양의 꿈을 꾸는가?', N'필립 K. 딕', N'폴라북스(현대문학)', 14000, N'D:\MetaBookImage\안드로이드는_전기양의_꿈을_꾸는가.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (34, N'펭귄의 여름', N'이원영', N'생각의힘', 15000, N'D:\MetaBookImage\펭귄의_여름.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (35, N'가재가 노래하는 곳', N'델리아 오언스', N'살림', 16000, N'D:\MetaBookImage\가재가_노래하는_곳.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (36, N'한자와 나오키 2', N'이케이도 준', N'인플루엔결(주)', 15000, N'D:\MetaBookImage\한자와_나오키_2.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (37, N'우리가 사랑한 소녀들', N'최현미, 노신회', N'혜화1117', 16500, N'D:\MetaBookImage\우리가_사랑한_소녀들.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (38, N'아기 동요 세상(분홍)', N'김혜진', N'스마트베어', 16500, N'D:\MetaBookImage\아기_동요_세상_분홍.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (39, N'2019 제10회 젊은작가상 수상작품집', N'박상영, 김희선', N'문학동네', 5500, N'D:\MetaBookImage\2019_제10회_젊은작가상_수상작품집.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (40, N'하이큐!! 36', N'후루다테 하루이치', N'대원씨아이', 5000, N'D:\MetaBookImage\하이큐_36.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (41, N'철학은 어떻게 삶의 무기가 되는가', N'야마구치 슈', N'다산초당(다산북스)', 16000, N'D:\MetaBookImage\철학은_어떻게_삶의_무기가_되는가.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (42, N'장수 고양이의 비밀', N'무라카미 하루키', N'문학동네', 14000, N'D:\MetaBookImage\장수_고양이의_비밀.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (43, N'해커스 토익 RC 리딩', N'David Cho', N'해커스어학연구소', 18800, N'D:\MetaBookImage\해커스_토익_RC_리딩.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (44, N'던전밥 7', N'쿠이 료코', N'(주)소미미디어', 7000, N'D:\MetaBookImage\던전밥_7.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (45, N'대변동 : 위기, 선택, 변화', N'재래드 다이아몬드', N'김영사', 24800, N'D:\MetaBookImage\대변동_위기_선택_변화.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (46, N'습관의 재발견', N'스티븐 기즈', N'비즈니스북스', 13000, N'D:\MetaBookImage\습관의_재발견.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (47, N'90년생이 온다', N'임홍택', N'웨일북', 14000, N'D:\MetaBookImage\90년생이_온다.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (48, N'아기 동요 세상(하늘)', N'김혜진', N'스마트베어', 16500, N'D:\MetaBookImage\아기_동요_세상_하늘.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (49, N'영어 그림책 공부법', N'정정혜', N'북하우스', 16500, N'D:\MetaBookImage\영어_그림책_공부법.PNG')
INSERT [dbo].[MetaDataBook] ([MetaDataBookID], [Title], [Writer], [Publisher], [Price], [Image]) VALUES (50, N'만화로 배우는 공룡의 생태', N'갈로아', N'한빛비즈', 17800, N'D:\MetaBookImage\만화로_배우는_공룡의_생태.PNG')
SET IDENTITY_INSERT [dbo].[MetaDataBook] OFF
SET IDENTITY_INSERT [dbo].[Sell] ON 

INSERT [dbo].[Sell] ([SellID], [SellerID], [RegistrationDate], [Checked]) VALUES (1, 1, CAST(N'2015-05-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Sell] ([SellID], [SellerID], [RegistrationDate], [Checked]) VALUES (2, 1, CAST(N'2015-07-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Sell] ([SellID], [SellerID], [RegistrationDate], [Checked]) VALUES (3, 5, CAST(N'2015-10-15T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Sell] ([SellID], [SellerID], [RegistrationDate], [Checked]) VALUES (4, 4, CAST(N'2016-05-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Sell] ([SellID], [SellerID], [RegistrationDate], [Checked]) VALUES (5, 17, CAST(N'2016-09-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Sell] ([SellID], [SellerID], [RegistrationDate], [Checked]) VALUES (6, 17, CAST(N'2017-02-18T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Sell] ([SellID], [SellerID], [RegistrationDate], [Checked]) VALUES (7, 10, CAST(N'2017-11-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Sell] ([SellID], [SellerID], [RegistrationDate], [Checked]) VALUES (8, 10, CAST(N'2017-12-25T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Sell] ([SellID], [SellerID], [RegistrationDate], [Checked]) VALUES (9, 10, CAST(N'2018-03-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Sell] ([SellID], [SellerID], [RegistrationDate], [Checked]) VALUES (10, 8, CAST(N'2018-03-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Sell] ([SellID], [SellerID], [RegistrationDate], [Checked]) VALUES (11, 8, CAST(N'2018-05-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Sell] ([SellID], [SellerID], [RegistrationDate], [Checked]) VALUES (12, 21, CAST(N'2018-08-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Sell] ([SellID], [SellerID], [RegistrationDate], [Checked]) VALUES (13, 22, CAST(N'2019-01-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Sell] ([SellID], [SellerID], [RegistrationDate], [Checked]) VALUES (14, 27, CAST(N'2019-06-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Sell] ([SellID], [SellerID], [RegistrationDate], [Checked]) VALUES (15, 30, CAST(N'2019-06-20T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Sell] ([SellID], [SellerID], [RegistrationDate], [Checked]) VALUES (16, 1, CAST(N'2019-06-25T20:10:38.913' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Sell] OFF
INSERT [dbo].[SellUsedBook] ([SellID], [Dummy], [UsedBookID]) VALUES (1, NULL, 1)
INSERT [dbo].[SellUsedBook] ([SellID], [Dummy], [UsedBookID]) VALUES (2, NULL, 2)
INSERT [dbo].[SellUsedBook] ([SellID], [Dummy], [UsedBookID]) VALUES (3, NULL, 3)
INSERT [dbo].[SellUsedBook] ([SellID], [Dummy], [UsedBookID]) VALUES (4, NULL, 4)
INSERT [dbo].[SellUsedBook] ([SellID], [Dummy], [UsedBookID]) VALUES (5, NULL, 5)
INSERT [dbo].[SellUsedBook] ([SellID], [Dummy], [UsedBookID]) VALUES (6, NULL, 6)
INSERT [dbo].[SellUsedBook] ([SellID], [Dummy], [UsedBookID]) VALUES (7, NULL, 7)
INSERT [dbo].[SellUsedBook] ([SellID], [Dummy], [UsedBookID]) VALUES (8, NULL, 8)
INSERT [dbo].[SellUsedBook] ([SellID], [Dummy], [UsedBookID]) VALUES (9, NULL, 9)
INSERT [dbo].[SellUsedBook] ([SellID], [Dummy], [UsedBookID]) VALUES (10, NULL, 10)
INSERT [dbo].[SellUsedBook] ([SellID], [Dummy], [UsedBookID]) VALUES (11, NULL, 11)
INSERT [dbo].[SellUsedBook] ([SellID], [Dummy], [UsedBookID]) VALUES (12, NULL, 12)
INSERT [dbo].[SellUsedBook] ([SellID], [Dummy], [UsedBookID]) VALUES (13, NULL, 13)
INSERT [dbo].[SellUsedBook] ([SellID], [Dummy], [UsedBookID]) VALUES (14, NULL, 14)
INSERT [dbo].[SellUsedBook] ([SellID], [Dummy], [UsedBookID]) VALUES (15, NULL, 15)
INSERT [dbo].[SellUsedBook] ([SellID], [Dummy], [UsedBookID]) VALUES (16, NULL, 16)
SET IDENTITY_INSERT [dbo].[UsedBook] ON 

INSERT [dbo].[UsedBook] ([UsedBookID], [MetaDataID], [Quality], [IsSell]) VALUES (1, 3, N'A', 0)
INSERT [dbo].[UsedBook] ([UsedBookID], [MetaDataID], [Quality], [IsSell]) VALUES (2, 18, N'C', 1)
INSERT [dbo].[UsedBook] ([UsedBookID], [MetaDataID], [Quality], [IsSell]) VALUES (3, 21, N'A', 1)
INSERT [dbo].[UsedBook] ([UsedBookID], [MetaDataID], [Quality], [IsSell]) VALUES (4, 8, N'B', 1)
INSERT [dbo].[UsedBook] ([UsedBookID], [MetaDataID], [Quality], [IsSell]) VALUES (5, 9, N'B', 0)
INSERT [dbo].[UsedBook] ([UsedBookID], [MetaDataID], [Quality], [IsSell]) VALUES (6, 50, N'C', 1)
INSERT [dbo].[UsedBook] ([UsedBookID], [MetaDataID], [Quality], [IsSell]) VALUES (7, 18, N'B', 1)
INSERT [dbo].[UsedBook] ([UsedBookID], [MetaDataID], [Quality], [IsSell]) VALUES (8, 13, N'F', 1)
INSERT [dbo].[UsedBook] ([UsedBookID], [MetaDataID], [Quality], [IsSell]) VALUES (9, 10, N'A', 1)
INSERT [dbo].[UsedBook] ([UsedBookID], [MetaDataID], [Quality], [IsSell]) VALUES (10, 25, N'B', 1)
INSERT [dbo].[UsedBook] ([UsedBookID], [MetaDataID], [Quality], [IsSell]) VALUES (11, 49, N'C', 1)
INSERT [dbo].[UsedBook] ([UsedBookID], [MetaDataID], [Quality], [IsSell]) VALUES (12, 43, N'A', 1)
INSERT [dbo].[UsedBook] ([UsedBookID], [MetaDataID], [Quality], [IsSell]) VALUES (13, 37, N'F', 1)
INSERT [dbo].[UsedBook] ([UsedBookID], [MetaDataID], [Quality], [IsSell]) VALUES (14, 30, N'B', 1)
INSERT [dbo].[UsedBook] ([UsedBookID], [MetaDataID], [Quality], [IsSell]) VALUES (15, 39, N'B', 1)
INSERT [dbo].[UsedBook] ([UsedBookID], [MetaDataID], [Quality], [IsSell]) VALUES (16, 3, N'A', 0)
SET IDENTITY_INSERT [dbo].[UsedBook] OFF
ALTER TABLE [dbo].[Buy]  WITH CHECK ADD  CONSTRAINT [FK_Buy_Customer] FOREIGN KEY([BuyerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Buy] CHECK CONSTRAINT [FK_Buy_Customer]
GO
ALTER TABLE [dbo].[BuyUsedBook]  WITH CHECK ADD  CONSTRAINT [FK_BuyUsedBook_Buy] FOREIGN KEY([BuyID])
REFERENCES [dbo].[Buy] ([BuyID])
GO
ALTER TABLE [dbo].[BuyUsedBook] CHECK CONSTRAINT [FK_BuyUsedBook_Buy]
GO
ALTER TABLE [dbo].[BuyUsedBook]  WITH CHECK ADD  CONSTRAINT [FK_BuyUsedBook_UsedBook] FOREIGN KEY([UsedBookID])
REFERENCES [dbo].[UsedBook] ([UsedBookID])
GO
ALTER TABLE [dbo].[BuyUsedBook] CHECK CONSTRAINT [FK_BuyUsedBook_UsedBook]
GO
ALTER TABLE [dbo].[Sell]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Customer] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Sell] CHECK CONSTRAINT [FK_Sale_Customer]
GO
ALTER TABLE [dbo].[SellUsedBook]  WITH CHECK ADD  CONSTRAINT [FK_SaleUsedBook_Sale] FOREIGN KEY([SellID])
REFERENCES [dbo].[Sell] ([SellID])
GO
ALTER TABLE [dbo].[SellUsedBook] CHECK CONSTRAINT [FK_SaleUsedBook_Sale]
GO
ALTER TABLE [dbo].[SellUsedBook]  WITH CHECK ADD  CONSTRAINT [FK_SaleUsedBook_UsedBook] FOREIGN KEY([UsedBookID])
REFERENCES [dbo].[UsedBook] ([UsedBookID])
GO
ALTER TABLE [dbo].[SellUsedBook] CHECK CONSTRAINT [FK_SaleUsedBook_UsedBook]
GO
ALTER TABLE [dbo].[UsedBook]  WITH CHECK ADD  CONSTRAINT [FK_UsedBook_MetaDataBook] FOREIGN KEY([MetaDataID])
REFERENCES [dbo].[MetaDataBook] ([MetaDataBookID])
GO
ALTER TABLE [dbo].[UsedBook] CHECK CONSTRAINT [FK_UsedBook_MetaDataBook]
GO
USE [master]
GO
ALTER DATABASE [YesAlaMungo] SET  READ_WRITE 
GO
