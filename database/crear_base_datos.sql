-- ============================================================================
-- SCRIPT DE CREACIÓN DE BASE DE DATOS QP_CALIFICACIONBD
-- Sistema de Calificación de Servicio - QP_SCORE
-- Ingeniería Inversa basada en código Java
-- ============================================================================
-- Fecha: 2024
-- Descripción: Script completo para crear todas las tablas necesarias
-- ============================================================================

-- ============================================================================
-- 1. CREAR BASE DE DATOS
-- ============================================================================
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'qp_calificacionbd')
BEGIN
    CREATE DATABASE qp_calificacionbd
    COLLATE SQL_Latin1_General_CP1_CI_AS
END
GO

USE qp_calificacionbd
GO

-- ============================================================================
-- 2. TABLA: qp_marca (Niveles de Calificación)
-- ============================================================================
-- Almacena los niveles de calificación (EXCELENTE, MUY BUENO, BUENO, REGULAR, MALO)
-- y su relación con imágenes y preguntas

IF OBJECT_ID('dbo.qp_marca', 'U') IS NOT NULL 
    DROP TABLE dbo.qp_marca;
GO

CREATE TABLE dbo.qp_marca (
    id_marca INT PRIMARY KEY IDENTITY(1,1),
    nombre_marca NVARCHAR(100) NOT NULL,              -- EXCELENTE, MUY BUENO, BUENO, REGULAR, MALO
    id_tipo_marca INT NULL,                           -- Tipo de marca (para futuro uso)
    id_pregunta INT NULL,                             -- FK a qp_encuesta (si tiene preguntas)
    opcion_pregunta INT NULL,                         -- 1 = tiene pregunta, 0 = sin pregunta
    ruta_objeto_marca NVARCHAR(500) NOT NULL,         -- Ruta de imagen: ../images/cfu_1.png
    estado INT DEFAULT 1,                             -- 1 = activo, 0 = inactivo
    fecha_creacion DATETIME DEFAULT GETDATE(),
    CONSTRAINT UQ_nombre_marca UNIQUE (nombre_marca)
)
GO

-- Insertar datos de ejemplo
INSERT INTO dbo.qp_marca (nombre_marca, id_tipo_marca, opcion_pregunta, ruta_objeto_marca, estado)
VALUES
    ('EXCELENTE', 1, 1, '../images/cfu_1.png', 1),
    ('MUY BUENO', 1, 1, '../images/cfu_2.png', 1),
    ('BUENO', 1, 0, '../images/cfu_3.png', 1),
    ('REGULAR', 1, 1, '../images/cfu_4.png', 1),
    ('MALO', 1, 1, '../images/cfu_5.png', 1)
GO

-- ============================================================================
-- 3. TABLA: qp_encuesta (Preguntas de Seguimiento)
-- ============================================================================
-- Almacena las preguntas que se hacen según la calificación seleccionada

IF OBJECT_ID('dbo.qp_encuesta', 'U') IS NOT NULL 
    DROP TABLE dbo.qp_encuesta;
GO

CREATE TABLE dbo.qp_encuesta (
    id_encuesta INT PRIMARY KEY IDENTITY(1,1),
    pregunta_encuesta NVARCHAR(500) NOT NULL,         -- Texto de la pregunta
    id_marca_opcion_1 INT NULL,                       -- FK a qp_marca (opción 1)
    id_marca_opcion_2 INT NULL,                       -- FK a qp_marca (opción 2)
    id_marca_opcion_3 INT NULL,                       -- FK a qp_marca (opción 3)
    id_marca_opcion_4 INT NULL,                       -- FK a qp_marca (opción 4)
    id_marca_opcion_5 INT NULL,                       -- FK a qp_marca (opción 5)
    estado INT DEFAULT 1,                             -- 1 = activo, 0 = inactivo
    fecha_creacion DATETIME DEFAULT GETDATE()
)
GO

