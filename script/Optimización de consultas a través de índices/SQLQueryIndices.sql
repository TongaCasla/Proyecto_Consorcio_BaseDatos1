DECLARE @i INT = 0;
DECLARE @fecha DATETIME = '2023-01-01';

WHILE @i < 1000000
BEGIN
    INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
    VALUES (1, 1, 1, DATEPART(MONTH, DATEADD(day, @i % 365, @fecha)), DATEADD(day, @i % 365, @fecha), 1, RAND() * 100);

    SET @i = @i + 1;
END
DECLARE @i INT = 0;
DECLARE @fecha DATETIME = '2023-01-01';

WHILE @i < 1000000
BEGIN
    INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
    VALUES (1, 1, 1, DATEPART(MONTH, DATEADD(day, @i % 365, @fecha)), DATEADD(day, @i % 365, @fecha), 1, RAND() * 100);

    SET @i = @i + 1;

    -- Mostrar progreso cada 10000 registros
    IF @i % 10000 = 0
    BEGIN
        PRINT 'Inserted ' + CAST(@i AS VARCHAR) + ' records';
    END
END
SELECT COUNT(*) FROM gasto;
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT *
FROM gasto
WHERE fechapago BETWEEN '2023-01-01' AND '2023-02-28';

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
SELECT COUNT(*) AS TotalRecords FROM gasto;
DECLARE @i INT = 300000; -- Reanuda desde donde te quedaste
DECLARE @fecha DATETIME = '2023-01-01';

WHILE @i < 1000000
BEGIN
    INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
    VALUES (1, 1, 1, DATEPART(MONTH, DATEADD(day, @i % 365, @fecha)), DATEADD(day, @i % 365, @fecha), 1, RAND() * 100);

    SET @i = @i + 1;

    -- Mostrar progreso cada 10000 registros
    IF @i % 10000 = 0
    BEGIN
        PRINT 'Inserted ' + CAST(@i AS VARCHAR) + ' records';
    END
END

DECLARE @i INT = 512000; -- Reanuda desde donde te quedaste
DECLARE @fecha DATETIME = '2023-01-01';

WHILE @i < 1000000
BEGIN
    INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
    VALUES (1, 1, 1, DATEPART(MONTH, DATEADD(day, @i % 365, @fecha)), DATEADD(day, @i % 365, @fecha), 1, RAND() * 100);

    SET @i = @i + 1;

    -- Mostrar progreso cada 10000 registros
    IF @i % 10000 = 0
    BEGIN
        PRINT 'Inserted ' + CAST(@i AS VARCHAR) + ' records';
    END
END

DECLARE @i INT =533069; -- Reanuda desde donde te quedaste
DECLARE @fecha DATETIME = '2023-01-01';

WHILE @i < 1000000
BEGIN
    INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
    VALUES (1, 1, 1, DATEPART(MONTH, DATEADD(day, @i % 365, @fecha)), DATEADD(day, @i % 365, @fecha), 1, RAND() * 100);

    SET @i = @i + 1;

    -- Mostrar progreso cada 10000 registros
    IF @i % 10000 = 0
    BEGIN
        PRINT 'Inserted ' + CAST(@i AS VARCHAR) + ' records';
    END
END


DECLARE @i INT=545570  -- Reanuda desde donde te quedaste
DECLARE @fecha DATETIME = '2023-01-01';

WHILE @i < 1000000
BEGIN
    INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
    VALUES (1, 1, 1, DATEPART(MONTH, DATEADD(day, @i % 365, @fecha)), DATEADD(day, @i % 365, @fecha), 1, RAND() * 100);

    SET @i = @i + 1;

    -- Mostrar progreso cada 10000 registros
    IF @i % 10000 = 0
    BEGIN
        PRINT 'Inserted ' + CAST(@i AS VARCHAR) + ' records';
    END
END

SELECT COUNT(*) AS TotalRecords FROM gasto;

DECLARE @i INT =553834; -- Reanuda desde donde te quedaste
DECLARE @fecha DATETIME = '2023-01-01';

WHILE @i < 1000000
BEGIN
    INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
    VALUES (1, 1, 1, DATEPART(MONTH, DATEADD(day, @i % 365, @fecha)), DATEADD(day, @i % 365, @fecha), 1, RAND() * 100);

    SET @i = @i + 1;

    -- Mostrar progreso cada 10000 registros
    IF @i % 10000 = 0
    BEGIN
        PRINT 'Inserted ' + CAST(@i AS VARCHAR) + ' records';
    END
END

