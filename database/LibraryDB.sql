USE [master]
GO
/****** Object:  Database [LibraryDB]    Script Date: 03/16/2018 11:47:18 AM ******/
CREATE DATABASE [LibraryDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.HAULV\MSSQL\DATA\LibraryDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.HAULV\MSSQL\DATA\LibraryDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LibraryDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryDB] SET RECOVERY FULL 
GO
ALTER DATABASE [LibraryDB] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LibraryDB', N'ON'
GO
ALTER DATABASE [LibraryDB] SET QUERY_STORE = OFF
GO
USE [LibraryDB]
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
USE [LibraryDB]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 03/16/2018 11:47:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[callNumber] [nvarchar](50) NOT NULL,
	[ISBN_Number] [nvarchar](50) NULL,
	[title] [nvarchar](50) NULL,
	[authorName] [nvarchar](50) NULL,
	[image] [nvarchar](500) NULL,
	[categoryID] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[statusBook] [nvarchar](50) NULL,
	[special] [bit] NULL,
	[lasted] [bit] NULL,
	[views] [int] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[callNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountStudent]    Script Date: 03/16/2018 11:47:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountStudent](
	[stu_userName] [nvarchar](50) NOT NULL,
	[stu_password] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[stuID] [nvarchar](50) NOT NULL,
	[statusStuAcc] [nvarchar](50) NULL,
 CONSTRAINT [PK_AccountStudent_1] PRIMARY KEY CLUSTERED 
(
	[stu_userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rent_Details]    Script Date: 03/16/2018 11:47:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rent_Details](
	[stu_userName] [nvarchar](50) NOT NULL,
	[callNumber] [nvarchar](50) NOT NULL,
	[unitQuantity] [int] NULL,
	[issueDate] [date] NULL,
	[dueDate] [date] NULL,
	[issueStatus] [nvarchar](50) NULL,
	[checkOutDate] [date] NULL,
	[lateFees] [int] NULL,
	[number_Date_Late] [int] NULL,
	[totalFees] [int] NULL,
 CONSTRAINT [PK_Rent_Details] PRIMARY KEY CLUSTERED 
(
	[stu_userName] ASC,
	[callNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Majors]    Script Date: 03/16/2018 11:47:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Majors](
	[majorID] [nvarchar](50) NOT NULL,
	[majorName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Majors] PRIMARY KEY CLUSTERED 
(
	[majorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 03/16/2018 11:47:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[stuID] [nvarchar](50) NOT NULL,
	[stuFirstName] [nvarchar](50) NULL,
	[stuLastName] [nvarchar](50) NULL,
	[stuAddress] [nvarchar](50) NULL,
	[stuPhone] [bigint] NULL,
	[majorID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[stuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_RentalDetailsReport]    Script Date: 03/16/2018 11:47:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_RentalDetailsReport]
AS
SELECT        dbo.Rent_Details.stu_userName AS Expr1, dbo.Rent_Details.callNumber, dbo.Rent_Details.unitQuantity, dbo.Rent_Details.issueDate, dbo.Rent_Details.dueDate, dbo.Rent_Details.issueStatus, dbo.Rent_Details.checkOutDate, 
                         dbo.Rent_Details.lateFees, dbo.Rent_Details.number_Date_Late, dbo.Rent_Details.totalFees, dbo.Books.title, dbo.AccountStudent.stu_userName, dbo.Students.*, dbo.AccountStudent.email, dbo.Majors.majorName
FROM            dbo.Books INNER JOIN
                         dbo.Rent_Details ON dbo.Books.callNumber = dbo.Rent_Details.callNumber INNER JOIN
                         dbo.AccountStudent ON dbo.Rent_Details.stu_userName = dbo.AccountStudent.stu_userName INNER JOIN
                         dbo.Students ON dbo.AccountStudent.stuID = dbo.Students.stuID INNER JOIN
                         dbo.Majors ON dbo.Students.majorID = dbo.Majors.majorID
GO
/****** Object:  View [dbo].[v_AccountStudents]    Script Date: 03/16/2018 11:47:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_AccountStudents]
AS
SELECT        dbo.AccountStudent.stuID, dbo.Students.stuLastName, dbo.Students.stuFirstName, dbo.AccountStudent.stu_userName, dbo.AccountStudent.stu_password, dbo.AccountStudent.statusStuAcc
FROM            dbo.AccountStudent INNER JOIN
                         dbo.Students ON dbo.AccountStudent.stuID = dbo.Students.stuID
GO
/****** Object:  View [dbo].[v_StudentManagementAPI]    Script Date: 03/16/2018 11:47:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_StudentManagementAPI]
AS
SELECT        dbo.Students.stuID, dbo.Students.stuFirstName, dbo.Students.stuLastName, dbo.Students.stuAddress, dbo.Students.stuPhone, dbo.Majors.majorID, dbo.Majors.majorName, dbo.AccountStudent.stu_userName, 
                         dbo.AccountStudent.stu_password, dbo.AccountStudent.statusStuAcc
FROM            dbo.AccountStudent INNER JOIN
                         dbo.Students ON dbo.AccountStudent.stuID = dbo.Students.stuID INNER JOIN
                         dbo.Majors ON dbo.Students.majorID = dbo.Majors.majorID
GO
/****** Object:  View [dbo].[v_StudentInfo]    Script Date: 03/16/2018 11:47:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_StudentInfo]
AS
SELECT        dbo.Students.stuID, dbo.Students.stuFirstName, dbo.Students.stuLastName, dbo.Students.stuAddress, dbo.Students.stuPhone, dbo.Majors.majorName, dbo.AccountStudent.stu_userName, dbo.AccountStudent.stu_password, 
                         dbo.AccountStudent.statusStuAcc
FROM            dbo.AccountStudent INNER JOIN
                         dbo.Students ON dbo.AccountStudent.stuID = dbo.Students.stuID INNER JOIN
                         dbo.Majors ON dbo.Students.majorID = dbo.Majors.majorID
GO
/****** Object:  Table [dbo].[Administrators]    Script Date: 03/16/2018 11:47:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrators](
	[userName] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[posID] [int] NULL,
	[statusAdminAcc] [nvarchar](50) NULL,
 CONSTRAINT [PK_Administrators] PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 03/16/2018 11:47:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[posID] [int] NOT NULL,
	[posName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[posID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_AccountAdmins]    Script Date: 03/16/2018 11:47:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_AccountAdmins]
AS
SELECT        dbo.Administrators.userName, dbo.Administrators.password, dbo.Administrators.name, dbo.Administrators.statusAdminAcc, dbo.Positions.posID, dbo.Positions.posName
FROM            dbo.Administrators INNER JOIN
                         dbo.Positions ON dbo.Administrators.posID = dbo.Positions.posID
GO
/****** Object:  View [dbo].[v_AccountAdmin]    Script Date: 03/16/2018 11:47:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_AccountAdmin]
AS
SELECT        dbo.Administrators.userName, dbo.Administrators.password, dbo.Administrators.name, dbo.Administrators.statusAdminAcc, dbo.Positions.posID, dbo.Positions.posName
FROM            dbo.Administrators INNER JOIN
                         dbo.Positions ON dbo.Administrators.posID = dbo.Positions.posID
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 03/16/2018 11:47:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[cateID] [nvarchar](50) NOT NULL,
	[cateName] [nvarchar](50) NULL,
	[keywords] [nvarchar](500) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[cateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'comgbs12125', N'123456', N'studenthl1997@gmail.com', N'GBS12125', N'Working')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'dinhgcs12312', N'123456', N'studenthl1997@gmail.com', N'GCS12312', N'Stopped')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'haugbs15155', N'123456', N'studenthl1997@gmail.com', N'GBS15155', N'Stopped')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'jamesgbs9999', N'123456', N'studenthl1997@gmail.com', N'GBS9999', N'Working')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'kiengbs12122', N'123456', N'studenthl1997@gmail.com', N'GBS12122', N'Working')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'longgcs12344', N'123456', N'studenthl1997@gmail.com', N'GCS12344', N'Working')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'lygbs12121', N'123456', N'studenthl1997@gmail.com', N'GBS12121', N'Working')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'obamagcs12313', N'123456', N'studenthl1997@gmail.com', N'GCS12313', N'Working')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'quangbs12124', N'123456', N'studenthl1997@gmail.com', N'GBS12124', N'Working')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'sanggbs12123', N'123456', N'studenthl1997@gmail.com', N'GBS12123', N'Working')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'teogcs12323', N'123456', N'studenthl1997@gmail.com', N'GCS12323', N'Working')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'teoggs12345', N'123456', N'studenthl1997@gmail.com', N'GGS12345', N'Working')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'thanhges12311', N'123456', N'studenthl1997@gmail.com', N'GES12311', N'Working')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'thaoggs12346', N'123456', N'studenthl1997@gmail.com', N'GGS12346', N'Working')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'thigcs11111', N'123456', N'studenthl1997@gmail.com', N'GCS11111', N'Working')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'thiggs12312', N'123456', N'studenthl1997@gmail.com', N'GGS12312', N'Working')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'trigcs12122', N'123456', N'studenthl1997@gmail.com', N'GCS12122', N'Working')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'trumpgbs15151', N'123456', N'studenthl1997@gmail.com', N'GBS15151', N'Working')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'tugbs15141', N'123123', N'studenthl1997@gmail.com', N'GBS15141', N'Working')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'tungbs12351', N'123456', N'studenthl1997@gmail.com', N'GBS12351', N'Working')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'ungbs15131', N'123456', N'studenthl1997@gmail.com', N'GBS15131', N'Working')
INSERT [dbo].[AccountStudent] ([stu_userName], [stu_password], [email], [stuID], [statusStuAcc]) VALUES (N'ungcs12314', N'123456', N'studenthl1997@gmail.com', N'GCS12314', N'Working')
INSERT [dbo].[Administrators] ([userName], [password], [name], [posID], [statusAdminAcc]) VALUES (N'admin', N'admin', N'Admin', 1, N'Working')
INSERT [dbo].[Administrators] ([userName], [password], [name], [posID], [statusAdminAcc]) VALUES (N'lib1', N'lib1', N'Lê Văn Hậu', 2, N'Working')
INSERT [dbo].[Administrators] ([userName], [password], [name], [posID], [statusAdminAcc]) VALUES (N'lib2', N'lib2', N'Lương Thị Cẩm Tú', 2, N'Working')
INSERT [dbo].[Administrators] ([userName], [password], [name], [posID], [statusAdminAcc]) VALUES (N'lib3', N'lib3', N'Trương Công Định', 2, N'Working')
INSERT [dbo].[Administrators] ([userName], [password], [name], [posID], [statusAdminAcc]) VALUES (N'lib4', N'lib4', N'Nguyễn Trần Anh Thi', 2, N'Working')
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'L299', N'978-15123123123', N'Go to American', N'Obama', N'G:\IT\Images\american.jpg', N'Q', 5, N'Exist', 1, 1, 0)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'L300', N'978-1245131245', N'The Great American School System', N'Diane Ravitch', N'../Images/american.jpg', N'L', 0, N'No Exist', 1, 1, 15)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'L301', N'978-6134135134', N'Walden on Wheels', N'Ken Ilgunas', N'../Images/walden.jpg', N'L', 4, N'Exist', 1, 1, 32)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'L303', N'978-1023812913', N'Fish in a Tree', N'Lynda Mullaly Hunt', N'../Images/fish.jpg', N'L', 5, N'Exist', 0, 0, 1)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'L304', N'978-1231o23981', N'The Teacher', N'Katerina Diamond', N'../Images/teacher.jpg', N'L', 5, N'Exist', 0, 1, 5)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'L305', N'978-4123812941', N'The Spark', N'Kristine Barnett', N'../Images/spark.jpg', N'L', 4, N'Exist', 0, 1, 6)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'L306', N'978-1928312309', N'101 Amazing Facts', N'Jack Goldstein', N'../Images/101fact.jpg', N'L', 5, N'Exist', 1, 0, 33)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'L307', N'978-4124512411', N'Why We Sleep', N'Matthew P. Walker', N'../Images/whysleep.jpg', N'L', 4, N'Exist', 0, 1, 7)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'L308', N'978-1352352362', N'Other People''s Children', N'Lisa Delpit', N'../Images/children.jpg', N'L', 5, N'Exist', 0, 1, 7)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'L309', N'978-5123123312', N'How Children Succeed', N'Paul Tough', N'../Images/childrensuccess.jpg', N'L', 5, N'Exist', 0, 1, 0)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'L501', N'978-1231235912', N'The Subtle Art  of Not Giving a F*ck', N'Mark Manson', N'../Images/sach-khuyen-hoc.jpg', N'L', 5, N'Exist', 1, 0, 0)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'L502', N'978-1231235912', N'cà phê', N'Mark', N'../Images/ca-phe-cung-tony.jpg', N'L', 5, N'Exist', 1, 0, 0)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'L503', N'978-1231235912', N'Đừng bao giờ đi ăn một mình', N'Tiểu Cao', N'../Images/cuon-sach-hay-dung-bao-gio-di-an-mot-minh.jpg', N'L', 5, N'Exist', 0, 1, 1)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'M400', N'978-6236423426', N'Dreaming the Beatles', N'Rob Sheffield

', N'../Images/dream.jpg', N'M', 5, N'Exist', 1, 0, 21)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'M401', N'978-7373245222', N'Meet Me in the Bathroom', N'Lizzy Goodman

', N'../Images/bathroom.png', N'M', 5, N'Exist', 0, 0, 5)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'M402', N'978-0247245234', N'
Trouble in Mind', N'Clinton Heylin', N'../Images/trouble.jpg', N'M', 5, N'Exist', 0, 0, 1)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'M403', N'978-0282523527', N'What Is It All But Luminous', N'Art Garfunkel', N'../Images/luminous.jpg', N'M', 4, N'Exist', 0, 1, 1)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'M404', N'978-0239423421', N'Otis Redding: An Unfinished Life', N'Jonathan Gold', N'../Images/otis.jpg', N'M', 5, N'Exist', 1, 0, 4)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'M405', N'978-2772342342', N'Liner Notes', N'Loudon Wainwright III', N'../Images/1454873935-sach-hay-dau-nam-2016-01-eva-vn.jpg', N'M', 4, N'Exist', 1, 0, 4)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'M406', N'978-3453453537', N'Reckless Daughter', N'David Yaffe', N'../Images/reckless.jpg', N'M', 5, N'Exist', 0, 1, 1)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'M407', N'978-9334535345', N'Once Upon a Time in Shaolin', N'Cyrus Bozorgmehr', N'../Images/onceupon.jpg', N'M', 5, N'Exist', 0, 0, 0)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'M408', N'978-0586474562', N'
Lou Reed: A Life', N'Anthony DeCurtis', N'../Images/loureed.jpg', N'M', 5, N'Exist', 1, 0, 5)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'M409', N'978-0282727272', N'Runnin'' With the Devil', N'Noel E. Monk', N'../Images/running.jpg', N'M', 5, N'Exist', 0, 1, 0)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'Q100', N'978-6546540274', N'Code Girls', N'Liza Mundy', N'../Images/codegirls.jpg', N'Q', 5, N'Exist', 0, 1, 0)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'Q101', N'978-1416540274', N'Why Time Flies', N'Alan Burdick', N'../Images/whytime.jpg', N'Q', 5, N'Exist', 1, 0, 1)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'Q102', N'978-0262036184', N'Gravity''s Kiss', N'Harry Collins', N'../Images/grakiss.jpg', N'Q', 5, N'Exist', 0, 1, 1)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'Q103', N'978-1026240274', N'PALEOART', N'Zoë Lescaze', N'../Images/paleoart.jpg', N'Q', 5, N'Exist', 1, 0, 1)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'Q104', N'978-0385537216', N'The Evolution of Beauty', N'Richard O.Prum', N'../Images/teob.jpg', N'Q', 5, N'Exist', 0, 1, 5)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'Q105', N'978-0312337226', N'What Future', N'Torie Bosch', N'../Images/whatfuture.jpg', N'Q', 5, N'Exist', 1, 0, 0)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'Q106', N'978-1026237226', N'BIG CHICKEN', N'Maryn McKenna', N'../Images/chicken.jpg', N'Q', 5, N'Exist', 1, 1, 0)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'Q107', N'978-0316502917', N'MAGNITUDE', N'Megan Watzke', N'../Images/magnitude.jpg', N'Q', 5, N'Exist', 0, 0, 0)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'Q108', N'978-0674504431', N'Numbers and the Making of Us', N'Caleb Everett', N'../Images/number.jpg', N'Q', 4, N'Exist', 0, 0, 2)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'Q109', N'978-0465096244', N'What It''s Like to Be a Dog', N'Gregory Berns', N'../Images/likeadog.jpg', N'Q', 4, N'Exist', 1, 1, 0)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'T200', N'978-6232423423', N'Android', N'Android', N'../Images/android.png', N'T', 4, N'Exist', 0, 1, 3)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'T201', N'978-6243242345', N'C', N'Gregory Everett', N'../Images/c.png', N'T', 3, N'Exist', 1, 0, 0)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'T202', N'978-7243246234', N'C++', N'Maryn Ilgunas', N'../Images/c.png', N'T', 5, N'Exist', 1, 1, 0)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'T203', N'978-7546585345', N'C#', N'Microsoft', N'../Images/cs.png', N'T', 4, N'Exist', 1, 0, 5)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'T204', N'978-2342672342', N'Entity Framework', N'Keith Ravitch', N'../Images/ef.png', N'T', 4, N'Exist', 1, 1, 7)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'T205', N'978-7658645783', N'Java', N'Oracle', N'../Images/java.png', N'T', 4, N'Exist', 1, 1, 0)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'T206', N'978-3457383834', N'MySQL', N'Rob Goldstein', N'../Images/mysql.png', N'T', 3, N'Exist', 0, 0, 1)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'T207', N'978-0262342342', N'.NET Framework', N'Microsoft', N'../Images/net.png', N'T', 3, N'Exist', 1, 0, 5)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'T208', N'978-0466234266', N'PHP', N'Rob Delpit', N'../Images/php.png', N'T', 2, N'Exist', 1, 1, 0)
INSERT [dbo].[Books] ([callNumber], [ISBN_Number], [title], [authorName], [image], [categoryID], [quantity], [statusBook], [special], [lasted], [views]) VALUES (N'T209', N'978-0734537344', N'SQL', N'Microsoft', N'../Images/sql.png', N'T', 2, N'Exist', 1, 1, 0)
INSERT [dbo].[Categories] ([cateID], [cateName], [keywords]) VALUES (N'L', N'Education', N'sách giáo dục, sách văn học, truyện, tiểu thuyết')
INSERT [dbo].[Categories] ([cateID], [cateName], [keywords]) VALUES (N'M', N'Music', N'sách âm nhạc, sách nghệ thuật, sách lãng mạn')
INSERT [dbo].[Categories] ([cateID], [cateName], [keywords]) VALUES (N'Q', N'Science', N'sách khoa học, sách nghiên cứu, đề tài, phát triển, kh, pt, dt')
INSERT [dbo].[Categories] ([cateID], [cateName], [keywords]) VALUES (N'T', N'Technology', N'sách kỹ thuật, công nghệ thông tin, lập trình, code, programming language, cntt, kt, dev, developer, sách lập trình')
INSERT [dbo].[Majors] ([majorID], [majorName]) VALUES (N'GBS', N'Business Administration')
INSERT [dbo].[Majors] ([majorID], [majorName]) VALUES (N'GCS', N'Information Technology
')
INSERT [dbo].[Majors] ([majorID], [majorName]) VALUES (N'GES', N'Marketing finance management')
INSERT [dbo].[Majors] ([majorID], [majorName]) VALUES (N'GGS', N'Graphic design
')
INSERT [dbo].[Positions] ([posID], [posName]) VALUES (1, N'Admins')
INSERT [dbo].[Positions] ([posID], [posName]) VALUES (2, N'Librarians')
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'dinhgcs12312', N'L301', 1, CAST(N'2018-02-27' AS Date), CAST(N'2018-03-14' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'dinhgcs12312', N'L306', 1, CAST(N'2018-01-27' AS Date), CAST(N'2018-02-12' AS Date), N'Late', CAST(N'2018-02-15' AS Date), 10, 3, 30)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'dinhgcs12312', N'L308', 1, CAST(N'2018-02-08' AS Date), CAST(N'2018-02-23' AS Date), N'Late', CAST(N'2018-02-25' AS Date), 10, 2, 20)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'dinhgcs12312', N'M404', 1, CAST(N'2018-02-08' AS Date), CAST(N'2018-02-23' AS Date), N'Late', CAST(N'2018-02-25' AS Date), 10, 2, 20)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'dinhgcs12312', N'M408', 1, CAST(N'2018-02-08' AS Date), CAST(N'2018-02-23' AS Date), N'Late', CAST(N'2018-02-25' AS Date), 10, 2, 20)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'dinhgcs12312', N'T209', 1, CAST(N'2018-02-28' AS Date), CAST(N'2018-03-15' AS Date), N'Late', CAST(N'2018-03-19' AS Date), 10, 4, 40)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'haugbs15155', N'L301', 1, CAST(N'2018-02-23' AS Date), CAST(N'2018-03-10' AS Date), N'Early', CAST(N'2018-02-27' AS Date), 10, 0, 0)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'haugbs15155', N'L304', 1, CAST(N'2018-02-24' AS Date), CAST(N'2018-03-11' AS Date), N'Early', CAST(N'2018-02-27' AS Date), 10, 0, 0)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'haugbs15155', N'L306', 1, CAST(N'2018-02-08' AS Date), CAST(N'2018-02-23' AS Date), N'Late', CAST(N'2018-02-27' AS Date), 10, 4, 40)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'haugbs15155', N'L307', 1, CAST(N'2018-02-27' AS Date), CAST(N'2018-03-14' AS Date), N'Late', CAST(N'2018-03-17' AS Date), 10, 3, 30)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'haugbs15155', N'M400', 1, CAST(N'2018-02-08' AS Date), CAST(N'2018-02-23' AS Date), N'Early', CAST(N'2018-02-19' AS Date), 10, 0, 0)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'haugbs15155', N'M401', 1, CAST(N'2018-02-08' AS Date), CAST(N'2018-02-23' AS Date), N'Early', CAST(N'2018-02-19' AS Date), 10, 0, 0)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'haugbs15155', N'M402', 1, CAST(N'2018-02-08' AS Date), CAST(N'2018-02-23' AS Date), N'Late', CAST(N'2018-02-27' AS Date), 10, 4, 40)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'haugbs15155', N'M403', 1, CAST(N'2018-02-27' AS Date), CAST(N'2018-03-14' AS Date), N'Late', CAST(N'2018-03-17' AS Date), 10, 3, 30)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'haugbs15155', N'M405', 1, CAST(N'2018-02-27' AS Date), CAST(N'2018-03-14' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'haugbs15155', N'Q102', 1, CAST(N'2018-02-08' AS Date), CAST(N'2018-02-23' AS Date), N'Late', CAST(N'2018-02-27' AS Date), 10, 4, 40)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'jamesgbs9999', N'T207', 1, CAST(N'2018-03-10' AS Date), CAST(N'2018-03-25' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'kiengbs12122', N'Q108', 1, CAST(N'2018-03-10' AS Date), CAST(N'2018-03-25' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'kiengbs12122', N'T200', 1, CAST(N'2018-03-05' AS Date), CAST(N'2018-03-20' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'kiengbs12122', N'T201', 1, CAST(N'2018-03-03' AS Date), CAST(N'2018-03-18' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'kiengbs12122', N'T203', 1, CAST(N'2018-03-06' AS Date), CAST(N'2018-03-21' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'longgcs12344', N'T206', 1, CAST(N'2018-03-08' AS Date), CAST(N'2018-03-23' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'longgcs12344', N'T208', 1, CAST(N'2018-03-10' AS Date), CAST(N'2018-03-25' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'longgcs12344', N'T209', 1, CAST(N'2018-03-06' AS Date), CAST(N'2018-03-21' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'obamagcs12313', N'T201', 1, CAST(N'2018-03-04' AS Date), CAST(N'2018-03-19' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'obamagcs12313', N'T204', 1, CAST(N'2018-03-01' AS Date), CAST(N'2018-03-16' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'obamagcs12313', N'T207', 1, CAST(N'2018-03-01' AS Date), CAST(N'2018-03-16' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'obamagcs12313', N'T208', 1, CAST(N'2018-03-01' AS Date), CAST(N'2018-03-16' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'tugbs15141', N'L301', 1, CAST(N'2018-02-09' AS Date), CAST(N'2018-02-24' AS Date), N'Late', CAST(N'2018-02-27' AS Date), 10, 3, 30)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'tugbs15141', N'L305', 1, CAST(N'2018-02-09' AS Date), CAST(N'2018-02-24' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'tugbs15141', N'L306', 1, CAST(N'2018-02-09' AS Date), CAST(N'2018-02-24' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'ungcs12314', N'Q109', 1, CAST(N'2018-02-28' AS Date), CAST(N'2018-03-14' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'ungcs12314', N'T205', 1, CAST(N'2018-03-01' AS Date), CAST(N'2018-03-16' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'ungcs12314', N'T206', 1, CAST(N'2018-02-28' AS Date), CAST(N'2018-03-14' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'ungcs12314', N'T208', 1, CAST(N'2018-03-08' AS Date), CAST(N'2018-03-23' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Rent_Details] ([stu_userName], [callNumber], [unitQuantity], [issueDate], [dueDate], [issueStatus], [checkOutDate], [lateFees], [number_Date_Late], [totalFees]) VALUES (N'ungcs12314', N'T209', 1, CAST(N'2018-03-08' AS Date), CAST(N'2018-03-23' AS Date), N'Rented', NULL, 10, NULL, NULL)
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GBS12121', N'Ly', N'Tieu Long', N'123 ptt', 12513513213, N'GBS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GBS12122', N'Kien', N'Dinh', N'123 PTH', 15123125123, N'GBS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GBS12123', N'Sang', N'Kenny', N'192 Ham Tu', 1151231231, N'GBS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GBS12124', N'Quan', N'Cool', N'123 PTT', 12314123123, N'GBS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GBS12125', N'Com', N'Suon', N'1212 Best Blit', 25465744455, N'GBS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GBS12351', N'Tun', N'Le Van', N'123 PVC', 1212331, N'GBS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GBS15131', N'Un', N'Kim Jong', N'123 PTT', 1231231111, N'GBS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GBS15141', N'Tu', N'Luong Thi Cam', N'124 PTT', 1269720975, N'GBS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GBS15151', N'Trump', N'Donald', N'White House', 123123819, N'GBS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GBS15155', N'Hau', N'Le Van', N'123 PTT', 1289720975, N'GCS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GBS9999', N'James', N'Lê', N'123 PTT', 1293123123, N'GBS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GCS11111', N'Thi', N'Nguyen Tran Anh', N'120 PTT', 1234556778, N'GCS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GCS12122', N'Tri', N'Ly', N'123 PTT', 12451231231, N'GCS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GCS12312', N'Dinh', N'Truong Cong', N'125 PTT', 1234556788, N'GCS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GCS12313', N'Obama', N'Barack', N'Old White House', 123123123, N'GCS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GCS12314', N'Un', N'KiM Jong', N'Triều Tiên', 123123123, N'GBS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GCS12323', N'Teo', N'KiM Jong', N'125 PTT', 123123123, N'GCS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GCS12344', N'Long', N'Lee', N'123 ptt', 1231251412, N'GCS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GES12311', N'Thanh', N'Huu', N'123 PTT', 120312312312, N'GCS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GGS12312', N'Thi', N'Le Van', N'123 PTT', 123123123, N'GGS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GGS12345', N'Teo', N'Le Van', N'127 PTT', 12381732113, N'GGS')
INSERT [dbo].[Students] ([stuID], [stuFirstName], [stuLastName], [stuAddress], [stuPhone], [majorID]) VALUES (N'GGS12346', N'Thao', N'Hieu', N'123 PTT', 1123115123, N'GGS')
ALTER TABLE [dbo].[AccountStudent]  WITH CHECK ADD  CONSTRAINT [FK_AccountStudent_Students] FOREIGN KEY([stuID])
REFERENCES [dbo].[Students] ([stuID])
GO
ALTER TABLE [dbo].[AccountStudent] CHECK CONSTRAINT [FK_AccountStudent_Students]
GO
ALTER TABLE [dbo].[Administrators]  WITH CHECK ADD  CONSTRAINT [FK_Administrators_Positions] FOREIGN KEY([posID])
REFERENCES [dbo].[Positions] ([posID])
GO
ALTER TABLE [dbo].[Administrators] CHECK CONSTRAINT [FK_Administrators_Positions]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Categories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Categories] ([cateID])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Categories]
GO
ALTER TABLE [dbo].[Rent_Details]  WITH CHECK ADD  CONSTRAINT [FK_Rent_Details_AccountStudent] FOREIGN KEY([stu_userName])
REFERENCES [dbo].[AccountStudent] ([stu_userName])
GO
ALTER TABLE [dbo].[Rent_Details] CHECK CONSTRAINT [FK_Rent_Details_AccountStudent]
GO
ALTER TABLE [dbo].[Rent_Details]  WITH CHECK ADD  CONSTRAINT [FK_Rent_Details_Books] FOREIGN KEY([callNumber])
REFERENCES [dbo].[Books] ([callNumber])
GO
ALTER TABLE [dbo].[Rent_Details] CHECK CONSTRAINT [FK_Rent_Details_Books]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Majors] FOREIGN KEY([majorID])
REFERENCES [dbo].[Majors] ([majorID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Majors]
GO
/****** Object:  StoredProcedure [dbo].[hl_StudentInfo]    Script Date: 03/16/2018 11:47:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hl_StudentInfo] @stuUserName nvarchar(50)
as
select * from v_StudentInfo s where stu_userName = @stuUserName
GO
/****** Object:  Trigger [dbo].[trgSetQuantityBook]    Script Date: 03/16/2018 11:47:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[trgSetQuantityBook] on [dbo].[Books]
after insert as
begin
	declare @callNumber nvarchar(50)
	select @callNumber = i.callNumber from inserted i
	update dbo.Books set quantity = 5, statusBook = 'Exist', [views] = 0 where callNumber = @callNumber
end
GO
ALTER TABLE [dbo].[Books] ENABLE TRIGGER [trgSetQuantityBook]
GO
/****** Object:  Trigger [dbo].[trgSetStatusNoExist]    Script Date: 03/16/2018 11:47:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trgSetStatusNoExist] on [dbo].[Books]
for insert, update
as	
if update(quantity)
	Begin
		declare @callNumber varchar(50), @quantity int
		select @callNumber = i.callNumber from inserted i
		select @quantity = i.quantity from inserted i
		if(@quantity = 0)
		begin
		update Books set statusBook = 'No Exist'
		where @callNumber = Books.callNumber
		end
		if(@quantity > 0)
		begin
		update Books set statusBook = 'Exist'
		where @callNumber = Books.callNumber
		end
	end
GO
ALTER TABLE [dbo].[Books] ENABLE TRIGGER [trgSetStatusNoExist]
GO
/****** Object:  Trigger [dbo].[trgThrowErrorCheckQuantityLibrary]    Script Date: 03/16/2018 11:47:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trgThrowErrorCheckQuantityLibrary] on [dbo].[Books]
for insert, update
as
if update(quantity)
begin
	declare @callNumber nvarchar(50), @bookFromLib int
	select @callNumber = i.callNumber from inserted i
	select @bookFromLib = i.quantity from inserted i

	if (@bookFromLib > 5)
	begin
		update Books set quantity = 5 where callNumber = @callNumber
	end
end
GO
ALTER TABLE [dbo].[Books] ENABLE TRIGGER [trgThrowErrorCheckQuantityLibrary]
GO
/****** Object:  Trigger [dbo].[trgCaculateTotalFee]    Script Date: 03/16/2018 11:47:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trgCaculateTotalFee] on [dbo].[Rent_Details]
for update
as
if update(checkOutDate)
begin
	declare @checkOutDate date, @dueDate date, @student nvarchar(50), @callNumber nvarchar(50), @numberDay int
	select @student = i.stu_userName from inserted i
	select @callNumber = i.callNumber from inserted i
	select @dueDate = Convert(date, r.dueDate) from Rent_Details r where stu_userName = @student and callNumber = @callNumber
	select @checkOutDate = CONVERT(date, i.checkOutDate) from inserted i
	select @numberDay = DATEDIFF(day, @dueDate, @checkOutDate)

	if (@numberDay > 0)
		begin
			update Rent_Details set issueStatus = 'Late', number_Date_Late = @numberDay, totalFees = @numberDay*lateFees*unitQuantity
			where stu_userName = @student and callNumber = @callNumber
		end
	if (@numberDay < 0)
		begin
			update Rent_Details set issueStatus = 'Early', number_Date_Late = 0, totalFees = 0
			where stu_userName = @student and callNumber = @callNumber
		end
	if (@numberDay = 0)
		begin
			update Rent_Details set issueStatus = 'Timely', number_Date_Late = 0, totalFees = 0
			where stu_userName = @student and callNumber = @callNumber
		end
end
GO
ALTER TABLE [dbo].[Rent_Details] ENABLE TRIGGER [trgCaculateTotalFee]
GO
/****** Object:  Trigger [dbo].[trgCheckQuantityOfBookEnough]    Script Date: 03/16/2018 11:47:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trgCheckQuantityOfBookEnough] on [dbo].[Rent_Details]
for update
as
if update(unitQuantity)
begin
	declare @unitQuantity int, @quantity int, @callNumber varchar(50)
	select @unitQuantity = i.unitQuantity from inserted i
	select @callNumber = i.callNumber from inserted i
	select @quantity = b.quantity from Books b where callNumber = @callNumber

	if (@unitQuantity <= @quantity)
	begin
		update Books set quantity = @quantity - @unitQuantity 
		where callNumber = @callNumber
	end
	if (@unitQuantity > @quantity)
	begin
		raiserror ('notenough',16,1)
		rollback tran
		return
	end
end
GO
ALTER TABLE [dbo].[Rent_Details] ENABLE TRIGGER [trgCheckQuantityOfBookEnough]
GO
/****** Object:  Trigger [dbo].[trgEachStudentRent5Book]    Script Date: 03/16/2018 11:47:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trgEachStudentRent5Book] on [dbo].[Rent_Details]
for insert
as
begin
	declare @quantity_student_rented int, @userName nvarchar(50)
	select @userName = i.stu_userName from inserted i
	select @quantity_student_rented = count(r.stu_userName) from Rent_Details r where issueStatus = 'Rented' and stu_userName = @userName

	--select count(r.stu_userName) from Rent_Details r where issueStatus = 'Rented' and stu_userName = 'haugbs15155'
	if (@quantity_student_rented > 5)
	begin
		raiserror ('5book',16,1)
		rollback tran
		return
	end
end
GO
ALTER TABLE [dbo].[Rent_Details] ENABLE TRIGGER [trgEachStudentRent5Book]
GO
/****** Object:  Trigger [dbo].[trgReturnBookToLibrary]    Script Date: 03/16/2018 11:47:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trgReturnBookToLibrary] on [dbo].[Rent_Details]
for update
as
if update(checkOutDate)
begin
	declare @callNumber nvarchar(50), @bookFromStu int
	select @callNumber = i.callNumber from inserted i
	select @bookFromStu = i.unitQuantity from inserted i

	update Books set quantity = quantity + @bookFromStu where callNumber = @callNumber
end
GO
ALTER TABLE [dbo].[Rent_Details] ENABLE TRIGGER [trgReturnBookToLibrary]
GO
/****** Object:  Trigger [dbo].[trgSetStatusWhenNewRent]    Script Date: 03/16/2018 11:47:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trgSetStatusWhenNewRent] on [dbo].[Rent_Details]
for insert
as
begin
	declare @stuUserName nvarchar(50), @callNumber nvarchar(50)
	select @stuUserName = i.stu_userName from inserted i
	select @callNumber = i.callNumber from inserted i
	update Rent_Details set unitQuantity = 1, issueStatus = 'Rented', lateFees = 10 where stu_userName = @stuUserName and callNumber = @callNumber
end
GO
ALTER TABLE [dbo].[Rent_Details] ENABLE TRIGGER [trgSetStatusWhenNewRent]
GO
/****** Object:  Trigger [dbo].[trgStopAccount]    Script Date: 03/16/2018 11:47:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[trgStopAccount] on [dbo].[Rent_Details]
for update
as
if update(checkOutDate)
begin
	declare @numberLate int, @userName nvarchar(50)
	select @userName = i.stu_userName from inserted i
	select @numberLate = count(stu_userName) from Rent_Details where stu_userName = @userName and issueStatus = 'Late'
	if(@numberLate >= 5)
	begin
		update AccountStudent set statusStuAcc = 'Stopped' where stu_userName = @userName
	end
end
GO
ALTER TABLE [dbo].[Rent_Details] ENABLE TRIGGER [trgStopAccount]
GO
/****** Object:  Trigger [dbo].[trgWorkAccount]    Script Date: 03/16/2018 11:47:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trgWorkAccount] on [dbo].[Rent_Details]
for delete
as
begin
	declare @numberLate int, @userName nvarchar(50)
	select @userName = d.stu_userName from deleted d
	select @numberLate = count(stu_userName) from Rent_Details where stu_userName = @userName and issueStatus = 'Late'
	if(@numberLate < 5)
	begin
		update AccountStudent set statusStuAcc = 'Working' where stu_userName = @userName
	end
end
GO
ALTER TABLE [dbo].[Rent_Details] ENABLE TRIGGER [trgWorkAccount]
GO
/****** Object:  Trigger [dbo].[trgNewAccountWhenNewStudent]    Script Date: 03/16/2018 11:47:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[trgNewAccountWhenNewStudent] on [dbo].[Students]
for Insert
as
begin
	declare @stuIDLow nvarchar(50),@stuID nvarchar(50), @stuID_Acc nvarchar(50), @stuFName nvarchar(50), 
	@stuUserName_Acc nvarchar(50), @stu_pass_Acc nvarchar(50), @statusStu_Acc nvarchar(50)
	select @stuIDLow = LOWER(i.stuID) from inserted i
	select @stuID = i.stuID from inserted i
	select @stuFName = LOWER(i.stuFirstName) from inserted i
	--select @stuID_Acc = acc.stuID from AccountStudent acc
	--select @stuUserName_Acc = acc.stu_userName from AccountStudent acc
	--select @stu_pass_Acc = acc.stu_password from AccountStudent acc
	--select @statusStu_Acc = acc.statusStuAcc from AccountStudent acc

	insert AccountStudent(stu_userName, stu_password, email, stuID, statusStuAcc) values
	(@stuFName + @stuIDLow,'123456', 'studenthl1997@gmail.com',@stuID, 'Working')
end
GO
ALTER TABLE [dbo].[Students] ENABLE TRIGGER [trgNewAccountWhenNewStudent]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Administrators"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Positions"
            Begin Extent = 
               Top = 6
               Left = 252
               Bottom = 102
               Right = 422
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AccountAdmin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AccountAdmin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Administrators"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Positions"
            Begin Extent = 
               Top = 6
               Left = 252
               Bottom = 102
               Right = 422
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AccountAdmins'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AccountAdmins'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AccountStudent"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Students"
            Begin Extent = 
               Top = 1
               Left = 382
               Bottom = 131
               Right = 552
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AccountStudents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AccountStudents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Books"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Rent_Details"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 135
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Students"
            Begin Extent = 
               Top = 6
               Left = 471
               Bottom = 136
               Right = 641
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AccountStudent"
            Begin Extent = 
               Top = 6
               Left = 679
               Bottom = 136
               Right = 849
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Majors"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_RentalDetailsReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_RentalDetailsReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_RentalDetailsReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AccountStudent"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Majors"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Students"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_StudentInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_StudentInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AccountStudent"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Students"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Majors"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_StudentManagementAPI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_StudentManagementAPI'
GO
USE [master]
GO
ALTER DATABASE [LibraryDB] SET  READ_WRITE 
GO