-- Insertar ejemplos de preguntas
INSERT INTO dbo.qp_encuesta (pregunta_encuesta, id_marca_opcion_1, id_marca_opcion_2, id_marca_opcion_3, id_marca_opcion_4, id_marca_opcion_5, estado)
VALUES
    ('¿Por qué no fue excelente?', 5, 4, 3, NULL, NULL, 1),
    ('¿Qué podemos mejorar?', 1, 2, 3, 4, 5, 1),
    ('¿Volvería a visitarnos?', 2, 1, 4, 5, NULL, 1)
GO

-- ============================================================================
-- 4. TABLA: qp_media (Control de Publicidad/Reproducción)
-- ============================================================================
-- Controla si se debe reproducir publicidad o calificación
-- media = 0: Mostrar pantalla de calificación
-- media = 1: Mostrar video de publicidad

IF OBJECT_ID('dbo.qp_media', 'U') IS NOT NULL 
    DROP TABLE dbo.qp_media;
GO

CREATE TABLE dbo.qp_media (
    id_media INT PRIMARY KEY IDENTITY(1,1),
    media INT NOT NULL DEFAULT 0,                     -- 0 = calificación, 1 = publicidad
    media_ruta NVARCHAR(500) NOT NULL,                -- Ruta del video: video.mp4
    activado INT DEFAULT 1,                           -- 1 = activo, 0 = inactivo
    fecha_creacion DATETIME DEFAULT GETDATE()
)
GO

-- Insertar datos iniciales
INSERT INTO dbo.qp_media (media, media_ruta, activado)
VALUES
    (0, '../video.mp4', 1)
GO

-- ============================================================================
-- 5. TABLA: qp_contenedor (Contenedores/Contenido)
-- ============================================================================
-- Almacena contenedores de contenido adicional

IF OBJECT_ID('dbo.qp_contenedor', 'U') IS NOT NULL 
    DROP TABLE dbo.qp_contenedor;
GO

CREATE TABLE dbo.qp_contenedor (
    id_contenedor INT PRIMARY KEY IDENTITY(1,1),
    nombre_contenedor NVARCHAR(100) NOT NULL,
    ruta_objeto_contenedor NVARCHAR(500) NOT NULL,
    estado INT DEFAULT 1,
    fecha_creacion DATETIME DEFAULT GETDATE()
)
GO

-- ============================================================================
-- 6. TABLA: qp_score (Respuestas Guardadas - Principal)
-- ============================================================================
-- Tabla principal que almacena todas las calificaciones y respuestas

IF OBJECT_ID('dbo.qp_score', 'U') IS NOT NULL 
    DROP TABLE dbo.qp_score;
GO

CREATE TABLE dbo.qp_score (
    id_score INT PRIMARY KEY IDENTITY(1,1),
    id_marca INT NOT NULL,                            -- FK a qp_marca (calificación principal)
    id_encuesta INT NULL,                             -- FK a qp_encuesta (pregunta si aplica)
    id_marca_encuesta INT NULL,                       -- FK a qp_marca (respuesta a pregunta)
    fecha_creacion INT NOT NULL,                      -- DDMMYYYY format
    hora_creacion INT NOT NULL,                       -- HH*60 + MM (minutos desde medianoche)
    timestamp_registro DATETIME DEFAULT GETDATE(),    -- Timestamp completo
    FOREIGN KEY (id_marca) REFERENCES qp_marca(id_marca),
    FOREIGN KEY (id_encuesta) REFERENCES qp_encuesta(id_encuesta),
    FOREIGN KEY (id_marca_encuesta) REFERENCES qp_marca(id_marca)
)
GO

-- Crear índices para optimizar búsquedas
CREATE INDEX IX_qp_score_fecha ON dbo.qp_score(fecha_creacion)
GO

CREATE INDEX IX_qp_score_id_marca ON dbo.qp_score(id_marca)
GO

-- ============================================================================
-- 7. VISTA: vw_reportes_diarios (Para reportes)
-- ============================================================================
-- Vista que permite ver resumen de calificaciones por día

CREATE OR ALTER VIEW vw_reportes_diarios AS
SELECT 
    fecha_creacion,
    m.nombre_marca,
    COUNT(*) as cantidad,
    CONVERT(FLOAT, COUNT(*)) * 100.0 / 
        (SELECT COUNT(*) FROM qp_score WHERE fecha_creacion = qp_score.fecha_creacion) as porcentaje
