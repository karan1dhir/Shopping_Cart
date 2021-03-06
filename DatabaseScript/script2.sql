USE [ShoppingCart]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 12-12-2018 17:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[ID] [uniqueidentifier] NOT NULL,
	[AddressLine1] [nvarchar](100) NOT NULL,
	[AddressLine2] [nvarchar](100) NULL,
	[Pin] [int] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartVariantMapping]    Script Date: 12-12-2018 17:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartVariantMapping](
	[ID] [uniqueidentifier] NOT NULL,
	[CartID] [uniqueidentifier] NOT NULL,
	[VariantID] [uniqueidentifier] NOT NULL,
	[SellingPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12-12-2018 17:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ProductsSold] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12-12-2018 17:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [uniqueidentifier] NOT NULL,
	[OrderDate] [smalldatetime] NOT NULL,
	[TotalAmount] [float] NOT NULL,
	[DeliveryAddressID] [uniqueidentifier] NOT NULL,
	[DeliveryDate] [smalldatetime] NOT NULL,
	[StatusID] [int] NOT NULL,
	[isCancelled] [char](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderPlaced]    Script Date: 12-12-2018 17:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPlaced](
	[ID] [uniqueidentifier] NOT NULL,
	[OrderID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderPlacedVariants]    Script Date: 12-12-2018 17:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPlacedVariants](
	[ID] [uniqueidentifier] NOT NULL,
	[OrderPlacedID] [uniqueidentifier] NOT NULL,
	[VariantID] [uniqueidentifier] NOT NULL,
	[SellingPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [uniqueidentifier] NOT NULL,
	[CategoryID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[OrderLimit] [int] NULL,
	[Description] [nvarchar](250) NULL,
	[TotalVariantsSold] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Property]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[HashPassword] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](11) NULL,
	[RoleID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAddressMapping]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddressMapping](
	[ID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NULL,
	[AddressID] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Value]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Value](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Variant]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Variant](
	[ID] [uniqueidentifier] NOT NULL,
	[SKU] [nvarchar](100) NULL,
	[ProductID] [uniqueidentifier] NOT NULL,
	[ListingPrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[QuantitySold] [int] NOT NULL,
	[Inventory] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VariantImage]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VariantImage](
	[ID] [uniqueidentifier] NOT NULL,
	[VariantID] [uniqueidentifier] NOT NULL,
	[ImageURL] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VariantPropertyValue]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VariantPropertyValue](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [uniqueidentifier] NOT NULL,
	[ValueID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'66a8d66f-a682-4a7c-a5c4-0280e66eec35', N'3-e/6 b.p nit fbd', N'3-e/6 b.p nit fbd', 121001, N'faridabad', N'haryana', N'India')
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'1acaeb84-0997-49ab-86e6-5842cdc31ea7', N'3-e/6 b.p nit fbd', N'3-e/6 b.p nit fbd', 121001, N'faridabad', N'haryana', N'India')
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'c5421612-de2d-46a4-b115-819024f3ca40', N'3-e/6 b.p nit fbd', N'3-e/6 b.p nit fbd', 121001, N'faridabad', N'haryana', N'India')
INSERT [dbo].[CartVariantMapping] ([ID], [CartID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'0cd53210-526b-45af-b028-85334616af69', N'5f11e18b-e9a3-4ae2-8f80-a10cbb311281', N'f0e00bf9-e39b-4a2d-8aa9-c201f5e8e0ee', 0, 1)
INSERT [dbo].[CartVariantMapping] ([ID], [CartID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'e559b61a-c85d-45d5-a316-c5db533cdbba', N'5f11e18b-e9a3-4ae2-8f80-a10cbb311281', N'9dbe3790-a79b-4c47-8c74-be08fa91202f', 0, 1)
INSERT [dbo].[Category] ([ID], [Name], [ProductsSold]) VALUES (N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'Shoes', 0)
INSERT [dbo].[Category] ([ID], [Name], [ProductsSold]) VALUES (N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'Music-CDs', 1)
INSERT [dbo].[Category] ([ID], [Name], [ProductsSold]) VALUES (N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'Technology', 1)
INSERT [dbo].[Category] ([ID], [Name], [ProductsSold]) VALUES (N'949dc197-d806-4be5-aa23-ca6e80605f62', N'Books', 0)
INSERT [dbo].[Category] ([ID], [Name], [ProductsSold]) VALUES (N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'Appliances', 0)
INSERT [dbo].[Order] ([ID], [OrderDate], [TotalAmount], [DeliveryAddressID], [DeliveryDate], [StatusID], [isCancelled]) VALUES (N'e2efe122-bf29-4bd2-8756-56ba6b52d9bf', CAST(N'2018-12-12T15:51:00' AS SmallDateTime), 750, N'66a8d66f-a682-4a7c-a5c4-0280e66eec35', CAST(N'2018-12-12T15:51:00' AS SmallDateTime), 1, N'N ')
INSERT [dbo].[Order] ([ID], [OrderDate], [TotalAmount], [DeliveryAddressID], [DeliveryDate], [StatusID], [isCancelled]) VALUES (N'190aca8e-5ac5-4f1f-aad3-a12a53e26051', CAST(N'2018-12-12T15:36:00' AS SmallDateTime), 2910, N'1acaeb84-0997-49ab-86e6-5842cdc31ea7', CAST(N'2018-12-12T15:36:00' AS SmallDateTime), 1, N'N ')
INSERT [dbo].[Order] ([ID], [OrderDate], [TotalAmount], [DeliveryAddressID], [DeliveryDate], [StatusID], [isCancelled]) VALUES (N'a6126efc-0a3b-4867-b425-d74bb835d85a', CAST(N'2018-12-12T16:02:00' AS SmallDateTime), 0, N'c5421612-de2d-46a4-b115-819024f3ca40', CAST(N'2018-12-12T16:02:00' AS SmallDateTime), 1, N'N ')
INSERT [dbo].[OrderPlaced] ([ID], [OrderID], [UserID]) VALUES (N'a2dd2377-2c5f-4740-be7f-3b94b3bf430e', N'e2efe122-bf29-4bd2-8756-56ba6b52d9bf', N'5f11e18b-e9a3-4ae2-8f80-a10cbb311281')
INSERT [dbo].[OrderPlaced] ([ID], [OrderID], [UserID]) VALUES (N'897c22b3-61f9-4c80-b73f-81d35b8c2a6a', N'a6126efc-0a3b-4867-b425-d74bb835d85a', N'5f11e18b-e9a3-4ae2-8f80-a10cbb311281')
INSERT [dbo].[OrderPlaced] ([ID], [OrderID], [UserID]) VALUES (N'1d6e8163-1c7b-4534-91b8-c8a16a157431', N'190aca8e-5ac5-4f1f-aad3-a12a53e26051', N'5f11e18b-e9a3-4ae2-8f80-a10cbb311281')
INSERT [dbo].[OrderPlacedVariants] ([ID], [OrderPlacedID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'12e5a29f-e17f-4385-8b9a-5c356481b2d8', N'1d6e8163-1c7b-4534-91b8-c8a16a157431', N'9dbe3790-a79b-4c47-8c74-be08fa91202f', 2910, 1)
INSERT [dbo].[OrderPlacedVariants] ([ID], [OrderPlacedID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'30de1175-4988-4d04-934c-8d913caae708', N'a2dd2377-2c5f-4740-be7f-3b94b3bf430e', N'dcd627cb-2f50-48bf-a0c5-cabd8c05ceda', 750, 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'b9813e3e-8851-42ab-9cdf-00f3f4c4ca5a', N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'ACE-11', N'Hola Samsung', 5, N'Its a Phone', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'02cbfcfa-4d3b-4d52-a49d-0888b35f126e', N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'kelvinator Refrigerator', N'Lives Ahead', 5, N'Lives Ahead', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'7cb24a63-eb07-4958-a543-0c5b94661a8d', N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'FootLife', N'Its about comfort', 5, N'Its about comfort', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'058378c3-9c0e-43c7-b039-0f524d61ca0a', N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'Hitachi Oven', N'Lives Ahead', 5, N'Lives Ahead', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'463e6983-77f9-4683-839f-0f724db000ff', N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'OnePLUS-6T', N'Hola Samsung', 5, N'Its a Phone', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'3f268071-a3f2-477c-9845-0fcb9fd8e845', N'949dc197-d806-4be5-aa23-ca6e80605f62', N'Shinchan-Comic', N'Its a Great Book', 5, N'Its a Great book', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'c5088876-7573-4659-ac67-115af7d6b386', N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'HushPuppies', N'Its about comfort', 5, N'Its about comfort', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'57f5774f-6511-4a61-96c6-1228e1dbbb66', N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'bada-230', N'Hola Samsung', 5, N'Its a Phone', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'03fa009b-fabe-420e-8d07-17abf6b2d07f', N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'fit-foot', N'Its about comfort', 5, N'Its about comfort', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'390f90e2-5ec1-435a-b678-1a079766b8d3', N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'RedChief-2', N'Its about comfort', 5, N'Its about comfort', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'4eb3d534-6155-4cb9-bee7-1b519e813fbd', N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'Nike', N'Its about comfort', 5, N'Its about comfort', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'f6cbc0ae-25d5-4601-b914-1c8b60fe10f5', N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'SalenaGomez', N'Its all about Music', 5, N'Its all about Music', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'816a37ae-a5d2-49c6-9530-1f465ea34ab4', N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'Hitachi Mixer', N'Lives Ahead', 5, N'Lives Ahead', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'01f0ca3f-8c1d-4ca8-8c32-20b93f55ec51', N'949dc197-d806-4be5-aa23-ca6e80605f62', N'Spiderman-Comic', N'Its a Great Book', 5, N'Its a Great book', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'4baf0803-bc25-4108-949d-28b4ddcb059a', N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'Kelvinator Grinder', N'Lives Ahead', 5, N'Lives Ahead', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'1aef842c-ce39-44f4-8ef9-28cac9b94a30', N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'Kelvinator Juicer', N'Lives Ahead', 5, N'Lives Ahead', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'ecd0e344-044d-403c-8afe-2bf90731822b', N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'LG Grinder', N'Lives Ahead', 5, N'Lives Ahead', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'132d86b5-26f5-4b76-83db-2cedbe9f81b4', N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'BackStreetBoys', N'Its all about Music', 5, N'Its all about Music', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'd20f5fd5-27a2-48d8-bf3d-2e789b66f3df', N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'Nokia', N'Hola Samsung', 5, N'Its a Phone', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'b389d1ae-3d26-4f59-be7f-3430d8046506', N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'Bata', N'Its about comfort', 5, N'Its about comfort', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'99cd4f09-3d71-4292-a950-3abc7cc8eb8e', N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'Ace-200', N'Live long Samsung', 5, N'Its an Phone', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'2d990f81-aba4-4303-b788-3bad18e7443b', N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'LG Refrigerator', N'Lives Ahead', 5, N'Lives Ahead', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'ddd8aed0-5a71-4b68-9342-3c9669a48d69', N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'TaylorSwift', N'Its all about Music', 5, N'Its all about Music', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'd0100adb-63e8-410e-9b8f-3cf728fbe278', N'949dc197-d806-4be5-aa23-ca6e80605f62', N'Beyblade-Comic', N'Its a Great Book', 5, N'Its a Great book', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'22bb3a91-15bf-4f3d-8594-40e353ed4676', N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'Shakira', N'Its all about Music', 5, N'Its all about Music', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'408dec82-7613-479b-ba97-41c5cda74036', N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'Puma-3', N'Its about comfort', 5, N'Its about comfort', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'832514f5-6568-42c5-8d42-4969b5742e2d', N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'LG Mixer', N'Lives Ahead', 5, N'Lives Ahead', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'ef16aeb0-f09f-49f3-afe8-4b6b6676d86d', N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'JassiGill', N'Its all about Music', 5, N'Its all about Music', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'61cd7d2a-c8a3-4bbc-b84d-4bcc2c8b080d', N'949dc197-d806-4be5-aa23-ca6e80605f62', N'Icici-Comic', N'Its a Great Book', 5, N'Its a Great book', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'd5fc7848-c9ce-4838-9c3f-4ddfc85bd979', N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'Hitachi Grinder ', N'Lives Ahead', 5, N'Lives Ahead', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'0e99342f-3cf9-4378-bd8c-4df8ff1e032d', N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'Red-Chief', N'Its about comfort', 5, N'Its about comfort', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'67a892e4-82cf-4217-bf89-5ee2d3db34b1', N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'Samsung Oven', N'Lives Ahead', 5, N'Lives Ahead', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'4135f51c-9eab-4c40-bce8-6175cacc66d8', N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'Hitachi Juicer', N'Lives Ahead', 5, N'Lives Ahead', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'a627ecc2-96a5-4451-a83a-617973b49b50', N'949dc197-d806-4be5-aa23-ca6e80605f62', N'Jin-Comic', N'Its a Great Book', 5, N'Its a Great book', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'76b22333-9ca0-4445-9dd0-629b97deea14', N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'Legendary', N'Its all about Music', 5, N'Its all about Music', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'40d66165-89f0-411a-a46f-64b65c3be71c', N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'force-10', N'Its about comfort', 5, N'Its about comfort', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'7368a1c7-2d3e-447b-afed-67d98a8ce26a', N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'OnePlus-5T', N'Hola Samsung', 5, N'Its a Phone', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'5c5e1da0-5b69-4947-bf1e-6ff6ca0e113c', N'949dc197-d806-4be5-aa23-ca6e80605f62', N'Superman-Comic', N'Its a Great Book', 5, N'Its a Great book', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'86a178ef-b55b-4447-8eef-7a6cf2556fe1', N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'RabbiShergill', N'Its all about Music', 5, N'Its all about Music', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'eb9b36c0-3477-4b3c-8ec3-7ab82f13e655', N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'Samsung-256', N'Hola Samsung', 5, N'Its a Phone', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'716e48f3-e687-4367-bc3f-7cd1cc5dd8e8', N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'OneDirection', N'Its all about Music', 5, N'Its all about Music', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'9daefacb-db70-450f-a2cf-8049bd6f7800', N'949dc197-d806-4be5-aa23-ca6e80605f62', N'Paul-Comic', N'Its a Great Book', 5, N'Its a Great book', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'8a7da0c6-153c-48d4-b5c2-8081f466935b', N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'Samsung Juicer', N'Lives Ahead', 5, N'Lives Ahead', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'a9e7f10f-23bc-4870-9e02-8102120fc5fd', N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'OnePlus-XS', N'Hola Samsung', 5, N'Its a Phone', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'4a849693-9a91-4e1d-86b9-825b6ac5b25e', N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'Kelvinator Oven', N'Lives Ahead', 5, N'Lives Ahead', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'f42e2761-8c11-46a6-a9cb-82ded0331abb', N'949dc197-d806-4be5-aa23-ca6e80605f62', N'Heman-Comic', N'Its a Great Book', 5, N'Its a Great book', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'ec3654e8-b7f6-44e6-abe6-85454b98a556', N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'Drake', N'Its all about Music', 5, N'Its all about Music', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'7bc296c9-b2ab-4720-9ac4-86589e75d766', N'949dc197-d806-4be5-aa23-ca6e80605f62', N'HarryPotter-Comic', N'Its a Great Book', 5, N'Its a Great book', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'57e97f35-10d3-4e0d-a8c3-8763c37728c6', N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'Readmi-4.0', N'Live long SmartPhone', 5, N'Its an Phone', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'b643b2ab-ead4-40e9-83bf-88291ed59344', N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'Bata-1', N'Its about comfort', 5, N'Its about comfort', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'482d2d73-c0b9-41a1-a4a5-89050d6d1555', N'949dc197-d806-4be5-aa23-ca6e80605f62', N'Hercules-Comic', N'Its a Great Book', 5, N'Its a Great book', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'61836dea-c5e9-47d7-a8bb-8d0007326875', N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'LG Juicer', N'Lives Ahead', 5, N'Lives Ahead', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'8af82192-f75f-446f-bda4-8df0ac338a9b', N'949dc197-d806-4be5-aa23-ca6e80605f62', N'Pokemon-Comic', N'Its a Great Book', 5, N'Its a Great book', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'52281ba4-5ac4-4dce-b171-9377e334067e', N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'RememberMeNow', N'Its all about Music', 5, N'Its all about Music', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'55ca5e2d-6b26-4d90-9091-9548767d6550', N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'NumeroUno', N'Its about comfort', 5, N'Its about comfort', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'82868a5e-a0e4-466e-9425-9913f63a5d6d', N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'Badshah', N'Its all about Music', 5, N'Its all about Music', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'7430fea6-c236-446c-8595-9beaa6de2f23', N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'Note-8', N'Live long Samsung', 5, N'Its an Phone', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'44a78384-66f4-49a0-9ee9-9e10c0fb853c', N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'Google-Pixel', N'Hola Samsung', 5, N'Its an Phone', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'6d4c2d8b-d14b-42f5-badf-a00eab8cf2b8', N'949dc197-d806-4be5-aa23-ca6e80605f62', N'Thor-Comic', N'Its a Great Book', 5, N'Its a Great book', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'9abc8f60-a1be-40f4-9863-a13a05516971', N'949dc197-d806-4be5-aa23-ca6e80605f62', N'HDFC-Comic', N'Its a Great Book', 5, N'Its a Great book', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'5265984b-316d-4107-8432-a14930d466ce', N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'WaveInFlag', N'Its all about Music', 5, N'Its all about Music', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'89d065d4-7d27-4a75-9bc5-a4bba85557bc', N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'Lotto', N'Its about comfort', 5, N'Its about comfort', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'f0e77fac-c405-4090-abdb-a7785114a60c', N'949dc197-d806-4be5-aa23-ca6e80605f62', N'GreenLandern-Comic', N'Its a Great Book', 5, N'Its a Great book', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'5b00ffa9-bc15-4770-9266-a79ea2e13f43', N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'OneRepublic', N'Its all about Music', 5, N'Its all about Music', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'e8fec112-b320-4b8a-bd76-ac33908ca62d', N'949dc197-d806-4be5-aa23-ca6e80605f62', N'Aquaman-Comic', N'Its a Great Book', 5, N'Its a Great book', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'ab9a5315-b848-455f-b385-add8033dbd14', N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'Vivo-11', N'Hola Samsung', 5, N'Its a Phone', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'415c12a1-9ce5-43d0-9102-aefcbea55de8', N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'Hitachi Refrigerator', N'Lives Ahead', 5, N'Lives Ahead', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'66c46a1b-ac92-4ebc-9d50-af2d7d115f7a', N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'Atta', N'Its about comfort', 5, N'Its about comfort', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'58000f57-f69b-4e28-9051-b00e3d1cd971', N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'Bada', N'Hola Samsung', 5, N'Its a Phone', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'23f1a028-ea32-45d5-8cee-b1d6b2c1f9c3', N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'Bata-2', N'Its about comfort', 5, N'Its about comfort', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'ae1a4c71-11f8-43f0-90b7-b2bf2a58c017', N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'LG Oven', N'Lives Ahead', 5, N'Lives Ahead', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'75c5cc20-f53e-406d-a84c-b58e4ce33e14', N'949dc197-d806-4be5-aa23-ca6e80605f62', N'Perman-Comic', N'Its a Great Book', 5, N'Its a Great book', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'92aed08d-b19b-4d3a-b3b1-b8b7c49fe83a', N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'Samsung Mixer', N'Lives Ahead', 5, N'Lives Ahead', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'f8805942-7b06-43bf-9002-b98fedb2ef73', N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'Bata-3', N'Its about comfort', 5, N'Its about comfort', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'69dbbf81-6baf-496e-bf36-bb7b65a87f8d', N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'Iphone', N'Live long Jobs', 5, N'Its an Iphone', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'b4526d19-697a-4fce-8ad3-bbce99c65b31', N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'SamsungAce', N'Best is here', 5, N'Its an Phone', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'eb2616d6-b1b9-495b-ad9d-bca6708fd4f8', N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'Shoe-Man', N'Its about comfort', 5, N'Its about comfort', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'42ad9bdf-6abd-4e08-85eb-c705990b0f27', N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'Samsung Grinder', N'Lives Ahead', 5, N'Lives Ahead', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'cbb0e1c8-0659-4cf3-97dd-c8996c0d850f', N'949dc197-d806-4be5-aa23-ca6e80605f62', N'Yes-Comic', N'Its a Great Book', 5, N'Its a Great book', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'1496a208-1acc-42f9-bc98-c8b6b11fadef', N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'OnePlus', N'Hola Samsung', 5, N'Its a Phone', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'01211bc4-ef51-48f0-8fbc-c96c715df01f', N'949dc197-d806-4be5-aa23-ca6e80605f62', N'Hehachi-Comic', N'Its a Great Book', 5, N'Its a Great book', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'274968f5-1f91-4a4b-bee1-cb69616144e7', N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'Adidas', N'Its about comfort', 5, N'Its about comfort', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'2edc36c3-e16a-4c2d-bc7b-cc1f54943889', N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'Samsung Refrigerator', N'Lives Ahead', 5, N'Lives Ahead', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'8e6be2a6-17d1-438a-91a7-cc56e1bdfc90', N'949dc197-d806-4be5-aa23-ca6e80605f62', N'Batman-Comic', N'Its a Great Book', 5, N'Its a Great book', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'a03179ed-79d2-416a-901a-d3653897d9c9', N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'XOLO-11', N'Hola Samsung', 5, N'Its a Phone', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'0aab15e0-f524-4f49-9ac4-d40424cfde74', N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'OnePlus-2', N'Hola Samsung', 5, N'Its an Phone', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'939c07f1-b233-4bf0-b4d8-d8b98546210b', N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'Bata-10', N'Its about comfort', 5, N'Its about comfort', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'57546047-c4cd-49f6-b293-d9a4ec2b6aeb', N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'LifeAhead', N'Its about comfort', 5, N'Its about comfort', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'71d504c6-2274-4bbc-9537-da4aeed6ff6a', N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'KatyPerry', N'Its all about Music', 5, N'Its all about Music', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'78973b63-4ce9-452e-8132-ded2a81f36c9', N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'Ellie', N'Its all about Music', 5, N'Its all about Music', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'5188cc98-1f5a-4757-a004-e035385a0015', N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'ShotInDart', N'Its all about Music', 5, N'Its all about Music', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'7e5b7733-9209-424c-92c5-e15d36c6c45e', N'b4b02a6f-4a1e-451a-a16d-e52778c1b4dd', N'Kelvinator Mixer', N'Lives Ahead', 5, N'Lives Ahead', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'249be914-fe59-4dde-b1c7-e1a99ff1cabb', N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'Ariana', N'Its all about Music', 5, N'Its all about Music', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'22d93695-2f28-4272-89a5-e43095bebb34', N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'HolaMadraid', N'Its all about Music', 5, N'Its all about Music', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'ebbaddc5-0826-49b8-90a8-e8d20441ff72', N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'GooglePixel', N'Buy our Product', 5, N'Its an Phone', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'3d7b7eee-f283-4500-b259-f29372927583', N'e5de569a-f93f-4333-a3f1-1478b2cb054e', N'Puma', N'Its about comfort', 5, N'Its about comfort', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'd2eb4eca-317f-413e-bb5b-f618956783ff', N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'Emenium', N'Its all about Music', 5, N'Its all about Music', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'a23ee4f1-bbf0-471c-8b5f-f74d038c8f47', N'949dc197-d806-4be5-aa23-ca6e80605f62', N'Dr.Strange-Comic', N'Its a Great Book', 5, N'Its a Great book', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'd925c9f1-b4d4-454e-a2f3-f93a4d1cbd5c', N'f70a5088-09fb-41b0-b0e6-c2b72bc3bd85', N'Motorola-XS', N'Live long Android', 5, N'Its an Phone', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'035213a1-caa0-44d5-886f-ff0bd5adfd86', N'844c1860-680c-4649-9665-aabcd8c1d9e8', N'EdSheeran', N'Its all about Music', 5, N'Its all about Music', 0)
GO
INSERT [dbo].[Property] ([ID], [Name]) VALUES (N'82b1a8b0-8b8b-40d8-94f3-10d7651a3577', N'size')
INSERT [dbo].[Property] ([ID], [Name]) VALUES (N'e69262a4-5fde-449d-aaab-23d0ab0aa6c4', N'color-size')
INSERT [dbo].[Property] ([ID], [Name]) VALUES (N'a0d3c996-f793-434b-b1d7-579f6c435950', N'color')
INSERT [dbo].[Property] ([ID], [Name]) VALUES (N'6c85763f-78fa-4abd-8f0a-d411e1ee1831', N'cover')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'e8e1abdc-b599-45b1-ba0e-5d8ad2467d74', N'CUSTROMER')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'd54f0971-e61e-4d34-8a45-7d7c818fedc4', N'ADMIN')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'4d38c26a-941e-4def-be1c-9a394a2f5b2d', N'USER')
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([ID], [description]) VALUES (1, N'PROCESSING')
INSERT [dbo].[Status] ([ID], [description]) VALUES (2, N'CANCELLED')
INSERT [dbo].[Status] ([ID], [description]) VALUES (3, N'DELIEVERED')
SET IDENTITY_INSERT [dbo].[Status] OFF
INSERT [dbo].[User] ([ID], [Name], [HashPassword], [Email], [PhoneNumber], [RoleID]) VALUES (N'5f11e18b-e9a3-4ae2-8f80-a10cbb311281', N'karan ', N'$2a$10$qOS1uz./EcL4bQ4FiA8/net5VXu2wvAFCgD4HZYZNuLktalrh6GkW', N'karandhir64@yahoo.co.in', N'7838563891', N'4d38c26a-941e-4def-be1c-9a394a2f5b2d')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'755cb6c1-b531-43d6-aaed-2b89212f6a73', N'5f11e18b-e9a3-4ae2-8f80-a10cbb311281', N'1acaeb84-0997-49ab-86e6-5842cdc31ea7')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'4de1b224-bbcb-4146-bbb2-95e26eeb4f85', N'5f11e18b-e9a3-4ae2-8f80-a10cbb311281', N'66a8d66f-a682-4a7c-a5c4-0280e66eec35')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'a3185126-54b9-4ed9-8ebc-bea7775a4ea9', N'5f11e18b-e9a3-4ae2-8f80-a10cbb311281', N'c5421612-de2d-46a4-b115-819024f3ca40')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'd22bf74b-0019-4e3a-ab9b-24fde69c48f1', N'Orange')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'297d9567-95f5-4f6a-918b-29d7116249d2', N'Hard')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'0edd3fd2-60eb-4dc2-ae1c-2c0ebe0e290f', N'Black-L')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'bb90c0b4-609b-4b28-a4ab-2d7b0f1cb72d', N'RED')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'71c3530b-6b42-49f5-8a3c-438cd55529c3', N'Black')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'b6dbbff6-be45-4bed-b40e-49afea7ef6ef', N'XS')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'2602e84e-09ec-4458-b890-6e766215cf89', N'Black-M')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'c6b345be-24d5-4a1e-863d-9a789c00fc91', N'Silver')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'1ad9449e-257d-4b82-bb1d-b9eb11118e6f', N'Blue')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'21badad9-b50b-4248-a60d-ca8c13cdad20', N'White')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'539a2c4f-751b-4fd8-8652-d630c4d10847', N'Pink')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'e7c04049-18fe-4d2d-acea-d6e703ddc1d3', N'Standard')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'd589bf10-5329-4626-b4b1-d99c72468d40', N'Green')
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'6dd71165-e093-411d-8228-0a4ddede9c18', N'1032', N'816a37ae-a5d2-49c6-9530-1f465ea34ab4', 10000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'b30a11ad-ba3d-4a16-9002-1290d54c4f5b', N'1032', N'42ad9bdf-6abd-4e08-85eb-c705990b0f27', 10000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'7ff23af4-2e70-4d67-9516-15f68280acf6', N'1021~1029', N'8e6be2a6-17d1-438a-91a7-cc56e1bdfc90', 2000, 13, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'ee7a80d6-21e9-4a60-9cdc-15ff4c7b99de', N'1031', N'274968f5-1f91-4a4b-bee1-cb69616144e7', 1000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'1960a5f4-c441-4685-96b2-1b766309d788', N'1031', N'0e99342f-3cf9-4378-bd8c-4df8ff1e032d', 4000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'a3bc4edc-d759-4730-a1ba-1d362dc5bb33', N'1032', N'02cbfcfa-4d3b-4d52-a49d-0888b35f126e', 10000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'6c6ad87b-5d1f-46c4-9715-1d43516dbfb8', N'1024~1022', N'ebbaddc5-0826-49b8-90a8-e8d20441ff72', 1000, 10, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'1791de28-fd7e-482b-b688-1fdef3e6c598', N'1030', N'716e48f3-e687-4367-bc3f-7cd1cc5dd8e8', 1100, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'10a88e9c-800d-4c5d-b8ff-216d763efd8b', N'1024~1022', N'1496a208-1acc-42f9-bc98-c8b6b11fadef', 1000, 20, 2, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'efaf1e04-cd72-4c9a-8181-32e610014802', N'1032', N'7e5b7733-9209-424c-92c5-e15d36c6c45e', 10000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'84de2871-59d7-4716-833a-375d16e072fa', N'1025~1022', N'0aab15e0-f524-4f49-9ac4-d40424cfde74', 1000, 50, 3, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'a6d046f8-9203-404e-9dc7-379be5f90088', N'1030', N'52281ba4-5ac4-4dce-b171-9377e334067e', 2000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'f251ca64-1e12-4381-8308-3a3c512e83f0', N'1031', N'eb2616d6-b1b9-495b-ad9d-bca6708fd4f8', 5000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'c9358b7c-7700-433e-9779-3a9f7400ee5c', N'1032', N'4135f51c-9eab-4c40-bce8-6175cacc66d8', 10000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'aeb1e601-e42c-46ed-ad52-3d0bf8e60d5f', N'1021~1029', N'3f268071-a3f2-477c-9845-0fcb9fd8e845', 4000, 5, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'6aefed9c-507d-45ab-8c0a-3e560fdbb33f', N'1032', N'92aed08d-b19b-4d3a-b3b1-b8b7c49fe83a', 10000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'cd31c1dd-c2ae-40aa-8c37-3e7212d277eb', N'1030', N'ddd8aed0-5a71-4b68-9342-3c9669a48d69', 2000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'82d37e91-41da-47cd-8e6f-3ff7f53f5944', N'1031', N'7cb24a63-eb07-4958-a543-0c5b94661a8d', 3000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'e679e12b-f22a-41bd-a2e4-4209f98ff049', N'1032', N'415c12a1-9ce5-43d0-9102-aefcbea55de8', 10000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'f83f566c-13be-4339-878b-467a7319dff6', N'1033~1022', N'69dbbf81-6baf-496e-bf36-bb7b65a87f8d', 1000, 10, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'c394033e-33fb-4dd5-8173-47a7b4be3222', N'1021~1029', N'a23ee4f1-bbf0-471c-8b5f-f74d038c8f47', 3000, 5, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'5e354d8a-1140-43ab-8b99-48bc04e9f2da', N'1021~1022', N'b4526d19-697a-4fce-8ad3-bbce99c65b31', 1000, 10, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'82e8b4ce-8382-4c46-bc5d-4f57103d06d1', N'1032', N'1aef842c-ce39-44f4-8ef9-28cac9b94a30', 10000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'657712ec-4aa9-4fc4-b3c8-52ccd8895f9c', N'1031', N'b643b2ab-ead4-40e9-83bf-88291ed59344', 1000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'3f8b1bb5-6bcc-4517-8a8e-5491860a2910', N'1032', N'2edc36c3-e16a-4c2d-bc7b-cc1f54943889', 10000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'142b3f2f-30b9-48b8-bf70-54be809f94ac', N'1031', N'23f1a028-ea32-45d5-8cee-b1d6b2c1f9c3', 1000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'5ed6d6cf-bbdc-4772-baeb-54d5b62b108e', N'1032', N'832514f5-6568-42c5-8d42-4969b5742e2d', 10000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'f45ed427-34a2-4047-9c69-552594e2ea76', N'1021~1022', N'99cd4f09-3d71-4292-a950-3abc7cc8eb8e', 1000, 10, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'c67acf12-0e57-4166-b29a-587424d4af5f', N'1032', N'61836dea-c5e9-47d7-a8bb-8d0007326875', 10000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'284dec6e-09e7-46e5-9521-58f862304411', N'1021~1029', N'7bc296c9-b2ab-4720-9ac4-86589e75d766', 2700, 4, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'f6b1d3bb-66fa-4335-8933-5901ffeffb0f', N'1025~1022', N'69dbbf81-6baf-496e-bf36-bb7b65a87f8d', 1000, 10, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'81d8450d-b771-4a71-b24d-5c750461102d', N'1021~1029', N'8af82192-f75f-446f-bda4-8df0ac338a9b', 9000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'5c4290fa-3a58-4395-9c65-604054a14782', N'1031', N'55ca5e2d-6b26-4d90-9091-9548767d6550', 4000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'c3e4731a-d176-4ae8-b41c-608948efcd9c', N'1031', N'939c07f1-b233-4bf0-b4d8-d8b98546210b', 1000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'3f53630b-e477-4ccb-bcd7-613837158677', N'1030', N'f6cbc0ae-25d5-4601-b914-1c8b60fe10f5', 6000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'3e4d2924-9f3d-4a42-8fc5-6aa98972f4e5', N'1032', N'ae1a4c71-11f8-43f0-90b7-b2bf2a58c017', 10000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'a073dee0-a96a-4f45-9500-6c12f3582792', N'1021~1029', N'd0100adb-63e8-410e-9b8f-3cf728fbe278', 1000, 3, 6, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'295e0fb7-06c4-4066-aa79-728925c30efc', N'1021~1029', N'482d2d73-c0b9-41a1-a4a5-89050d6d1555', 4000, 2, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'0159bba4-115b-43db-b108-72b99f52de41', N'1021~1029', N'e8fec112-b320-4b8a-bd76-ac33908ca62d', 2000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'3871e933-f76c-4b90-857c-74cd260531dd', N'1031', N'66c46a1b-ac92-4ebc-9d50-af2d7d115f7a', 2000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'193bb1bc-a58d-432d-ad2a-76c9107024fc', N'1021~1029', N'01f0ca3f-8c1d-4ca8-8c32-20b93f55ec51', 2500, 4, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'4262bacf-0468-40ab-bc07-79033bad0885', N'1032', N'67a892e4-82cf-4217-bf89-5ee2d3db34b1', 10000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'559e57ec-3e62-44e5-bcad-7a4856957077', N'1021~1029', N'a627ecc2-96a5-4451-a83a-617973b49b50', 3000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'90939e22-ecea-46ae-8dca-7c73602b170f', N'1031', N'03fa009b-fabe-420e-8d07-17abf6b2d07f', 11000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'd74af396-dd66-4b3a-a5f6-7cf8c4df61c3', N'1030', N'78973b63-4ce9-452e-8132-ded2a81f36c9', 5000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'7e532093-af9f-4491-8a60-82334066e5df', N'1025~1022', N'd20f5fd5-27a2-48d8-bf3d-2e789b66f3df', 1000, 2, 20, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'fe87a486-b50b-43d7-98f3-84d2adf7132c', N'1032', N'ecd0e344-044d-403c-8afe-2bf90731822b', 10000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'415a1ace-9328-4d78-8b55-8670759a1e7d', N'1021~1022', N'69dbbf81-6baf-496e-bf36-bb7b65a87f8d', 1000, 10, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'b3f28571-bb2e-4927-9b11-86c349eb2413', N'1021~1029', N'f0e77fac-c405-4090-abdb-a7785114a60c', 6000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'9f076fa6-07ae-4736-b82a-897348790dc2', N'1030', N'035213a1-caa0-44d5-886f-ff0bd5adfd86', 1000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'4b0f34aa-743c-4cef-8131-8b3f55d19a01', N'1023~1022', N'7430fea6-c236-446c-8595-9beaa6de2f23', 1000, 10, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'865ae975-f2b9-4c3f-bb08-8e4c99008476', N'1030', N'22bb3a91-15bf-4f3d-8594-40e353ed4676', 7000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'de65f0df-0d02-4c57-8062-9510052d21c7', N'1021~1029', N'f42e2761-8c11-46a6-a9cb-82ded0331abb', 2600, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'801be311-0e2b-4066-a2e6-98351b6cca94', N'1032', N'058378c3-9c0e-43c7-b039-0f524d61ca0a', 10000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'81bd95d5-f83c-4aca-9d7f-9c1cb78c0712', N'1021~1022', N'7368a1c7-2d3e-447b-afed-67d98a8ce26a', 1000, 30, 3, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'7f99ad86-9d71-4fec-b2dd-9cdeb4dae0c0', N'1031', N'89d065d4-7d27-4a75-9bc5-a4bba85557bc', 6000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'79cd8e65-9721-4324-9cc4-a148e30055c2', N'1030', N'5188cc98-1f5a-4757-a004-e035385a0015', 3000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'9b30967a-73e4-4026-b291-a1aa7e2a6cb7', N'1028~1022', N'b9813e3e-8851-42ab-9cdf-00f3f4c4ca5a', 1000, 13, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'6454dfea-7728-41f3-b38d-a3a8287675eb', N'1021~1029', N'9abc8f60-a1be-40f4-9863-a13a05516971', 9000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'cca600e4-9448-4c60-8571-a40228f9d4ce', N'1031', N'f8805942-7b06-43bf-9002-b98fedb2ef73', 1000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'1cf03dba-818d-4e20-b278-a7fd16ed2cf8', N'1031', N'b389d1ae-3d26-4f59-be7f-3430d8046506', 1000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'1b1a6912-cec3-4134-a2b2-a9bf5440b3b7', N'1023~1022', N'58000f57-f69b-4e28-9051-b00e3d1cd971', 1000, 5, 4, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'ef7b0c50-9811-403e-8430-ac1b5a5ead2b', N'1021~1029', N'61cd7d2a-c8a3-4bbc-b84d-4bcc2c8b080d', 7000, 3, 10, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'42dc8c91-ecf7-4647-a525-ad2f85e874b0', N'1021~1022', N'44a78384-66f4-49a0-9ee9-9e10c0fb853c', 1000, 10, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'1be98746-d262-464a-a468-af3670b43fb8', N'1021~1022', N'd925c9f1-b4d4-454e-a2f3-f93a4d1cbd5c', 1000, 10, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'3e15fbf2-cde5-4467-b320-b1e12234c026', N'1030', N'86a178ef-b55b-4447-8eef-7a6cf2556fe1', 1000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'9b7f12d7-955b-4506-8ecd-b433f76718c4', N'1031', N'4eb3d534-6155-4cb9-bee7-1b519e813fbd', 3000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'de376f1b-95a1-4a73-9d6e-ba5a94123501', N'1028~1022', N'a03179ed-79d2-416a-901a-d3653897d9c9', 1000, 13, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'6c0d4109-ce31-4c83-8e6e-ba5ea1ea5987', N'1030', N'5b00ffa9-bc15-4770-9266-a79ea2e13f43', 4000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'52f13e75-9025-4c32-badb-bbea6221e59d', N'1030', N'76b22333-9ca0-4445-9dd0-629b97deea14', 4000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'312177a4-dc4b-4e6d-9077-bcee2ba77eda', N'1021~1029', N'75c5cc20-f53e-406d-a84c-b58e4ce33e14', 1000, 2, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'9dbe3790-a79b-4c47-8c74-be08fa91202f', N'1030', N'132d86b5-26f5-4b76-83db-2cedbe9f81b4', 3000, 3, 6, 99)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'4db5109e-17a6-4828-addd-bf5ec50bdd03', N'1024~1022', N'69dbbf81-6baf-496e-bf36-bb7b65a87f8d', 1000, 10, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'b78d1a82-b683-4e9c-bd20-bfb654faf753', N'1030', N'22d93695-2f28-4272-89a5-e43095bebb34', 1000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'f0e00bf9-e39b-4a2d-8aa9-c201f5e8e0ee', N'1031', N'c5088876-7573-4659-ac67-115af7d6b386', 2000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'db36ebfa-8506-4cbf-b250-c49af639806f', N'1032', N'd5fc7848-c9ce-4838-9c3f-4ddfc85bd979', 10000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'a529d5ac-7e94-4dcc-8d0e-c4a41b824874', N'1021~1029', N'5c5e1da0-5b69-4947-bf1e-6ff6ca0e113c', 3000, 11, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'89c0232b-fb6b-43d6-8852-c56980695534', N'1021~1029', N'01211bc4-ef51-48f0-8fbc-c96c715df01f', 4000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'176355e4-a0b9-4ddb-bd88-c5aadb595c03', N'1030', N'71d504c6-2274-4bbc-9537-da4aeed6ff6a', 3000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'547c3b8e-afff-4f2c-81ad-cab1d5d06585', N'1021~1029', N'6d4c2d8b-d14b-42f5-badf-a00eab8cf2b8', 1000, 1, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'91134c3e-4ca3-48ac-b039-cab7d5e00d90', N'1032', N'4baf0803-bc25-4108-949d-28b4ddcb059a', 10000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'dcd627cb-2f50-48bf-a0c5-cabd8c05ceda', N'1027~1022', N'463e6983-77f9-4683-839f-0f724db000ff', 1000, 25, 11, 99)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'7c58e87a-2a08-45aa-ba73-cb4c4cf53d3e', N'1021~1029', N'cbb0e1c8-0659-4cf3-97dd-c8996c0d850f', 3000, 3, 2, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'122a28e7-0b40-4936-8e93-cb716ee966a8', N'1031', N'390f90e2-5ec1-435a-b678-1a079766b8d3', 6000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'6b8a4b0c-e1f0-42e9-99ce-e499cb2cb2b4', N'1030', N'249be914-fe59-4dde-b1c7-e1a99ff1cabb', 5000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'7444b594-5c6f-4cf1-bac0-e59f854cba15', N'1031', N'40d66165-89f0-411a-a46f-64b65c3be71c', 1000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'60c0e194-30cb-4d04-ad1e-e623bdb4c8aa', N'1030', N'82868a5e-a0e4-466e-9425-9913f63a5d6d', 8000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'47699fe6-f9b5-4739-bda6-e6264ecd4835', N'1027~1022', N'a9e7f10f-23bc-4870-9e02-8102120fc5fd', 1000, 40, 9, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'f7ff5fb2-04b8-4b55-ac42-e68b1740ea07', N'1021~1022', N'57e97f35-10d3-4e0d-a8c3-8763c37728c6', 1000, 10, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'5d5f6fc6-b329-4adc-8731-e7f2a1d02333', N'1031', N'408dec82-7613-479b-ba97-41c5cda74036', 7000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'534f613b-03c4-49f7-91af-e90a5a307df3', N'1030', N'ec3654e8-b7f6-44e6-abe6-85454b98a556', 3000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'67941eab-1c13-4213-a3c8-e92d78c4601d', N'1030', N'd2eb4eca-317f-413e-bb5b-f618956783ff', 5000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'e527ad07-1c0d-42a0-8fb1-e9499fc99d79', N'1021~1029', N'9daefacb-db70-450f-a2cf-8049bd6f7800', 1000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'3928d5c5-3381-498f-9e8f-ea921e1ee2eb', N'1032', N'2d990f81-aba4-4303-b788-3bad18e7443b', 10000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'96da2519-3cd8-4102-8a6b-ebf3fcb3aebe', N'1032', N'4a849693-9a91-4e1d-86b9-825b6ac5b25e', 10000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'6709c2bd-7909-4ae8-92bf-ef9e825532c3', N'1030', N'ef16aeb0-f09f-49f3-afe8-4b6b6676d86d', 5000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'663e9a16-15a7-4415-9502-f18059a8ae90', N'1032', N'8a7da0c6-153c-48d4-b5c2-8081f466935b', 10000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'449077bf-d0ce-4c3f-8ccf-f49df27bfe0e', N'1031', N'3d7b7eee-f283-4500-b259-f29372927583', 2000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'e1c0ac1b-ef35-4cb9-a1e1-f760a69dd824', N'1021~1022', N'eb9b36c0-3477-4b3c-8ec3-7ab82f13e655', 1000, 20, 3, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'8d06cdc5-246e-4da3-82b9-f79dd34fcca5', N'1031', N'57546047-c4cd-49f6-b293-d9a4ec2b6aeb', 9000, 3, 5, 100)
GO
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'cfbe6453-4940-4ce5-b611-f7b06dba3574', N'1028~1022', N'ab9a5315-b848-455f-b385-add8033dbd14', 1000, 13, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'72faad18-90a2-4966-8899-f7c29fa80aa5', N'1030', N'5265984b-316d-4107-8432-a14930d466ce', 1000, 3, 5, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'a134dee1-7c29-430a-9e02-fff71f00fed1', N'1026~1022', N'57f5774f-6511-4a61-96c6-1228e1dbbb66', 1000, 3, 2, 100)
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'42d39946-8cb3-4903-8967-00a713835fee', N'193bb1bc-a58d-432d-ad2a-76c9107024fc', N'https://image.shutterstock.com/image-photo/stack-tack-books-isolated-on-450w-92946784.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'05c2e503-fb46-4897-8ebf-031467bbb38e', N'3871e933-f76c-4b90-857c-74cd260531dd', N'https://image.shutterstock.com/image-photo/portugal-november-20-2017the-force-450w-758688058.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'abb01f54-07d0-4c43-a744-0c108807f691', N'7ff23af4-2e70-4d67-9516-15f68280acf6', N'https://image.shutterstock.com/image-photo/book-450w-732217162.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'51f64f34-c5cd-4d68-97fe-0f17a253ea39', N'8d06cdc5-246e-4da3-82b9-f79dd34fcca5', N'https://image.shutterstock.com/image-photo/group-shoes-on-isolated-background-450w-754651234.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'7d21748a-df47-42ea-a176-110757c1ca25', N'a3bc4edc-d759-4730-a1ba-1d362dc5bb33', N'https://image.shutterstock.com/image-vector/kitchen-provence-color-there-furniture-450w-554764099.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'52a42697-56d6-42b9-a875-1431a465f443', N'f7ff5fb2-04b8-4b55-ac42-e68b1740ea07', N'https://image.shutterstock.com/image-photo/hand-holding-smartphone-drawn-media-450w-248776741.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'a8d806d7-3f4f-41d1-8db5-14ac14734976', N'efaf1e04-cd72-4c9a-8181-32e610014802', N'https://image.shutterstock.com/image-illustration/set-household-home-appliancess-on-450w-1074222590.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'06590c6f-fc72-4fda-ba62-16f8d1820280', N'547c3b8e-afff-4f2c-81ad-cab1d5d06585', N'https://image.shutterstock.com/image-photo/open-magic-book-lights-on-450w-218825869.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'a15ac772-12f6-4d18-9112-19d77ed538e0', N'3928d5c5-3381-498f-9e8f-ea921e1ee2eb', N'https://image.shutterstock.com/image-vector/modern-kitchen-on-yellow-background-450w-404867530.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'987bac9e-0f34-4019-9c73-1b46795e5c1c', N'4db5109e-17a6-4828-addd-bf5ec50bdd03', N'https://image.shutterstock.com/image-photo/hand-using-phone-white-screen-450w-328551176.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'64bb3e11-334f-458e-9e15-1bc0ebd64ff7', N'42dc8c91-ecf7-4647-a525-ad2f85e874b0', N'https://image.shutterstock.com/image-vector/clean-mobile-ui-design-concept-450w-1031608870.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'40df188c-1642-4d9d-81a9-21e39876aeaf', N'865ae975-f2b9-4c3f-bb08-8e4c99008476', N'https://image.shutterstock.com/image-photo/san-franciso-ca-september-13-450w-715985080.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'a42edfe3-3a55-4f4d-b9ec-2318ed4c3537', N'449077bf-d0ce-4c3f-8ccf-f49df27bfe0e', N'https://image.shutterstock.com/image-photo/old-sport-shoes-450w-271492538.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'd897cd08-610a-464e-9092-2574a287da43', N'91134c3e-4ca3-48ac-b039-cab7d5e00d90', N'https://image.shutterstock.com/image-vector/two-colored-horizontal-banners-set-450w-468544937.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'04b577d2-daaf-424f-b76d-27983229652b', N'60c0e194-30cb-4d04-ad1e-e623bdb4c8aa', N'https://image.shutterstock.com/image-photo/young-handsome-african-man-holding-450w-471817784.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'3278e7ef-b05c-484a-9cca-2d54d9408f56', N'c3e4731a-d176-4ae8-b41c-608948efcd9c', N'https://image.shutterstock.com/image-photo/mens-brown-shoes-on-white-450w-713254657.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'5d998aac-f1e4-4347-bc24-2ebd5d78c595', N'cfbe6453-4940-4ce5-b611-f7b06dba3574', N'https://image.shutterstock.com/image-photo/man-typing-keyboard-laptop-handproject-450w-447406066.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'81d03c02-3264-4a31-b3bf-2f59a02a9dce', N'415a1ace-9328-4d78-8b55-8670759a1e7d', N'https://image.shutterstock.com/image-vector/mobile-phone-smartphone-template-circle-450w-1160092174.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'2e5c4d91-b489-43ee-b0f3-32c225d931ce', N'0159bba4-115b-43db-b108-72b99f52de41', N'https://image.shutterstock.com/image-illustration/3d-illustration-white-bookshelves-various-450w-383710669.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'69fe44d1-122b-425c-921a-3331302b5ddd', N'b78d1a82-b683-4e9c-bd20-bfb654faf753', N'https://image.shutterstock.com/image-photo/rock-band-performs-on-stage-450w-1018479406.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'df4cca1b-dffb-4680-a3ae-3685bc25609d', N'6709c2bd-7909-4ae8-92bf-ef9e825532c3', N'https://image.shutterstock.com/image-photo/halloween-witch-creates-magic-attractive-450w-487438969.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'af5c9d73-ac2b-4c84-b66c-37484ec2add0', N'47699fe6-f9b5-4739-bda6-e6264ecd4835', N'https://image.shutterstock.com/image-photo/team-job-photo-young-businessmans-450w-387274792.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'a919e56c-3ce4-4d62-bb66-391136e8df84', N'5c4290fa-3a58-4395-9c65-604054a14782', N'https://image.shutterstock.com/image-photo/pair-old-well-worn-military-450w-120367.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'7c6636d5-efca-4be6-8dc9-3c0bd9971112', N'559e57ec-3e62-44e5-bcad-7a4856957077', N'https://image.shutterstock.com/image-photo/unique-vintage-antique-books-copy-450w-68176987.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'b48cbf1a-9674-4eed-a040-3cdbb9746ac1', N'6c0d4109-ce31-4c83-8e6e-ba5ea1ea5987', N'https://image.shutterstock.com/image-photo/guitarist-on-stage-singer-concert-450w-1181137801.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'31849e8f-2476-4125-9835-40cfbee6768d', N'82e8b4ce-8382-4c46-bc5d-4f57103d06d1', N'https://image.shutterstock.com/image-illustration/set-household-home-appliancess-on-450w-1074222590.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'571e8657-b271-43b6-b339-4d14d3f02de7', N'5ed6d6cf-bbdc-4772-baeb-54d5b62b108e', N'https://image.shutterstock.com/image-vector/interior-living-room-modern-cozy-450w-1043312401.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'5cf40cbb-2c0c-4941-a779-4d19b3152e9b', N'9b7f12d7-955b-4506-8ecd-b433f76718c4', N'https://image.shutterstock.com/image-photo/concept-run-love-blue-running-450w-1183178386.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'382c81ea-7670-4718-9277-4f3fc5703ebb', N'67941eab-1c13-4213-a3c8-e92d78c4601d', N'https://image.shutterstock.com/image-photo/terrible-plague-doctor-medieval-europe-450w-255800578.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'93a7a5a1-2359-4854-b3f7-530231994221', N'5d5f6fc6-b329-4adc-8731-e7f2a1d02333', N'https://image.shutterstock.com/image-photo/leather-boots-typical-traditional-andalusian-450w-198194531.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'36b625a3-6351-418b-b028-53489b3f912d', N'fe87a486-b50b-43d7-98f3-84d2adf7132c', N'https://image.shutterstock.com/image-vector/kitchen-furniture-long-shadows-flat-450w-215338024.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'9b2093b6-56ae-4303-a90e-53aba74f7aa3', N'312177a4-dc4b-4e6d-9077-bcee2ba77eda', N'https://image.shutterstock.com/image-photo/books-various-literary-genres-on-450w-113890540.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'59288063-cfd0-48b4-bea9-5602fd4297a7', N'10a88e9c-800d-4c5d-b8ff-216d763efd8b', N'https://image.shutterstock.com/image-photo/business-meeting-conceptcoworkers-team-working-450w-1016849572.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'd3f4af5a-1d1a-42ef-894a-56ddd2b7bd21', N'81bd95d5-f83c-4aca-9d7f-9c1cb78c0712', N'https://image.shutterstock.com/image-photo/concept-digital-diagramgraph-interfacesvirtual-screenconnections-450w-720823048.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'c7e9166d-624a-4363-892e-5b392ea2846b', N'5e354d8a-1140-43ab-8b99-48bc04e9f2da', N'https://image.shutterstock.com/image-vector/website-wireframe-mobile-apps-round-450w-1008309199.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'05d219fb-297e-4439-b4f9-5edf8d1605b5', N'f251ca64-1e12-4381-8308-3a3c512e83f0', N'https://image.shutterstock.com/image-photo/group-shoes-on-white-background-450w-1018053109.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'ad57593b-bfac-4b9a-8475-64297bea2c85', N'9dbe3790-a79b-4c47-8c74-be08fa91202f', N'https://image.shutterstock.com/image-photo/showman-young-male-entertainer-presenter-450w-1079231687.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'd7116af4-b2d3-4c23-bfce-6990c19ed856', N'295e0fb7-06c4-4066-aa79-728925c30efc', N'https://image.shutterstock.com/image-vector/library-wooden-book-shelf-bookcase-450w-670174969.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'e85dd297-52b4-467f-a357-69fc2454644c', N'534f613b-03c4-49f7-91af-e90a5a307df3', N'https://image.shutterstock.com/image-photo/drummer-playing-on-drum-set-450w-1194464716.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'c86ac3eb-4caa-4219-9515-6a605b521433', N'7e532093-af9f-4491-8a60-82334066e5df', N'https://image.shutterstock.com/image-photo/handsome-male-beautiful-female-mobile-450w-714655705.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'c6ff549a-1973-464c-a7fa-6ab1e7d38e4c', N'6aefed9c-507d-45ab-8c0a-3e560fdbb33f', N'https://image.shutterstock.com/image-vector/living-room-furniture-cozy-interior-450w-413982937.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'93283134-d128-4b70-baa2-6be6ffcebd7d', N'1960a5f4-c441-4685-96b2-1b766309d788', N'https://image.shutterstock.com/image-photo/pair-sport-shoes-on-colorful-450w-1086173984.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'932cf959-52d8-4df8-8c84-708911884644', N'4b0f34aa-743c-4cef-8131-8b3f55d19a01', N'https://image.shutterstock.com/image-vector/smart-home-controlled-smartphone-internet-450w-1045674226.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'988df620-2b69-4480-b781-70d93784d375', N'7f99ad86-9d71-4fec-b2dd-9cdeb4dae0c0', N'https://image.shutterstock.com/image-photo/concept-run-pink-running-shoes-450w-1120117460.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'664281bd-6821-4a33-b0c6-73e39ded55e9', N'e527ad07-1c0d-42a0-8fb1-e9499fc99d79', N'https://image.shutterstock.com/image-photo/three-old-book-isolated-education-450w-1146013487.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'51d78cb9-58d3-44d3-81e5-75c4c8b9fb24', N'1be98746-d262-464a-a468-af3670b43fb8', N'https://image.shutterstock.com/image-vector/flat-design-vector-illustration-concept-450w-169338014.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'2db4b9f3-cc0c-477a-ad50-7af4a9cc92e3', N'e1c0ac1b-ef35-4cb9-a1e1-f760a69dd824', N'https://image.shutterstock.com/image-vector/isometric-programmer-working-software-develop-450w-1060922264.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'63e908ce-810f-43fc-9380-7b8aaacb6b11', N'db36ebfa-8506-4cbf-b250-c49af639806f', N'https://image.shutterstock.com/image-vector/apartment-inside-detailed-modern-house-450w-436133881.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'67733109-0529-4738-8eb8-7e73577a2afc', N'c394033e-33fb-4dd5-8173-47a7b4be3222', N'https://image.shutterstock.com/image-photo/books-library-blurred-450w-658609684.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'eb44e02e-029b-4925-a3ee-7f7a6a6064ac', N'89c0232b-fb6b-43d6-8852-c56980695534', N'https://image.shutterstock.com/image-photo/book-stack-old-450w-273210656.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'5e29ab89-870d-4337-821c-80cb33187363', N'6454dfea-7728-41f3-b38d-a3a8287675eb', N'https://image.shutterstock.com/image-photo/stack-books-on-desk-blackboard-450w-284442470.jpghttps://image.shutterstock.com/image-photo/stack-books-on-desk-blackboard-450w-284442470.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'daea4ea8-1473-46f5-b44a-81f85d57e8d9', N'6dd71165-e093-411d-8228-0a4ddede9c18', N'https://image.shutterstock.com/image-vector/interior-living-room-furniture-windowvector-450w-597418880.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'69320df7-8eb0-4c84-9104-82917917991b', N'c67acf12-0e57-4166-b29a-587424d4af5f', N'https://image.shutterstock.com/image-illustration/set-household-home-appliancess-on-450w-1074222590.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'301f2a2a-2c8c-41f3-a94d-8400e476cb26', N'7c58e87a-2a08-45aa-ba73-cb4c4cf53d3e', N'https://image.shutterstock.com/image-photo/pile-books-on-blue-background-450w-325524551.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'59ff29b6-386c-48a3-b0f2-84856c1ede4f', N'ee7a80d6-21e9-4a60-9cdc-15ff4c7b99de', N'https://image.shutterstock.com/image-illustration/shoe-icons-set-isometric-3d-450w-1181778745.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'96083d26-0436-44ec-9ca9-89acd13dc8a3', N'142b3f2f-30b9-48b8-bf70-54be809f94ac', N'https://image.shutterstock.com/image-photo/picture-shows-female-shoes-on-450w-398376691.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'9acd582f-68f6-40d2-a980-932892c67623', N'b30a11ad-ba3d-4a16-9002-1290d54c4f5b', N'https://image.shutterstock.com/image-vector/kitchen-vector-formed-flat-style-450w-386703394.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'bcd691eb-ff55-4496-9667-946f660f8665', N'122a28e7-0b40-4936-8e93-cb716ee966a8', N'https://image.shutterstock.com/image-photo/old-model-high-combat-boots-450w-218320735.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'8d471bc6-733d-42a6-af70-95278ef74cbe', N'de65f0df-0d02-4c57-8062-9510052d21c7', N'https://image.shutterstock.com/image-photo/old-booksvintage-books-450w-140187055.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'841dbcf2-6bf8-4440-92bd-979cf06d0ded', N'cca600e4-9448-4c60-8571-a40228f9d4ce', N'https://image.shutterstock.com/image-photo/brown-boots-isolated-on-white-450w-515582458.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'98658faa-f0dd-49b7-b2fe-9b7d42b472ff', N'79cd8e65-9721-4324-9cc4-a148e30055c2', N'https://image.shutterstock.com/image-photo/naples-italy-april-05-2018-450w-1063085063.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'113a10fb-f487-40ad-8cb7-9be0c071f4a3', N'a6d046f8-9203-404e-9dc7-379be5f90088', N'https://image.shutterstock.com/image-photo/prague-november-7-famous-pop-450w-337443692.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'682e2822-a7f0-46ed-8f3f-9e9f2fb43539', N'84de2871-59d7-4716-833a-375d16e072fa', N'https://image.shutterstock.com/image-photo/business-project-team-working-together-450w-739242352.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'8aea8d2e-0535-4b9a-93cc-9ffd20e62cfa', N'f45ed427-34a2-4047-9c69-552594e2ea76', N'https://image.shutterstock.com/image-vector/hand-holding-mobile-phone-flat-450w-247245826.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'bbca4b41-7a12-4f61-ab41-a2fa3f379f53', N'a073dee0-a96a-4f45-9500-6c12f3582792', N'https://image.shutterstock.com/image-photo/stack-books-on-desk-blackboard-450w-298863359.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'ecc078bf-4945-4bcc-987c-a4265b866657', N'657712ec-4aa9-4fc4-b3c8-52ccd8895f9c', N'https://image.shutterstock.com/image-photo/elegant-boots-men-leather-450w-745997668.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'0c8ca165-b482-42b2-a2f7-a44580f509d8', N'de376f1b-95a1-4a73-9d6e-ba5a94123501', N'https://image.shutterstock.com/image-photo/photo-businessman-holding-smart-phone-450w-383494012.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'ee0850dc-e2b8-4e1b-91fd-a4e745d4d399', N'284dec6e-09e7-46e5-9521-58f862304411', N'https://image.shutterstock.com/image-photo/old-books-isolated-on-white-450w-623380358.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'259e4b23-f70c-4731-b74c-a53a19cdff86', N'6c6ad87b-5d1f-46c4-9715-1d43516dbfb8', N'https://image.shutterstock.com/image-vector/smartphone-mobile-phone-isolated-realistic-450w-140946124.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'fb3a2709-78cc-42bd-8321-ac2876b6cc1b', N'52f13e75-9025-4c32-badb-bbea6221e59d', N'https://image.shutterstock.com/image-photo/80s-super-rock-group-asia-450w-1905194.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'f3960ae4-bee6-4505-a095-ac6f3c91e3b1', N'3f8b1bb5-6bcc-4517-8a8e-5491860a2910', N'https://image.shutterstock.com/image-illustration/modern-kitchen-interior-objects-set-450w-1210468537.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'b90d249b-af41-402a-887b-b00f9d18c835', N'd74af396-dd66-4b3a-a5f6-7cf8c4df61c3', N'https://image.shutterstock.com/image-photo/nyon-switzerland-20-july-2018-450w-1155852916.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'128124a8-4510-4bc9-93ad-b21e4b3d8b30', N'72faad18-90a2-4966-8899-f7c29fa80aa5', N'https://image.shutterstock.com/image-photo/san-franciso-ca-september-13-450w-715985305.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'81c04901-1670-46b2-ae39-b53139ad7c64', N'82d37e91-41da-47cd-8e6f-3ff7f53f5944', N'https://image.shutterstock.com/image-photo/group-elegant-shoes-on-white-450w-1244025415.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'0d238451-0f39-47d8-911f-b60fbf8b82f8', N'b3f28571-bb2e-4927-9b11-86c349eb2413', N'https://image.shutterstock.com/image-photo/book-450w-509582812.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'abb7759b-bc7a-4e65-aaae-ba7994cdca04', N'7444b594-5c6f-4cf1-bac0-e59f854cba15', N'https://image.shutterstock.com/image-photo/pink-baby-shoes-450w-1005414.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'65f88922-676a-4a0a-9c2b-c0d68250b0b2', N'3f53630b-e477-4ccb-bcd7-613837158677', N'https://image.shutterstock.com/image-photo/abstract-woman-hands-playing-music-450w-507995524.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'1247b0a0-0129-49fa-b36e-c44ba36d293b', N'1b1a6912-cec3-4134-a2b2-a9bf5440b3b7', N'https://image.shutterstock.com/image-vector/design-mobile-app-ui-ux-450w-715965994.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'44351dbf-cfc6-473e-a57d-c4a1b97e8384', N'96da2519-3cd8-4102-8a6b-ebf3fcb3aebe', N'https://image.shutterstock.com/image-illustration/set-household-home-appliancess-on-450w-1074222590.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'08d062e5-5f8a-4a5f-9b41-c4b717c85e9d', N'a134dee1-7c29-430a-9e02-fff71f00fed1', N'https://image.shutterstock.com/image-photo/closeup-group-adult-hipsters-friends-450w-482236333.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'109d1396-01a6-4cc1-8e41-d1620701e41f', N'9f076fa6-07ae-4736-b82a-897348790dc2', N'https://image.shutterstock.com/image-photo/hollywood-caoct-24-recording-artist-450w-448572433.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'cd9f539b-d024-46e7-9a24-d4fbb415066b', N'aeb1e601-e42c-46ed-ad52-3d0bf8e60d5f', N'https://image.shutterstock.com/image-photo/set-books-library-knowledge-science-450w-468503102.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'ec00ea20-0c98-4cb2-95d4-d89edd81767f', N'4262bacf-0468-40ab-bc07-79033bad0885', N'https://image.shutterstock.com/image-illustration/set-household-home-appliancess-on-450w-1074222590.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'477c61fc-e75d-424b-b186-d8e7cdf0a2c9', N'f83f566c-13be-4339-878b-467a7319dff6', N'https://image.shutterstock.com/image-vector/smartphone-mobile-phone-isolated-realistic-450w-703670326.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'9476d527-0253-4316-ba4b-d98455904d91', N'3e4d2924-9f3d-4a42-8fc5-6aa98972f4e5', N'https://image.shutterstock.com/image-illustration/set-household-home-appliancess-on-450w-1074222590.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'9071584b-6d16-4917-a32a-dafb679398d3', N'a529d5ac-7e94-4dcc-8d0e-c4a41b824874', N'https://image.shutterstock.com/image-photo/old-books-on-background-wooden-450w-522019972.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'4d6de120-250e-4ab2-8200-ddad74088d6a', N'801be311-0e2b-4066-a2e6-98351b6cca94', N'https://image.shutterstock.com/image-illustration/set-household-home-appliancess-on-450w-1074222590.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'88b5a46f-b05b-4702-9c84-de9b7fc458bf', N'81d8450d-b771-4a71-b24d-5c750461102d', N'https://image.shutterstock.com/image-photo/one-open-old-book-three-450w-789007807.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'3b64430c-7767-46cf-a403-e523eabce61b', N'f0e00bf9-e39b-4a2d-8aa9-c201f5e8e0ee', N'https://image.shutterstock.com/image-photo/elegant-boots-men-leather-450w-745994554.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'3218b359-6b76-4e46-bf3a-e60ce34d8dba', N'f6b1d3bb-66fa-4335-8933-5901ffeffb0f', N'https://image.shutterstock.com/image-vector/mobile-phone-smartphone-template-circle-450w-1160092174.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'864b82d1-3e58-4b91-8454-eab55fd9119f', N'176355e4-a0b9-4ddb-bd88-c5aadb595c03', N'https://image.shutterstock.com/image-photo/rock-star-guitar-450w-290267582.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'e4fb1dca-407e-4f06-a1ef-ec26a3a9766a', N'3e15fbf2-cde5-4467-b320-b1e12234c026', N'https://thumb9.shutterstock.com/display_pic_with_logo/2495788/635037602/stock-photo-guitarist-on-stage-for-background-soft-and-blur-concept-635037602.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'0e8b014f-41d9-41d0-a7ff-ec2ce77b0a5a', N'ef7b0c50-9811-403e-8430-ac1b5a5ead2b', N'https://image.shutterstock.com/image-photo/back-school-background-450w-696858301.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'34b95e65-0812-41be-8253-ed47fb953c50', N'dcd627cb-2f50-48bf-a0c5-cabd8c05ceda', N'https://image.shutterstock.com/image-photo/business-meeting-boss-young-businesspeople-450w-1094529677.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'03f8f757-d00d-42dd-8238-eda9808b833c', N'e679e12b-f22a-41bd-a2e4-4209f98ff049', N'https://image.shutterstock.com/image-vector/kitchen-illustration-450w-232210210.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'93ceac27-9091-436e-beec-f18c6db09ddb', N'90939e22-ecea-46ae-8dca-7c73602b170f', N'https://image.shutterstock.com/image-photo/male-brown-blue-shoes-on-450w-797844037.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'd53b1eb3-51a7-4c76-8b24-f455ec3eb834', N'6b8a4b0c-e1f0-42e9-99ce-e499cb2cb2b4', N'https://image.shutterstock.com/image-photo/one-man-play-acoustic-music-450w-1022278351.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'373d37d9-fa98-4407-9b3b-f6cfd4a5b2fa', N'cd31c1dd-c2ae-40aa-8c37-3e7212d277eb', N'https://image.shutterstock.com/image-photo/patchogue-nymar-9-singer-jessie-450w-416995387.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'6229300f-e125-4386-9f15-f6fa401f0801', N'1cf03dba-818d-4e20-b278-a7fd16ed2cf8', N'https://image.shutterstock.com/image-photo/brown-boots-isolated-on-white-450w-370733114.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'c2d055e9-688a-49cb-98c9-f87b6efc9785', N'1791de28-fd7e-482b-b688-1fdef3e6c598', N'https://image.shutterstock.com/image-photo/drummer-blurred-motion-playing-on-450w-237959743.jpg')
GO
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'd99c1429-d8e8-42a5-8225-f9f39cf19978', N'9b30967a-73e4-4026-b291-a1aa7e2a6cb7', N'https://image.shutterstock.com/image-photo/man-holding-white-business-card-450w-313679270.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'71a6430b-ae81-4545-ad17-fa678970cedf', N'663e9a16-15a7-4415-9502-f18059a8ae90', N'https://image.shutterstock.com/image-illustration/set-household-home-appliancess-on-450w-1074222590.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'8658a397-a7d7-4573-a23b-fd40a2f0ab53', N'c9358b7c-7700-433e-9779-3a9f7400ee5c', N'https://image.shutterstock.com/image-illustration/set-household-home-appliancess-on-450w-1074222590.jpg')
SET IDENTITY_INSERT [dbo].[VariantPropertyValue] ON 

INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1021, N'a0d3c996-f793-434b-b1d7-579f6c435950', N'71c3530b-6b42-49f5-8a3c-438cd55529c3')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1022, N'82b1a8b0-8b8b-40d8-94f3-10d7651a3577', N'b6dbbff6-be45-4bed-b40e-49afea7ef6ef')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1023, N'a0d3c996-f793-434b-b1d7-579f6c435950', N'd589bf10-5329-4626-b4b1-d99c72468d40')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1024, N'a0d3c996-f793-434b-b1d7-579f6c435950', N'21badad9-b50b-4248-a60d-ca8c13cdad20')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1025, N'a0d3c996-f793-434b-b1d7-579f6c435950', N'1ad9449e-257d-4b82-bb1d-b9eb11118e6f')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1026, N'a0d3c996-f793-434b-b1d7-579f6c435950', N'd22bf74b-0019-4e3a-ab9b-24fde69c48f1')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1027, N'a0d3c996-f793-434b-b1d7-579f6c435950', N'c6b345be-24d5-4a1e-863d-9a789c00fc91')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1028, N'a0d3c996-f793-434b-b1d7-579f6c435950', N'539a2c4f-751b-4fd8-8652-d630c4d10847')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1029, N'6c85763f-78fa-4abd-8f0a-d411e1ee1831', N'297d9567-95f5-4f6a-918b-29d7116249d2')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1030, N'82b1a8b0-8b8b-40d8-94f3-10d7651a3577', N'e7c04049-18fe-4d2d-acea-d6e703ddc1d3')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1031, N'e69262a4-5fde-449d-aaab-23d0ab0aa6c4', N'2602e84e-09ec-4458-b890-6e766215cf89')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1032, N'e69262a4-5fde-449d-aaab-23d0ab0aa6c4', N'0edd3fd2-60eb-4dc2-ae1c-2c0ebe0e290f')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1033, N'a0d3c996-f793-434b-b1d7-579f6c435950', N'bb90c0b4-609b-4b28-a4ab-2d7b0f1cb72d')
SET IDENTITY_INSERT [dbo].[VariantPropertyValue] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_Email]    Script Date: 12-12-2018 17:35:10 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [Unique_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartVariantMapping] ADD  CONSTRAINT [default_CartVariantMapping_SellingPrice]  DEFAULT ((0)) FOR [SellingPrice]
GO
ALTER TABLE [dbo].[CartVariantMapping] ADD  CONSTRAINT [default_CCartVariantMapping_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [default_ProductsSold]  DEFAULT ((0)) FOR [ProductsSold]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [default_OrderDate]  DEFAULT (CONVERT([varchar](19),getdate(),(120))) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [default_TotalAmount]  DEFAULT ((0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [default_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [default_OrderCancelled]  DEFAULT ('N') FOR [isCancelled]
GO
ALTER TABLE [dbo].[OrderPlacedVariants] ADD  CONSTRAINT [default_OrderPlacedVariants_SellingPrice]  DEFAULT ((0)) FOR [SellingPrice]
GO
ALTER TABLE [dbo].[OrderPlacedVariants] ADD  CONSTRAINT [default_OrderPlacedVariants_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [default_TotalVariantsSold]  DEFAULT ((0)) FOR [TotalVariantsSold]
GO
ALTER TABLE [dbo].[Variant] ADD  CONSTRAINT [default_ListingPrice]  DEFAULT ((0)) FOR [ListingPrice]
GO
ALTER TABLE [dbo].[Variant] ADD  CONSTRAINT [default_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Variant] ADD  CONSTRAINT [default_QuantitySold]  DEFAULT ((0)) FOR [QuantitySold]
GO
ALTER TABLE [dbo].[Variant] ADD  CONSTRAINT [default_Inventory]  DEFAULT ((0)) FOR [Inventory]
GO
ALTER TABLE [dbo].[VariantImage] ADD  CONSTRAINT [default_ImageURL]  DEFAULT ('https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png') FOR [ImageURL]
GO
ALTER TABLE [dbo].[CartVariantMapping]  WITH CHECK ADD  CONSTRAINT [FK_CartVariantMapping_Cart] FOREIGN KEY([CartID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[CartVariantMapping] CHECK CONSTRAINT [FK_CartVariantMapping_Cart]
GO
ALTER TABLE [dbo].[CartVariantMapping]  WITH CHECK ADD  CONSTRAINT [FK_CartVariantMapping_Variant] FOREIGN KEY([VariantID])
REFERENCES [dbo].[Variant] ([ID])
GO
ALTER TABLE [dbo].[CartVariantMapping] CHECK CONSTRAINT [FK_CartVariantMapping_Variant]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_OrderAddressID] FOREIGN KEY([DeliveryAddressID])
REFERENCES [dbo].[Address] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_OrderAddressID]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_statusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_statusID]
GO
ALTER TABLE [dbo].[OrderPlaced]  WITH CHECK ADD  CONSTRAINT [FK_OrderPlaced_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderPlaced] CHECK CONSTRAINT [FK_OrderPlaced_OrderID]
GO
ALTER TABLE [dbo].[OrderPlaced]  WITH CHECK ADD  CONSTRAINT [FK_OrderPlaced_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[OrderPlaced] CHECK CONSTRAINT [FK_OrderPlaced_UserID]
GO
ALTER TABLE [dbo].[OrderPlacedVariants]  WITH CHECK ADD  CONSTRAINT [FK_OrderPlacedVariants_OrderPlacedID] FOREIGN KEY([OrderPlacedID])
REFERENCES [dbo].[OrderPlaced] ([ID])
GO
ALTER TABLE [dbo].[OrderPlacedVariants] CHECK CONSTRAINT [FK_OrderPlacedVariants_OrderPlacedID]
GO
ALTER TABLE [dbo].[OrderPlacedVariants]  WITH CHECK ADD  CONSTRAINT [FK_OrderPlacedVariants_VariantID] FOREIGN KEY([VariantID])
REFERENCES [dbo].[Variant] ([ID])
GO
ALTER TABLE [dbo].[OrderPlacedVariants] CHECK CONSTRAINT [FK_OrderPlacedVariants_VariantID]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_CategoryID]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User]
GO
ALTER TABLE [dbo].[UserAddressMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserAddressMapping_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([ID])
GO
ALTER TABLE [dbo].[UserAddressMapping] CHECK CONSTRAINT [FK_UserAddressMapping_Address]
GO
ALTER TABLE [dbo].[UserAddressMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserAddressMapping_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[UserAddressMapping] CHECK CONSTRAINT [FK_UserAddressMapping_User]
GO
ALTER TABLE [dbo].[Variant]  WITH CHECK ADD  CONSTRAINT [FK_Variant] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Variant] CHECK CONSTRAINT [FK_Variant]
GO
ALTER TABLE [dbo].[VariantImage]  WITH CHECK ADD  CONSTRAINT [FK_VariantImage] FOREIGN KEY([VariantID])
REFERENCES [dbo].[Variant] ([ID])
GO
ALTER TABLE [dbo].[VariantImage] CHECK CONSTRAINT [FK_VariantImage]
GO
ALTER TABLE [dbo].[VariantPropertyValue]  WITH CHECK ADD  CONSTRAINT [FK_VariantPropertyValue_PropertyID] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Property] ([ID])
GO
ALTER TABLE [dbo].[VariantPropertyValue] CHECK CONSTRAINT [FK_VariantPropertyValue_PropertyID]
GO
ALTER TABLE [dbo].[VariantPropertyValue]  WITH CHECK ADD  CONSTRAINT [FK_VariantPropertyValue_ValueID] FOREIGN KEY([ValueID])
REFERENCES [dbo].[Value] ([ID])
GO
ALTER TABLE [dbo].[VariantPropertyValue] CHECK CONSTRAINT [FK_VariantPropertyValue_ValueID]
GO
/****** Object:  StoredProcedure [dbo].[AddAddress]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddAddress]
@UserID uniqueidentifier,
@AddressLine1 nvarchar(100),
@Pin int,
@City nvarchar(50),
@State nvarchar(50),
@Country nvarchar(50),
@AddressLine2 nvarchar(100) = ''
as
begin
declare @AddressID uniqueidentifier
 SET @AddressID = NEWID() 
 insert into Address(ID,AddressLine1,AddressLine2,Pin,City,State,Country) values(@AddressID,@AddressLine1,@AddressLine2,@Pin,@City,@State,@Country)
 insert into UserAddressMapping(ID,UserID,AddressID) values(newID(),@UserID,@AddressID)
end
GO
/****** Object:  StoredProcedure [dbo].[addCategory]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addCategory]
@CategoryName nvarchar(100),
@CategoryID uniqueidentifier OUT
as
begin
declare @ID uniqueidentifier
IF EXISTS(select 'True' from Category where Name = @CategoryName)
   begin
      select @categoryID = ID from Category where Name = @CategoryName
   end;
else
  begin
    set @ID = newID()
       insert into Category(ID,Name) values (@ID,@CategoryName)
       set @categoryID = @ID
  end;
end
GO
/****** Object:  StoredProcedure [dbo].[AddItem]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddItem]
@CategoryName nvarchar(50),
@ProductName nvarchar(100),
@Title nvarchar(150),
@OrderLimit int,
@Description nvarchar(150),
@ListingPrice float,
@Discount float,
@QuantitySold int,
@Inventory int,
@PropertyName nvarchar(50),
@ValueName nvarchar(50),
@VariantImage nvarchar(200)
as
begin
	declare @CategoryID uniqueidentifier
	exec addCategory @CategoryName,@CategoryID OUTPUT

	exec AddProduct @ProductName,@Title,@OrderLimit,@Description,@CategoryID,@ListingPrice,@Discount,@QuantitySold,@Inventory,@PropertyName,@ValueName,@VariantImage

end
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddProduct]
@ProductName nvarchar(100),
@Title nvarchar(150),
@OrderLimit int,
@Description nvarchar(150),
@CategoryID uniqueidentifier,
@ListingPrice float,
@Discount float,
@QuantitySold int,
@Inventory int,
@PropertyName nvarchar(50),
@ValueName nvarchar(50),
@VariantImage nvarchar(200)

as
begin
       declare @ProductID uniqueidentifier
       IF Exists(select 'True' from Product where Name = @ProductName and CategoryID = @CategoryID)
              begin
                     select @ProductID = ID from Product where name = @ProductName and CategoryID = @CategoryID
              end;
       else
       begin
              set @ProductID = NEWID()
              INSERT INTO Product(ID,CategoryID,Name,Title,OrderLimit,Description) values(@ProductID,@CategoryID,@ProductName,@Title,@OrderLimit,@Description);
       end;
	   exec AddVariant @ProductID,@ListingPrice,@Discount,@QuantitySold,@Inventory,@PropertyName,@ValueName,@VariantImage 
end;
GO
/****** Object:  StoredProcedure [dbo].[AddProperty]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddProperty]
@Name nvarchar(50),
@PropertyID uniqueidentifier out
as 
begin
IF NOT EXISTS (select 'True' from Property where Name = @Name)
	begin
		set @PropertyID = newID()
		insert into Property(ID,Name) values (@PropertyID,@Name)
	end
ELSE
	begin
		select @PropertyID = ID from Property where Name = @Name
	end
end;
GO
/****** Object:  StoredProcedure [dbo].[AddRole]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddRole]
@RoleName nvarchar(100),
@RoleID uniqueidentifier OUT
as
begin
IF not EXISTS (SELECT 'TRUE' FROM Role WHERE Name = @RoleName)
begin
	insert into Role(ID,Name) values (newID(), @RoleName)
end
select @RoleID =ID from Role WHERE Name =@RoleName
end
GO
/****** Object:  StoredProcedure [dbo].[AddToCart]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddToCart]
@UserID uniqueidentifier,
@VariantID uniqueidentifier,
@SellingPrice float,
@Quantity int
as
begin
 Declare
 @ID uniqueidentifier
 IF EXISTS (SELECT 'TRUE' FROM CartVariantMapping WHERE VariantID = @VariantID)
 begin
   update CartVariantMapping set Quantity = Quantity + 1
 end
 set @ID = newid()
 insert into CartVariantMapping(ID,CartID,VariantID,SellingPrice,Quantity) values (@ID,@UserID,@VariantID,@SellingPrice,@Quantity)
end
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddUser]
@UserName nvarchar(100),
@HashPassword nvarchar(4000),
@Email nvarchar(100),
@PhoneNumber int,
@RoleName nvarchar(100)
as
begin
declare @RoleID uniqueidentifier,
@ID uniqueidentifier

IF EXISTS (SELECT 'TRUE' FROM [USER] WHERE Email = @Email)
begin
	RAISERROR('User with same email id already exists',16,1)
end
else
begin
set @ID = NEWID()
exec AddRole @RoleName, @RoleID OUTPUT 
INSERT INTO [USER] (ID,Name,HashPassword,Email,PhoneNumber,RoleID) values (@ID,@UserName,HASHBYTES('SHA2_256',CONVERT(nvarchar(4000),@HashPassword)),
@Email,@PhoneNumber,@RoleID)
end
end
GO
/****** Object:  StoredProcedure [dbo].[AddValue]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddValue]
@Name nvarchar(50),
@ValueID uniqueidentifier out
as 
begin
IF NOT EXISTS (select 'True' from Value where Name = @Name)
	begin
		set @ValueID = newID()
		insert into Value(ID,Name) values (@ValueID,@Name)

	end
ELSE
	begin
		select @ValueID = ID from Value where Name = @Name	
	end;
end;
GO
/****** Object:  StoredProcedure [dbo].[AddVariant]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddVariant] 
@ProductID uniqueidentifier,
@ListingPrice float,
@Discount float,
@QuantitySold int,
@Inventory int,
@PropertyName nvarchar(50),
@ValueName nvarchar(50),
@VariantImage nvarchar(200)
as 
begin
  declare @PropertyID uniqueidentifier,
  @ValueID uniqueidentifier,
  @SKUCode nvarchar(100),
  @MapperKey int,
  @VariantID uniqueidentifier
  
SET NOCOUNT ON
 DECLARE @PropertyNameCursor varchar(50)
 DECLARE cursor_property CURSOR

STATIC FOR 
SELECT value FROM STRING_SPLIT(@PropertyName, '~')
OPEN cursor_property	
 DECLARE @ValueNameCursor varchar(50)
 DECLARE cursor_value CURSOR
 STATIC FOR 
 SELECT value FROM STRING_SPLIT(@ValueName, '~')
 open cursor_value
IF @@CURSOR_ROWS > 0  
 BEGIN 
 FETCH NEXT FROM cursor_property INTO @PropertyNameCursor;
 FETCH NEXT FROM cursor_value INTO @ValueNameCursor;

 WHILE @@Fetch_status = 0
 BEGIN
 PRINT 'PropertyName : '+@PropertyNameCursor
 exec AddProperty @PropertyNameCursor, @PropertyID OUTPUT


 
 PRINT 'PropertyValue : '+@ValueNameCursor
 exec AddValue @ValueNameCursor,@ValueID OUTPUT

 exec AddVariantPropertyValueMapping @PropertyNameCursor,@ValueNameCursor,@MapperKey OUTPUT

 if len(@SKUCode) >0
 begin
  set @SKUCode = @SKUCode + '~' + Convert(nvarchar(100),@MapperKey)
 end
 else
 begin
  set @SKUCode = Convert(nvarchar(100),@MapperKey)
 end

 FETCH NEXT FROM cursor_property INTO @PropertyNameCursor;
 FETCH NEXT FROM cursor_value INTO @ValueNameCursor
 END
END
CLOSE cursor_property
DEALLOCATE cursor_property
SET NOCOUNT OFF
CLOSE cursor_value
DEALLOCATE cursor_value
SET NOCOUNT OFF

 if not exists (select 'true' from Variant where SKU = @SKUCode and ProductID =@ProductID)
 begin
    set @VariantID = newID()
	
	insert into Variant(ID,SKU,ProductID,ListingPrice,Discount,QuantitySold,Inventory) values (@VariantID,@SKUCode,@ProductID,@ListingPrice,@Discount,@QuantitySold,@Inventory)
	exec AddVariantImage @VariantID,@VariantImage
 end
 else
 begin
	select @VariantID = ID from Variant where SKU = @SKUCode
	update Variant set Inventory = Inventory + 1 where ID = @VariantID and ProductID =@ProductID
 end
end
GO
/****** Object:  StoredProcedure [dbo].[AddVariantImage]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AddVariantImage]
@VariantID uniqueidentifier,
@ImageURL nvarchar(200) = 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png'
as
begin
	IF (@ImageURL IS NOT NULL) OR (LEN(@ImageURL) > 0)
	begin
		insert into VariantImage(ID,VariantID,ImageURL) values (newID(),@VariantID,@ImageURL)
	end
	ELSE
	BEGIN
		INSERT INTO VariantImage(VariantID) values (@VariantID)
	END
	
end;
GO
/****** Object:  StoredProcedure [dbo].[AddVariantPropertyValueMapping]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddVariantPropertyValueMapping]
@PropertyName nvarchar(50),
@ValueName nvarchar(50),
@MapID INT out
as
begin
 declare @PropertyID uniqueidentifier,
  @ValueID uniqueidentifier

  exec AddProperty @PropertyName, @PropertyID OUTPUT
  exec AddValue @ValueName, @ValueID OUTPUT
  select @PropertyID
  select @ValueID
 IF NOT EXISTS (SELECT 'TRUE' FROM VariantPropertyValue where PropertyID = @PropertyID AND ValueID = @ValueID)
 BEGIN
   insert into VariantPropertyValue(PropertyID,ValueID) values (@PropertyID,@ValueID)
 END
 SELECT @MapID = ID FROM VariantPropertyValue where PropertyID=@PropertyID AND ValueID = @ValueID
END
GO
/****** Object:  StoredProcedure [dbo].[CheckOutFromCart]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CheckOutFromCart]
@UserID uniqueidentifier,
@DeliveryAddressID uniqueidentifier,
@TotalAmount float
as
begin
 declare @OrderID uniqueidentifier,
 @OrderPlacedID uniqueidentifier
 exec PlaceOrder @UserID,@DeliveryAddressID,@TotalAmount,@OrderID OUTPUT
 set @OrderPlacedID = newid()

 insert into OrderPlaced (ID,OrderID,UserID) values (@OrderPlacedID,@OrderID,@UserID)

 insert into OrderPlacedVariants (ID,OrderPlacedID,VariantID,SellingPrice,Quantity) select newID(),
 @OrderPlacedID,VariantID,SellingPrice,Quantity from CartVariantMapping where CartID = @UserID

end
GO
/****** Object:  StoredProcedure [dbo].[PlaceOrder]    Script Date: 12-12-2018 17:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PlaceOrder]
@UserID uniqueidentifier,
@DeliveryAddressID uniqueidentifier,
@TotalAmount float,
@OrderID uniqueidentifier OUT
as
begin
 SET @OrderID = NEWID() 
 insert into [Order] (ID,OrderDate,TotalAmount,DeliveryAddressID,DeliveryDate) VALUES 
 (@OrderID,CONVERT(smalldatetime,CURRENT_TIMESTAMP) ,@TotalAmount,@DeliveryAddressID,CONVERT(smalldatetime, CURRENT_TIMESTAMP)+5)
end
GO
