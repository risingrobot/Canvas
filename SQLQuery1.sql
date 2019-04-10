USE [sd_adCreator]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/4/2019 1:05:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DesignGalleries]    Script Date: 4/4/2019 1:05:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DesignGalleries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[CategoryId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_DesignGalleries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Designs]    Script Date: 4/4/2019 1:05:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Html] [nvarchar](max) NULL,
	[CategoryId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[ImageUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Designs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 4/4/2019 1:05:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[EmailAddress] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[ProfessionId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[FK_Role] [bigint] NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Professions]    Script Date: 4/4/2019 1:05:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Professions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/4/2019 1:05:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](max) NULL,
	[EnableFlag] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscribes]    Script Date: 4/4/2019 1:05:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscribes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Subscribes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 4/4/2019 1:05:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [nvarchar](128) NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
 CONSTRAINT [PK_sysdiagrams] PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDesigns]    Script Date: 4/4/2019 1:05:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDesigns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Heading] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[PersonId] [int] NULL,
	[DesignId] [int] NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_UserDesigns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (1, N'Cards', CAST(N'2018-05-19T14:42:10.807' AS DateTime), CAST(N'2018-05-19T14:42:10.807' AS DateTime), 0)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (2, N'Banners', CAST(N'2018-05-19T14:42:10.807' AS DateTime), CAST(N'2018-05-19T14:42:10.807' AS DateTime), 0)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (3, N'Book Covers', CAST(N'2018-05-19T14:42:10.810' AS DateTime), CAST(N'2018-05-19T14:42:10.810' AS DateTime), 0)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (4, N'Posters', CAST(N'2018-05-19T14:42:10.810' AS DateTime), CAST(N'2018-05-19T14:42:10.810' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Designs] ON 

INSERT [dbo].[Designs] ([Id], [Html], [CategoryId], [CreatedOn], [UpdatedOn], [IsDeleted], [ImageUrl]) VALUES (1, N'<div class="card1">
            <div class="heading">
              <h1 id="title"></h1>
            </div>
            <div class="body">
              <p id="description"></p>
            </div>
          </div>', 1, CAST(N'2018-05-22T16:20:10.810' AS DateTime), CAST(N'2018-05-22T16:20:10.810' AS DateTime), 0, N'/screenshots/card1.PNG')
INSERT [dbo].[Designs] ([Id], [Html], [CategoryId], [CreatedOn], [UpdatedOn], [IsDeleted], [ImageUrl]) VALUES (2, N'<div class="card2">
            <div class="main-panel">
              <h1 id="title"></h1>
              <p id="description"></p>
            </div>
          </div>', 1, CAST(N'2018-05-22T16:21:17.480' AS DateTime), CAST(N'2018-05-22T16:21:17.480' AS DateTime), 0, N'/screenshots/card2.PNG')
INSERT [dbo].[Designs] ([Id], [Html], [CategoryId], [CreatedOn], [UpdatedOn], [IsDeleted], [ImageUrl]) VALUES (3, N'<div class="poster1">
            <div class="main-panel">
              <h1 id="description"></h1>
            </div>
          </div>', 4, CAST(N'2018-05-22T16:22:26.647' AS DateTime), CAST(N'2018-05-22T16:22:26.647' AS DateTime), 0, N'/screenshots/poster1.PNG')
INSERT [dbo].[Designs] ([Id], [Html], [CategoryId], [CreatedOn], [UpdatedOn], [IsDeleted], [ImageUrl]) VALUES (4, N'<div class="poster2">
            <div class="main-panel">
              <h1 id="description"></h1>
            </div>
          </div>', 4, CAST(N'2018-05-22T16:23:01.537' AS DateTime), CAST(N'2018-05-22T16:23:01.537' AS DateTime), 0, N'/screenshots/poster2.PNG')
INSERT [dbo].[Designs] ([Id], [Html], [CategoryId], [CreatedOn], [UpdatedOn], [IsDeleted], [ImageUrl]) VALUES (5, N'<div class="book-cover1">
            <div class="main-panel">
              <h1 id="title"></h1>
              <p id="description"></p>
            </div>
          </div>', 3, CAST(N'2018-05-22T16:24:00.837' AS DateTime), CAST(N'2018-05-22T16:24:00.837' AS DateTime), 0, N'/screenshots/bookCover1.PNG')
INSERT [dbo].[Designs] ([Id], [Html], [CategoryId], [CreatedOn], [UpdatedOn], [IsDeleted], [ImageUrl]) VALUES (6, N'<div class="book-cover2">
            <div class="main-panel">
              <h1 id="title"></h1>
              <p id="description"></p>
            </div>
          </div>', 3, CAST(N'2018-05-22T16:24:39.773' AS DateTime), CAST(N'2018-05-22T16:24:39.773' AS DateTime), 0, N'/screenshots/bookCover2.PNG')
INSERT [dbo].[Designs] ([Id], [Html], [CategoryId], [CreatedOn], [UpdatedOn], [IsDeleted], [ImageUrl]) VALUES (7, N'<div class="banner1">
            <div class="main-panel">
              <h1 id="description">@Model.description</h1>
            </div>
          </div>', 2, CAST(N'2018-05-22T16:26:01.540' AS DateTime), CAST(N'2018-05-22T16:26:01.540' AS DateTime), 0, N'/screenshots/banner1.PNG')
INSERT [dbo].[Designs] ([Id], [Html], [CategoryId], [CreatedOn], [UpdatedOn], [IsDeleted], [ImageUrl]) VALUES (8, N'<div class="banner2">
            <div class="main-panel">
              <h1 id="description"></h1>
            </div>
          </div>', 2, CAST(N'2018-05-22T16:26:25.623' AS DateTime), CAST(N'2018-05-22T16:26:25.623' AS DateTime), 0, N'/screenshots/banner2.PNG')
SET IDENTITY_INSERT [dbo].[Designs] OFF
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([Id], [FullName], [EmailAddress], [Password], [ImageUrl], [ProfessionId], [CreatedOn], [UpdatedOn], [IsDeleted], [FK_Role]) VALUES (1, N'Hassam Sherazi', N'hassamsherazi05@gmail.com', N'abc123', NULL, 1, CAST(N'2018-05-03T09:11:23.177' AS DateTime), CAST(N'2018-05-03T09:11:23.180' AS DateTime), 0, NULL)
INSERT [dbo].[People] ([Id], [FullName], [EmailAddress], [Password], [ImageUrl], [ProfessionId], [CreatedOn], [UpdatedOn], [IsDeleted], [FK_Role]) VALUES (2, N'Insha', N'insha@gmail.com', N'abc123', NULL, 2, CAST(N'2018-05-04T19:51:32.487' AS DateTime), CAST(N'2018-05-04T19:51:32.487' AS DateTime), 0, NULL)
INSERT [dbo].[People] ([Id], [FullName], [EmailAddress], [Password], [ImageUrl], [ProfessionId], [CreatedOn], [UpdatedOn], [IsDeleted], [FK_Role]) VALUES (3, N'Admin', N'admin@adcreator.com', N'12345', NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[People] OFF
SET IDENTITY_INSERT [dbo].[Professions] ON 

INSERT [dbo].[Professions] ([Id], [Name], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (1, N'Software Engineer', CAST(N'2018-05-02T20:10:39.487' AS DateTime), CAST(N'2018-05-02T20:10:39.487' AS DateTime), 0)
INSERT [dbo].[Professions] ([Id], [Name], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (2, N'Electrical Engineer', CAST(N'2018-05-02T20:11:05.587' AS DateTime), CAST(N'2018-05-02T20:11:05.587' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Professions] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [RoleName], [EnableFlag], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'ADMIN', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Roles] ([Id], [RoleName], [EnableFlag], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'USER', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[UserDesigns] ON 

INSERT [dbo].[UserDesigns] ([Id], [Heading], [Description], [PersonId], [DesignId], [ImageUrl], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (1, N'Marriage Ceremony', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et justo metus. Nulla eleifend ex vitae dui iaculis cursus. Duis in auctor turpis, cursus viverra odio. Cras tempus diam arcu.', 1, 2, NULL, CAST(N'2018-05-29T17:09:10.747' AS DateTime), CAST(N'2018-05-29T17:09:20.280' AS DateTime), 0)
INSERT [dbo].[UserDesigns] ([Id], [Heading], [Description], [PersonId], [DesignId], [ImageUrl], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (2, N'Marriage Ceremony', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et justo metus. Nulla eleifend ex vitae dui iaculis cursus. Duis in auctor turpis, cursus viverra odio. Cras tempus diam arcu.', 1, 2, NULL, CAST(N'2018-05-29T17:24:18.707' AS DateTime), CAST(N'2018-05-29T17:24:18.707' AS DateTime), 0)
INSERT [dbo].[UserDesigns] ([Id], [Heading], [Description], [PersonId], [DesignId], [ImageUrl], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (3, N'Holy Quran', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et justo metus. Nulla eleifend ex vitae dui iaculis cursus.', 1, 5, NULL, CAST(N'2018-05-29T17:49:07.823' AS DateTime), CAST(N'2018-05-29T17:49:08.480' AS DateTime), 0)
INSERT [dbo].[UserDesigns] ([Id], [Heading], [Description], [PersonId], [DesignId], [ImageUrl], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (4, N'Shinning Stars', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et justo metus. Nulla eleifend ex vitae dui iaculis cursus.', 1, 5, NULL, CAST(N'2018-05-29T18:01:09.593' AS DateTime), CAST(N'2018-05-29T18:01:09.593' AS DateTime), 0)
INSERT [dbo].[UserDesigns] ([Id], [Heading], [Description], [PersonId], [DesignId], [ImageUrl], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (5, NULL, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et justo metus. Nulla eleifend ex vitae dui iaculis cursus. Duis in auctor turpis, cursus viverra odio', 1, 3, NULL, CAST(N'2018-05-29T18:06:43.147' AS DateTime), CAST(N'2018-05-29T18:06:43.147' AS DateTime), 0)
INSERT [dbo].[UserDesigns] ([Id], [Heading], [Description], [PersonId], [DesignId], [ImageUrl], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (6, N'Holy Quran', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et justo metus. Nulla eleifend ex vitae dui iaculis cursus. Duis in auctor turpis, cursus viverra odio', 1, 5, NULL, CAST(N'2018-05-29T18:10:55.137' AS DateTime), CAST(N'2018-05-29T18:10:55.137' AS DateTime), 0)
INSERT [dbo].[UserDesigns] ([Id], [Heading], [Description], [PersonId], [DesignId], [ImageUrl], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (7, N'Dearest Cousin', N'Etiam id mollis nisl, eu condimentum orci. Nulla eu diam porta, commodo enim nec, dictum sapien. Suspendisse et eleifend justo. Aenean tristique sapien dignissim consequat imperdiet. Aliquam tempor est vel ultrices dignissim. Suspendisse orci libero, ultricies sed rutrum a, feugiat sit amet nibh. Nunc nec pharetra felis, sit amet gravida turpis. Sed non turpis arcu.

', 1, 2, NULL, CAST(N'2018-05-30T15:25:08.547' AS DateTime), CAST(N'2018-05-30T15:25:08.547' AS DateTime), 0)
INSERT [dbo].[UserDesigns] ([Id], [Heading], [Description], [PersonId], [DesignId], [ImageUrl], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (8, N'Dearest Cousin', N'Aliquam id hendrerit lorem, at mattis libero. Curabitur porta, quam quis vulputate aliquam, dui nulla semper augue, at fringilla nunc felis aliquet quam.
', 1, 2, NULL, CAST(N'2018-05-30T15:26:23.427' AS DateTime), CAST(N'2018-05-30T15:26:23.427' AS DateTime), 0)
INSERT [dbo].[UserDesigns] ([Id], [Heading], [Description], [PersonId], [DesignId], [ImageUrl], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (9, N'Hello World ', N'This is test
', 1, 2, NULL, CAST(N'2018-05-30T15:26:49.757' AS DateTime), CAST(N'2018-05-30T15:26:49.757' AS DateTime), 0)
INSERT [dbo].[UserDesigns] ([Id], [Heading], [Description], [PersonId], [DesignId], [ImageUrl], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (11, N'test', N' test', 1, 1, NULL, CAST(N'2018-05-30T15:34:10.137' AS DateTime), CAST(N'2018-05-30T15:34:10.137' AS DateTime), 0)
INSERT [dbo].[UserDesigns] ([Id], [Heading], [Description], [PersonId], [DesignId], [ImageUrl], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (13, N'test ', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis fermentum dignissim magna non tempor. Proin pretium rhoncus urna sed ornare. Etiam id mollis nisl, eu condimentum orci. Nulla eu diam porta, commodo enim nec, dictum sapien. Suspendisse et eleifend justo. Aenean tristique sapien dignissim consequat imperdiet. ', 1, 1, NULL, CAST(N'2018-05-30T16:05:36.487' AS DateTime), CAST(N'2018-05-30T16:05:36.487' AS DateTime), 0)
INSERT [dbo].[UserDesigns] ([Id], [Heading], [Description], [PersonId], [DesignId], [ImageUrl], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (14, NULL, N'Aliquam id hendrerit lorem, at mattis libero. Curabitur porta, quam quis vulputate aliquam, dui nulla semper augue, at fringilla nunc felis aliquet quam. Vivamus laoreet sed diam ut sagittis. Nulla semper eros orci, id facilisis mi porttitor non. Nullam blandit lobortis dignissim. Fusce finibus dui cursus, molestie ligula et, volutpat libero. Curabitur sit amet metus luctus, lobortis arcu id, accumsan dui. Vivamus at tincidunt tellus. Duis feugiat mattis ante, eu venenatis dui viverra id. Nam ac turpis est. Duis efficitur, diam et pretium finibus, quam eros convallis diam, sed aliquet mauris risus vitae risus. Donec egestas nibh nec velit tincidunt gravida. Proin lacus metus, finibus ut urna sed, lacinia placerat elit.', 1, 4, NULL, CAST(N'2018-05-30T16:48:05.923' AS DateTime), CAST(N'2018-05-30T16:48:05.923' AS DateTime), 0)
INSERT [dbo].[UserDesigns] ([Id], [Heading], [Description], [PersonId], [DesignId], [ImageUrl], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (15, N'Happy Valentines Day', N'Aliquam id hendrerit lorem, at mattis libero. Curabitur porta, quam quis vulputate aliquam, dui nulla semper augue, at fringilla nunc felis aliquet quam. Vivamus laoreet sed diam ut sagittis. Nulla semper eros orci, id facilisis mi porttitor non. Nullam blandit lobortis dignissim. Fusce finibus dui cursus, molestie ligula et, volutpat libero. Curabitur sit amet metus luctus, lobortis arcu id, accumsan dui. Vivamus at tincidunt tellus.', 2, 1, NULL, CAST(N'2018-05-30T16:58:32.440' AS DateTime), CAST(N'2018-05-30T16:58:32.440' AS DateTime), 0)
INSERT [dbo].[UserDesigns] ([Id], [Heading], [Description], [PersonId], [DesignId], [ImageUrl], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (16, NULL, N'Donec gravida vitae justo sit amet aliquet. Nulla nec tristique ante. Curabitur nec pharetra nunc. Vivamus aliquet maximus enim, in sagittis diam. Ut sit amet venenatis nisi, sed mattis enim. Integer euismod vulputate massa, vel volutpat nunc commodo eu. Curabitur a tortor vel nibh luctus mattis vitae sit amet ipsum. Praesent hendrerit orci quis auctor fringilla. Curabitur sit amet elit sed odio lacinia ullamcorper euismod sed lorem. Morbi id feugiat magna.', 2, 7, NULL, CAST(N'2018-05-30T16:58:57.510' AS DateTime), CAST(N'2018-05-30T16:58:57.510' AS DateTime), 0)
INSERT [dbo].[UserDesigns] ([Id], [Heading], [Description], [PersonId], [DesignId], [ImageUrl], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (17, N'Holy Quran', N'Donec gravida vitae justo sit amet aliquet. Nulla nec tristique ante. Curabitur nec pharetra nunc. Vivamus aliquet maximus enim, in sagittis diam. Ut sit amet venenatis nisi, sed mattis enim. Integer euismod vulputate massa, vel volutpat nunc commodo eu. Curabitur a tortor vel nibh luctus mattis vitae sit amet ipsum. Praesent hendrerit orci quis auctor fringilla. Curabitur sit amet elit sed odio lacinia ullamcorper euismod sed lorem. Morbi id feugiat magna.', 2, 6, NULL, CAST(N'2018-05-30T16:59:26.047' AS DateTime), CAST(N'2018-05-30T16:59:26.047' AS DateTime), 0)
INSERT [dbo].[UserDesigns] ([Id], [Heading], [Description], [PersonId], [DesignId], [ImageUrl], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (18, NULL, N'Ut sit amet venenatis nisi, sed mattis enim. Integer euismod vulputate massa, vel volutpat nunc commodo eu. Curabitur a tortor vel nibh luctus mattis vitae sit amet ipsum. Praesent hendrerit orci quis auctor fringilla. Curabitur sit amet elit sed odio lacinia ullamcorper euismod sed lorem. Morbi id feugiat magna.', 2, 4, NULL, CAST(N'2018-05-30T16:59:45.160' AS DateTime), CAST(N'2018-05-30T16:59:45.160' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[UserDesigns] OFF
ALTER TABLE [dbo].[DesignGalleries]  WITH CHECK ADD  CONSTRAINT [FK_DesignGalleries_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[DesignGalleries] CHECK CONSTRAINT [FK_DesignGalleries_Categories]
GO
ALTER TABLE [dbo].[Designs]  WITH CHECK ADD  CONSTRAINT [FK_Designs_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Designs] CHECK CONSTRAINT [FK_Designs_Categories]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Professions] FOREIGN KEY([ProfessionId])
REFERENCES [dbo].[Professions] ([Id])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Professions]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Roles] FOREIGN KEY([FK_Role])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Roles]
GO
ALTER TABLE [dbo].[UserDesigns]  WITH CHECK ADD  CONSTRAINT [FK_UserDesigns_Designs] FOREIGN KEY([DesignId])
REFERENCES [dbo].[Designs] ([Id])
GO
ALTER TABLE [dbo].[UserDesigns] CHECK CONSTRAINT [FK_UserDesigns_Designs]
GO
ALTER TABLE [dbo].[UserDesigns]  WITH CHECK ADD  CONSTRAINT [FK_UserDesigns_People] FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[UserDesigns] CHECK CONSTRAINT [FK_UserDesigns_People]
GO
