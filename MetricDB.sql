USE [master]
GO
/****** Object:  Database [MetricsDB]    Script Date: 8/21/2022 4:51:04 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'MetricsDB')
BEGIN
CREATE DATABASE [MetricsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MetricsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MetricsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MetricsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MetricsDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [MetricsDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MetricsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MetricsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MetricsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MetricsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MetricsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MetricsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MetricsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MetricsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MetricsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MetricsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MetricsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MetricsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MetricsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MetricsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MetricsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MetricsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MetricsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MetricsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MetricsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MetricsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MetricsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MetricsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MetricsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MetricsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MetricsDB] SET  MULTI_USER 
GO
ALTER DATABASE [MetricsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MetricsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MetricsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MetricsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MetricsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MetricsDB] SET QUERY_STORE = OFF
GO
USE [MetricsDB]
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
USE [MetricsDB]
GO
/****** Object:  Table [dbo].[ConversionUnits]    Script Date: 8/21/2022 4:51:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConversionUnits]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ConversionUnits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuantityId] [int] NOT NULL,
	[ConversionRate] [decimal](18, 5) NOT NULL,
	[MetricUnitId] [int] NOT NULL,
	[ImperialUnitId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ConversionUnits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Quantity]    Script Date: 8/21/2022 4:51:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Quantity]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Quantity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_MeasurementType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Units]    Script Date: 8/21/2022 4:51:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Units]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Units](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Symbol] [varchar](10) NOT NULL,
	[QuantityId] [int] NOT NULL,
	[UnitType] [int] NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ConversionUnits] ON 
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (1, 1, CAST(0.03937 AS Decimal(18, 5)), 1, 5, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (2, 1, CAST(0.39370 AS Decimal(18, 5)), 2, 5, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (3, 1, CAST(1.09360 AS Decimal(18, 5)), 3, 7, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (4, 1, CAST(0.62140 AS Decimal(18, 5)), 4, 8, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (5, 1, CAST(2.54000 AS Decimal(18, 5)), 5, 2, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (6, 1, CAST(0.30480 AS Decimal(18, 5)), 6, 3, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (7, 1, CAST(0.91440 AS Decimal(18, 5)), 7, 3, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (9, 1, CAST(1.60930 AS Decimal(18, 5)), 8, 5, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (10, 2, CAST(0.15500 AS Decimal(18, 5)), 9, 13, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (11, 2, CAST(1.19600 AS Decimal(18, 5)), 10, 16, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (12, 2, CAST(2.47110 AS Decimal(18, 5)), 11, 17, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (13, 2, CAST(0.38610 AS Decimal(18, 5)), 10, 18, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (14, 2, CAST(6.45160 AS Decimal(18, 5)), 13, 9, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (15, 2, CAST(0.09290 AS Decimal(18, 5)), 15, 10, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (16, 2, CAST(0.83610 AS Decimal(18, 5)), 16, 10, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (17, 2, CAST(4046.90000 AS Decimal(18, 5)), 17, 10, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (18, 2, CAST(2.59000 AS Decimal(18, 5)), 18, 12, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (19, 3, CAST(0.06100 AS Decimal(18, 5)), 19, 33, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (20, 3, CAST(0.03530 AS Decimal(18, 5)), 20, 34, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (22, 3, CAST(1.30800 AS Decimal(18, 5)), 21, 35, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (23, 3, CAST(29.57400 AS Decimal(18, 5)), 23, 37, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (24, 3, CAST(0.47320 AS Decimal(18, 5)), 38, 22, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (25, 3, CAST(3.78540 AS Decimal(18, 5)), 24, 22, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (26, 4, CAST(0.03530 AS Decimal(18, 5)), 26, 23, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (27, 4, CAST(2.20460 AS Decimal(18, 5)), 27, 29, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (28, 4, CAST(0.45360 AS Decimal(18, 5)), 29, 27, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (29, 5, CAST(32.00000 AS Decimal(18, 5)), 30, 31, 1)
GO
INSERT [dbo].[ConversionUnits] ([Id], [QuantityId], [ConversionRate], [MetricUnitId], [ImperialUnitId], [IsActive]) VALUES (30, 5, CAST(1.80000 AS Decimal(18, 5)), 31, 30, 1)
GO
SET IDENTITY_INSERT [dbo].[ConversionUnits] OFF
GO
SET IDENTITY_INSERT [dbo].[Quantity] ON 
GO
INSERT [dbo].[Quantity] ([Id], [Name], [IsActive]) VALUES (1, N'Length', 1)
GO
INSERT [dbo].[Quantity] ([Id], [Name], [IsActive]) VALUES (2, N'Area', 1)
GO
INSERT [dbo].[Quantity] ([Id], [Name], [IsActive]) VALUES (3, N'Volume', 1)
GO
INSERT [dbo].[Quantity] ([Id], [Name], [IsActive]) VALUES (4, N'Mass', 1)
GO
INSERT [dbo].[Quantity] ([Id], [Name], [IsActive]) VALUES (5, N'Temperature', 1)
GO
SET IDENTITY_INSERT [dbo].[Quantity] OFF
GO
SET IDENTITY_INSERT [dbo].[Units] ON 
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (1, N'millimeter', N'mm', 1, 1)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (2, N'centimeter', N'cm', 1, 1)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (3, N'meter', N'm', 1, 1)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (4, N'kilometer', N'km', 1, 1)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (5, N'inch', N'in', 1, 2)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (6, N'foot', N'ft', 1, 2)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (7, N'yard', N'yd', 1, 2)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (8, N'mile', N'mi', 1, 2)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (9, N'square centimeter', N'cm2', 2, 1)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (10, N'square meter', N'm2', 2, 1)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (11, N'hectare', N'ha', 2, 1)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (12, N'square kilometer', N'km2', 2, 1)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (13, N'square inch', N'in2', 2, 2)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (15, N'square feet', N'ft2', 2, 2)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (16, N'square yard', N'yd2', 2, 2)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (17, N'acre', N'ac', 2, 2)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (18, N'square mile', N'mile2', 2, 2)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (19, N'cubic centimeter', N'cm3', 3, 1)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (20, N'cubic decimeter', N'dm3', 3, 1)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (21, N'cubic meter', N'm3', 3, 1)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (22, N'liter', N'l', 3, 1)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (23, N'ounce', N'fl oz', 3, 2)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (24, N'gallon', N'gal', 3, 2)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (25, N'milligram', N'mg', 4, 1)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (26, N'gram', N'gm', 4, 1)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (27, N'kilogram', N'kg', 4, 1)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (28, N'tonne', N't', 4, 1)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (29, N'pound', N'lb', 4, 2)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (30, N'Fahrenheit', N'°F
', 5, 2)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (31, N'Celsius', N'°C
', 5, 1)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (33, N'Cubic Inch', N'in3', 3, 2)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (34, N'Cubic Feet', N'ft3', 3, 2)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (35, N'Cubic Yard', N'yd3', 3, 2)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (37, N'Milliliter', N'ml', 3, 1)
GO
INSERT [dbo].[Units] ([Id], [Name], [Symbol], [QuantityId], [UnitType]) VALUES (38, N'Pint', N'pt', 3, 2)
GO
SET IDENTITY_INSERT [dbo].[Units] OFF
GO
USE [master]
GO
ALTER DATABASE [MetricsDB] SET  READ_WRITE 
GO
