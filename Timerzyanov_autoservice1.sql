USE [master]
GO
/****** Object:  Database [Timerzyanov_autoservice]    Script Date: 26.09.2023 23:28:37 ******/
CREATE DATABASE [Timerzyanov_autoservice]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Timerzyanov_autoservice', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Timerzyanov_autoservice.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Timerzyanov_autoservice_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Timerzyanov_autoservice_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Timerzyanov_autoservice].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Timerzyanov_autoservice] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET ARITHABORT OFF 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET RECOVERY FULL 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET  MULTI_USER 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Timerzyanov_autoservice] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Timerzyanov_autoservice] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Timerzyanov_autoservice', N'ON'
GO
USE [Timerzyanov_autoservice]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 26.09.2023 23:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 26.09.2023 23:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](50) NOT NULL,
	[Пол] [nchar](1) NOT NULL,
	[Телефон] [nvarchar](50) NOT NULL,
	[Дата_рождения] [date] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Дата_регистрации] [date] NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 26.09.2023 23:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 26.09.2023 23:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 26.09.2023 23:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 26.09.2023 23:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 26.09.2023 23:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 26.09.2023 23:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 26.09.2023 23:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 26.09.2023 23:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 26.09.2023 23:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Наименование_услуги] [nvarchar](50) NOT NULL,
	[Главное_изображение] [nvarchar](100) NOT NULL,
	[Длительность] [nvarchar](50) NOT NULL,
	[Стоимость] [numeric](18, 2) NOT NULL,
	[Действующая_скидка] [int] NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 26.09.2023 23:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 26.09.2023 23:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (1, N'Мишина', N'Иветта', N'Андреевна', N'ж', N'7(3926)244-81-96', CAST(N'2002-10-05' AS Date), N'aukjan@yahoo.com', CAST(N'2016-01-24' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (2, N'Суворова', N'Божена', N'Анатольевна', N'ж', N'7(347)895-86-57', CAST(N'1981-03-09' AS Date), N'attwood@aol.com', CAST(N'2016-01-28' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (3, N'Белозёрова', N'Диана', N'Антоновна', N'ж', N'7(9900)174-59-87', CAST(N'1989-02-27' AS Date), N'dialworld@aol.com', CAST(N'2017-01-30' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (4, N'Дементьева', N'Эдита', N'Онисимовна', N'ж', N'7(198)922-28-76', CAST(N'1975-09-17' AS Date), N'frosal@hotmail.com', CAST(N'2018-11-24' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (5, N'Блинов', N'Евгений', N'Мэлсович', N'м', N'7(0852)321-82-64', CAST(N'1994-01-05' AS Date), N'moxfulder@outlook.com', CAST(N'2017-05-07' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (6, N'Морозов', N'Наум', N'Валерьянович', N'м', N'7(636)050-96-13', CAST(N'1985-07-04' AS Date), N'salesgeek@mac.com', CAST(N'2016-05-02' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (7, N'Попова', N'Харита', N'Якуновна', N'ж', N'7(335)386-81-06', CAST(N'1997-12-16' AS Date), N'firstpr@verizon.net', CAST(N'2016-07-05' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (8, N'Крюков', N'Наум', N'Ильяович', N'м', N'7(81)657-88-92', CAST(N'1993-11-17' AS Date), N'floxy@hotmail.com', CAST(N'2017-02-01' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (9, N'Крюкова', N'Авигея', N'Святославовна', N'ж', N'7(499)318-88-53', CAST(N'2000-08-10' AS Date), N'simone@gmail.com', CAST(N'2018-01-03' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (10, N'Беляева', N'Сабрина', N'Федосеевна', N'ж', N'7(6580)534-32-58', CAST(N'1972-07-26' AS Date), N'agapow@gmail.com', CAST(N'2017-06-14' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (11, N'Медведев', N'Святослав', N'Юлианович', N'м', N'7(3520)435-21-20', CAST(N'1972-10-04' AS Date), N'hllam@comcast.net', CAST(N'2018-10-13' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (12, N'Блохин', N'Пантелеймон', N'Феликсович', N'м', N'7(9524)556-48-98', CAST(N'1978-03-06' AS Date), N'balchen@comcast.net', CAST(N'2018-02-14' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (13, N'Горбачёва', N'Никки', N'Еремеевна', N'ж', N'7(94)789-69-20', CAST(N'1987-04-21' AS Date), N'chinthaka@att.net', CAST(N'2018-08-16' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (14, N'Архипова', N'Прасковья', N'Валерьевна', N'ж', N'7(86)540-10-21', CAST(N'1979-01-09' AS Date), N'cgcra@live.com', CAST(N'2018-07-23' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (15, N'Андреева', N'Патрисия', N'Валерьевна', N'ж', N'7(9648)953-81-26', CAST(N'1993-11-18' AS Date), N'jigsaw@aol.com', CAST(N'2016-07-17' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (16, N'Горшкова', N'Марта', N'Иосифовна', N'ж', N'7(544)650-59-03', CAST(N'2001-02-13' AS Date), N'gbacon@mac.com', CAST(N'2016-08-04' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (17, N'Орлова', N'Влада', N'Мартыновна', N'ж', N'7(2506)433-38-35', CAST(N'1990-06-26' AS Date), N'rnelson@yahoo.ca', CAST(N'2016-03-21' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (18, N'Ершов', N'Глеб', N'Федорович', N'м', N'7(2608)298-40-82', CAST(N'1970-06-14' AS Date), N'sjava@aol.com', CAST(N'2016-09-14' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (19, N'Быкова', N'Тала', N'Георгьевна', N'ж', N'7(13)915-53-53', CAST(N'2000-02-22' AS Date), N'ganter@optonline.net', CAST(N'2016-08-13' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (20, N'Новиков', N'Адриан', N'Аркадьевич', N'м', N'7(70)572-33-62', CAST(N'1974-01-15' AS Date), N'multiplx@verizon.net', CAST(N'2018-11-23' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (21, N'Филатов', N'Аристарх', N'Дмитриевич', N'м', N'7(696)235-29-24', CAST(N'1989-05-29' AS Date), N'hampton@att.net', CAST(N'2017-01-11' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (22, N'Анисимова', N'Тамара', N'Витальевна', N'ж', N'7(66)128-04-10', CAST(N'1988-06-16' AS Date), N'schwaang@mac.com', CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (23, N'Кудряшов', N'Аверкий', N'Константинович', N'м', N'7(88)732-96-30', CAST(N'1991-07-26' AS Date), N'nanop@msn.com', CAST(N'2018-03-08' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (24, N'Колобов', N'Орест', N'Юлианович', N'м', N'7(1680)508-58-26', CAST(N'2001-07-14' AS Date), N'parkes@verizon.net', CAST(N'2017-01-01' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (25, N'Кузьмина', N'Дэнна', N'Витальевна', N'ж', N'7(9940)977-45-73', CAST(N'1993-08-24' AS Date), N'nichoj@mac.com', CAST(N'2016-03-27' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (26, N'Александров', N'Станислав', N'Эдуардович', N'м', N'7(18)164-05-12', CAST(N'1981-07-04' AS Date), N'bigmauler@aol.com', CAST(N'2018-11-08' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (27, N'Андреев', N'Станислав', N'Максович', N'м', N'7(02)993-91-28', CAST(N'1975-10-10' AS Date), N'budinger@mac.com', CAST(N'2017-12-26' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (28, N'Дроздов', N'Вольдемар', N'Артемович', N'м', N'7(307)456-99-05', CAST(N'1976-02-07' AS Date), N'smpeters@me.com', CAST(N'2017-07-18' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (29, N'Абрамов', N'Станислав', N'Филатович', N'м', N'7(6545)478-87-79', CAST(N'1989-05-18' AS Date), N'solomon@att.net', CAST(N'2016-12-08' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (30, N'Гусева', N'Роза', N'Дмитриевна', N'ж', N'7(23)064-51-84', CAST(N'1999-02-13' AS Date), N'martyloo@live.com', CAST(N'2017-12-12' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (31, N'Лазарев', N'Алексей', N'Богданович', N'м', N'7(0055)737-37-48', CAST(N'1977-03-10' AS Date), N'claesjac@me.com', CAST(N'2017-01-02' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (32, N'Большаков', N'Вадим', N'Данилович', N'м', N'7(386)641-13-37', CAST(N'1970-05-15' AS Date), N'uncle@gmail.com', CAST(N'2018-08-04' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (33, N'Ефремов', N'Витольд', N'Авксентьевич', N'м', N'7(93)922-14-03', CAST(N'1975-12-02' AS Date), N'kwilliams@yahoo.ca', CAST(N'2018-04-09' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (34, N'Игнатов', N'Захар', N'Павлович', N'м', N'7(578)574-73-36', CAST(N'1998-10-07' AS Date), N'dieman@icloud.com', CAST(N'2017-11-10' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (35, N'Калашников', N'Артур', N'Юрьевич', N'м', N'7(147)947-47-21', CAST(N'1972-12-13' AS Date), N'oevans@aol.com', CAST(N'2017-08-20' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (36, N'Овчинникова', N'Лаура', N'Еремеевна', N'ж', N'7(85)829-33-79', CAST(N'1992-04-03' AS Date), N'carcus@yahoo.ca', CAST(N'2018-11-24' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (37, N'Голубев', N'Иосиф', N'Тимофеевич', N'м', N'7(78)972-73-11', CAST(N'1982-05-06' AS Date), N'smcnabb@att.net', CAST(N'2018-08-18' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (38, N'Галкин', N'Эрик', N'Онисимович', N'м', N'7(759)873-77-39', CAST(N'1975-01-18' AS Date), N'snunez@verizon.net', CAST(N'2016-07-19' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (39, N'Некрасов', N'Варлам', N'Михайлович', N'м', N'7(019)258-06-35', CAST(N'2000-11-12' AS Date), N'dogdude@verizon.net', CAST(N'2017-12-03' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (40, N'Федотов', N'Осип', N'Анатольевич', N'м', N'7(590)702-33-06', CAST(N'1971-04-13' AS Date), N'breegster@hotmail.com', CAST(N'2018-07-23' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (41, N'Смирнов', N'Мартын', N'Арсеньевич', N'м', N'7(6251)589-02-43', CAST(N'1996-06-25' AS Date), N'haddawy@live.com', CAST(N'2017-02-07' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (42, N'Копылов', N'Касьян', N'Робертович', N'м', N'7(5774)679-82-06', CAST(N'1983-08-04' AS Date), N'crobles@sbcglobal.net', CAST(N'2018-03-18' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (43, N'Дмитриева', N'Элина', N'Даниловна', N'ж', N'7(787)140-48-84', CAST(N'1988-12-10' AS Date), N'vmalik@live.com', CAST(N'2017-02-11' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (44, N'Бирюкова', N'Инара', N'Улебовна', N'ж', N'7(098)346-50-58', CAST(N'1978-07-21' AS Date), N'smpeters@hotmail.com', CAST(N'2017-10-01' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (45, N'Васильев', N'Оскар', N'Богданович', N'м', N'7(585)801-94-29', CAST(N'1971-01-30' AS Date), N'miturria@verizon.net', CAST(N'2017-05-28' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (46, N'Киселёв', N'Устин', N'Яковлевич', N'м', N'7(83)334-52-76', CAST(N'1985-01-08' AS Date), N'dalamb@verizon.net', CAST(N'2018-06-21' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (47, N'Кузьмин', N'Леонтий', N'Валерьянович', N'м', N'7(1340)148-90-68', CAST(N'2000-05-05' AS Date), N'msloan@hotmail.com', CAST(N'2017-10-12' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (48, N'Ефимова', N'Магда', N'Платоновна', N'ж', N'7(9261)386-15-92', CAST(N'1995-08-16' AS Date), N'rbarreira@me.com', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (49, N'Воронова', N'Изабелла', N'Вячеславовна', N'ж', N'7(17)433-44-98', CAST(N'1999-09-24' AS Date), N'kildjean@sbcglobal.net', CAST(N'2017-12-21' AS Date))
INSERT [dbo].[Clients] ([ID], [Фамилия], [Имя], [Отчество], [Пол], [Телефон], [Дата_рождения], [Email], [Дата_регистрации]) VALUES (50, N'Волков', N'Людвиг', N'Витальевич', N'м', N'7(8459)592-05-58', CAST(N'1977-12-27' AS Date), N'jrkorson@msn.com', CAST(N'2016-04-27' AS Date))
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'ж', NULL)
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'м', NULL)
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (1, N'Замена жидкости в кондиционере', N'Услуги автосервиса\Кондиционер.jpg', N'8 час.', CAST(3040.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (2, N'Ремонт и замена коллектора', N'Услуги автосервиса\Выхлопная система.jpg', N'150 мин.', CAST(2770.00 AS Numeric(18, 2)), 15)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (3, N'Замена актуатора сцепления', N'Услуги автосервиса\Сцепление.jpg', N'330 мин.', CAST(4100.00 AS Numeric(18, 2)), 15)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (4, N'Замена жидкости ГУР', N'Услуги автосервиса\ГУР.png', N'9 час.', CAST(2380.00 AS Numeric(18, 2)), 20)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (5, N'Заправка кондиционеров', N'Услуги автосервиса\Кондиционер.jpg', N'2 час.', CAST(4860.00 AS Numeric(18, 2)), 5)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (6, N'Замена масла в вариаторе', N'Услуги автосервиса\Вариатор.jpg', N'2 час.', CAST(4720.00 AS Numeric(18, 2)), 5)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (7, N'Ремонт двигателя', N'Услуги автосервиса\Двигатель.png', N'4 час.', CAST(2470.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (8, N'Замена заднего сальника АКПП', N'Услуги автосервиса\АКПП.jpg', N'390 мин.', CAST(1510.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (9, N'Покраска', N'Услуги автосервиса\Дополнительные услуги.png', N'2 час.', CAST(2370.00 AS Numeric(18, 2)), 15)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (10, N'Мойка колес', N'Услуги автосервиса\Шиномонтаж.jpg', N'570 мин.', CAST(3490.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (11, N'Замена прокладки впускного-выпуского коллектора', N'Услуги автосервиса\Выхлопная система.jpg', N'3 час.', CAST(2980.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (12, N'Диагностика работы двигателя', N'Услуги автосервиса\Двигатель.png', N'150 мин.', CAST(2760.00 AS Numeric(18, 2)), 10)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (13, N'Установка сигнализации', N'Услуги автосервиса\Электрика.png', N'4 час.', CAST(1760.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (14, N'Замена компрессора кондиционера', N'Услуги автосервиса\Кондиционер.jpg', N'270 мин.', CAST(2720.00 AS Numeric(18, 2)), 10)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (15, N'Замена ремня привода ГУР', N'Услуги автосервиса\ГУР.png', N'10 час.', CAST(3350.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (16, N'Замена тормозных колодок', N'Услуги автосервиса\Техническое обслуживание.png', N'8 час.', CAST(4260.00 AS Numeric(18, 2)), 5)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (17, N'Замена масла', N'Услуги автосервиса\Техническое обслуживание.png', N'510 мин.', CAST(1430.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (18, N'Замена цепи ГРМ', N'Услуги автосервиса\Двигатель.png', N'6 час.', CAST(4570.00 AS Numeric(18, 2)), 20)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (19, N'Замена бензонасоса', N'Услуги автосервиса\Топливная система.png', N'4 час.', CAST(1780.00 AS Numeric(18, 2)), 10)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (20, N'Ремонт приводного вала', N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', N'210 мин.', CAST(4520.00 AS Numeric(18, 2)), 5)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (21, N'Замена подшипника компрессора кондиционера', N'Услуги автосервиса\Кондиционер.jpg', N'330 мин.', CAST(1110.00 AS Numeric(18, 2)), 20)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (22, N'Снятие и установка колес', N'Услуги автосервиса\Шиномонтаж.jpg', N'390 мин.', CAST(3130.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (23, N'Замена лямбда зонда', N'Услуги автосервиса\Выхлопная система.jpg', N'270 мин.', CAST(770.00 AS Numeric(18, 2)), 5)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (24, N'Замена привода в сборе', N'Услуги автосервиса\transmission.jpg', N'8 час.', CAST(3890.00 AS Numeric(18, 2)), 15)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (25, N'Замена трубки кондиционера', N'Услуги автосервиса\Кондиционер.jpg', N'3 час.', CAST(2810.00 AS Numeric(18, 2)), 15)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (26, N'Замена ремня кондиционера', N'Услуги автосервиса\Кондиционер.jpg', N'8 час.', CAST(4650.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (27, N'Замена охлаждающей жидкости', N'Услуги автосервиса\Техническое обслуживание.png', N'210 мин.', CAST(1590.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (28, N'Замена троса сцепления', N'Услуги автосервиса\Сцепление.jpg', N'8 час.', CAST(4460.00 AS Numeric(18, 2)), 5)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (29, N'Замена масла в МКПП', N'Услуги автосервиса\КПП.png', N'9 час.', CAST(4490.00 AS Numeric(18, 2)), 20)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (30, N'Замена рулевой рейки', N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', N'570 мин.', CAST(4840.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (31, N'Ремонт дисков', N'Услуги автосервиса\Шиномонтаж.jpg', N'270 мин.', CAST(3860.00 AS Numeric(18, 2)), 10)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (32, N'Замена масла заднего редуктора (моста)', N'Услуги автосервиса\transmission.jpg', N'7 час.', CAST(840.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (33, N'Замена подшипника задней ступицы', N'Услуги автосервиса\transmission.jpg', N'270 мин.', CAST(1860.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (34, N'Восстановление рулевых реек', N'Услуги автосервиса\Подвеска.png', N'2 час.', CAST(1020.00 AS Numeric(18, 2)), 20)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (35, N'Замена рулевой тяги', N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', N'3 час.', CAST(570.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (36, N'Ремонт и замена гидроблока АКПП', N'Услуги автосервиса\АКПП.jpg', N'270 мин.', CAST(2040.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (37, N'Замена масла раздаточной коробки', N'Услуги автосервиса\transmission.jpg', N'510 мин.', CAST(2070.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (38, N'Диагностика кондиционера', N'Услуги автосервиса\Кондиционер.jpg', N'10 час.', CAST(2590.00 AS Numeric(18, 2)), 10)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (39, N'Ремонт и замена катализатора', N'Услуги автосервиса\Выхлопная система.jpg', N'270 мин.', CAST(500.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (40, N'Замена гофры глушителя', N'Услуги автосервиса\Выхлопная система.jpg', N'270 мин.', CAST(760.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (41, N'Замена ремня ГРМ', N'Услуги автосервиса\Двигатель.png', N'150 мин.', CAST(4630.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (42, N'Ремонт редуктора', N'Услуги автосервиса\КПП.png', N'8 час.', CAST(870.00 AS Numeric(18, 2)), 15)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (43, N'Замена электромагнитного клапана без снятия ТНВД', N'Услуги автосервиса\diz.jpg', N'450 мин.', CAST(4610.00 AS Numeric(18, 2)), 10)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (44, N'Вулканизация шин', N'Услуги автосервиса\Шиномонтаж.jpg', N'330 мин.', CAST(540.00 AS Numeric(18, 2)), 20)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (45, N'Ремонт стартера', N'Услуги автосервиса\Электрика.png', N'8 час.', CAST(2680.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (46, N'Ремонт коробки передач', N'Услуги автосервиса\КПП.png', N'450 мин.', CAST(1850.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (47, N'Жидкостная промывка топливной системы', N'Услуги автосервиса\Топливная система.png', N'6 час.', CAST(3620.00 AS Numeric(18, 2)), 15)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (48, N'Ремонт генератора', N'Услуги автосервиса\Электрика.png', N'210 мин.', CAST(1700.00 AS Numeric(18, 2)), 20)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (49, N'Замена масла АКПП', N'Услуги автосервиса\АКПП.jpg', N'450 мин.', CAST(2430.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (50, N'Диагностика трансмиссии', N'Услуги автосервиса\transmission.jpg', N'2 час.', CAST(2790.00 AS Numeric(18, 2)), 20)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (51, N'Монтаж и снятие шин с диска', N'Услуги автосервиса\Шиномонтаж.jpg', N'10 час.', CAST(3990.00 AS Numeric(18, 2)), 15)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (52, N'Замена подшипника передней ступицы', N'Услуги автосервиса\transmission.jpg', N'330 мин.', CAST(4020.00 AS Numeric(18, 2)), 15)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (53, N'Замена главного цилиндра сцепления', N'Услуги автосервиса\Сцепление.jpg', N'150 мин.', CAST(4910.00 AS Numeric(18, 2)), 5)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (54, N'Установка автомагнитолы', N'Услуги автосервиса\Электрика.png', N'270 мин.', CAST(3210.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (55, N'Диагностика рулевых тяг', N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', N'3 час.', CAST(1680.00 AS Numeric(18, 2)), 5)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (56, N'Замена радиатора кондиционера', N'Услуги автосервиса\Кондиционер.jpg', N'9 час.', CAST(1770.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (57, N'Замена тормозной жидкости', N'Услуги автосервиса\Техническое обслуживание.png', N'6 час.', CAST(2200.00 AS Numeric(18, 2)), 10)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (58, N'Ремонт рулевого управления', N'Услуги автосервиса\Подвеска.png', N'2 час.', CAST(3440.00 AS Numeric(18, 2)), 20)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (59, N'Замена заднего редуктора', N'Услуги автосервиса\transmission.jpg', N'330 мин.', CAST(2240.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (60, N'Дефектация CVT', N'Услуги автосервиса\Вариатор.jpg', N'3 час.', CAST(1830.00 AS Numeric(18, 2)), 5)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (61, N'Замена карданного вала', N'Услуги автосервиса\transmission.jpg', N'2 час.', CAST(4450.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (62, N'Замена сцепления', N'Услуги автосервиса\КПП.png', N'330 мин.', CAST(4320.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (63, N'Установка системы автозапуска', N'Услуги автосервиса\Электрика.png', N'9 час.', CAST(3620.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (64, N'Замена опоры АКПП', N'Услуги автосервиса\АКПП.jpg', N'5 час.', CAST(2540.00 AS Numeric(18, 2)), 10)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (65, N'Ремонт бензонасоса', N'Услуги автосервиса\Топливная система.png', N'210 мин.', CAST(500.00 AS Numeric(18, 2)), 15)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (66, N'Замена масла переднего редуктора (моста)', N'Услуги автосервиса\transmission.jpg', N'9 час.', CAST(3950.00 AS Numeric(18, 2)), 5)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (67, N'Ремонт подвесного подшипника', N'Услуги автосервиса\transmission.jpg', N'7 час.', CAST(4440.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (68, N'Тестирование форсунок (стенд)', N'Услуги автосервиса\Топливная система.png', N'6 час.', CAST(1600.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (69, N'Диагностика сцепления', N'Услуги автосервиса\Сцепление.jpg', N'6 час.', CAST(4210.00 AS Numeric(18, 2)), 20)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (70, N'Замена ступицы в сборе', N'Услуги автосервиса\transmission.jpg', N'150 мин.', CAST(4250.00 AS Numeric(18, 2)), 20)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (71, N'Антибактериальная обработка кондиционера', N'Услуги автосервиса\Кондиционер.jpg', N'450 мин.', CAST(4580.00 AS Numeric(18, 2)), 20)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (72, N'Ремонт глушителя', N'Услуги автосервиса\Выхлопная система.jpg', N'150 мин.', CAST(2100.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (73, N'Диагностика рулевого редуктора', N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', N'3 час.', CAST(2930.00 AS Numeric(18, 2)), 10)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (74, N'Диагностика подвески', N'Услуги автосервиса\Подвеска.png', N'330 мин.', CAST(1460.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (75, N'Замена свечей', N'Услуги автосервиса\Техническое обслуживание.png', N'2 час.', CAST(2240.00 AS Numeric(18, 2)), 10)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (76, N'Диагностика инжектора', N'Услуги автосервиса\Топливная система.png', N'330 мин.', CAST(3390.00 AS Numeric(18, 2)), 5)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (77, N'Комплексная диагностика автомобиля', N'Услуги автосервиса\Техническое обслуживание.png', N'10 час.', CAST(1120.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (78, N'Ремонт раздаточной коробки', N'Услуги автосервиса\КПП.png', N'10 час.', CAST(3610.00 AS Numeric(18, 2)), 5)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (79, N'Удаление катализатора', N'Услуги автосервиса\Дополнительные услуги.png', N'510 мин.', CAST(1930.00 AS Numeric(18, 2)), 10)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (80, N'Снятие/установка форсунок', N'Услуги автосервиса\diz.jpg', N'5 час.', CAST(1470.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (81, N'Развал-схождение', N'Услуги автосервиса\Подвеска.png', N'3 час.', CAST(3890.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (82, N'Замена выжимного подшипника', N'Услуги автосервиса\Сцепление.jpg', N'10 час.', CAST(2250.00 AS Numeric(18, 2)), 5)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (83, N'Чистка форсунок ультразвуком', N'Услуги автосервиса\Топливная система.png', N'4 час.', CAST(3920.00 AS Numeric(18, 2)), 5)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (84, N'Ремонт компрессора кондиционера', N'Услуги автосервиса\Кондиционер.jpg', N'150 мин.', CAST(4760.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (85, N'Замена цилиндра сцепления', N'Услуги автосервиса\Сцепление.jpg', N'8 час.', CAST(810.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (86, N'Ремонт подвески (ходовой)', N'Услуги автосервиса\Подвеска.png', N'3 час.', CAST(680.00 AS Numeric(18, 2)), 5)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (87, N'Замена фильтров', N'Услуги автосервиса\Техническое обслуживание.png', N'210 мин.', CAST(530.00 AS Numeric(18, 2)), 15)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (88, N'Кузовной ремонт', N'Услуги автосервиса\Дополнительные услуги.png', N'150 мин.', CAST(2750.00 AS Numeric(18, 2)), 5)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (89, N'Замена прокладки приемной трубки', N'Услуги автосервиса\Выхлопная система.jpg', N'570 мин.', CAST(4680.00 AS Numeric(18, 2)), 20)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (90, N'Диагностика выхлопной системы автомобиля', N'Услуги автосервиса\Выхлопная система.jpg', N'3 час.', CAST(2550.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (91, N'Балансировка колес', N'Услуги автосервиса\Шиномонтаж.jpg', N'390 мин.', CAST(4690.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (92, N'Ремонт автоэлектрики', N'Услуги автосервиса\Электрика.png', N'450 мин.', CAST(4230.00 AS Numeric(18, 2)), 10)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (93, N'ТО с сохранением гарантии', N'Услуги автосервиса\Техническое обслуживание.png', N'270 мин.', CAST(4300.00 AS Numeric(18, 2)), 20)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (94, N'Ремонт карданного вала', N'Услуги автосервиса\transmission.jpg', N'210 мин.', CAST(780.00 AS Numeric(18, 2)), 5)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (95, N'Ремонт сцепления', N'Услуги автосервиса\КПП.png', N'10 час.', CAST(3290.00 AS Numeric(18, 2)), 25)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (96, N'Замена кулисы АКПП', N'Услуги автосервиса\АКПП.jpg', N'6 час.', CAST(3250.00 AS Numeric(18, 2)), 10)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (97, N'Ремонт кронштейна глушителя', N'Услуги автосервиса\Выхлопная система.jpg', N'570 мин.', CAST(1410.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (98, N'Замена сальника привода', N'Услуги автосервиса\transmission.jpg', N'570 мин.', CAST(3820.00 AS Numeric(18, 2)), 15)
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (99, N'Замена пыльника шруса', N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', N'5 час.', CAST(4730.00 AS Numeric(18, 2)), 0)
GO
INSERT [dbo].[Services] ([ID], [Наименование_услуги], [Главное_изображение], [Длительность], [Стоимость], [Действующая_скидка]) VALUES (100, N'Замена маховика', N'Услуги автосервиса\Сцепление.jpg', N'10 час.', CAST(2400.00 AS Numeric(18, 2)), 25)
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_Gender] FOREIGN KEY([Пол])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Clients] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Clients]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Services]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Services]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [Timerzyanov_autoservice] SET  READ_WRITE 
GO
