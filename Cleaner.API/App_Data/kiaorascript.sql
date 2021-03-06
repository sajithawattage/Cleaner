USE [KiaOra]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddressDelete]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddressInsert]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddressList]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddressUpdate]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ApproveGroupDelete]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ApproveGroupInsert]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ApproveGroupList]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ApproveGroupUpdate]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ApproveGroupUserDelete]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ApproveGroupUserInsert]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ApproveGroupUserList]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ContractorDelete]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ContractorEmployeeDelete]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ContractorEmployeeInsert]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ContractorEmployeeList]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ContractorEmployeeUpdate]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ContractorInsert]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ContractorList]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ContractorUpdate]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EmployeeDelete]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EmployeeInsert]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EmployeeList]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EmployeeUpdate]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EquipmentCategoryDelete]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EquipmentCategoryInsert]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EquipmentCategoryList]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EquipmentCategoryUpdate]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EquipmentDelete]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EquipmentInsert]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EquipmentList]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EquipmentUpdate]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_GetAllEquipments]    Script Date: 23/7/2019 5:54:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetAllEquipments]
as
select * from [dbo].[Equipment]

GO
/****** Object:  StoredProcedure [dbo].[sp_JobDelete]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_JobEquipmentDelete]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_JobEquipmentInsert]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_JobEquipmentList]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_JobEquipmentUpdate]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_JobInsert]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_JobList]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_JobUpdate]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_RequestHeaderDelete]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_RequestHeaderInsert]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_RequestHeaderList]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_RequestHeaderUpdate]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SiteDelete]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SiteInsert]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SiteList]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SiteSubContractorDelete]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SiteSubContractorInsert]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SiteSubContractorList]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SiteSubContractorUpdate]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SiteUpdate]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SubContractorDelete]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SubContractorInsert]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SubContractorList]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SubContractorUpdate]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UserLoginDelete]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UserLoginGetByUserName]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UserLoginInsert]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UserLoginList]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UserLoginUpdate]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_WorkTypeDelete]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_WorkTypeInsert]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_WorkTypeList]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_WorkTypeUpdate]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  Table [dbo].[Address]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  Table [dbo].[ApproveGroup]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  Table [dbo].[ApproveGroupUser]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  Table [dbo].[Contractor]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 23/7/2019 5:54:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[ContactNo] [int] NOT NULL,
	[NationalIDNumber] [nvarchar](15) NOT NULL,
	[LoginID] [nvarchar](256) NOT NULL,
	[OrganizationLevel] [int] NOT NULL,
	[JobTitle] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[MaritalStatus] [nchar](1) NOT NULL,
	[Gender] [nchar](1) NOT NULL,
	[HireDate] [date] NOT NULL,
	[SalariedFlag] [bit] NOT NULL,
	[VacationHours] [smallint] NOT NULL,
	[SickLeaveHours] [smallint] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[ParttimeFlag] [bit] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Employee_EmployeeID] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  Table [dbo].[EquipmentCategory]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  Table [dbo].[Job]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  Table [dbo].[JobEmployee]    Script Date: 23/7/2019 5:54:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobEmployee](
	[EmployeeJobID] [int] IDENTITY(1,1) NOT NULL,
	[ContractorID] [int] NULL,
	[EmployeeID] [int] NULL,
	[JoinDate] [date] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
 CONSTRAINT [PK_ContractorEmployee] PRIMARY KEY CLUSTERED 
(
	[EmployeeJobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobEquipment]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  Table [dbo].[RequestHeader]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  Table [dbo].[Site]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  Table [dbo].[SiteSubContractor]    Script Date: 23/7/2019 5:54:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SiteSubContractor](
	[ID] [int] NOT NULL,
	[SiteID] [int] NULL,
	[SubContractorID] [int] NULL,
	[ReportingOfficer] [varchar](1) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](255) NULL,
 CONSTRAINT [PK_SiteSubContractor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubContractor]    Script Date: 23/7/2019 5:54:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubContractor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ContractorID] [int] NOT NULL,
	[Name] [varchar](255) NULL,
	[AddressID] [int] NULL,
	[ABN] [varchar](20) NULL,
	[EmailAddress] [varchar](255) NULL,
 CONSTRAINT [PK_SubContractor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 23/7/2019 5:54:41 PM ******/
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
/****** Object:  Table [dbo].[WorkType]    Script Date: 23/7/2019 5:54:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WorkType](
	[WorkTypeID] [int] IDENTITY(1,1) NOT NULL,
	[WorkTypeName] [varchar](200) NULL,
 CONSTRAINT [PK_WorkType] PRIMARY KEY CLUSTERED 
(
	[WorkTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([AddressID], [Name], [StreetAddress], [City], [PostalCode], [State], [Country]) VALUES (1, N'Broke L Loewe', N'42 Quayside Vista', N'Kingston', 537670, N'Australian Capital Territory', N'Australia')
INSERT [dbo].[Address] ([AddressID], [Name], [StreetAddress], [City], [PostalCode], [State], [Country]) VALUES (2, N'Danial G lyttle', N'4 Marlin Avenue', N'Bigga', 2583, N'NSW', N'Australia')
INSERT [dbo].[Address] ([AddressID], [Name], [StreetAddress], [City], [PostalCode], [State], [Country]) VALUES (3, N'Xavioer Broke', N'3 Bailey Street', N'Willatook', 3287, N'VIC', N'Australia')
INSERT [dbo].[Address] ([AddressID], [Name], [StreetAddress], [City], [PostalCode], [State], [Country]) VALUES (4, N'David Simon', N'42 Queen Avenue', N'BiggaTook', 3457, N'VIC', N'Australia')
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[Contractor] ON 

INSERT [dbo].[Contractor] ([ContractorID], [AddressID], [Name], [EmailID], [ContactPerson], [ContactNo], [ABN], [PaymentOption], [InvoiceDate], [Note]) VALUES (1, 1, N'Broke L Loewe', N'broke.loewe@gmial.com', N'Broke L Loewe', 8489383, N'9206', 1, CAST(0x0000AA1E010CA967 AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[Contractor] OFF
INSERT [dbo].[Employee] ([EmployeeID], [Name], [ContactNo], [NationalIDNumber], [LoginID], [OrganizationLevel], [JobTitle], [BirthDate], [MaritalStatus], [Gender], [HireDate], [SalariedFlag], [VacationHours], [SickLeaveHours], [CurrentFlag], [ParttimeFlag], [rowguid], [ModifiedDate]) VALUES (1, N'ADAMS', 8106913, N'6724720', N'ADAMS', 2, N'Cleaner', CAST(0xF0220B00 AS Date), N'S', N'M', CAST(0x57380B00 AS Date), 1, 20, 20, 1, 0, N'37eee3ee-3eb6-49a2-bd5f-d364a3350a89', CAST(0x0000AA1E00AEA111 AS DateTime))
INSERT [dbo].[Employee] ([EmployeeID], [Name], [ContactNo], [NationalIDNumber], [LoginID], [OrganizationLevel], [JobTitle], [BirthDate], [MaritalStatus], [Gender], [HireDate], [SalariedFlag], [VacationHours], [SickLeaveHours], [CurrentFlag], [ParttimeFlag], [rowguid], [ModifiedDate]) VALUES (2, N'KEN', 8764759, N'7034392', N'KEN', 2, N'Cleaner', CAST(0xF0220B00 AS Date), N'S', N'M', CAST(0x57380B00 AS Date), 1, 20, 20, 1, 0, N'6f8564a7-0ff6-450c-adbc-6b117a8793a3', CAST(0x0000AA1E00AEF218 AS DateTime))
INSERT [dbo].[Employee] ([EmployeeID], [Name], [ContactNo], [NationalIDNumber], [LoginID], [OrganizationLevel], [JobTitle], [BirthDate], [MaritalStatus], [Gender], [HireDate], [SalariedFlag], [VacationHours], [SickLeaveHours], [CurrentFlag], [ParttimeFlag], [rowguid], [ModifiedDate]) VALUES (3, N'DILAN', 1458717, N'5351564', N'DILAN', 2, N'Cleaner', CAST(0xF0220B00 AS Date), N'S', N'M', CAST(0x57380B00 AS Date), 1, 20, 20, 1, 0, N'cd458432-1307-493a-a9e5-a49f80ce0c45', CAST(0x0000AA1E00AEF21A AS DateTime))
INSERT [dbo].[Employee] ([EmployeeID], [Name], [ContactNo], [NationalIDNumber], [LoginID], [OrganizationLevel], [JobTitle], [BirthDate], [MaritalStatus], [Gender], [HireDate], [SalariedFlag], [VacationHours], [SickLeaveHours], [CurrentFlag], [ParttimeFlag], [rowguid], [ModifiedDate]) VALUES (4, N'MIKE', 4291503, N'2834393', N'MIKE', 2, N'Cleaner', CAST(0xF0220B00 AS Date), N'S', N'M', CAST(0x57380B00 AS Date), 1, 20, 20, 1, 0, N'96c69a92-20e1-4a42-abc6-5cab0cc3cfa7', CAST(0x0000AA1E00AEF21A AS DateTime))
INSERT [dbo].[Employee] ([EmployeeID], [Name], [ContactNo], [NationalIDNumber], [LoginID], [OrganizationLevel], [JobTitle], [BirthDate], [MaritalStatus], [Gender], [HireDate], [SalariedFlag], [VacationHours], [SickLeaveHours], [CurrentFlag], [ParttimeFlag], [rowguid], [ModifiedDate]) VALUES (5, N'ROB', 6498863, N'3076095', N'ROB', 2, N'Cleaner', CAST(0xF0220B00 AS Date), N'S', N'M', CAST(0x57380B00 AS Date), 1, 20, 20, 1, 0, N'c9001fd4-b191-43ca-b7e2-4ae4336747ce', CAST(0x0000AA1E00AEF21A AS DateTime))
INSERT [dbo].[Employee] ([EmployeeID], [Name], [ContactNo], [NationalIDNumber], [LoginID], [OrganizationLevel], [JobTitle], [BirthDate], [MaritalStatus], [Gender], [HireDate], [SalariedFlag], [VacationHours], [SickLeaveHours], [CurrentFlag], [ParttimeFlag], [rowguid], [ModifiedDate]) VALUES (6, N'DAVID', 1174205, N'935634', N'DAVID', 2, N'Cleaner', CAST(0xF0220B00 AS Date), N'S', N'M', CAST(0x57380B00 AS Date), 1, 20, 20, 1, 0, N'87683ddc-2c40-4b9e-8d33-2d7ec55c18c2', CAST(0x0000AA1E00AEF21A AS DateTime))
INSERT [dbo].[Employee] ([EmployeeID], [Name], [ContactNo], [NationalIDNumber], [LoginID], [OrganizationLevel], [JobTitle], [BirthDate], [MaritalStatus], [Gender], [HireDate], [SalariedFlag], [VacationHours], [SickLeaveHours], [CurrentFlag], [ParttimeFlag], [rowguid], [ModifiedDate]) VALUES (7, N'JOHN', 7233669, N'2069560', N'JOHN', 2, N'Cleaner', CAST(0xF0220B00 AS Date), N'S', N'M', CAST(0x57380B00 AS Date), 1, 20, 20, 1, 0, N'1ce9c329-4a7f-4719-a7a2-0431983c3e73', CAST(0x0000AA1E00AEF21A AS DateTime))
INSERT [dbo].[Employee] ([EmployeeID], [Name], [ContactNo], [NationalIDNumber], [LoginID], [OrganizationLevel], [JobTitle], [BirthDate], [MaritalStatus], [Gender], [HireDate], [SalariedFlag], [VacationHours], [SickLeaveHours], [CurrentFlag], [ParttimeFlag], [rowguid], [ModifiedDate]) VALUES (8, N'MARY', 9859726, N'9345245', N'MARY', 2, N'Cleaner', CAST(0xF0220B00 AS Date), N'S', N'M', CAST(0x57380B00 AS Date), 1, 20, 20, 1, 0, N'090e8989-e3e5-4bab-8042-4e11d6b239e8', CAST(0x0000AA1E00AEF21A AS DateTime))
INSERT [dbo].[Employee] ([EmployeeID], [Name], [ContactNo], [NationalIDNumber], [LoginID], [OrganizationLevel], [JobTitle], [BirthDate], [MaritalStatus], [Gender], [HireDate], [SalariedFlag], [VacationHours], [SickLeaveHours], [CurrentFlag], [ParttimeFlag], [rowguid], [ModifiedDate]) VALUES (9, N'KEVIN', 4644897, N'4131449', N'KEVIN', 2, N'Cleaner', CAST(0xF0220B00 AS Date), N'S', N'M', CAST(0x57380B00 AS Date), 1, 20, 20, 1, 0, N'f645d895-61f5-4483-b46d-50600acf1d1a', CAST(0x0000AA1E00AEF21B AS DateTime))
INSERT [dbo].[Employee] ([EmployeeID], [Name], [ContactNo], [NationalIDNumber], [LoginID], [OrganizationLevel], [JobTitle], [BirthDate], [MaritalStatus], [Gender], [HireDate], [SalariedFlag], [VacationHours], [SickLeaveHours], [CurrentFlag], [ParttimeFlag], [rowguid], [ModifiedDate]) VALUES (10, N'TERRY', 8805144, N'7826954', N'TERRY', 2, N'Cleaner', CAST(0xF0220B00 AS Date), N'S', N'M', CAST(0x57380B00 AS Date), 1, 20, 20, 1, 0, N'bd393024-151f-424f-9ca1-4edab2831bca', CAST(0x0000AA1E00AEF21B AS DateTime))
SET IDENTITY_INSERT [dbo].[Equipment] ON 

INSERT [dbo].[Equipment] ([ID], [Code], [Brand], [Model], [CategoryID], [PurchasedFrom], [PurchaseDate], [WarrantyExpire]) VALUES (1, N'R2E220-AA4', N'EBM-PAPST', N'Fan Blower, R2E Series', 1, N'Element 14', CAST(0x0000AA1E00A1236B AS DateTime), CAST(0x0000B14100A1236B AS DateTime))
INSERT [dbo].[Equipment] ([ID], [Code], [Brand], [Model], [CategoryID], [PurchasedFrom], [PurchaseDate], [WarrantyExpire]) VALUES (2, N'RLF35-8/14N', N'EBM-PAPST', N'Fan Blower, RLF 35 Series', 1, N'Element 14', CAST(0x0000AA1E00A1236C AS DateTime), CAST(0x0000B14100A1236C AS DateTime))
INSERT [dbo].[Equipment] ([ID], [Code], [Brand], [Model], [CategoryID], [PurchasedFrom], [PurchaseDate], [WarrantyExpire]) VALUES (3, N'R2E190-RA26', N'EBM-PAPST', N'Fan Blower R2E 190 Series', 1, N'Element 14', CAST(0x0000AA1E00A1236C AS DateTime), CAST(0x0000B14100A1236C AS DateTime))
INSERT [dbo].[Equipment] ([ID], [Code], [Brand], [Model], [CategoryID], [PurchasedFrom], [PurchaseDate], [WarrantyExpire]) VALUES (4, N'D2E133-AM26', N'EBM-PAPST', N'AC Centrifugel', 1, N'Element 14', CAST(0x0000AA1E00A1236C AS DateTime), CAST(0x0000B14100A1236C AS DateTime))
INSERT [dbo].[Equipment] ([ID], [Code], [Brand], [Model], [CategoryID], [PurchasedFrom], [PurchaseDate], [WarrantyExpire]) VALUES (5, N'R2K150-AC26', N'EBM-PAPST', N'Fan Blower R2K Series', 1, N'Element 14', CAST(0x0000AA1E00A1236C AS DateTime), CAST(0x0000B14100A1236C AS DateTime))
INSERT [dbo].[Equipment] ([ID], [Code], [Brand], [Model], [CategoryID], [PurchasedFrom], [PurchaseDate], [WarrantyExpire]) VALUES (6, N'231700', N'VERMASON', N'Vaccume Cleaner, ESD, 1.3 kW', 2, N'Element 14', CAST(0x0000AA1E00A3F7C6 AS DateTime), CAST(0x0000B14100A3F7C6 AS DateTime))
INSERT [dbo].[Equipment] ([ID], [Code], [Brand], [Model], [CategoryID], [PurchasedFrom], [PurchaseDate], [WarrantyExpire]) VALUES (7, N'497ABF', N'VERMASON', N'3M -Toner Vaccume', 2, N'Element 14', CAST(0x0000AA1E00A3F7C8 AS DateTime), CAST(0x0000B14100A3F7C8 AS DateTime))
INSERT [dbo].[Equipment] ([ID], [Code], [Brand], [Model], [CategoryID], [PurchasedFrom], [PurchaseDate], [WarrantyExpire]) VALUES (8, N'SV-MPF2', N'SCS', N'Vaccume Filter', 2, N'Element 14', CAST(0x0000AA1E00A3F7C8 AS DateTime), CAST(0x0000B14100A3F7C8 AS DateTime))
INSERT [dbo].[Equipment] ([ID], [Code], [Brand], [Model], [CategoryID], [PurchasedFrom], [PurchaseDate], [WarrantyExpire]) VALUES (9, N'TE-VC-1930SA', N'EINHELL', N'Vaccume Cleaner Wet/Dry, 19000 Pa, 1.5kW', 4, N'Element 14', CAST(0x0000AA1E00A3F7C8 AS DateTime), CAST(0x0000B14100A3F7C8 AS DateTime))
INSERT [dbo].[Equipment] ([ID], [Code], [Brand], [Model], [CategoryID], [PurchasedFrom], [PurchaseDate], [WarrantyExpire]) VALUES (10, N'TE-VC-1820SA', N'EINHELL', N'Vaccume Cleaner, 1250W 20L Wet/Dry', 4, N'Element 14', CAST(0x0000AA1E00A3F7C8 AS DateTime), CAST(0x0000B14100A3F7C8 AS DateTime))
INSERT [dbo].[Equipment] ([ID], [Code], [Brand], [Model], [CategoryID], [PurchasedFrom], [PurchaseDate], [WarrantyExpire]) VALUES (11, N'497ABG', N'SCS', N'ELECTRONIC VACCUME 120v', 2, N'Element 14', CAST(0x0000AA1E00A3F7C8 AS DateTime), CAST(0x0000B14100A3F7C8 AS DateTime))
SET IDENTITY_INSERT [dbo].[Equipment] OFF
INSERT [dbo].[EquipmentCategory] ([ID], [Name]) VALUES (1, N'Blower')
INSERT [dbo].[EquipmentCategory] ([ID], [Name]) VALUES (2, N'Vaccume Cleaner')
INSERT [dbo].[EquipmentCategory] ([ID], [Name]) VALUES (3, N'Steam Cleaner')
INSERT [dbo].[EquipmentCategory] ([ID], [Name]) VALUES (4, N'Wet & Dry Vaccume')
INSERT [dbo].[EquipmentCategory] ([ID], [Name]) VALUES (5, N'Scrubber')
SET IDENTITY_INSERT [dbo].[SubContractor] ON 

INSERT [dbo].[SubContractor] ([ID], [ContractorID], [Name], [AddressID], [ABN], [EmailAddress]) VALUES (1, 1, N'Danial G lyttle', 2, N'3280', N'danial.lyttle@gmial.com')
INSERT [dbo].[SubContractor] ([ID], [ContractorID], [Name], [AddressID], [ABN], [EmailAddress]) VALUES (3, 1, N'Xavioer Broke', 3, N'9603', N'xavioer.broke@gmial.com')
SET IDENTITY_INSERT [dbo].[SubContractor] OFF
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_SalariedFlag]  DEFAULT ((1)) FOR [SalariedFlag]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_VacationHours]  DEFAULT ((0)) FOR [VacationHours]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_SickLeaveHours]  DEFAULT ((0)) FOR [SickLeaveHours]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_CurrentFlag]  DEFAULT ((1)) FOR [CurrentFlag]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_ParttimeFlag]  DEFAULT ((0)) FOR [ParttimeFlag]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
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
ALTER TABLE [dbo].[JobEmployee]  WITH CHECK ADD  CONSTRAINT [FK_Contractor_ContractorEmployee] FOREIGN KEY([ContractorID])
REFERENCES [dbo].[Contractor] ([ContractorID])
GO
ALTER TABLE [dbo].[JobEmployee] CHECK CONSTRAINT [FK_Contractor_ContractorEmployee]
GO
ALTER TABLE [dbo].[JobEmployee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_ContractorEmployee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[JobEmployee] CHECK CONSTRAINT [FK_Employee_ContractorEmployee]
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
