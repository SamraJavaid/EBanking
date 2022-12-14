USE [master]
GO
/****** Object:  Database [Ebanking]    Script Date: 8/20/2022 1:36:46 PM ******/
CREATE DATABASE [Ebanking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ebanking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Ebanking.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ebanking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Ebanking_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ebanking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ebanking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ebanking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ebanking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ebanking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ebanking] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ebanking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ebanking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ebanking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ebanking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ebanking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ebanking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ebanking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ebanking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ebanking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ebanking] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Ebanking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ebanking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ebanking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ebanking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ebanking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ebanking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ebanking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ebanking] SET RECOVERY FULL 
GO
ALTER DATABASE [Ebanking] SET  MULTI_USER 
GO
ALTER DATABASE [Ebanking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ebanking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ebanking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ebanking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ebanking] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ebanking] SET QUERY_STORE = OFF
GO
USE [Ebanking]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Ebanking]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 8/20/2022 1:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountNO] [int] IDENTITY(102980,1) NOT NULL,
	[Balance] [decimal](8, 3) NULL,
	[AccountDate] [date] NULL,
	[AccountType] [int] NULL,
	[CustomerId] [int] NULL,
	[DocId] [int] NULL,
	[Description] [varchar](225) NULL,
	[Debit] [decimal](8, 3) NULL,
	[Credit] [decimal](8, 3) NULL,
	[Total] [decimal](18, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 8/20/2022 1:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TypeOfAccount] [varchar](225) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BalanceEnquiry]    Script Date: 8/20/2022 1:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BalanceEnquiry](
	[BalId] [int] IDENTITY(121,1) NOT NULL,
	[AccountNo] [int] NULL,
	[CurrentBalance] [decimal](8, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[BalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[branch]    Script Date: 8/20/2022 1:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[branch](
	[branchId] [int] IDENTITY(101,1) NOT NULL,
	[branchName] [varchar](225) NULL,
PRIMARY KEY CLUSTERED 
(
	[branchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChangeofAddress]    Script Date: 8/20/2022 1:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChangeofAddress](
	[ChangeId] [int] IDENTITY(1001,1) NOT NULL,
	[AccountNo] [int] NULL,
	[OldAddress] [nvarchar](max) NULL,
	[NewAddress] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ChangeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChequeReq]    Script Date: 8/20/2022 1:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChequeReq](
	[ChecqueId] [int] IDENTITY(101,1) NOT NULL,
	[Description] [varchar](225) NULL,
	[AccountNumber] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ChecqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 8/20/2022 1:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustId] [int] IDENTITY(101,1) NOT NULL,
	[firstName] [varchar](225) NULL,
	[lastName] [varchar](225) NULL,
	[Gender] [varchar](225) NULL,
	[DateofBirth] [date] NULL,
	[CnicNo] [varchar](225) NULL,
	[Address] [varchar](225) NULL,
	[EmailId] [varchar](225) NULL,
	[PinCode] [int] NULL,
	[Password] [varchar](225) NULL,
	[Image] [varchar](max) NULL,
	[Branch] [int] NULL,
	[Role] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestofChequeBook]    Script Date: 8/20/2022 1:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestofChequeBook](
	[ReqCheqid] [int] IDENTITY(1,1) NOT NULL,
	[AccountNo] [int] NULL,
	[LeavesofCheque] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReqCheqid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StopPaymentofCheque]    Script Date: 8/20/2022 1:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StopPaymentofCheque](
	[StopPaymentId] [int] IDENTITY(501,1) NOT NULL,
	[AccountNo] [int] NULL,
	[StopPayment] [varchar](225) NULL,
PRIMARY KEY CLUSTERED 
(
	[StopPaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 8/20/2022 1:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransId] [int] IDENTITY(101,1) NOT NULL,
	[TransferAmount] [decimal](8, 3) NULL,
	[TransferDate] [date] NULL,
	[SenderAccountNum] [int] NULL,
	[RecieverAccountNum] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountNO], [Balance], [AccountDate], [AccountType], [CustomerId], [DocId], [Description], [Debit], [Credit], [Total]) VALUES (102980, CAST(1000.000 AS Decimal(8, 3)), CAST(N'2022-08-18' AS Date), 1, 102, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccountNO], [Balance], [AccountDate], [AccountType], [CustomerId], [DocId], [Description], [Debit], [Credit], [Total]) VALUES (102984, CAST(5000.000 AS Decimal(8, 3)), CAST(N'2022-08-19' AS Date), 2, 105, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccountNO], [Balance], [AccountDate], [AccountType], [CustomerId], [DocId], [Description], [Debit], [Credit], [Total]) VALUES (102985, CAST(10000.000 AS Decimal(8, 3)), CAST(N'2022-08-19' AS Date), 1, 106, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[AccountType] ON 

INSERT [dbo].[AccountType] ([id], [TypeOfAccount]) VALUES (1, N'Current ')
INSERT [dbo].[AccountType] ([id], [TypeOfAccount]) VALUES (2, N'Saving')
SET IDENTITY_INSERT [dbo].[AccountType] OFF
SET IDENTITY_INSERT [dbo].[branch] ON 

INSERT [dbo].[branch] ([branchId], [branchName]) VALUES (101, N'North Nazimabad')
INSERT [dbo].[branch] ([branchId], [branchName]) VALUES (102, N'Gulberg')
INSERT [dbo].[branch] ([branchId], [branchName]) VALUES (103, N'Hydri')
SET IDENTITY_INSERT [dbo].[branch] OFF
SET IDENTITY_INSERT [dbo].[ChangeofAddress] ON 

INSERT [dbo].[ChangeofAddress] ([ChangeId], [AccountNo], [OldAddress], [NewAddress]) VALUES (1001, NULL, N'House No. N-928', N'House No. N-944 Gulshan')
INSERT [dbo].[ChangeofAddress] ([ChangeId], [AccountNo], [OldAddress], [NewAddress]) VALUES (1002, 102980, N'House No. N-944', N'House No. N-455')
SET IDENTITY_INSERT [dbo].[ChangeofAddress] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustId], [firstName], [lastName], [Gender], [DateofBirth], [CnicNo], [Address], [EmailId], [PinCode], [Password], [Image], [Branch], [Role]) VALUES (102, N'Adnan', N'Rehman', N'Male', CAST(N'1992-04-21' AS Date), N'2344-896585-9', N'House No. N-928 Sector 7/C', N'adnan@gmail.com', 1342, N'2341', N'gentle man3.jpg', 101, N'V')
INSERT [dbo].[Customer] ([CustId], [firstName], [lastName], [Gender], [DateofBirth], [CnicNo], [Address], [EmailId], [PinCode], [Password], [Image], [Branch], [Role]) VALUES (104, N'Furqan', N'rehman', N'male', CAST(N'1991-10-10' AS Date), N'4563-81987-8', N'House No. 938', N'furqan123@gmail.com', 4531, N'1288821', NULL, NULL, N'A')
INSERT [dbo].[Customer] ([CustId], [firstName], [lastName], [Gender], [DateofBirth], [CnicNo], [Address], [EmailId], [PinCode], [Password], [Image], [Branch], [Role]) VALUES (105, N'Ali', N'Ahmed', N'Male', CAST(N'1991-10-12' AS Date), N'5643-987695-9', N'House L-11 Sector 10', N'Ali143@gmail.com', 675, N'1245', N'bio book image.jpg', 103, N'V')
INSERT [dbo].[Customer] ([CustId], [firstName], [lastName], [Gender], [DateofBirth], [CnicNo], [Address], [EmailId], [PinCode], [Password], [Image], [Branch], [Role]) VALUES (106, N'Hassan', N'Rehman', N'Male', CAST(N'1998-06-03' AS Date), N'3419-152473-7', N'House A-313A Gulistan e Johar', N'Hassan123@gmail.com', 980, N'1290', N'Bookspile.jpg', 102, N'V')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[RequestofChequeBook] ON 

