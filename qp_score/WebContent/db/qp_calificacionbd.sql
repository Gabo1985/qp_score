USE master;
BEGIN
  CREATE LOGIN qp_calificacion WITH PASSWORD = 'qp_calificacion', CHECK_POLICY = OFF;
END
GO

CREATE DATABASE qp_calificacionbd collate latin1_general_cs_as;
GO

USE [qp_calificacionbd];
GO
EXEC sp_adduser 'qp_calificacion', 'qp_calificacion', 'db_owner';
GO
USE [qp_calificacionbd]
GO
/****** Object:  User [qp_calificacion]    Script Date: 24/06/2019 10:48:12 ******/
CREATE USER [qp_calificacion] FOR LOGIN [qp_calificacion] WITH DEFAULT_SCHEMA=[qp_calificacion]
GO
ALTER ROLE [db_owner] ADD MEMBER [qp_calificacion]
GO
/****** Object:  Schema [qp_calificacion]    Script Date: 24/06/2019 10:48:12 ******/
CREATE SCHEMA [qp_calificacion]
GO
/****** Object:  Table [dbo].[qp_encuesta]    Script Date: 24/06/2019 10:48:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qp_encuesta](
	[id_encuesta] [int] IDENTITY(1,1) NOT NULL,
	[pregunta_encuesta] [nvarchar](MAX) NOT NULL,
	[id_marca] [int] NOT NULL,
	[fecha_creacion] [int] NULL,
	[hora_creacion] [int] NULL,
	[estado] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qp_marca]    Script Date: 24/06/2019 10:48:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qp_marca](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[nombre_marca] [nvarchar](MAX) NOT NULL,
	[ruta_objeto_marca] [nvarchar](MAX) NOT NULL,
	[id_tipo_marca] [int] NOT NULL,
	[fecha_creacion] [int] NULL,
	[hora_creacion] [int] NULL,
	[estado] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qp_score]    Script Date: 24/06/2019 10:48:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qp_score](
	[id_score] [int] IDENTITY(1,1) NOT NULL,
	[id_marca] [int] NOT NULL,
	[id_encuesta] [int] NOT NULL,
	[fecha_creacion] [int] NOT NULL,
	[hora_creacion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qp_tipo_marca]    Script Date: 24/06/2019 10:48:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qp_tipo_marca](
	[id_tipo_marca] [int] IDENTITY(1,1) NOT NULL,
	[nombre_tipo_marca] [nvarchar](MAX) NULL
) ON [PRIMARY]
GO
