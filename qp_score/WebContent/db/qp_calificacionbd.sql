USE [master]
GO
/****** Object:  Database [qp_calificacionbd]    Script Date: 03/01/2020 17:01:15 ******/
CREATE DATABASE [qp_calificacionbd]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'qp_calificacionbd', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\qp_calificacionbd.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'qp_calificacionbd_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\qp_calificacionbd_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [qp_calificacionbd] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [qp_calificacionbd].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [qp_calificacionbd] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [qp_calificacionbd] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [qp_calificacionbd] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [qp_calificacionbd] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [qp_calificacionbd] SET ARITHABORT OFF 
GO
ALTER DATABASE [qp_calificacionbd] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [qp_calificacionbd] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [qp_calificacionbd] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [qp_calificacionbd] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [qp_calificacionbd] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [qp_calificacionbd] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [qp_calificacionbd] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [qp_calificacionbd] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [qp_calificacionbd] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [qp_calificacionbd] SET  ENABLE_BROKER 
GO
ALTER DATABASE [qp_calificacionbd] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [qp_calificacionbd] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [qp_calificacionbd] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [qp_calificacionbd] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [qp_calificacionbd] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [qp_calificacionbd] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [qp_calificacionbd] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [qp_calificacionbd] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [qp_calificacionbd] SET  MULTI_USER 
GO
ALTER DATABASE [qp_calificacionbd] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [qp_calificacionbd] SET DB_CHAINING OFF 
GO
ALTER DATABASE [qp_calificacionbd] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [qp_calificacionbd] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [qp_calificacionbd] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [qp_calificacionbd] SET QUERY_STORE = OFF
GO
USE [qp_calificacionbd]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [qp_calificacionbd]
GO
/****** Object:  User [qp_calificacion]    Script Date: 03/01/2020 17:01:15 ******/
CREATE USER [qp_calificacion] FOR LOGIN [qp_calificacion] WITH DEFAULT_SCHEMA=[qp_calificacion]
GO
ALTER ROLE [db_owner] ADD MEMBER [qp_calificacion]
GO
/****** Object:  Schema [qp_calificacion]    Script Date: 03/01/2020 17:01:15 ******/
CREATE SCHEMA [qp_calificacion]
GO
/****** Object:  Table [dbo].[qp_contenedor]    Script Date: 03/01/2020 17:01:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qp_contenedor](
	[id_contenedor] [int] IDENTITY(1,1) NOT NULL,
	[nombre_contenedor] [nchar](500) NULL,
	[ruta_objeto_contenedor] [nchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qp_encuesta]    Script Date: 03/01/2020 17:01:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qp_encuesta](
	[id_encuesta] [int] IDENTITY(1,1) NOT NULL,
	[pregunta_encuesta] [nvarchar](max) NOT NULL,
	[id_marca_opcion_1] [int] NOT NULL,
	[id_marca_opcion_2] [int] NULL,
	[id_marca_opcion_3] [int] NULL,
	[id_marca_opcion_4] [int] NULL,
	[id_marca_opcion_5] [int] NULL,
	[fecha_creacion] [int] NULL,
	[hora_creacion] [int] NULL,
	[estado] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qp_eventos]    Script Date: 03/01/2020 17:01:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qp_eventos](
	[id_evento] [int] IDENTITY(1,1) NOT NULL,
	[evento] [nvarchar](50) NULL,
	[descripcion_evento] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qp_marca]    Script Date: 03/01/2020 17:01:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qp_marca](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[nombre_marca] [nvarchar](max) NOT NULL,
	[nombre_marca_interno] [nvarchar](max) NULL,
	[ruta_objeto_marca] [nvarchar](max) NOT NULL,
	[opcion_pregunta] [int] NULL,
	[id_pregunta] [int] NULL,
	[id_tipo_marca] [int] NOT NULL,
	[fecha_creacion] [int] NULL,
	[hora_creacion] [int] NULL,
	[estado] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qp_media]    Script Date: 03/01/2020 17:01:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qp_media](
	[id_media] [int] IDENTITY(1,1) NOT NULL,
	[media] [char](1) NOT NULL,
	[media_ruta] [varchar](500) NULL,
	[activado] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qp_score]    Script Date: 03/01/2020 17:01:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qp_score](
	[id_score] [int] IDENTITY(1,1) NOT NULL,
	[id_marca] [int] NOT NULL,
	[id_encuesta] [int] NULL,
	[id_marca_encuesta] [int] NULL,
	[fecha_creacion] [int] NOT NULL,
	[hora_creacion] [int] NOT NULL,
	[parametro] [nchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qp_tipo_marca]    Script Date: 03/01/2020 17:01:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qp_tipo_marca](
	[id_tipo_marca] [int] IDENTITY(1,1) NOT NULL,
	[nombre_tipo_marca] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [qp_calificacionbd] SET  READ_WRITE 
GO