INSERT [dbo].[RequestofChequeBook] ([ReqCheqid], [AccountNo], [LeavesofCheque]) VALUES (1, 102980, 25)
INSERT [dbo].[RequestofChequeBook] ([ReqCheqid], [AccountNo], [LeavesofCheque]) VALUES (2, 102980, NULL)
SET IDENTITY_INSERT [dbo].[RequestofChequeBook] OFF
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([TransId], [TransferAmount], [TransferDate], [SenderAccountNum], [RecieverAccountNum]) VALUES (101, CAST(200.000 AS Decimal(8, 3)), CAST(N'2022-08-19' AS Date), 102980, 102984)
INSERT [dbo].[Transactions] ([TransId], [TransferAmount], [TransferDate], [SenderAccountNum], [RecieverAccountNum]) VALUES (102, CAST(4000.000 AS Decimal(8, 3)), CAST(N'2022-08-20' AS Date), 102985, 102980)
SET IDENTITY_INSERT [dbo].[Transactions] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([AccountType])
REFERENCES [dbo].[AccountType] ([id])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustId])
GO
ALTER TABLE [dbo].[BalanceEnquiry]  WITH CHECK ADD FOREIGN KEY([AccountNo])
REFERENCES [dbo].[Account] ([AccountNO])
GO
ALTER TABLE [dbo].[ChangeofAddress]  WITH CHECK ADD FOREIGN KEY([AccountNo])
REFERENCES [dbo].[Account] ([AccountNO])
GO
ALTER TABLE [dbo].[ChequeReq]  WITH CHECK ADD FOREIGN KEY([AccountNumber])
REFERENCES [dbo].[Account] ([AccountNO])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([Branch])
REFERENCES [dbo].[branch] ([branchId])
GO
ALTER TABLE [dbo].[RequestofChequeBook]  WITH CHECK ADD FOREIGN KEY([AccountNo])
REFERENCES [dbo].[Account] ([AccountNO])
GO
ALTER TABLE [dbo].[StopPaymentofCheque]  WITH CHECK ADD FOREIGN KEY([AccountNo])
REFERENCES [dbo].[Account] ([AccountNO])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([RecieverAccountNum])
REFERENCES [dbo].[Account] ([AccountNO])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([SenderAccountNum])
REFERENCES [dbo].[Account] ([AccountNO])
GO
USE [master]
GO
ALTER DATABASE [Ebanking] SET  READ_WRITE 
GO
