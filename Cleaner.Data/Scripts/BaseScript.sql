USE [master]
GO
/****** Object:  Database [HRDB]    Script Date: 4/1/2019 3:12:19 PM ******/
CREATE DATABASE [HRDB] ON  PRIMARY 
( NAME = N'HRDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HRDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HRDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HRDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HRDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HRDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HRDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HRDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HRDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HRDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HRDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HRDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HRDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HRDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HRDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HRDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HRDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HRDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HRDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HRDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HRDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HRDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HRDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HRDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HRDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HRDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HRDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HRDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HRDB] SET  MULTI_USER 
GO
ALTER DATABASE [HRDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HRDB] SET DB_CHAINING OFF 
GO
USE [HRDB]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[StreetAddress] [varchar](2000) NOT NULL,
	[City] [varchar](255) NOT NULL,
	[PostalCode] [int] NOT NULL,
	[State] [varchar](255) NOT NULL,
	[Country] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ApproveGroup]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ApproveGroup](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](255) NULL,
	[Description] [varchar](255) NULL,
 CONSTRAINT [PK_ApproveGroup] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ApproveGroupUser]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApproveGroupUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_ApproveGroupUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[GroupID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contractor]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contractor](
	[ContractorID] [int] IDENTITY(1,1) NOT NULL,
	[AddressID] [int] NOT NULL,
	[Name] [varchar](255) NULL,
	[EmailID] [varchar](255) NULL,
	[ContactPerson] [varchar](255) NULL,
	[ContactNo] [int] NULL,
	[ABN] [varchar](50) NULL,
	[PaymentOption] [int] NULL,
	[InvoiceDate] [datetime] NULL,
	[Note] [text] NULL,
 CONSTRAINT [PK_Contractor] PRIMARY KEY CLUSTERED 
(
	[ContractorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContractorEmployee]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractorEmployee](
	[EmployeeJobID] [int] IDENTITY(1,1) NOT NULL,
	[ContractorID] [int] NULL,
	[EmployeeID] [int] NULL,
	[JoinDate] [date] NULL,
 CONSTRAINT [PK_ContractorEmployee] PRIMARY KEY CLUSTERED 
(
	[EmployeeJobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [varchar](255) NULL,
	[EmployeeContactNo] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Equipment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Brand] [varchar](100) NOT NULL,
	[Model] [varchar](100) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[PurchasedFrom] [varchar](100) NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
	[WarrantyExpire] [datetime] NOT NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EquipmentCategory]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EquipmentCategory](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_EquipmentCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Job]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[ID] [int] NOT NULL,
	[SiteID] [int] NOT NULL,
	[JobStartDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobEquipment]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobEquipment](
	[ID] [int] NOT NULL,
	[JobID] [int] NOT NULL,
	[EquipmentID] [int] NOT NULL,
 CONSTRAINT [PK_JobEquipment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestHeader]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RequestHeader](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RequestID] [int] NULL,
	[GroupID] [int] NOT NULL,
	[EmployeeID] [int] NULL,
	[JobID] [int] NOT NULL,
	[RequestDateTime] [datetime] NULL,
	[ApproveGroupID] [int] NULL,
	[ApproveStatus] [varchar](2) NULL,
	[ApprovedDateTime] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_RequestHeader] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Site]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Site](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WorkTypeID] [int] NOT NULL,
	[AddressID] [int] NOT NULL,
	[ContractorID] [int] NOT NULL,
	[SiteName] [varchar](1) NULL,
	[WorkType] [int] NULL,
	[Notes] [varchar](1) NULL,
	[Budget] [int] NULL,
	[Allocation] [int] NULL,
	[WorkDays] [int] NULL,
 CONSTRAINT [PK_Site] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SiteSubContractor]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SiteSubContractor](
	[SubContractorID] [int] NULL,
	[ReportingOfficer] [varchar](1) NULL,
	[SiteID] [int] NULL,
	[ID] [int] NOT NULL,
 CONSTRAINT [PK_SiteSubContractor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubContractor]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubContractor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ContractorID] [int] NOT NULL,
	[Name] [varchar](1) NULL,
	[AddressID] [int] NULL,
	[ABN] [varchar](1) NULL,
	[EmailAddress] [varchar](1) NULL,
 CONSTRAINT [PK_SubContractor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserLogin](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](200) NULL,
	[PasswordHash] [varchar](200) NULL,
	[UserRoleID] [int] NULL,
	[EmployeeID] [int] NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WorkType]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WorkType](
	[WorkTypeID] [int] IDENTITY(1,1) NOT NULL,
	[WorkTypeName] [varchar](1) NULL,
 CONSTRAINT [PK_WorkType] PRIMARY KEY CLUSTERED 
(
	[WorkTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IFK_ApproveGroup_ApproveGroupU]    Script Date: 4/1/2019 3:12:19 PM ******/
CREATE NONCLUSTERED INDEX [IFK_ApproveGroup_ApproveGroupU] ON [dbo].[ApproveGroupUser]
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IFK_UserLogin_ApproveGroupUser]    Script Date: 4/1/2019 3:12:19 PM ******/
CREATE NONCLUSTERED INDEX [IFK_UserLogin_ApproveGroupUser] ON [dbo].[ApproveGroupUser]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [FK_]    Script Date: 4/1/2019 3:12:19 PM ******/
CREATE NONCLUSTERED INDEX [FK_] ON [dbo].[Contractor]
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Contractor_Address]    Script Date: 4/1/2019 3:12:19 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Contractor_Address] ON [dbo].[Contractor]
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [ContractorEmployee_FKIndex2]    Script Date: 4/1/2019 3:12:19 PM ******/
CREATE NONCLUSTERED INDEX [ContractorEmployee_FKIndex2] ON [dbo].[ContractorEmployee]
(
	[ContractorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Contractor_ContratorEmploy]    Script Date: 4/1/2019 3:12:19 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Contractor_ContratorEmploy] ON [dbo].[ContractorEmployee]
