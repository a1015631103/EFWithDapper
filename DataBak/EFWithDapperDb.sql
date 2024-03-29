USE [master]
GO
/****** Object:  Database [EFWithDapperDb]    Script Date: 2022/7/1 16:56:25 ******/
CREATE DATABASE [EFWithDapperDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EFWithDapperDb', FILENAME = N'E:\data\EFWithDapperDb.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EFWithDapperDb_log', FILENAME = N'E:\data\EFWithDapperDb_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EFWithDapperDb] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EFWithDapperDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EFWithDapperDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EFWithDapperDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EFWithDapperDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EFWithDapperDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EFWithDapperDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [EFWithDapperDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EFWithDapperDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EFWithDapperDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EFWithDapperDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EFWithDapperDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EFWithDapperDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EFWithDapperDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EFWithDapperDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EFWithDapperDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EFWithDapperDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EFWithDapperDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EFWithDapperDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EFWithDapperDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EFWithDapperDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EFWithDapperDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EFWithDapperDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EFWithDapperDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EFWithDapperDb] SET RECOVERY FULL 
GO
ALTER DATABASE [EFWithDapperDb] SET  MULTI_USER 
GO
ALTER DATABASE [EFWithDapperDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EFWithDapperDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EFWithDapperDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EFWithDapperDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EFWithDapperDb', N'ON'
GO
USE [EFWithDapperDb]
GO
/****** Object:  Table [dbo].[sys_Role]    Script Date: 2022/7/1 16:56:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Level] [int] NULL,
	[Type] [int] NULL,
	[Enabled] [int] NULL,
 CONSTRAINT [PK_sys_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_RoleInUser]    Script Date: 2022/7/1 16:56:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_RoleInUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[UserGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_sys_RoleInUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_User]    Script Date: 2022/7/1 16:56:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_User](
	[Guid] [uniqueidentifier] NOT NULL,
	[LoginName] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Type] [int] NULL,
	[Status] [int] NULL,
	[Enabled] [int] NULL,
	[CreateTime] [datetime] NULL,
	[RegType] [int] NOT NULL,
	[IsDelete] [int] NOT NULL DEFAULT ((2)),
	[RegEmail] [varchar](50) NULL,
	[RegPhone] [varchar](20) NULL,
 CONSTRAINT [PK_sys_User] PRIMARY KEY CLUSTERED 
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_UsersExpand]    Script Date: 2022/7/1 16:56:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_UsersExpand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NULL,
	[LastDate] [datetime] NULL,
	[LastIP] [varchar](30) NULL,
	[Remark] [nvarchar](100) NULL,
	[SysUserId] [uniqueidentifier] NULL,
	[Sex] [int] NULL,
	[BorthDay] [datetime] NULL,
	[EducationBackground] [int] NULL,
	[Employment] [int] NULL,
	[PersonPhotoPath] [nvarchar](1000) NULL,
	[BlueMoney] [float] NULL,
 CONSTRAINT [PK_tb_UsersExpand_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[sys_Role] ON 

INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (1, N'管理员', N'管理员', 1, 1, 2)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (2, N'教务组', N'教务组用户', 2, 1, 2)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (3, N'高级讲师', N'高级讲师用户', 3, 1, 2)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (4, N'中级讲师', N'中级讲师用户', 4, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (5, N'助理', N'助理用户', 5, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (6, N'学员', N'学员用户', 6, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (14, N'高级教师', N'测试描述3', 3, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (15, N'测试4', N'测试描述4', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (16, N'测试5', N'测试描述5', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (17, N'测试6', N'测试描述6', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (18, N'测试7', N'测试描述7', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (19, N'测试8', N'测试描述8', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (20, N'测试9', N'测试描述9', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (21, N'测试10', N'测试描述10', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (22, N'测试11', N'测试描述11', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (23, N'测试12', N'测试描述12', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (24, N'测试13', N'测试描述13', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (25, N'测试14', N'测试描述14', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (26, N'测试15', N'测试描述15', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (27, N'测试16', N'测试描述16', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (28, N'测试17', N'测试描述17', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (29, N'测试18', N'测试描述18', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (30, N'测试19', N'测试描述19', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (31, N'测试20', N'测试描述20', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (32, N'测试21', N'测试描述21', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (33, N'测试22', N'测试描述22', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (34, N'测试23', N'测试描述23', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (35, N'测试24', N'测试描述24', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (36, N'测试25', N'测试描述25', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (37, N'测试26', N'测试描述26', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (38, N'测试27', N'测试描述27', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (39, N'测试28', N'测试描述28', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (40, N'测试29', N'测试描述29', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (41, N'测试30', N'测试描述30', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (42, N'测试31', N'测试描述31', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (43, N'测试32', N'测试描述32', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (44, N'测试33', N'测试描述33', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (45, N'测试34', N'测试描述34', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (46, N'测试35', N'测试描述35', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (47, N'测试36', N'测试描述36', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (48, N'测试37', N'测试描述37', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (49, N'测试38', N'测试描述38', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (50, N'测试39', N'测试描述39', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (51, N'测试40', N'测试描述40', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (52, N'测试41', N'测试描述41', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (53, N'测试42', N'测试描述42', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (54, N'测试43', N'测试描述43', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (55, N'测试44', N'测试描述44', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (56, N'测试45', N'测试描述45', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (57, N'测试46', N'测试描述46', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (58, N'测试47', N'测试描述47', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (59, N'测试48', N'测试描述48', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (60, N'测试49', N'测试描述49', 1, 1, 1)
INSERT [dbo].[sys_Role] ([Id], [Name], [Description], [Level], [Type], [Enabled]) VALUES (61, N'测试', N'描述测试', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[sys_Role] OFF
SET IDENTITY_INSERT [dbo].[sys_RoleInUser] ON 

INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (32, 3, N'157edba2-a92c-451b-9cb9-2ebe1d19073c')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (33, 2, N'da249e30-5975-449a-b5da-5ce6e254d0b0')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (34, 5, N'ca7ddc9e-92a6-4bfe-8f61-22e090f8019f')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (35, 4, N'd04846a3-9a57-449c-989e-f3a6664f44c0')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (36, 1, N'f9721cee-360f-4149-b5c4-0a766115e801')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (37, 6, N'd9c34607-bc7e-4867-a39d-7cb19e8f8d85')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (38, 3, N'b1a7e950-2954-4e4f-b532-8d597a510596')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (39, 2, N'54b83f80-3f04-46dc-9b68-fc62a878be00')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (41, 5, N'4f250671-757f-4122-b31e-73f7cf928c92')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (42, 3, N'fed6730b-73f2-4e91-b659-0be70dc14de1')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (43, 2, N'a21db021-2e6a-4287-afa2-02766e52b517')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (44, 4, N'786e2a7f-b474-4876-bde9-adf7595cb45b')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (45, 5, N'734f2dcc-5eaa-4a20-b0ca-80ca62927ea6')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (46, 1, N'47119ccd-d747-4671-9910-536ae1e76808')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (47, 6, N'4911f252-d3db-4bf7-b5ce-97ccdb046aed')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (48, 1, N'f53abe7c-1bb2-4a07-8d71-122f0ff70a07')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (49, 2, N'1ab86e2a-fefe-4644-90ed-07e15772c2fb')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (52, 2, N'c54e2727-3959-4b75-87e4-9d4e0ddf8b55')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (54, 6, N'23d75d69-7104-4643-9a5f-768d849dfed8')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (58, 6, N'2638bccd-bdb4-457d-aa81-28f3e28c4b89')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (61, 6, N'c6515f0e-bd7e-4994-bddd-c604cd5be8a0')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (63, 6, N'd0f4fefc-c8d2-4064-857f-bebcb7a0016a')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (64, 6, N'44871f13-a3e7-4bbf-8ee3-5c7fe48a2c70')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (65, 3, N'c17abcb8-7e26-421d-bf28-a53cd92d933a')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (68, 6, N'c0434603-9db6-4776-90cd-b79db0b43b9c')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (72, 6, N'6b0f3371-c644-488c-8772-3ad8e1a2f054')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (73, 6, N'299b55ac-bb93-4a83-b114-f67a9fee9e38')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (75, 6, N'a136ca63-ca54-403f-82a5-ef1c5dd28c01')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (76, 9, N'7113cbe5-acae-4a6d-8ae5-a6ed229c362e')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (77, 9, N'bc730f6b-2270-4570-8937-cf4f1dafddc8')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (80, 0, N'8dfa146b-22cd-4a13-af2c-dca50e8aff26')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (81, 0, N'29304bb7-b883-495c-925e-7a2cdf246574')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (82, 6, N'b50684e2-405a-4322-b0f3-9d3bf0fc304b')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (83, 6, N'73be7e89-8b4b-42f4-bcc7-feb265274675')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (84, 6, N'9b0fc52c-fab6-4876-b158-269cd3268152')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (85, 6, N'a99f0e0a-d96f-474c-ae05-0bdb744fadbf')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (86, 6, N'4a004efa-c62f-416f-9a5f-7d501bfe96f1')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (87, 6, N'1269be5a-1cc5-411a-93e9-c141bd6f0e53')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (89, 6, N'a1b9d502-a807-46f8-96bb-417e02f4ac5a')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (90, 6, N'dd983b8e-fa16-4b6f-a461-406a1fc4691a')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (91, 6, N'b0ce927e-38e7-4c8b-b333-5eb1317b64ae')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (93, 6, N'a35cf383-1ae8-43e0-a27a-5eb66523afba')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (94, 6, N'c62ec6ea-2aa4-4fe9-99b0-53fd3eabdb3e')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (96, 6, N'd8bcfd35-264f-45af-bb75-bf6e5aa81751')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (97, 6, N'04f485d6-7d79-46e0-8b72-391f7abaddec')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (98, 6, N'e47354f3-3cb3-4311-987d-a4cffae960c0')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (99, 6, N'4838f8bf-0356-4c61-bdab-114220b9d090')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (101, 6, N'c55f4074-f8a7-465f-a89f-03a5aedd90d1')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (102, 6, N'426cedf8-6f2f-45f3-bf55-07852b0cc0bf')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (103, 6, N'd6291b18-2309-4289-8e62-6c9995ab5f04')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (104, 6, N'b9e4152d-55ac-4349-abe9-e4e9d0395f58')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (105, 6, N'a887d231-5073-45e0-a44d-1c0e843f7406')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (106, 6, N'3634982f-4e66-465f-9c30-25780bab18ce')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (107, 6, N'ba140eb4-7fc0-4c27-a03e-cdd795f9f1b7')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (108, 6, N'778eae30-6c51-4cd3-977d-00e84fc11bbe')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (109, 6, N'49c9a042-eb16-49cb-9b41-f10e00025b36')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (110, 5, N'b465fb2e-1894-465e-86d3-a185b54d0053')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (111, 6, N'd5f1341c-e31f-4472-a789-88512d0dca21')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (112, 6, N'e9067284-c3a2-4c7b-832d-f9c7298b36fb')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (113, 5, N'56707eed-457c-4e6f-bfc3-7c5038db5b1f')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (114, 4, N'a17377e3-1b99-4482-a3c8-4802fd197ed4')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (115, 3, N'68b7d30d-c0f4-4d79-ab53-3638093feab3')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (116, 5, N'e60c8b03-6769-40ea-850d-80741dcf5f2b')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (117, 6, N'b9c48d59-668e-47e1-a0ec-f7f14798bd56')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (124, 6, N'b07376d7-574a-45fb-8db2-e99516461850')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (125, 6, N'14c38b7c-d6a5-4c6c-bd55-1ef99cf9715b')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (126, 6, N'33765532-c865-4152-9cf4-07cd60544b62')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (127, 6, N'e9962a32-8643-41ee-8c3a-e6fc545729ec')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (128, 6, N'40519a29-72e2-46ec-8665-b30b415dcaf3')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (129, 6, N'd276a249-ade3-46d6-8995-537bd5307ab7')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (130, 6, N'db6a77b4-d8fa-4c48-93ff-fdacb7f3f402')
INSERT [dbo].[sys_RoleInUser] ([Id], [RoleId], [UserGuid]) VALUES (131, 4, N'0e8eb5cf-5be1-4779-b7e0-bd0e5cf4c332')
SET IDENTITY_INSERT [dbo].[sys_RoleInUser] OFF
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'778eae30-6c51-4cd3-977d-00e84fc11bbe', N'lhp', N'4QrcOUm6Wau+VuBX8g+IPg==', N'大海55', 1, 1, 1, CAST(N'2015-12-21 14:31:52.147' AS DateTime), 2, 2, N'lhp@qq.com', N'18825142622')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'a21db021-2e6a-4287-afa2-02766e52b517', N'JWZ3', N'4QrcOUm6Wau+VuBX8g+IPg==', N'教务组3号', 1, 1, 1, CAST(N'2015-09-08 10:16:34.450' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'c55f4074-f8a7-465f-a89f-03a5aedd90d1', N'', N'4QrcOUm6Wau+VuBX8g+IPg==', N'tianming', 1, 1, 1, CAST(N'2015-12-07 15:03:52.287' AS DateTime), 1, 2, N'', N'18825142600')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'b8f35fc0-841e-4629-b44d-072a208d6e60', N'测试2', N'4QrcOUm6Wau+VuBX8g+IPg==', N'测试2', 1, 1, 2, CAST(N'2015-12-17 10:50:51.907' AS DateTime), 2, 1, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'426cedf8-6f2f-45f3-bf55-07852b0cc0bf', N'longtou3000', N'4QrcOUm6Wau+VuBX8g+IPg==', N'龙头18', 1, 1, 1, CAST(N'2015-12-07 16:04:55.127' AS DateTime), 1, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'33765532-c865-4152-9cf4-07cd60544b62', N'222', N'4QrcOUm6Wau+VuBX8g+IPg==', N'333', 1, 1, 1, CAST(N'2016-01-04 11:47:50.823' AS DateTime), 2, 2, N'', N'18825142668')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'1ab86e2a-fefe-4644-90ed-07e15772c2fb', N'JWZ4', N'4QrcOUm6Wau+VuBX8g+IPg==', N'教务组4号', 1, 1, 1, CAST(N'2015-09-14 15:07:40.843' AS DateTime), 2, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'f9721cee-360f-4149-b5c4-0a766115e801', N'admin', N'ISMvKXpXpadDiUoOSoAfww==', N'管理员', 0, 1, 1, CAST(N'2014-07-02 11:54:22.087' AS DateTime), 2, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'a1beac14-5832-463c-9ceb-0b0b1d283968', N'GJJS16', N'4QrcOUm6Wau+VuBX8g+IPg==', N'高级讲师16', 1, 1, 1, CAST(N'2015-12-07 14:49:58.523' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'fed6730b-73f2-4e91-b659-0be70dc14de1', N'GJJS3', N'4QrcOUm6Wau+VuBX8g+IPg==', N'高级讲师3号', 1, 1, 1, CAST(N'2015-09-08 10:16:17.997' AS DateTime), 2, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'44ad38ec-ab93-4c12-96cc-0d58130b2ba4', N'make', N'4QrcOUm6Wau+VuBX8g+IPg==', N'马课', 1, 1, 1, CAST(N'2015-12-25 14:24:18.650' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'3069abc2-0eba-4e9f-9dd1-1131568d179c', N'qwqwqwqwq', N'4QrcOUm6Wau+VuBX8g+IPg==', N'qwqwqwqwq', 1, 1, 1, CAST(N'2015-12-18 11:25:14.480' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'4838f8bf-0356-4c61-bdab-114220b9d090', N'123456', N'4QrcOUm6Wau+VuBX8g+IPg==', N'学员101', 1, 1, 1, CAST(N'2015-12-01 09:30:52.817' AS DateTime), 1, 2, N'', N'188215142678')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'f53abe7c-1bb2-4a07-8d71-122f0ff70a07', N'guanli2', N'4QrcOUm6Wau+VuBX8g+IPg==', N'管理员2号', 1, 1, 1, CAST(N'2015-09-10 09:36:53.897' AS DateTime), 2, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'a887d231-5073-45e0-a44d-1c0e843f7406', N'5252', N'4QrcOUm6Wau+VuBX8g+IPg==', N'tiantian', 1, 1, 2, CAST(N'2015-12-09 10:28:59.733' AS DateTime), 1, 1, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'14c38b7c-d6a5-4c6c-bd55-1ef99cf9715b', N'2222', N'4QrcOUm6Wau+VuBX8g+IPg==', N'222', 1, 1, 1, CAST(N'2016-01-04 11:47:49.463' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'ca7ddc9e-92a6-4bfe-8f61-22e090f8019f', N'ZJ', N'4QrcOUm6Wau+VuBX8g+IPg==', N'助教', 1, 1, 1, CAST(N'2015-09-01 16:10:22.990' AS DateTime), 2, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'3634982f-4e66-465f-9c30-25780bab18ce', N'4', N'4QrcOUm6Wau+VuBX8g+IPg==', N'tianshen', 1, 1, 1, CAST(N'2015-12-09 10:46:38.407' AS DateTime), 1, 2, N'', N'18825142741')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'9b0fc52c-fab6-4876-b158-269cd3268152', N'lixiaoyao', N'JdVa0oOqQAr0ZMdtcTwHrQ==', N'', 1, 1, 1, CAST(N'2015-11-24 14:08:19.453' AS DateTime), 1, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'088d4f29-090d-4da2-9be6-26e3dff9512e', N'ererere', N'4QrcOUm6Wau+VuBX8g+IPg==', N'ererere', 1, 1, 1, CAST(N'2015-12-18 11:32:37.997' AS DateTime), 2, 2, N'', N'13516789415')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'2638bccd-bdb4-457d-aa81-28f3e28c4b89', N'tiantian', N'4QrcOUm6Wau+VuBX8g+IPg==', N'', 1, 0, 2, CAST(N'2015-09-28 19:21:23.500' AS DateTime), 1, 1, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'157edba2-a92c-451b-9cb9-2ebe1d19073c', N'GJJS1', N'4QrcOUm6Wau+VuBX8g+IPg==', N'高级讲师', 1, 1, 1, CAST(N'2015-09-01 16:09:41.823' AS DateTime), 2, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'c9488f77-cbe1-47e0-a813-303e380686d1', N'67565', N'4QrcOUm6Wau+VuBX8g+IPg==', N'67565', 1, 1, 1, CAST(N'2015-12-17 11:08:06.580' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'68b7d30d-c0f4-4d79-ab53-3638093feab3', N'meiyou', N'4QrcOUm6Wau+VuBX8g+IPg==', N'没有', 1, 1, 2, CAST(N'2015-12-25 15:27:54.443' AS DateTime), 2, 1, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'04f485d6-7d79-46e0-8b72-391f7abaddec', N'', N'4QrcOUm6Wau+VuBX8g+IPg==', N'学员10', 1, 1, 1, CAST(N'2015-11-30 11:54:46.480' AS DateTime), 1, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'6b0f3371-c644-488c-8772-3ad8e1a2f054', N'tianshan', N'4QrcOUm6Wau+VuBX8g+IPg==', N'', 1, 1, 2, CAST(N'2015-10-27 11:27:00.480' AS DateTime), 1, 1, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'dd983b8e-fa16-4b6f-a461-406a1fc4691a', N'luwushuang', N'4QrcOUm6Wau+VuBX8g+IPg==', N'', 1, 1, 1, CAST(N'2015-11-25 17:06:30.363' AS DateTime), 1, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'a1b9d502-a807-46f8-96bb-417e02f4ac5a', N'tianwang', N'4QrcOUm6Wau+VuBX8g+IPg==', N'', 1, 1, 1, CAST(N'2015-11-24 16:24:43.323' AS DateTime), 1, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'a17377e3-1b99-4482-a3c8-4802fd197ed4', N'haohao', N'4QrcOUm6Wau+VuBX8g+IPg==', N'好好', 1, 1, 1, CAST(N'2015-12-25 15:47:51.157' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'fd9c386d-6a41-4921-97de-4847d782f6e6', N'111', N'4QrcOUm6Wau+VuBX8g+IPg==', N'111', 1, 1, 1, CAST(N'2015-12-18 11:33:47.573' AS DateTime), 2, 2, N'', N'18825142698')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'47119ccd-d747-4671-9910-536ae1e76808', N'guanli1', N'4QrcOUm6Wau+VuBX8g+IPg==', N'管理员1号', 1, 1, 2, CAST(N'2015-09-09 15:07:09.067' AS DateTime), 2, 1, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'd276a249-ade3-46d6-8995-537bd5307ab7', N'666', N'4QrcOUm6Wau+VuBX8g+IPg==', N'666', 1, 1, 1, CAST(N'2016-01-04 11:47:52.730' AS DateTime), 2, 2, N'123@qq.com', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'c62ec6ea-2aa4-4fe9-99b0-53fd3eabdb3e', N'wo2', N'4QrcOUm6Wau+VuBX8g+IPg==', N'我2', 1, 1, 1, CAST(N'2015-11-27 14:23:27.337' AS DateTime), 2, 1, N'123454656@qq.com', N'18825142677')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'44871f13-a3e7-4bbf-8ee3-5c7fe48a2c70', N'huaqian', N'4QrcOUm6Wau+VuBX8g+IPg==', N'', 1, 1, 2, CAST(N'2015-10-08 16:36:42.647' AS DateTime), 1, 1, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'da249e30-5975-449a-b5da-5ce6e254d0b0', N'JWZ', N'4QrcOUm6Wau+VuBX8g+IPg==', N'教务组', 1, 1, 1, CAST(N'2015-09-01 16:10:40.307' AS DateTime), 2, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'1cc41603-2f4e-4e91-8bbc-5e9bee782ebe', N'tytyty44', N'4QrcOUm6Wau+VuBX8g+IPg==', N'tytyty', 1, 1, 1, CAST(N'2015-12-18 11:20:19.803' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'b0ce927e-38e7-4c8b-b333-5eb1317b64ae', N'rr', N'4QrcOUm6Wau+VuBX8g+IPg==', N'rr', 1, 1, 1, CAST(N'2015-11-10 17:52:25.267' AS DateTime), 2, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'd6291b18-2309-4289-8e62-6c9995ab5f04', N'11', N'4QrcOUm6Wau+VuBX8g+IPg==', N'龙头大哥', 1, 1, 1, CAST(N'2015-12-08 11:08:34.713' AS DateTime), 1, 2, N'', N'13808841642')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'f0c9c33a-c8ca-4550-9d86-6eb78affdb67', N'8825', N'4QrcOUm6Wau+VuBX8g+IPg==', N'8825', 1, 1, 1, CAST(N'2015-12-18 11:45:11.640' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'4f250671-757f-4122-b31e-73f7cf928c92', N'ZJ2', N'4QrcOUm6Wau+VuBX8g+IPg==', N'助教2号', 1, 1, 1, CAST(N'2015-09-08 10:15:59.260' AS DateTime), 2, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'23d75d69-7104-4643-9a5f-768d849dfed8', N'abc', N'4QrcOUm6Wau+VuBX8g+IPg==', N'学员2', 1, 1, 2, CAST(N'2015-09-17 10:23:20.357' AS DateTime), 2, 1, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'56707eed-457c-4e6f-bfc3-7c5038db5b1f', N'dd', N'4QrcOUm6Wau+VuBX8g+IPg==', N'等不', 1, 1, 1, CAST(N'2015-11-10 17:05:32.550' AS DateTime), 2, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'd9c34607-bc7e-4867-a39d-7cb19e8f8d85', N'abcde', N'4QrcOUm6Wau+VuBX8g+IPg==', N'学员', 1, 1, 1, CAST(N'2015-09-06 10:08:51.747' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'e60c8b03-6769-40ea-850d-80741dcf5f2b', N'lisi', N'4QrcOUm6Wau+VuBX8g+IPg==', N'李四', 1, 1, 1, CAST(N'2015-12-25 15:22:58.290' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'734f2dcc-5eaa-4a20-b0ca-80ca62927ea6', N'ZJ3', N'4QrcOUm6Wau+VuBX8g+IPg==', N'助教3号', 1, 1, 1, CAST(N'2015-09-08 10:17:20.170' AS DateTime), 2, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'2ae8c7c9-5405-4aa8-8b5f-81fbff159dc7', N'xueyuan1000', N'4QrcOUm6Wau+VuBX8g+IPg==', N'学员1000', 1, 1, 1, CAST(N'2015-12-25 11:53:35.223' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'd5f1341c-e31f-4472-a789-88512d0dca21', N'jiangxin', N'4QrcOUm6Wau+VuBX8g+IPg==', N'', 1, 1, 1, CAST(N'2015-11-24 16:07:30.300' AS DateTime), 1, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'b1a7e950-2954-4e4f-b532-8d597a510596', N'GJJS2', N'4QrcOUm6Wau+VuBX8g+IPg==', N'高级讲师2号', 1, 1, 1, CAST(N'2015-09-07 15:25:13.287' AS DateTime), 2, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'08868dbc-4bd1-41e1-9512-90be58e056ad', N'测试账号1', N'4QrcOUm6Wau+VuBX8g+IPg==', N'测试昵称1', 1, 1, 1, CAST(N'2015-12-17 10:48:33.200' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'4911f252-d3db-4bf7-b5ce-97ccdb046aed', N'xueyuan2', N'4QrcOUm6Wau+VuBX8g+IPg==', N'学员2号', 1, 1, 2, CAST(N'2015-09-09 15:13:10.753' AS DateTime), 2, 1, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'b50684e2-405a-4322-b0f3-9d3bf0fc304b', N'linyueru', N'4QrcOUm6Wau+VuBX8g+IPg==', N'林岳入', 1, 1, 1, CAST(N'2015-11-20 11:48:52.540' AS DateTime), 1, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'b465fb2e-1894-465e-86d3-a185b54d0053', N'ttty', N'4QrcOUm6Wau+VuBX8g+IPg==', N'ttty', 1, 1, 1, CAST(N'2015-12-17 10:18:53.160' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'bbb1391d-ce4d-4383-9ab9-a2ab598ef097', N'longtou1001', N'4QrcOUm6Wau+VuBX8g+IPg==', N'龙头12', 1, 1, 1, CAST(N'2015-12-16 09:39:15.210' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'e47354f3-3cb3-4311-987d-a4cffae960c0', N'xueyuan100', N'JdVa0oOqQAr0ZMdtcTwHrQ==', N'我101', 1, 1, 1, CAST(N'2015-12-01 09:19:08.280' AS DateTime), 1, 2, N'a1015631103@sina.com', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'c17abcb8-7e26-421d-bf28-a53cd92d933a', N'GJJS5', N'4QrcOUm6Wau+VuBX8g+IPg==', N'高级讲师5号', 1, 1, 2, CAST(N'2015-10-09 19:20:11.153' AS DateTime), 2, 1, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'0935aa7e-53aa-44f6-95c7-a54fcd47edb5', N'sdsd', N'4QrcOUm6Wau+VuBX8g+IPg==', N'sdsd', 1, 1, 2, CAST(N'2015-12-17 11:03:46.543' AS DateTime), 2, 1, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'7113cbe5-acae-4a6d-8ae5-a6ed229c362e', N'drz1', N'4QrcOUm6Wau+VuBX8g+IPg==', N'导入者1号', 1, 1, 1, CAST(N'2015-11-11 16:25:25.417' AS DateTime), 2, 2, N'111@qq.com', N'18825142678')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'7b47f9c1-bd95-4370-8a09-a87a297bcb0a', N'GJJS15', N'4QrcOUm6Wau+VuBX8g+IPg==', N'高级讲师15', 1, 1, 2, CAST(N'2015-12-07 14:31:58.193' AS DateTime), 2, 1, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'786e2a7f-b474-4876-bde9-adf7595cb45b', N'ZJJS3', N'4QrcOUm6Wau+VuBX8g+IPg==', N'中级讲师3号', 1, 1, 1, CAST(N'2015-09-08 10:17:05.340' AS DateTime), 2, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'5421358d-d21f-4337-8686-aeceff255f79', N'sdsd', N'4QrcOUm6Wau+VuBX8g+IPg==', N'sdsd', 1, 1, 2, CAST(N'2015-12-17 11:03:33.347' AS DateTime), 2, 1, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'40519a29-72e2-46ec-8665-b30b415dcaf3', N'555', N'4QrcOUm6Wau+VuBX8g+IPg==', N'5555', 1, 1, 1, CAST(N'2016-01-04 11:47:52.090' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'c0434603-9db6-4776-90cd-b79db0b43b9c', N'maxiaoling', N'4QrcOUm6Wau+VuBX8g+IPg==', N'学员1', 1, 1, 2, CAST(N'2015-10-16 17:06:23.317' AS DateTime), 1, 1, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'30125fcb-fa6e-4b95-981f-bb091a96c58a', N'dfd', N'4QrcOUm6Wau+VuBX8g+IPg==', N'dfd', 1, 1, 2, CAST(N'2015-12-17 10:54:22.373' AS DateTime), 2, 1, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'0e8eb5cf-5be1-4779-b7e0-bd0e5cf4c332', N'testtest', N'4QrcOUm6Wau+VuBX8g+IPg==', N'测试测试', 1, 1, 1, CAST(N'2022-07-01 16:15:34.870' AS DateTime), 1, 1, N'test@qq.com', NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'8a9e0d16-a1a7-494c-80c3-bd61ce911389', N'wewewewe', N'4QrcOUm6Wau+VuBX8g+IPg==', N'wewewewe', 1, 1, 1, CAST(N'2015-12-18 11:22:52.977' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'd0f4fefc-c8d2-4064-857f-bebcb7a0016a', N'dongfang', N'4QrcOUm6Wau+VuBX8g+IPg==', N'', 1, 1, 1, CAST(N'2015-10-08 16:26:55.910' AS DateTime), 1, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'd8bcfd35-264f-45af-bb75-bf6e5aa81751', N'wo1', N'4QrcOUm6Wau+VuBX8g+IPg==', N'我1', 1, 1, 2, CAST(N'2015-11-27 14:22:44.990' AS DateTime), 2, 1, N'13213213@qq.com', N'18825142655')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'c6515f0e-bd7e-4994-bddd-c604cd5be8a0', N'xueyuan10', N'4QrcOUm6Wau+VuBX8g+IPg==', N'', 1, 0, 2, CAST(N'2015-09-30 14:48:37.723' AS DateTime), 1, 1, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'ba140eb4-7fc0-4c27-a03e-cdd795f9f1b7', N'', N'4QrcOUm6Wau+VuBX8g+IPg==', N'rivals', 1, 1, 1, CAST(N'2015-12-16 17:21:40.330' AS DateTime), 1, 2, N'919485590@qq.com', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'bc730f6b-2270-4570-8937-cf4f1dafddc8', N'drz2', N'4QrcOUm6Wau+VuBX8g+IPg==', N'导入者2号', 1, 1, 1, CAST(N'2015-11-11 16:25:43.993' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'3a838271-f9f1-4704-80b0-dc2044164216', N'dfd', N'4QrcOUm6Wau+VuBX8g+IPg==', N'dfd', 1, 1, 2, CAST(N'2015-12-17 10:54:03.850' AS DateTime), 2, 1, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'b9e4152d-55ac-4349-abe9-e4e9d0395f58', N'', N'4QrcOUm6Wau+VuBX8g+IPg==', N'dongdong', 1, 1, 1, CAST(N'2015-12-09 10:19:02.357' AS DateTime), 1, 2, N'', N'13288824859')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'e9962a32-8643-41ee-8c3a-e6fc545729ec', N'444', N'4QrcOUm6Wau+VuBX8g+IPg==', N'555', 1, 1, 1, CAST(N'2016-01-04 11:47:51.450' AS DateTime), 2, 2, N'11@qq.com', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'b07376d7-574a-45fb-8db2-e99516461850', N'sousuo', N'4QrcOUm6Wau+VuBX8g+IPg==', N'搜索', 1, 1, 1, CAST(N'2016-01-04 11:47:44.917' AS DateTime), 2, 2, N'1@qq.com', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'a136ca63-ca54-403f-82a5-ef1c5dd28c01', N'YNWTUU', N'Oz1oW8WoHwkFK554mhpdvg==', N'', 1, 1, 1, CAST(N'2015-11-09 09:30:01.007' AS DateTime), 1, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'49c9a042-eb16-49cb-9b41-f10e00025b36', N'ld', N'4QrcOUm6Wau+VuBX8g+IPg==', N'牛人', 1, 1, 1, CAST(N'2015-12-24 10:17:16.657' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'bc12844d-9fc0-4115-877d-f182017ac767', N'zhaomin', N'4QrcOUm6Wau+VuBX8g+IPg==', N'赵敏', 1, 1, 1, CAST(N'2015-12-25 09:27:56.850' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'd04846a3-9a57-449c-989e-f3a6664f44c0', N'ZJJS', N'4QrcOUm6Wau+VuBX8g+IPg==', N'中级讲师', 1, 1, 1, CAST(N'2015-09-01 16:10:02.617' AS DateTime), 2, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'93d34625-77cc-41f3-9bdc-f52084e2892e', N'测试2', N'4QrcOUm6Wau+VuBX8g+IPg==', N'测试2', 1, 1, 2, CAST(N'2015-12-17 10:50:42.257' AS DateTime), 2, 1, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'299b55ac-bb93-4a83-b114-f67a9fee9e38', N'xueyuan22', N'4QrcOUm6Wau+VuBX8g+IPg==', N'学员2', 1, 1, 2, CAST(N'2015-11-03 16:43:15.440' AS DateTime), 2, 1, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'b9c48d59-668e-47e1-a0ec-f7f14798bd56', N'xy100', N'4QrcOUm6Wau+VuBX8g+IPg==', N'学员100', 1, 1, 1, CAST(N'2015-12-25 16:00:40.003' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'e9067284-c3a2-4c7b-832d-f9c7298b36fb', N'huren', N'4QrcOUm6Wau+VuBX8g+IPg==', N'唬人', 1, 1, 1, CAST(N'2015-12-25 15:26:02.457' AS DateTime), 2, 2, N'1111111111@qq.com', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'54b83f80-3f04-46dc-9b68-fc62a878be00', N'JWZ2', N'4QrcOUm6Wau+VuBX8g+IPg==', N'教务组2号', 1, 1, 1, CAST(N'2015-09-08 09:39:31.497' AS DateTime), 2, 2, NULL, NULL)
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'db6a77b4-d8fa-4c48-93ff-fdacb7f3f402', N'777', N'4QrcOUm6Wau+VuBX8g+IPg==', N'777', 1, 1, 1, CAST(N'2016-01-04 11:47:56.230' AS DateTime), 2, 2, N'', N'')
INSERT [dbo].[sys_User] ([Guid], [LoginName], [Password], [Name], [Type], [Status], [Enabled], [CreateTime], [RegType], [IsDelete], [RegEmail], [RegPhone]) VALUES (N'73be7e89-8b4b-42f4-bcc7-feb265274675', N'wangping', N'4QrcOUm6Wau+VuBX8g+IPg==', N'', 1, 1, 1, CAST(N'2015-11-23 17:22:07.713' AS DateTime), 1, 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_UsersExpand] ON 

INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (1, CAST(N'2015-11-30 11:54:52.983' AS DateTime), CAST(N'2015-11-30 11:54:52.983' AS DateTime), N'1.1.1.1', N'', N'04f485d6-7d79-46e0-8b72-391f7abaddec', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (2, CAST(N'2015-12-01 09:19:08.357' AS DateTime), CAST(N'2015-12-01 09:19:08.357' AS DateTime), N'1.1.1.1', N'', N'e47354f3-3cb3-4311-987d-a4cffae960c0', 2, CAST(N'2015-11-30 00:00:00.000' AS DateTime), 3, 1, N'/Uploads/Person/image/635527923042999890_20151207114639_0313.jpg', NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (3, CAST(N'2015-12-01 09:30:52.833' AS DateTime), CAST(N'2015-12-01 09:30:52.833' AS DateTime), N'1.1.1.1', N'', N'4838f8bf-0356-4c61-bdab-114220b9d090', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (4, NULL, NULL, NULL, NULL, N'a1beac14-5832-463c-9ceb-0b0b1d283968', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (5, CAST(N'2015-12-07 15:03:52.317' AS DateTime), CAST(N'2015-12-07 15:03:52.317' AS DateTime), N'1.1.1.1', N'', N'c55f4074-f8a7-465f-a89f-03a5aedd90d1', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (6, CAST(N'2015-11-27 14:23:27.337' AS DateTime), NULL, NULL, NULL, N'c62ec6ea-2aa4-4fe9-99b0-53fd3eabdb3e', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (7, CAST(N'2015-12-07 16:04:55.140' AS DateTime), CAST(N'2015-12-07 16:04:55.140' AS DateTime), N'1.1.1.1', N'', N'426cedf8-6f2f-45f3-bf55-07852b0cc0bf', 3, NULL, 1, 1, N'', NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (8, CAST(N'2015-12-08 11:08:34.730' AS DateTime), CAST(N'2015-12-08 11:08:34.730' AS DateTime), N'1.1.1.1', N'', N'd6291b18-2309-4289-8e62-6c9995ab5f04', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (9, CAST(N'2015-12-09 10:19:02.403' AS DateTime), CAST(N'2015-12-09 10:19:02.403' AS DateTime), N'1.1.1.1', N'', N'b9e4152d-55ac-4349-abe9-e4e9d0395f58', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (10, CAST(N'2015-12-09 10:28:59.750' AS DateTime), CAST(N'2015-12-09 10:28:59.750' AS DateTime), N'1.1.1.1', N'', N'a887d231-5073-45e0-a44d-1c0e843f7406', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (11, CAST(N'2015-12-09 10:46:38.407' AS DateTime), CAST(N'2015-12-09 10:46:38.407' AS DateTime), N'1.1.1.1', N'', N'3634982f-4e66-465f-9c30-25780bab18ce', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (12, CAST(N'2015-12-16 09:39:15.210' AS DateTime), NULL, NULL, NULL, N'bbb1391d-ce4d-4383-9ab9-a2ab598ef097', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (13, CAST(N'2015-12-16 17:21:40.383' AS DateTime), CAST(N'2015-12-16 17:21:40.383' AS DateTime), N'1.1.1.1', N'', N'ba140eb4-7fc0-4c27-a03e-cdd795f9f1b7', 3, NULL, 1, 1, N'', NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (14, CAST(N'2015-12-17 10:18:53.160' AS DateTime), NULL, NULL, NULL, N'b465fb2e-1894-465e-86d3-a185b54d0053', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (15, CAST(N'2015-12-17 10:48:33.200' AS DateTime), NULL, NULL, NULL, N'08868dbc-4bd1-41e1-9512-90be58e056ad', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (16, CAST(N'2015-12-17 10:50:42.257' AS DateTime), NULL, NULL, NULL, N'93d34625-77cc-41f3-9bdc-f52084e2892e', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (17, CAST(N'2015-12-17 10:50:51.907' AS DateTime), NULL, NULL, NULL, N'b8f35fc0-841e-4629-b44d-072a208d6e60', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (18, CAST(N'2015-12-17 10:54:03.850' AS DateTime), NULL, NULL, NULL, N'3a838271-f9f1-4704-80b0-dc2044164216', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (19, CAST(N'2015-12-17 10:54:22.373' AS DateTime), NULL, NULL, NULL, N'30125fcb-fa6e-4b95-981f-bb091a96c58a', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (20, CAST(N'2015-12-17 11:03:33.347' AS DateTime), NULL, NULL, NULL, N'5421358d-d21f-4337-8686-aeceff255f79', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (21, CAST(N'2015-12-17 11:03:46.543' AS DateTime), NULL, NULL, NULL, N'0935aa7e-53aa-44f6-95c7-a54fcd47edb5', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (22, CAST(N'2015-12-17 11:08:06.580' AS DateTime), NULL, NULL, NULL, N'c9488f77-cbe1-47e0-a813-303e380686d1', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (23, CAST(N'2015-12-18 11:20:19.803' AS DateTime), NULL, NULL, NULL, N'1cc41603-2f4e-4e91-8bbc-5e9bee782ebe', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (24, CAST(N'2015-12-18 11:22:52.977' AS DateTime), NULL, NULL, NULL, N'8a9e0d16-a1a7-494c-80c3-bd61ce911389', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (25, CAST(N'2015-12-18 11:25:14.480' AS DateTime), NULL, NULL, NULL, N'3069abc2-0eba-4e9f-9dd1-1131568d179c', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (26, CAST(N'2015-12-18 11:32:37.997' AS DateTime), NULL, NULL, NULL, N'088d4f29-090d-4da2-9be6-26e3dff9512e', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (27, CAST(N'2015-12-18 11:33:47.573' AS DateTime), NULL, NULL, NULL, N'fd9c386d-6a41-4921-97de-4847d782f6e6', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (28, CAST(N'2015-12-18 11:45:11.640' AS DateTime), NULL, NULL, NULL, N'f0c9c33a-c8ca-4550-9d86-6eb78affdb67', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (29, CAST(N'2015-12-21 14:31:52.147' AS DateTime), NULL, NULL, NULL, N'778eae30-6c51-4cd3-977d-00e84fc11bbe', 1, CAST(N'2015-12-31 00:00:00.000' AS DateTime), 2, 1, N'/Uploads/Person/image/3_20151221154154_3895.jpg', NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (30, CAST(N'2015-12-24 10:17:16.657' AS DateTime), NULL, NULL, NULL, N'49c9a042-eb16-49cb-9b41-f10e00025b36', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (31, CAST(N'2015-12-25 09:27:56.850' AS DateTime), NULL, NULL, NULL, N'bc12844d-9fc0-4115-877d-f182017ac767', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (32, CAST(N'2015-12-25 11:53:35.223' AS DateTime), NULL, NULL, NULL, N'2ae8c7c9-5405-4aa8-8b5f-81fbff159dc7', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (33, CAST(N'2015-12-25 14:24:18.650' AS DateTime), NULL, NULL, NULL, N'44ad38ec-ab93-4c12-96cc-0d58130b2ba4', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (34, CAST(N'2015-12-25 15:22:58.290' AS DateTime), NULL, NULL, NULL, N'e60c8b03-6769-40ea-850d-80741dcf5f2b', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (35, CAST(N'2015-12-25 15:26:02.457' AS DateTime), NULL, NULL, NULL, N'e9067284-c3a2-4c7b-832d-f9c7298b36fb', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (36, CAST(N'2015-12-25 15:27:54.443' AS DateTime), NULL, NULL, NULL, N'68b7d30d-c0f4-4d79-ab53-3638093feab3', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (37, CAST(N'2015-12-25 15:47:51.157' AS DateTime), NULL, NULL, NULL, N'a17377e3-1b99-4482-a3c8-4802fd197ed4', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (38, CAST(N'2015-12-25 16:00:40.003' AS DateTime), NULL, NULL, NULL, N'b9c48d59-668e-47e1-a0ec-f7f14798bd56', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (45, CAST(N'2016-01-04 11:47:46.340' AS DateTime), NULL, NULL, NULL, N'b07376d7-574a-45fb-8db2-e99516461850', 3, NULL, 1, 2, NULL, 0)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (46, CAST(N'2016-01-04 11:47:50.370' AS DateTime), NULL, NULL, NULL, N'14c38b7c-d6a5-4c6c-bd55-1ef99cf9715b', 3, NULL, 1, 2, NULL, 0)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (47, CAST(N'2016-01-04 11:47:51.010' AS DateTime), NULL, NULL, NULL, N'33765532-c865-4152-9cf4-07cd60544b62', 3, NULL, 1, 2, NULL, 0)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (48, CAST(N'2016-01-04 11:47:51.653' AS DateTime), NULL, NULL, NULL, N'e9962a32-8643-41ee-8c3a-e6fc545729ec', 3, NULL, 1, 2, NULL, 0)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (49, CAST(N'2016-01-04 11:47:52.293' AS DateTime), NULL, NULL, NULL, N'40519a29-72e2-46ec-8665-b30b415dcaf3', 3, NULL, 1, 2, NULL, 0)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (50, CAST(N'2016-01-04 11:47:52.933' AS DateTime), NULL, NULL, NULL, N'd276a249-ade3-46d6-8995-537bd5307ab7', 3, NULL, 1, 2, NULL, 0)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (51, CAST(N'2016-01-04 11:47:56.230' AS DateTime), NULL, NULL, NULL, N'db6a77b4-d8fa-4c48-93ff-fdacb7f3f402', 3, NULL, 1, 2, NULL, 0)
INSERT [dbo].[tb_UsersExpand] ([Id], [CreateDate], [LastDate], [LastIP], [Remark], [SysUserId], [Sex], [BorthDay], [EducationBackground], [Employment], [PersonPhotoPath], [BlueMoney]) VALUES (53, CAST(N'2022-07-01 16:15:35.097' AS DateTime), NULL, NULL, NULL, N'0e8eb5cf-5be1-4779-b7e0-bd0e5cf4c332', 1, CAST(N'1995-09-11 00:00:00.000' AS DateTime), 4, 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_UsersExpand] OFF
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_Role', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_Role', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_Role', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_Role', @level2type=N'COLUMN',@level2name=N'Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_Role', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁用/启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_Role', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户角色表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_RoleInUser', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色表Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_RoleInUser', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户表Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_RoleInUser', @level2type=N'COLUMN',@level2name=N'UserGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_User', @level2type=N'COLUMN',@level2name=N'Guid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_User', @level2type=N'COLUMN',@level2name=N'LoginName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_User', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_User', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型 0代表超级管理员，1代表其他用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_User', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态,默认设置为1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_User', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁用/启用，1代表启用，2代表禁用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_User', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_User', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1代表前台注册，2代表后台添加' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_User', @level2type=N'COLUMN',@level2name=N'RegType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1代表已经删除，2代表没有删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_User', @level2type=N'COLUMN',@level2name=N'IsDelete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_User', @level2type=N'COLUMN',@level2name=N'RegEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册手机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_User', @level2type=N'COLUMN',@level2name=N'RegPhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersExpand', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersExpand', @level2type=N'COLUMN',@level2name=N'LastDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近登录IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersExpand', @level2type=N'COLUMN',@level2name=N'LastIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersExpand', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联后台系统用户表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersExpand', @level2type=N'COLUMN',@level2name=N'SysUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1代表男，2代表女，3代表保密' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersExpand', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersExpand', @level2type=N'COLUMN',@level2name=N'BorthDay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1代表小学2代表初中，3代表高中，4代表大专5代表本科，6代表硕士研究生，7代表博士研究生以上' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersExpand', @level2type=N'COLUMN',@level2name=N'EducationBackground'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1代表学生，2代表在职' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersExpand', @level2type=N'COLUMN',@level2name=N'Employment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户扩展表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersExpand'
GO
USE [master]
GO
ALTER DATABASE [EFWithDapperDb] SET  READ_WRITE 
GO
