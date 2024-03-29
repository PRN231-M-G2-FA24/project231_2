USE [PRN231_PROJECT]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/13/2024 8:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 3/13/2024 8:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/13/2024 8:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/13/2024 8:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/13/2024 8:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/13/2024 8:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/13/2024 8:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 3/13/2024 8:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/13/2024 8:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 3/13/2024 8:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Item]    Script Date: 3/13/2024 8:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orders_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[price_per_item] [int] NULL,
 CONSTRAINT [PK_Order_Item] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/13/2024 8:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[order_date] [date] NULL,
	[total_amout] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/13/2024 8:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](100) NOT NULL,
	[price] [int] NULL,
	[image] [nvarchar](100) NOT NULL,
	[category_id] [int] NULL,
	[supplier_id] [int] NULL,
	[inventory_id] [int] NULL,
	[quantity_in_stock] [int] NULL,
	[status] [int] NULL,
	[Date] [date] NULL,
	[ProductCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 3/13/2024 8:44:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231030135909_DBversion1', N'6.0.24')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231030153238_DBversion2', N'6.0.24')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231031071749_DBversion', N'6.0.24')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1', N'Admin', NULL, NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2', N'User', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[AspNetUserRoles] ON 

INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Id]) VALUES (N'ec319949-7668-4a5e-a782-d58f698791d9', N'1', 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Id]) VALUES (N'efb5b4f2-2903-4b10-a9d7-e100d03aa5a6', N'2', 2)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Id]) VALUES (N'232bbd17-f42b-4b20-a50a-7a10ca737e1e', N'2', 4)
SET IDENTITY_INSERT [dbo].[AspNetUserRoles] OFF
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'232bbd17-f42b-4b20-a50a-7a10ca737e1e', N'string2', NULL, N'user@example.com', NULL, 0, N'string', N'0c1ea431-d3bc-43da-b74c-07371a159de2', NULL, NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ec319949-7668-4a5e-a782-d58f698791d9', N'string', NULL, N'user@example.com', NULL, 0, N'string', N'45eebdc3-a447-4122-bf61-78856c8856a0', NULL, NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ed865373-20ef-4d60-b9bb-d2341890a053', N'string4', NULL, N'chienhvhe163678@fpt.edu.vn', NULL, 0, N'string', N'a6dac5bd-7c47-4319-b110-aa9ea420d011', NULL, NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'efb5b4f2-2903-4b10-a9d7-e100d03aa5a6', N'string1', NULL, N'user@example.com', NULL, 0, N'string', N'a38aa6ab-8e34-4662-9022-f5810ca15a49', NULL, NULL, 0, 0, NULL, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'T-Shirt')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Jacket ')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Vest ')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [user_id], [order_date], [total_amout], [status]) VALUES (21, NULL, CAST(N'2023-07-22' AS Date), 615615, 0)
INSERT [dbo].[Orders] ([id], [user_id], [order_date], [total_amout], [status]) VALUES (22, NULL, CAST(N'2023-07-22' AS Date), 6370581, 0)
INSERT [dbo].[Orders] ([id], [user_id], [order_date], [total_amout], [status]) VALUES (23, NULL, CAST(N'2023-07-24' AS Date), 6369369, 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [description], [price], [image], [category_id], [supplier_id], [inventory_id], [quantity_in_stock], [status], [Date], [ProductCode]) VALUES (100, N'Hoodie', N'aa', 123123, N'https://sakurafashion.vn/upload/a/2749-ao-hoodie-ao-thun-tay-dai-3587.jpg', 3, 9, NULL, 5, 0, CAST(N'2023-07-22' AS Date), NULL)
INSERT [dbo].[Product] ([id], [name], [description], [price], [image], [category_id], [supplier_id], [inventory_id], [quantity_in_stock], [status], [Date], [ProductCode]) VALUES (103, N'Áo trễ vai', N'lalalala', 1212, N'http://sakurafashion.vn/upload/sanpham/large/3967-ao-hoa-tiet-nhun-chiec-la-rong-1.jpg', 1, 17, NULL, 100, 0, CAST(N'2023-07-22' AS Date), NULL)
INSERT [dbo].[Product] ([id], [name], [description], [price], [image], [category_id], [supplier_id], [inventory_id], [quantity_in_stock], [status], [Date], [ProductCode]) VALUES (106, N'Áo phối ren điệu đà', N'aa', 123123, N'http://sakurafashion.vn/upload/sanpham/large/23-vay-ren-co-gau-vay-kieu-dinh-hoa-1.jpg', 3, 20, NULL, 23, 0, CAST(N'2023-07-22' AS Date), NULL)
INSERT [dbo].[Product] ([id], [name], [description], [price], [image], [category_id], [supplier_id], [inventory_id], [quantity_in_stock], [status], [Date], [ProductCode]) VALUES (123, N'Áo thun kẻ sọc', N'hahahaha', 3123123, N'http://sakurafashion.vn/upload/sanpham/large/1609-ao-thun-ke-soc-hai-day-dai-o-vai-1.jpg', 2, 18, NULL, 3, 0, CAST(N'2023-07-23' AS Date), NULL)
INSERT [dbo].[Product] ([id], [name], [description], [price], [image], [category_id], [supplier_id], [inventory_id], [quantity_in_stock], [status], [Date], [ProductCode]) VALUES (140, N'Áo khoác phao', N'lalalala', 120000, N'https://sakurafashion.vn/upload/a/2758-ao-khoac-phao-7020.jpg', 1, 17, NULL, 4, 0, CAST(N'2023-07-24' AS Date), NULL)
INSERT [dbo].[Product] ([id], [name], [description], [price], [image], [category_id], [supplier_id], [inventory_id], [quantity_in_stock], [status], [Date], [ProductCode]) VALUES (141, N'Áo khoác dạ', N'hahahaha', 200000, N'http://sakurafashion.vn/upload/images/58-ao-khoac-da-form-dai-khuy-go-1.jpg', 2, 18, NULL, 3, 0, CAST(N'2023-07-24' AS Date), NULL)
INSERT [dbo].[Product] ([id], [name], [description], [price], [image], [category_id], [supplier_id], [inventory_id], [quantity_in_stock], [status], [Date], [ProductCode]) VALUES (142, N'Áo len', N'lolol', 150000, N'http://sakurafashion.vn/upload/sanpham/large/3293-ao-len-co-lo-dang-dai-1.jpg', 3, 23, NULL, 2, 0, CAST(N'2023-07-24' AS Date), NULL)
INSERT [dbo].[Product] ([id], [name], [description], [price], [image], [category_id], [supplier_id], [inventory_id], [quantity_in_stock], [status], [Date], [ProductCode]) VALUES (143, N'Áo thun thủy thủ', N'aa', 3000000, N'http://sakurafashion.vn/upload/sanpham/large/32-ao-thun-thuy-thu-dai-tay-dinh-caravat-1.jpg', 3, 20, NULL, 4, 0, CAST(N'2023-07-24' AS Date), NULL)
INSERT [dbo].[Product] ([id], [name], [description], [price], [image], [category_id], [supplier_id], [inventory_id], [quantity_in_stock], [status], [Date], [ProductCode]) VALUES (144, N'Áo khoác cánh dơi', N'aa', 400000, N'https://sakurafashion.vn/upload/a/2754-ao-khoac-canh-doi-9031.jpg', 3, 24, NULL, 3, 0, CAST(N'2023-07-24' AS Date), NULL)
INSERT [dbo].[Product] ([id], [name], [description], [price], [image], [category_id], [supplier_id], [inventory_id], [quantity_in_stock], [status], [Date], [ProductCode]) VALUES (145, N'Áo khoác phao', N'lalalala', 120000, N'https://sakurafashion.vn/upload/a/2758-ao-khoac-phao-7020.jpg', 1, 17, NULL, 4, 0, CAST(N'2023-07-24' AS Date), NULL)
INSERT [dbo].[Product] ([id], [name], [description], [price], [image], [category_id], [supplier_id], [inventory_id], [quantity_in_stock], [status], [Date], [ProductCode]) VALUES (146, N'Áo khoác dạ', N'hahahaha', 200000, N'http://sakurafashion.vn/upload/images/58-ao-khoac-da-form-dai-khuy-go-1.jpg', 2, 18, NULL, 3, 0, CAST(N'2023-07-24' AS Date), NULL)
INSERT [dbo].[Product] ([id], [name], [description], [price], [image], [category_id], [supplier_id], [inventory_id], [quantity_in_stock], [status], [Date], [ProductCode]) VALUES (147, N'Áo len', N'lolol', 150000, N'http://sakurafashion.vn/upload/sanpham/large/3293-ao-len-co-lo-dang-dai-1.jpg', 3, 23, NULL, 2, 0, CAST(N'2023-07-24' AS Date), NULL)
INSERT [dbo].[Product] ([id], [name], [description], [price], [image], [category_id], [supplier_id], [inventory_id], [quantity_in_stock], [status], [Date], [ProductCode]) VALUES (148, N'Áo thun thủy thủ', N'aa', 3000000, N'http://sakurafashion.vn/upload/sanpham/large/32-ao-thun-thuy-thu-dai-tay-dinh-caravat-1.jpg', 3, 20, NULL, 4, 0, CAST(N'2023-07-24' AS Date), NULL)
INSERT [dbo].[Product] ([id], [name], [description], [price], [image], [category_id], [supplier_id], [inventory_id], [quantity_in_stock], [status], [Date], [ProductCode]) VALUES (149, N'Áo khoác cánh dơi', N'aa', 400000, N'https://sakurafashion.vn/upload/a/2754-ao-khoac-canh-doi-9031.jpg', 3, 24, NULL, 3, 0, CAST(N'2023-07-24' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([id], [name], [email], [phone], [address]) VALUES (9, N'H&M', NULL, N'0854082002', N'2')
INSERT [dbo].[Suppliers] ([id], [name], [email], [phone], [address]) VALUES (17, N'Gucci', NULL, N'09864721', N'Spain')
INSERT [dbo].[Suppliers] ([id], [name], [email], [phone], [address]) VALUES (18, N'Louis Vutton', NULL, N'0947372', N'France')
INSERT [dbo].[Suppliers] ([id], [name], [email], [phone], [address]) VALUES (20, N'Zara', NULL, N'09477483932', N'China')
INSERT [dbo].[Suppliers] ([id], [name], [email], [phone], [address]) VALUES (23, N'Chanel', NULL, NULL, NULL)
INSERT [dbo].[Suppliers] ([id], [name], [email], [phone], [address]) VALUES (24, N'Canifa', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Order_Item]  WITH CHECK ADD  CONSTRAINT [FK_Order_Item_Orders] FOREIGN KEY([orders_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[Order_Item] CHECK CONSTRAINT [FK_Order_Item_Orders]
GO
ALTER TABLE [dbo].[Order_Item]  WITH CHECK ADD  CONSTRAINT [FK_Order_Item_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Order_Item] CHECK CONSTRAINT [FK_Order_Item_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Suppliers] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[Suppliers] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Suppliers]
GO