(
	[ContractorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Employee_ContractorEmploye]    Script Date: 4/1/2019 3:12:19 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Employee_ContractorEmploye] ON [dbo].[ContractorEmployee]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IFK_EmployeeJob_RequestHeader]    Script Date: 4/1/2019 3:12:19 PM ******/
CREATE NONCLUSTERED INDEX [IFK_EmployeeJob_RequestHeader] ON [dbo].[RequestHeader]
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_06]    Script Date: 4/1/2019 3:12:19 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_06] ON [dbo].[RequestHeader]
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IFK_ContractorSite]    Script Date: 4/1/2019 3:12:19 PM ******/
CREATE NONCLUSTERED INDEX [IFK_ContractorSite] ON [dbo].[Site]
(
	[ContractorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IFK_SiteAddress_AddressID]    Script Date: 4/1/2019 3:12:19 PM ******/
CREATE NONCLUSTERED INDEX [IFK_SiteAddress_AddressID] ON [dbo].[Site]
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IFK_SiteWorkType]    Script Date: 4/1/2019 3:12:19 PM ******/
CREATE NONCLUSTERED INDEX [IFK_SiteWorkType] ON [dbo].[Site]
(
	[WorkTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IFK_SubContractorContractor]    Script Date: 4/1/2019 3:12:19 PM ******/
CREATE NONCLUSTERED INDEX [IFK_SubContractorContractor] ON [dbo].[SubContractor]
(
	[ContractorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApproveGroupUser]  WITH CHECK ADD  CONSTRAINT [FK_ApproveGroup_ApproveGroupUser] FOREIGN KEY([GroupID])
REFERENCES [dbo].[ApproveGroup] ([GroupID])
GO
ALTER TABLE [dbo].[ApproveGroupUser] CHECK CONSTRAINT [FK_ApproveGroup_ApproveGroupUser]
GO
ALTER TABLE [dbo].[ApproveGroupUser]  WITH CHECK ADD  CONSTRAINT [FK_UserLogin_ApproveGroupUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserLogin] ([UserID])
GO
ALTER TABLE [dbo].[ApproveGroupUser] CHECK CONSTRAINT [FK_UserLogin_ApproveGroupUser]
GO
ALTER TABLE [dbo].[Contractor]  WITH CHECK ADD  CONSTRAINT [FK_Address_Contractor] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[Contractor] CHECK CONSTRAINT [FK_Address_Contractor]
GO
ALTER TABLE [dbo].[ContractorEmployee]  WITH CHECK ADD  CONSTRAINT [FK_Contractor_ContractorEmployee] FOREIGN KEY([ContractorID])
REFERENCES [dbo].[Contractor] ([ContractorID])
GO
ALTER TABLE [dbo].[ContractorEmployee] CHECK CONSTRAINT [FK_Contractor_ContractorEmployee]
GO
ALTER TABLE [dbo].[ContractorEmployee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_ContractorEmployee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[ContractorEmployee] CHECK CONSTRAINT [FK_Employee_ContractorEmployee]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_EquipmentCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[EquipmentCategory] ([ID])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_EquipmentCategory]
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_RequestHeader_Job] FOREIGN KEY([ID])
REFERENCES [dbo].[RequestHeader] ([ID])
GO
ALTER TABLE [dbo].[Job] CHECK CONSTRAINT [FK_RequestHeader_Job]
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_Site_Job] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Site] ([ID])
GO
ALTER TABLE [dbo].[Job] CHECK CONSTRAINT [FK_Site_Job]
GO
ALTER TABLE [dbo].[JobEquipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_JobEquipment] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[Equipment] ([ID])
GO
ALTER TABLE [dbo].[JobEquipment] CHECK CONSTRAINT [FK_Equipment_JobEquipment]
GO
ALTER TABLE [dbo].[JobEquipment]  WITH CHECK ADD  CONSTRAINT [FK_Job_JobEquipment] FOREIGN KEY([JobID])
REFERENCES [dbo].[Job] ([ID])
GO
ALTER TABLE [dbo].[JobEquipment] CHECK CONSTRAINT [FK_Job_JobEquipment]
GO
ALTER TABLE [dbo].[RequestHeader]  WITH CHECK ADD  CONSTRAINT [FK_ApproveGroup_RequestHeader] FOREIGN KEY([GroupID])
REFERENCES [dbo].[ApproveGroup] ([GroupID])
GO
ALTER TABLE [dbo].[RequestHeader] CHECK CONSTRAINT [FK_ApproveGroup_RequestHeader]
GO
ALTER TABLE [dbo].[Site]  WITH CHECK ADD  CONSTRAINT [FK_Address_Site] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[Site] CHECK CONSTRAINT [FK_Address_Site]
GO
ALTER TABLE [dbo].[Site]  WITH CHECK ADD  CONSTRAINT [FK_Contractor_Site] FOREIGN KEY([ContractorID])
REFERENCES [dbo].[Contractor] ([ContractorID])
GO
ALTER TABLE [dbo].[Site] CHECK CONSTRAINT [FK_Contractor_Site]
GO
ALTER TABLE [dbo].[Site]  WITH CHECK ADD  CONSTRAINT [FK_WorkType_Site] FOREIGN KEY([WorkTypeID])
REFERENCES [dbo].[WorkType] ([WorkTypeID])
GO
ALTER TABLE [dbo].[Site] CHECK CONSTRAINT [FK_WorkType_Site]
GO
ALTER TABLE [dbo].[SiteSubContractor]  WITH CHECK ADD  CONSTRAINT [FK_Site_SiteSubContractor] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Site] ([ID])
GO
ALTER TABLE [dbo].[SiteSubContractor] CHECK CONSTRAINT [FK_Site_SiteSubContractor]
GO
ALTER TABLE [dbo].[SubContractor]  WITH CHECK ADD  CONSTRAINT [FK_Contractor_SubContractor] FOREIGN KEY([ContractorID])
REFERENCES [dbo].[Contractor] ([ContractorID])
GO
ALTER TABLE [dbo].[SubContractor] CHECK CONSTRAINT [FK_Contractor_SubContractor]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddressDelete]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AddressDelete] 
    @AddressID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Address]
	WHERE  [AddressID] = @AddressID

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_AddressInsert]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AddressInsert] 
    @Name varchar(255),
    @StreetAddress varchar(2000),
    @City varchar(255),
    @PostalCode int,
    @State varchar(255),
    @Country varchar(255)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Address] ([Name], [StreetAddress], [City], [PostalCode], [State], [Country])
	SELECT @Name, @StreetAddress, @City, @PostalCode, @State, @Country
	
	-- Begin Return Select <- do not remove
	SELECT [AddressID], [Name], [StreetAddress], [City], [PostalCode], [State], [Country]
	FROM   [dbo].[Address]
	WHERE  [AddressID] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_AddressList]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AddressList] 
    @AddressID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [AddressID], [Name], [StreetAddress], [City], [PostalCode], [State], [Country] 
	FROM   [dbo].[Address] 
	WHERE  ([AddressID] = @AddressID OR @AddressID IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_AddressUpdate]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AddressUpdate] 
    @AddressID int,
    @Name varchar(255),
    @StreetAddress varchar(2000),
    @City varchar(255),
    @PostalCode int,
    @State varchar(255),
    @Country varchar(255)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Address]
	SET    [Name] = @Name, [StreetAddress] = @StreetAddress, [City] = @City, [PostalCode] = @PostalCode, [State] = @State, [Country] = @Country
	WHERE  [AddressID] = @AddressID
	
	-- Begin Return Select <- do not remove
	SELECT [AddressID], [Name], [StreetAddress], [City], [PostalCode], [State], [Country]
	FROM   [dbo].[Address]
	WHERE  [AddressID] = @AddressID	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ApproveGroupDelete]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ApproveGroupDelete] 
    @GroupID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[ApproveGroup]
	WHERE  [GroupID] = @GroupID

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ApproveGroupInsert]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ApproveGroupInsert] 
    @GroupName varchar(255) = NULL,
    @Description varchar(255) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[ApproveGroup] ([GroupName], [Description])
	SELECT @GroupName, @Description
	
	-- Begin Return Select <- do not remove
	SELECT [GroupID], [GroupName], [Description]
	FROM   [dbo].[ApproveGroup]
	WHERE  [GroupID] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ApproveGroupList]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ApproveGroupList] 
    @GroupID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [GroupID], [GroupName], [Description] 
	FROM   [dbo].[ApproveGroup] 
	WHERE  ([GroupID] = @GroupID OR @GroupID IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ApproveGroupUpdate]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ApproveGroupUpdate] 
    @GroupID int,
    @GroupName varchar(255) = NULL,
    @Description varchar(255) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[ApproveGroup]
	SET    [GroupName] = @GroupName, [Description] = @Description
	WHERE  [GroupID] = @GroupID
	
	-- Begin Return Select <- do not remove
	SELECT [GroupID], [GroupName], [Description]
	FROM   [dbo].[ApproveGroup]
	WHERE  [GroupID] = @GroupID	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ApproveGroupUserDelete]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ApproveGroupUserDelete] 
    @ID int,
    @GroupID int,
    @UserID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[ApproveGroupUser]
	WHERE  [ID] = @ID
	       AND [GroupID] = @GroupID
	       AND [UserID] = @UserID

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ApproveGroupUserInsert]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ApproveGroupUserInsert] 
    @GroupID int,
    @UserID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[ApproveGroupUser] ([GroupID], [UserID])
	SELECT @GroupID, @UserID
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [GroupID], [UserID]
	FROM   [dbo].[ApproveGroupUser]
	WHERE  [ID] = SCOPE_IDENTITY()
	       AND [GroupID] = @GroupID
	       AND [UserID] = @UserID
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ApproveGroupUserList]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ApproveGroupUserList] 
    @ID int,
    @GroupID int,
    @UserID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [GroupID], [UserID] 
	FROM   [dbo].[ApproveGroupUser] 
	WHERE  ([ID] = @ID OR @ID IS NULL) 
	       AND ([GroupID] = @GroupID OR @GroupID IS NULL) 
	       AND ([UserID] = @UserID OR @UserID IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ApproveGroupUserUpdate]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ApproveGroupUserUpdate] 
	@ID int,
    @GroupID int,
    @UserID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	UPDATE [dbo].[ApproveGroupUser]
	SET  [GroupID]  = @GroupID, [UserID] = @UserID
	WHERE [ID] = @ID
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [GroupID], [UserID]
	FROM   [dbo].[ApproveGroupUser]
	WHERE  [ID] = SCOPE_IDENTITY()
	       AND [GroupID] = @GroupID
	       AND [UserID] = @UserID
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ContractorDelete]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ContractorDelete] 
    @ContractorID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Contractor]
	WHERE  [ContractorID] = @ContractorID

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ContractorEmployeeDelete]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ContractorEmployeeDelete] 
    @EmployeeJobID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[ContractorEmployee]
	WHERE  [EmployeeJobID] = @EmployeeJobID

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ContractorEmployeeInsert]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ContractorEmployeeInsert] 
    @ContractorID int = NULL,
    @EmployeeID int = NULL,
    @JoinDate date = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[ContractorEmployee] ([ContractorID], [EmployeeID], [JoinDate])
	SELECT @ContractorID, @EmployeeID, @JoinDate
	
	-- Begin Return Select <- do not remove
	SELECT [EmployeeJobID], [ContractorID], [EmployeeID], [JoinDate]
	FROM   [dbo].[ContractorEmployee]
	WHERE  [EmployeeJobID] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ContractorEmployeeList]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ContractorEmployeeList] 
    @EmployeeJobID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [EmployeeJobID], [ContractorID], [EmployeeID], [JoinDate] 
	FROM   [dbo].[ContractorEmployee] 
	WHERE  ([EmployeeJobID] = @EmployeeJobID OR @EmployeeJobID IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ContractorEmployeeUpdate]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ContractorEmployeeUpdate] 
    @EmployeeJobID int,
    @ContractorID int = NULL,
    @EmployeeID int = NULL,
    @JoinDate date = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[ContractorEmployee]
	SET    [ContractorID] = @ContractorID, [EmployeeID] = @EmployeeID, [JoinDate] = @JoinDate
	WHERE  [EmployeeJobID] = @EmployeeJobID
	
	-- Begin Return Select <- do not remove
	SELECT [EmployeeJobID], [ContractorID], [EmployeeID], [JoinDate]
	FROM   [dbo].[ContractorEmployee]
	WHERE  [EmployeeJobID] = @EmployeeJobID	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ContractorInsert]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ContractorInsert] 
    @AddressID int,
    @Name varchar(255) = NULL,
    @EmailID varchar(255) = NULL,
    @ContactPerson varchar(255) = NULL,
    @ContactNo int = NULL,
    @ABN varchar(50) = NULL,
    @PaymentOption int = NULL,
    @InvoiceDate datetime = NULL,
    @Note text = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Contractor] ([AddressID], [Name], [EmailID], [ContactPerson], [ContactNo], [ABN], [PaymentOption], [InvoiceDate], [Note])
	SELECT @AddressID, @Name, @EmailID, @ContactPerson, @ContactNo, @ABN, @PaymentOption, @InvoiceDate, @Note
	
	-- Begin Return Select <- do not remove
	SELECT [ContractorID], [AddressID], [Name], [EmailID], [ContactPerson], [ContactNo], [ABN], [PaymentOption], [InvoiceDate], [Note]
	FROM   [dbo].[Contractor]
	WHERE  [ContractorID] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ContractorList]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ContractorList] 
    @ContractorID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ContractorID], [AddressID], [Name], [EmailID], [ContactPerson], [ContactNo], [ABN], [PaymentOption], [InvoiceDate], [Note] 
	FROM   [dbo].[Contractor] 
	WHERE  ([ContractorID] = @ContractorID OR @ContractorID IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ContractorUpdate]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ContractorUpdate] 
    @ContractorID int,
    @AddressID int,
    @Name varchar(255) = NULL,
    @EmailID varchar(255) = NULL,
    @ContactPerson varchar(255) = NULL,
    @ContactNo int = NULL,
    @ABN varchar(50) = NULL,
    @PaymentOption int = NULL,
    @InvoiceDate datetime = NULL,
    @Note text = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Contractor]
	SET    [AddressID] = @AddressID, [Name] = @Name, [EmailID] = @EmailID, [ContactPerson] = @ContactPerson, [ContactNo] = @ContactNo, [ABN] = @ABN, [PaymentOption] = @PaymentOption, [InvoiceDate] = @InvoiceDate, [Note] = @Note
	WHERE  [ContractorID] = @ContractorID
	
	-- Begin Return Select <- do not remove
	SELECT [ContractorID], [AddressID], [Name], [EmailID], [ContactPerson], [ContactNo], [ABN], [PaymentOption], [InvoiceDate], [Note]
	FROM   [dbo].[Contractor]
	WHERE  [ContractorID] = @ContractorID	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_EmployeeDelete]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_EmployeeDelete] 
    @EmployeeID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Employee]
	WHERE  [EmployeeID] = @EmployeeID

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_EmployeeInsert]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_EmployeeInsert] 
    @EmployeeName varchar(255) = NULL,
    @EmployeeContactNo int = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Employee] ([EmployeeName], [EmployeeContactNo])
	SELECT @EmployeeName, @EmployeeContactNo
	
	-- Begin Return Select <- do not remove
	SELECT [EmployeeID], [EmployeeName], [EmployeeContactNo]
	FROM   [dbo].[Employee]
	WHERE  [EmployeeID] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_EmployeeList]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_EmployeeList] 
    @EmployeeID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [EmployeeID], [EmployeeName], [EmployeeContactNo] 
	FROM   [dbo].[Employee] 
	WHERE  ([EmployeeID] = @EmployeeID OR @EmployeeID IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_EmployeeUpdate]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_EmployeeUpdate] 
    @EmployeeID int,
    @EmployeeName varchar(255) = NULL,
    @EmployeeContactNo int = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Employee]
	SET    [EmployeeName] = @EmployeeName, [EmployeeContactNo] = @EmployeeContactNo
	WHERE  [EmployeeID] = @EmployeeID
	
	-- Begin Return Select <- do not remove
	SELECT [EmployeeID], [EmployeeName], [EmployeeContactNo]
	FROM   [dbo].[Employee]
	WHERE  [EmployeeID] = @EmployeeID	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_EquipmentCategoryDelete]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_EquipmentCategoryDelete] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[EquipmentCategory]
	WHERE  [ID] = @ID

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_EquipmentCategoryInsert]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_EquipmentCategoryInsert] 
    @ID int,
    @Name varchar(255)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[EquipmentCategory] ([ID], [Name])
	SELECT @ID, @Name
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [Name]
	FROM   [dbo].[EquipmentCategory]
	WHERE  [ID] = @ID
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_EquipmentCategoryList]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_EquipmentCategoryList] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [Name] 
	FROM   [dbo].[EquipmentCategory] 
	WHERE  ([ID] = @ID OR @ID IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_EquipmentCategoryUpdate]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_EquipmentCategoryUpdate] 
    @ID int,
    @Name varchar(255)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[EquipmentCategory]
	SET    [Name] = @Name
	WHERE  [ID] = @ID
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [Name]
	FROM   [dbo].[EquipmentCategory]
	WHERE  [ID] = @ID	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_EquipmentDelete]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_EquipmentDelete] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Equipment]
	WHERE  [ID] = @ID

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_EquipmentInsert]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_EquipmentInsert] 
    @Code varchar(50),
    @Brand varchar(100),
    @Model varchar(100),
    @CategoryID int,
    @PurchasedFrom varchar(100),
    @PurchaseDate datetime,
    @WarrantyExpire datetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Equipment] ([Code], [Brand], [Model], [CategoryID], [PurchasedFrom], [PurchaseDate], [WarrantyExpire])
	SELECT @Code, @Brand, @Model, @CategoryID, @PurchasedFrom, @PurchaseDate, @WarrantyExpire
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [Code], [Brand], [Model], [CategoryID], [PurchasedFrom], [PurchaseDate], [WarrantyExpire]
	FROM   [dbo].[Equipment]
	WHERE  [ID] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_EquipmentList]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_EquipmentList] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [Code], [Brand], [Model], [CategoryID], [PurchasedFrom], [PurchaseDate], [WarrantyExpire] 
	FROM   [dbo].[Equipment] 
	WHERE  ([ID] = @ID OR @ID IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_EquipmentUpdate]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_EquipmentUpdate] 
    @ID int,
    @Code varchar(50),
    @Brand varchar(100),
    @Model varchar(100),
    @CategoryID int,
    @PurchasedFrom varchar(100),
    @PurchaseDate datetime,
    @WarrantyExpire datetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Equipment]
	SET    [Code] = @Code, [Brand] = @Brand, [Model] = @Model, [CategoryID] = @CategoryID, [PurchasedFrom] = @PurchasedFrom, [PurchaseDate] = @PurchaseDate, [WarrantyExpire] = @WarrantyExpire
	WHERE  [ID] = @ID
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [Code], [Brand], [Model], [CategoryID], [PurchasedFrom], [PurchaseDate], [WarrantyExpire]
	FROM   [dbo].[Equipment]
	WHERE  [ID] = @ID	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllEquipments]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetAllEquipments]