FROM dbo.qp_score
INNER JOIN dbo.qp_marca m ON qp_score.id_marca = m.id_marca
GROUP BY fecha_creacion, m.nombre_marca
GO

-- ============================================================================
-- 8. PROCEDIMIENTO ALMACENADO: sp_insertar_calificacion
-- ============================================================================
-- Procedimiento para insertar una nueva calificación (alternativa segura)

CREATE OR ALTER PROCEDURE sp_insertar_calificacion
    @id_marca INT,
    @id_encuesta INT = NULL,
    @id_marca_encuesta INT = NULL,
    @fecha_creacion INT,
    @hora_creacion INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        INSERT INTO dbo.qp_score 
        (id_marca, id_encuesta, id_marca_encuesta, fecha_creacion, hora_creacion)
        VALUES 
        (@id_marca, @id_encuesta, @id_marca_encuesta, @fecha_creacion, @hora_creacion)
        
        SELECT 'Inserción exitosa' as Mensaje
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() as Mensaje
    END CATCH
END
GO

-- ============================================================================
-- 9. PROCEDIMIENTO ALMACENADO: sp_obtener_calificaciones_por_fecha
-- ============================================================================
-- Obtiene estadísticas de calificaciones por fecha

CREATE OR ALTER PROCEDURE sp_obtener_calificaciones_por_fecha
    @fecha_creacion INT
AS
BEGIN
    SELECT 
        m.nombre_marca,
        COUNT(*) as cantidad,
        ROUND(CAST(COUNT(*) AS FLOAT) * 100.0 / 
            (SELECT COUNT(*) FROM qp_score WHERE fecha_creacion = @fecha_creacion), 2) as porcentaje
    FROM dbo.qp_score s
    INNER JOIN dbo.qp_marca m ON s.id_marca = m.id_marca
    WHERE s.fecha_creacion = @fecha_creacion
    GROUP BY m.nombre_marca
    ORDER BY cantidad DESC
END
GO

-- ============================================================================
-- 10. CREAR USUARIO DE APLICACIÓN
-- ============================================================================
-- Usuario específico con permisos limitados para la aplicación

IF NOT EXISTS (SELECT * FROM sys.sql_logins WHERE name = 'qp_calificacion')
BEGIN
    CREATE LOGIN qp_calificacion WITH PASSWORD = 'qp_calificacion'
END
GO

-- Crear usuario en la BD
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'qp_calificacion')
BEGIN
    CREATE USER qp_calificacion FOR LOGIN qp_calificacion
END
GO

-- Otorgar permisos específicos
GRANT SELECT ON dbo.qp_marca TO qp_calificacion
GRANT SELECT ON dbo.qp_encuesta TO qp_calificacion
GRANT SELECT ON dbo.qp_media TO qp_calificacion
GRANT SELECT ON dbo.qp_contenedor TO qp_calificacion
GRANT SELECT, INSERT ON dbo.qp_score TO qp_calificacion
GRANT UPDATE ON dbo.qp_media TO qp_calificacion
GRANT EXECUTE ON dbo.sp_insertar_calificacion TO qp_calificacion
GRANT EXECUTE ON dbo.sp_obtener_calificaciones_por_fecha TO qp_calificacion
GO

-- ============================================================================
-- 11. VERIFICACIÓN - CONSULTAS DE PRUEBA
-- ============================================================================
-- Descomentar para verificar que todo fue creado correctamente

/*
-- Ver todas las marcas
SELECT * FROM dbo.qp_marca;

-- Ver todas las encuestas
SELECT * FROM dbo.qp_encuesta;

-- Ver estado de media
SELECT * FROM dbo.qp_media;

-- Ver datos de contenedor
SELECT * FROM dbo.qp_contenedor;

-- Ver scores registrados
SELECT * FROM dbo.qp_score;

-- Ver reporte
SELECT * FROM vw_reportes_diarios;
*/

-- ============================================================================
-- FIN DEL SCRIPT
-- ============================================================================