DECLARE @i INT =567717 --Reanuda desde donde te quedaste
DECLARE @fecha DATETIME = '2023-01-01';

WHILE @i < 1000000
BEGIN
    INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
    VALUES (1, 1, 1, DATEPART(MONTH, DATEADD(day, @i % 365, @fecha)), DATEADD(day, @i % 365, @fecha), 1, RAND() * 100);

    SET @i = @i + 1;

    -- Mostrar progreso cada 10000 registros
    IF @i % 10000 = 0
    BEGIN
        PRINT 'Inserted ' + CAST(@i AS VARCHAR) + ' records';
    END
END

DECLARE @i INT =629960 --Reanuda desde donde te quedaste
DECLARE @fecha DATETIME = '2023-01-01';

WHILE @i < 1000000
BEGIN
    INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
    VALUES (1, 1, 1, DATEPART(MONTH, DATEADD(day, @i % 365, @fecha)), DATEADD(day, @i % 365, @fecha), 1, RAND() * 100);

    SET @i = @i + 1;

    -- Mostrar progreso cada 10000 registros
    IF @i % 10000 = 0
    BEGIN
        PRINT 'Inserted ' + CAST(@i AS VARCHAR) + ' records';
    END
END


DECLARE @i INT =685967 --Reanuda desde donde te quedaste
DECLARE @fecha DATETIME = '2023-01-01';

WHILE @i < 1000000
BEGIN
    INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
    VALUES (1, 1, 1, DATEPART(MONTH, DATEADD(day, @i % 365, @fecha)), DATEADD(day, @i % 365, @fecha), 1, RAND() * 100);

    SET @i = @i + 1;

    -- Mostrar progreso cada 10000 registros
    IF @i % 10000 = 0
    BEGIN
        PRINT 'Inserted ' + CAST(@i AS VARCHAR) + ' records';
    END
END

DECLARE @i INT =718981 --Reanuda desde donde te quedaste
DECLARE @fecha DATETIME = '2023-01-01';

WHILE @i < 1000000
BEGIN
    INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
    VALUES (1, 1, 1, DATEPART(MONTH, DATEADD(day, @i % 365, @fecha)), DATEADD(day, @i % 365, @fecha), 1, RAND() * 100);

    SET @i = @i + 1;

    -- Mostrar progreso cada 10000 registros
    IF @i % 10000 = 0
    BEGIN
        PRINT 'Inserted ' + CAST(@i AS VARCHAR) + ' records';
    END
END
DECLARE @i INT =746724 --Reanuda desde donde te quedaste
DECLARE @fecha DATETIME = '2023-01-01';

WHILE @i < 1000000
BEGIN
    INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
    VALUES (1, 1, 1, DATEPART(MONTH, DATEADD(day, @i % 365, @fecha)), DATEADD(day, @i % 365, @fecha), 1, RAND() * 100);

    SET @i = @i + 1;

    -- Mostrar progreso cada 10000 registros
    IF @i % 10000 = 0
    BEGIN
        PRINT 'Inserted ' + CAST(@i AS VARCHAR) + ' records';
    END
END
SELECT COUNT(*) AS TotalRecords FROM gasto;

DECLARE @i INT =805447 --Reanuda desde donde te quedaste
DECLARE @fecha DATETIME = '2023-01-01';

WHILE @i < 1000000
BEGIN
    INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
    VALUES (1, 1, 1, DATEPART(MONTH, DATEADD(day, @i % 365, @fecha)), DATEADD(day, @i % 365, @fecha), 1, RAND() * 100);

    SET @i = @i + 1;

    -- Mostrar progreso cada 10000 registros
    IF @i % 10000 = 0
    BEGIN
        PRINT 'Inserted ' + CAST(@i AS VARCHAR) + ' records';
    END
END

DECLARE @i INT =979540 --Reanuda desde donde te quedaste
DECLARE @fecha DATETIME = '2023-01-01';

WHILE @i < 1000000
BEGIN
    INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
    VALUES (1, 1, 1, DATEPART(MONTH, DATEADD(day, @i % 365, @fecha)), DATEADD(day, @i % 365, @fecha), 1, RAND() * 100);

    SET @i = @i + 1;

    -- Mostrar progreso cada 10000 registros
    IF @i % 10000 = 0
    BEGIN
        PRINT 'Inserted ' + CAST(@i AS VARCHAR) + ' records';
    END
END
DECLARE @i INT =997160 --Reanuda desde donde te quedaste
DECLARE @fecha DATETIME = '2023-01-01';

