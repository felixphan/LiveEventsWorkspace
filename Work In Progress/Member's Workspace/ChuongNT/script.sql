USE [master]
GO
/****** Object:  Database [LiveStreamingSNS]    Script Date: 9/30/2015 4:01:23 PM ******/
CREATE DATABASE [LiveStreamingSNS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LiveStreamingSNS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\LiveStreamingSNS.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LiveStreamingSNS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\LiveStreamingSNS_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LiveStreamingSNS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LiveStreamingSNS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LiveStreamingSNS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LiveStreamingSNS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LiveStreamingSNS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LiveStreamingSNS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LiveStreamingSNS] SET ARITHABORT OFF 
GO
ALTER DATABASE [LiveStreamingSNS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LiveStreamingSNS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [LiveStreamingSNS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LiveStreamingSNS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LiveStreamingSNS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LiveStreamingSNS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LiveStreamingSNS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LiveStreamingSNS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LiveStreamingSNS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LiveStreamingSNS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LiveStreamingSNS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LiveStreamingSNS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LiveStreamingSNS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LiveStreamingSNS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LiveStreamingSNS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LiveStreamingSNS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LiveStreamingSNS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LiveStreamingSNS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LiveStreamingSNS] SET RECOVERY FULL 
GO
ALTER DATABASE [LiveStreamingSNS] SET  MULTI_USER 
GO
ALTER DATABASE [LiveStreamingSNS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LiveStreamingSNS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LiveStreamingSNS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LiveStreamingSNS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LiveStreamingSNS', N'ON'
GO
USE [LiveStreamingSNS]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 9/30/2015 4:01:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nchar](32) NOT NULL,
	[password] [nchar](16) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Appeal]    Script Date: 9/30/2015 4:01:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appeal](
	[AppealID] [bigint] IDENTITY(1,1) NOT NULL,
	[EventID] [bigint] NOT NULL,
	[AppealContent] [nvarchar](max) NOT NULL,
	[AppealStatus] [int] NOT NULL,
	[SendDate] [date] NOT NULL,
	[ResultDate] [date] NULL,
 CONSTRAINT [PK_Appeal] PRIMARY KEY CLUSTERED 
(
	[AppealID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/30/2015 4:01:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryFollow]    Script Date: 9/30/2015 4:01:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryFollow](
	[CategoryFollowID] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryID] [bigint] NOT NULL,
	[FollowerID] [bigint] NOT NULL,
 CONSTRAINT [PK_CategoryFollow] PRIMARY KEY CLUSTERED 
(
	[CategoryFollowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Channel]    Script Date: 9/30/2015 4:01:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Channel](
	[ChannelID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[ChannelName] [nvarchar](512) NOT NULL,
	[ChannelDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_Channel] PRIMARY KEY CLUSTERED 
(
	[ChannelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 9/30/2015 4:01:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [bigint] IDENTITY(1,1) NOT NULL,
	[EventID] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[CommentContent] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event]    Script Date: 9/30/2015 4:01:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventID] [bigint] NOT NULL,
	[ChannelID] [bigint] IDENTITY(1,1) NOT NULL,
	[EventName] [nvarchar](1024) NOT NULL,
	[EventStartDate] [date] NOT NULL,
	[EventEndDate] [date] NOT NULL,
	[EventDescription] [nvarchar](max) NULL,
	[EventRegisterDate] [date] NOT NULL,
	[Views] [bigint] NOT NULL,
	[CategoryID] [bigint] NOT NULL,
	[Privacy] [bit] NOT NULL,
	[AvatarLink] [nvarchar](256) NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventFollow]    Script Date: 9/30/2015 4:01:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventFollow](
	[EventFollowID] [bigint] IDENTITY(1,1) NOT NULL,
	[EventID] [bigint] NOT NULL,
	[FollowerID] [bigint] NOT NULL,
 CONSTRAINT [PK_EventFollow] PRIMARY KEY CLUSTERED 
(
	[EventFollowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventPlace]    Script Date: 9/30/2015 4:01:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventPlace](
	[EventPlaceID] [bigint] IDENTITY(1,1) NOT NULL,
	[EventID] [bigint] NOT NULL,
	[LocationID] [bigint] NOT NULL,
 CONSTRAINT [PK_EventPlace] PRIMARY KEY CLUSTERED 
(
	[EventPlaceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gallery]    Script Date: 9/30/2015 4:01:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gallery](
	[GalleryID] [bigint] IDENTITY(1,1) NOT NULL,
	[EventID] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[ImageLink] [nvarchar](256) NOT NULL,
	[UploadDate] [date] NOT NULL,
 CONSTRAINT [PK_Gallery] PRIMARY KEY CLUSTERED 
(
	[GalleryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LikeDislike]    Script Date: 9/30/2015 4:01:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikeDislike](
	[LikeDislikeID] [bigint] IDENTITY(1,1) NOT NULL,
	[EventID] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[Type] [bit] NOT NULL,
 CONSTRAINT [PK_LikeDislike_1] PRIMARY KEY CLUSTERED 
(
	[LikeDislikeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 9/30/2015 4:01:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [bigint] IDENTITY(1,1) NOT NULL,
	[Longitude] [float] NOT NULL,
	[Lagitude] [float] NOT NULL,
	[LocationName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PeopleFollow]    Script Date: 9/30/2015 4:01:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeopleFollow](
	[PeopleFollowID] [bigint] IDENTITY(1,1) NOT NULL,
	[FollowerUserID] [bigint] NOT NULL,
	[FollowingUserID] [bigint] NOT NULL,
 CONSTRAINT [PK_PeopleFollow] PRIMARY KEY CLUSTERED 
(
	[PeopleFollowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report]    Script Date: 9/30/2015 4:01:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportID] [bigint] IDENTITY(1,1) NOT NULL,
	[EventID] [bigint] NOT NULL,
	[SenderID] [bigint] NOT NULL,
	[ReportType] [nvarchar](128) NOT NULL,
	[ReportContent] [nvarchar](max) NULL,
	[ReportStatus] [int] NOT NULL,
	[ReportDate] [date] NOT NULL,
	[ResultDate] [date] NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Share]    Script Date: 9/30/2015 4:01:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Share](
	[ShareID] [bigint] IDENTITY(1,1) NOT NULL,
	[EventID] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
 CONSTRAINT [PK_Share] PRIMARY KEY CLUSTERED 
(
	[ShareID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 9/30/2015 4:01:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserAccountName] [nvarchar](32) NOT NULL,
	[UserPassword] [nchar](16) NOT NULL,
	[UserFirstName] [nvarchar](32) NOT NULL,
	[UserLastName] [nvarchar](32) NOT NULL,
	[UserEmail] [nvarchar](64) NOT NULL,
	[UserDOB] [date] NOT NULL,
	[IDCard] [nvarchar](16) NOT NULL,
	[UserRoles] [int] NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[Place] [nvarchar](max) NULL,
	[AccountStatus] [bit] NOT NULL,
	[Gender] [int] NOT NULL,
	[AvatarLink] [nvarchar](512) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Video]    Script Date: 9/30/2015 4:01:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[VideoID] [bigint] IDENTITY(1,1) NOT NULL,
	[EventID] [bigint] NOT NULL,
	[VideoLink] [nvarchar](256) NOT NULL,
	[LocationID] [bigint] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NULL,
	[Privacy] [bit] NOT NULL,
 CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED 
(
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Appeal]  WITH CHECK ADD  CONSTRAINT [FK_Appeal_Event1] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[Appeal] CHECK CONSTRAINT [FK_Appeal_Event1]
GO
ALTER TABLE [dbo].[CategoryFollow]  WITH CHECK ADD  CONSTRAINT [FK_CategoryFollow_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[CategoryFollow] CHECK CONSTRAINT [FK_CategoryFollow_Category]
GO
ALTER TABLE [dbo].[CategoryFollow]  WITH CHECK ADD  CONSTRAINT [FK_CategoryFollow_User] FOREIGN KEY([FollowerID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[CategoryFollow] CHECK CONSTRAINT [FK_CategoryFollow_User]
GO
ALTER TABLE [dbo].[Channel]  WITH CHECK ADD  CONSTRAINT [FK_Channel_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Channel] CHECK CONSTRAINT [FK_Channel_User]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Event1] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Event1]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Category]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Channel1] FOREIGN KEY([ChannelID])
REFERENCES [dbo].[Channel] ([ChannelID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Channel1]
GO
ALTER TABLE [dbo].[EventFollow]  WITH CHECK ADD  CONSTRAINT [FK_EventFollow_Event1] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[EventFollow] CHECK CONSTRAINT [FK_EventFollow_Event1]
GO
ALTER TABLE [dbo].[EventFollow]  WITH CHECK ADD  CONSTRAINT [FK_EventFollow_User] FOREIGN KEY([FollowerID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[EventFollow] CHECK CONSTRAINT [FK_EventFollow_User]
GO
ALTER TABLE [dbo].[EventPlace]  WITH CHECK ADD  CONSTRAINT [FK_EventPlace_Event1] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[EventPlace] CHECK CONSTRAINT [FK_EventPlace_Event1]
GO
ALTER TABLE [dbo].[EventPlace]  WITH CHECK ADD  CONSTRAINT [FK_EventPlace_Location] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[EventPlace] CHECK CONSTRAINT [FK_EventPlace_Location]
GO
ALTER TABLE [dbo].[Gallery]  WITH CHECK ADD  CONSTRAINT [FK_Gallery_Event1] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[Gallery] CHECK CONSTRAINT [FK_Gallery_Event1]
GO
ALTER TABLE [dbo].[Gallery]  WITH CHECK ADD  CONSTRAINT [FK_Gallery_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Gallery] CHECK CONSTRAINT [FK_Gallery_User]
GO
ALTER TABLE [dbo].[LikeDislike]  WITH CHECK ADD  CONSTRAINT [FK_LikeDislike_Event1] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[LikeDislike] CHECK CONSTRAINT [FK_LikeDislike_Event1]
GO
ALTER TABLE [dbo].[LikeDislike]  WITH CHECK ADD  CONSTRAINT [FK_LikeDislike_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[LikeDislike] CHECK CONSTRAINT [FK_LikeDislike_User]
GO
ALTER TABLE [dbo].[PeopleFollow]  WITH CHECK ADD  CONSTRAINT [FK_PeopleFollow_User] FOREIGN KEY([FollowerUserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[PeopleFollow] CHECK CONSTRAINT [FK_PeopleFollow_User]
GO
ALTER TABLE [dbo].[PeopleFollow]  WITH CHECK ADD  CONSTRAINT [FK_PeopleFollow_User3] FOREIGN KEY([FollowingUserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[PeopleFollow] CHECK CONSTRAINT [FK_PeopleFollow_User3]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Event]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_User] FOREIGN KEY([SenderID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_User]
GO
ALTER TABLE [dbo].[Share]  WITH CHECK ADD  CONSTRAINT [FK_Share_Event1] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[Share] CHECK CONSTRAINT [FK_Share_Event1]
GO
ALTER TABLE [dbo].[Share]  WITH CHECK ADD  CONSTRAINT [FK_Share_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Share] CHECK CONSTRAINT [FK_Share_User]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_Event]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_Location] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_Location]
GO
USE [master]
GO
ALTER DATABASE [LiveStreamingSNS] SET  READ_WRITE 
GO