as
select * from [dbo].[Equipment]
GO
/****** Object:  StoredProcedure [dbo].[sp_JobDelete]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_JobDelete] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Job]
	WHERE  [ID] = @ID

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_JobEquipmentDelete]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_JobEquipmentDelete] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[JobEquipment]
	WHERE  [ID] = @ID

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_JobEquipmentInsert]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_JobEquipmentInsert] 
    @ID int,
    @JobID int,
    @EquipmentID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[JobEquipment] ([ID], [JobID], [EquipmentID])
	SELECT @ID, @JobID, @EquipmentID
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [JobID], [EquipmentID]
	FROM   [dbo].[JobEquipment]
	WHERE  [ID] = @ID
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_JobEquipmentList]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_JobEquipmentList] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [JobID], [EquipmentID] 
	FROM   [dbo].[JobEquipment] 
	WHERE  ([ID] = @ID OR @ID IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_JobEquipmentUpdate]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_JobEquipmentUpdate] 
    @ID int,
    @JobID int,
    @EquipmentID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[JobEquipment]
	SET    [JobID] = @JobID, [EquipmentID] = @EquipmentID
	WHERE  [ID] = @ID
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [JobID], [EquipmentID]
	FROM   [dbo].[JobEquipment]
	WHERE  [ID] = @ID	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_JobInsert]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_JobInsert] 
    @ID int,
    @SiteID int,
    @JobStartDate datetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Job] ([ID], [SiteID], [JobStartDate])
	SELECT @ID, @SiteID, @JobStartDate
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [SiteID], [JobStartDate]
	FROM   [dbo].[Job]
	WHERE  [ID] = @ID
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_JobList]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_JobList] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [SiteID], [JobStartDate] 
	FROM   [dbo].[Job] 
	WHERE  ([ID] = @ID OR @ID IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_JobUpdate]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_JobUpdate] 
    @ID int,
    @SiteID int,
    @JobStartDate datetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Job]
	SET    [SiteID] = @SiteID, [JobStartDate] = @JobStartDate
	WHERE  [ID] = @ID
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [SiteID], [JobStartDate]
	FROM   [dbo].[Job]
	WHERE  [ID] = @ID	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_RequestHeaderDelete]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_RequestHeaderDelete] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[RequestHeader]
	WHERE  [ID] = @ID

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_RequestHeaderInsert]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_RequestHeaderInsert] 
    @RequestID int = NULL,
    @GroupID int,
    @EmployeeID int = NULL,
    @JobID int,
    @RequestDateTime datetime = NULL,
    @ApproveGroupID int = NULL,
    @ApproveStatus varchar(2) = NULL,
    @ApprovedDateTime datetime = NULL,
    @CreatedDate datetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[RequestHeader] ([RequestID], [GroupID], [EmployeeID], [JobID], [RequestDateTime], [ApproveGroupID], [ApproveStatus], [ApprovedDateTime], [CreatedDate])
	SELECT @RequestID, @GroupID, @EmployeeID, @JobID, @RequestDateTime, @ApproveGroupID, @ApproveStatus, @ApprovedDateTime, @CreatedDate
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [RequestID], [GroupID], [EmployeeID], [JobID], [RequestDateTime], [ApproveGroupID], [ApproveStatus], [ApprovedDateTime], [CreatedDate]
	FROM   [dbo].[RequestHeader]
	WHERE  [ID] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_RequestHeaderList]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_RequestHeaderList] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [RequestID], [GroupID], [EmployeeID], [JobID], [RequestDateTime], [ApproveGroupID], [ApproveStatus], [ApprovedDateTime], [CreatedDate] 
	FROM   [dbo].[RequestHeader] 
	WHERE  ([ID] = @ID OR @ID IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_RequestHeaderUpdate]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_RequestHeaderUpdate] 
    @ID int,
    @RequestID int = NULL,
    @GroupID int,
    @EmployeeID int = NULL,
    @JobID int,
    @RequestDateTime datetime = NULL,
    @ApproveGroupID int = NULL,
    @ApproveStatus varchar(2) = NULL,
    @ApprovedDateTime datetime = NULL,
    @CreatedDate datetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[RequestHeader]
	SET    [RequestID] = @RequestID, [GroupID] = @GroupID, [EmployeeID] = @EmployeeID, [JobID] = @JobID, [RequestDateTime] = @RequestDateTime, [ApproveGroupID] = @ApproveGroupID, [ApproveStatus] = @ApproveStatus, [ApprovedDateTime] = @ApprovedDateTime, [CreatedDate] = @CreatedDate
	WHERE  [ID] = @ID
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [RequestID], [GroupID], [EmployeeID], [JobID], [RequestDateTime], [ApproveGroupID], [ApproveStatus], [ApprovedDateTime], [CreatedDate]
	FROM   [dbo].[RequestHeader]
	WHERE  [ID] = @ID	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_SiteDelete]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SiteDelete] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Site]
	WHERE  [ID] = @ID

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_SiteInsert]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SiteInsert] 
    @WorkTypeID int,
    @AddressID int,
    @ContractorID int,
    @SiteName varchar(1) = NULL,
    @WorkType int = NULL,
    @Notes varchar(1) = NULL,
    @Budget int = NULL,
    @Allocation int = NULL,
    @WorkDays int = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Site] ([WorkTypeID], [AddressID], [ContractorID], [SiteName], [WorkType], [Notes], [Budget], [Allocation], [WorkDays])
	SELECT @WorkTypeID, @AddressID, @ContractorID, @SiteName, @WorkType, @Notes, @Budget, @Allocation, @WorkDays
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [WorkTypeID], [AddressID], [ContractorID], [SiteName], [WorkType], [Notes], [Budget], [Allocation], [WorkDays]
	FROM   [dbo].[Site]
	WHERE  [ID] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_SiteList]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SiteList] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [WorkTypeID], [AddressID], [ContractorID], [SiteName], [WorkType], [Notes], [Budget], [Allocation], [WorkDays] 
	FROM   [dbo].[Site] 
	WHERE  ([ID] = @ID OR @ID IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_SiteSubContractorDelete]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SiteSubContractorDelete] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[SiteSubContractor]
	WHERE  [ID] = @ID

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_SiteSubContractorInsert]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SiteSubContractorInsert] 
    @ID int,
    @SubContractorID int = NULL,
    @ReportingOfficer varchar(1) = NULL,
    @SiteID int = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[SiteSubContractor] ([ID], [SubContractorID], [ReportingOfficer], [SiteID])
	SELECT @ID, @SubContractorID, @ReportingOfficer, @SiteID
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [SubContractorID], [ReportingOfficer], [SiteID]
	FROM   [dbo].[SiteSubContractor]
	WHERE  [ID] = @ID
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_SiteSubContractorList]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SiteSubContractorList] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [SubContractorID], [ReportingOfficer], [SiteID] 
	FROM   [dbo].[SiteSubContractor] 
	WHERE  ([ID] = @ID OR @ID IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_SiteSubContractorUpdate]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SiteSubContractorUpdate] 
    @ID int,
    @SubContractorID int = NULL,
    @ReportingOfficer varchar(1) = NULL,
    @SiteID int = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[SiteSubContractor]
	SET    [SubContractorID] = @SubContractorID, [ReportingOfficer] = @ReportingOfficer, [SiteID] = @SiteID
	WHERE  [ID] = @ID
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [SubContractorID], [ReportingOfficer], [SiteID]
	FROM   [dbo].[SiteSubContractor]
	WHERE  [ID] = @ID	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_SiteUpdate]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SiteUpdate] 
    @ID int,
    @WorkTypeID int,
    @AddressID int,
    @ContractorID int,
    @SiteName varchar(1) = NULL,
    @WorkType int = NULL,
    @Notes varchar(1) = NULL,
    @Budget int = NULL,
    @Allocation int = NULL,
    @WorkDays int = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Site]
	SET    [WorkTypeID] = @WorkTypeID, [AddressID] = @AddressID, [ContractorID] = @ContractorID, [SiteName] = @SiteName, [WorkType] = @WorkType, [Notes] = @Notes, [Budget] = @Budget, [Allocation] = @Allocation, [WorkDays] = @WorkDays
	WHERE  [ID] = @ID
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [WorkTypeID], [AddressID], [ContractorID], [SiteName], [WorkType], [Notes], [Budget], [Allocation], [WorkDays]
	FROM   [dbo].[Site]
	WHERE  [ID] = @ID	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_SubContractorDelete]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SubContractorDelete] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[SubContractor]
	WHERE  [ID] = @ID

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_SubContractorInsert]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SubContractorInsert] 
    @ContractorID int,
    @Name varchar(1) = NULL,
    @AddressID int = NULL,
    @ABN varchar(1) = NULL,
    @EmailAddress varchar(1) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[SubContractor] ([ContractorID], [Name], [AddressID], [ABN], [EmailAddress])
	SELECT @ContractorID, @Name, @AddressID, @ABN, @EmailAddress
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [ContractorID], [Name], [AddressID], [ABN], [EmailAddress]
	FROM   [dbo].[SubContractor]
	WHERE  [ID] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_SubContractorList]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SubContractorList] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [ContractorID], [Name], [AddressID], [ABN], [EmailAddress] 
	FROM   [dbo].[SubContractor] 
	WHERE  ([ID] = @ID OR @ID IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_SubContractorUpdate]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SubContractorUpdate] 
    @ID int,
    @ContractorID int,
    @Name varchar(1) = NULL,
    @AddressID int = NULL,
    @ABN varchar(1) = NULL,
    @EmailAddress varchar(1) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[SubContractor]
	SET    [ContractorID] = @ContractorID, [Name] = @Name, [AddressID] = @AddressID, [ABN] = @ABN, [EmailAddress] = @EmailAddress
	WHERE  [ID] = @ID
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [ContractorID], [Name], [AddressID], [ABN], [EmailAddress]
	FROM   [dbo].[SubContractor]
	WHERE  [ID] = @ID	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_UserLoginDelete]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UserLoginDelete] 
    @UserID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[UserLogin]
	WHERE  [UserID] = @UserID

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_UserLoginGetByUserName]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UserLoginGetByUserName]

      

       @UserName varchar(200)

 

AS

 

       SELECT [UserID], [UserName], [PasswordHash], [UserRoleID], [EmployeeID]

       FROM  [dbo].[UserLogin]

       WHERE [UserName] = @UserName

 
GO
/****** Object:  StoredProcedure [dbo].[sp_UserLoginInsert]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UserLoginInsert] 
    @UserName varchar(200) = NULL,
    @PasswordHash varchar(200) = NULL,
    @UserRoleID int = NULL,
    @EmployeeID int = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[UserLogin] ([UserName], [PasswordHash], [UserRoleID], [EmployeeID])
	SELECT @UserName, @PasswordHash, @UserRoleID, @EmployeeID
	
	-- Begin Return Select <- do not remove
	SELECT [UserID], [UserName], [PasswordHash], [UserRoleID], [EmployeeID]
	FROM   [dbo].[UserLogin]
	WHERE  [UserID] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_UserLoginList]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UserLoginList] 
    @UserID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [UserID], [UserName], [PasswordHash], [UserRoleID], [EmployeeID] 
	FROM   [dbo].[UserLogin] 
	WHERE  ([UserID] = @UserID OR @UserID IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_UserLoginUpdate]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UserLoginUpdate] 
    @UserID int,
    @UserName varchar(200) = NULL,
    @PasswordHash varchar(200) = NULL,
    @UserRoleID int = NULL,
    @EmployeeID int = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[UserLogin]
	SET    [UserName] = @UserName, [PasswordHash] = @PasswordHash, [UserRoleID] = @UserRoleID, [EmployeeID] = @EmployeeID
	WHERE  [UserID] = @UserID
	
	-- Begin Return Select <- do not remove
	SELECT [UserID], [UserName], [PasswordHash], [UserRoleID], [EmployeeID]
	FROM   [dbo].[UserLogin]
	WHERE  [UserID] = @UserID	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_WorkTypeDelete]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_WorkTypeDelete] 
    @WorkTypeID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[WorkType]
	WHERE  [WorkTypeID] = @WorkTypeID

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_WorkTypeInsert]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_WorkTypeInsert] 
    @WorkTypeName varchar(1) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[WorkType] ([WorkTypeName])
	SELECT @WorkTypeName
	
	-- Begin Return Select <- do not remove
	SELECT [WorkTypeID], [WorkTypeName]
	FROM   [dbo].[WorkType]
	WHERE  [WorkTypeID] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_WorkTypeList]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_WorkTypeList] 
    @WorkTypeID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [WorkTypeID], [WorkTypeName] 
	FROM   [dbo].[WorkType] 
	WHERE  ([WorkTypeID] = @WorkTypeID OR @WorkTypeID IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_WorkTypeUpdate]    Script Date: 4/1/2019 3:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_WorkTypeUpdate] 
    @WorkTypeID int,
    @WorkTypeName varchar(1) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[WorkType]
	SET    [WorkTypeName] = @WorkTypeName
	WHERE  [WorkTypeID] = @WorkTypeID
	
	-- Begin Return Select <- do not remove
	SELECT [WorkTypeID], [WorkTypeName]
	FROM   [dbo].[WorkType]
	WHERE  [WorkTypeID] = @WorkTypeID	
	-- End Return Select <- do not remove

	COMMIT

GO
USE [master]
GO
ALTER DATABASE [HRDB] SET  READ_WRITE 
GO