WHILE @i < 1000000
BEGIN
    INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
    VALUES (1, 1, 1, DATEPART(MONTH, DATEADD(day, @i % 365, @fecha)), DATEADD(day, @i % 365, @fecha), 1, RAND() * 100);

    SET @i = @i + 1;

    -- Mostrar progreso cada 10000 registros
    IF @i % 10000 = 0
    BEGIN
        PRINT 'Inserted ' + CAST(@i AS VARCHAR) + ' records';
    END
END
-- Verifica el total de registros insertados
SELECT COUNT(*) AS TotalRecords FROM gasto;

-- Verifica el rango de fechas
SELECT MIN(fechapago) AS FechaMin, MAX(fechapago) AS FechaMax FROM gasto;


-- Crear una copia de la tabla 'gasto' en una tabla gasto_sin_indice
SELECT *
INTO gasto_sin_indices
FROM gasto;

-- Verificar que no tenga índices (opcional)
EXEC sp_helpindex 'gasto_sin_indices';
sp_help gasto_sin_indices
sp_help gasto


-- Consulta inicial sin índices
 /*SET STATISTICS TIME ON;
SET STATISTICS IO ON;*/
SELECT *
FROM gasto_sin_indices
WHERE fechapago BETWEEN '2023-06-30' AND '2023-06-30';
 /*SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;*/

/*SET STATISTICS TIME ON; 
SET STATISTICS IO ON; */
SELECT 
* FROM gasto WHERE fechapago BETWEEN '2023-06-30' AND '2023-06-30';
 /*SET STATISTICS TIME OFF; 
SET STATISTICS IO OFF;*/




-- Verificar los índices en la tabla 'gasto_sin_indices'
SELECT name
FROM sys.indexes
WHERE object_id = OBJECT_ID('gasto_sin_indices');


-- Crear índice no agrupado en la nueva tabla 'gasto_sin_indices'
CREATE NONCLUSTERED INDEX IDX_gasto_sin_indices_fechapago ON gasto_sin_indices(fechapago);
-- Verificar que el índice no agrupado se haya creado en la tabla 'gasto_sin_indices'
SELECT name
FROM sys.indexes
WHERE object_id = OBJECT_ID('gasto_sin_indices');
---PARA VER SI CREO EL INDICE AGRUPADO EN GASTO_SIN:INDICES--
sp_help gasto_sin_indices

----SE COMPARA LOS TIEMPOS DE ACCESO CON INDICE AGRUPADO Y SIN AGRUPAR---
-- Habilitar estadísticas de tiempo y E/S
/*SET STATISTICS TIME ON;
SET STATISTICS IO ON;*/

-- Ejecutar la consulta en la tabla original con el índice agrupado
SELECT *
FROM gasto
WHERE fechapago BETWEEN '2023-01-01' AND '2023-02-28';

/*SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;*/


-- Habilitar estadísticas de tiempo y E/S
/*SET STATISTICS TIME ON;
SET STATISTICS IO ON;*/

-- Ejecutar la consulta en la tabla con el índice no agrupado
SELECT *
FROM gasto_sin_indices
WHERE fechapago BETWEEN '2023-01-01' AND '2023-02-28';

/*SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;*/

-- Eliminar el índice no agrupado en la tabla 'gasto_sin_indices'
DROP INDEX IDX_gasto_sin_indices_fechapago ON gasto_sin_indices;
 
 -- Crear índice agrupado en la tabla 'gasto_sin_indices'
CREATE CLUSTERED INDEX IDX_Clustered_gasto_sin_indices_fechapago ON gasto_sin_indices(fechapago);

DROP INDEX IDX_Clustered_gasto_sin_indices_fechapago ON gasto_sin_indices;

---SE VUELVE A COMPARAR LOS TIEMPOS DE ACCESOS AHORA CON EL INDICE AGRUPADO CREADO---
-- Habilitar estadísticas de tiempo y E/S 
SET STATISTICS TIME ON; 
SET STATISTICS IO ON; 
-- Ejecutar la consulta en la tabla original con el índice existente 
SELECT * FROM gasto WHERE fechapago BETWEEN '2023-01-01' AND '2023-02-28'; 
SET STATISTICS TIME OFF; 
SET STATISTICS IO OFF; 


-- Habilitar estadísticas de tiempo y E/S 
SET STATISTICS TIME ON;
SET STATISTICS IO ON; 
-- Ejecutar la consulta en la tabla con el índice agrupado 
SELECT * FROM gasto_sin_indices WHERE fechapago BETWEEN '2023-01-01' AND '2023-02-28'; 
SET STATISTICS TIME OFF; 
SET STATISTICS IO OFF;