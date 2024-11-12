use bd_proyecto_consorcio

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Gaston>
-- Create date: <14/10/2024>
-- Description:	<Insert de la tabla gasto>
-- =============================================
CREATE PROCEDURE  InsertGasto
	
	@id_provincia int,
	@id_localidad int,
	@id_consorcio int,
	@periodo int,
	@fecha_pago datetime,
	@id_tipogasto int,
	@importe decimal (8,2)
AS
BEGIN
	BEGIN TRY
		insert into gasto (idprovincia,idlocalidad,idconsorcio,periodo,fechapago,idtipogasto,importe)
		values(@id_provincia,@id_localidad,@id_consorcio,@periodo,@fecha_pago,@id_tipogasto,@importe)
	END TRY
	BEGIN CATCH
		select ERROR_NUMBER(),ERROR_MESSAGE()
	END CATCH
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Gaston>
-- Create date: <22/10/2024>
-- Description:	<Update de la tabla gasto>
-- =============================================
CREATE PROCEDURE  UpdateGasto
	
	@id_gasto int,
	@periodo int = null,
	@fecha_pago datetime = null,
	@id_tipogasto int = null,
	@importe decimal (8,2) = null
AS
BEGIN
	BEGIN TRY
		update gasto 
	set
        periodo = CASE WHEN @periodo IS NOT NULL THEN @periodo ELSE periodo END,
        fechapago = CASE WHEN @fecha_pago IS NOT NULL THEN @fecha_pago ELSE fechapago END,
        idtipogasto = CASE WHEN @id_tipogasto IS NOT NULL THEN @id_tipoGasto ELSE idtipogasto END,
        importe = CASE WHEN @importe IS NOT NULL THEN @importe ELSE importe END
    WHERE idgasto = @id_gasto;
	END TRY
	BEGIN CATCH
		select ERROR_NUMBER(),ERROR_MESSAGE()
	END CATCH
	
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Gaston>
-- Create date: <22/10/2024>
-- Description:	<Delete de la tabla gasto>
-- =============================================
CREATE PROCEDURE  DeleteGasto
	
	@id_gasto int
AS
BEGIN
	BEGIN TRY
		 DELETE FROM gasto
		 WHERE idgasto = @id_gasto;
	END TRY
	BEGIN CATCH
		select ERROR_NUMBER(),ERROR_MESSAGE()
	END CATCH
	
END
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Función que calcula el gasto total de un consorcio en un determinado año
*/
CREATE FUNCTION TotalConsorcioPorAnio
(
	@id_provincia int,
	@id_localidad int,
	@id_consorcio int,
	@anio int
) RETURNS table
AS 
RETURN 
(
	   select distinct g.idprovincia as Provincia,
	   g.idlocalidad as Localidad,
	   g.idconsorcio as Consorcio,
	   sum(g.importe) as Total
	   from gasto g
	   where g.idprovincia=@id_provincia and g.idlocalidad=@id_localidad and g.idconsorcio=@id_consorcio and year(g.fechapago)=@anio
	   group by g.idprovincia,g.idlocalidad,g.idconsorcio
);
go


/*
	Función que calcula el gasto total por tipo de gasto de un consorcio en un determinado año
*/
CREATE FUNCTION TotalConsorcioPorAnioTipoGasto
(
	@id_provincia int,
	@id_localidad int,
	@id_consorcio int,
	@anio int
) RETURNS table
AS 
RETURN 
(
	   select distinct g.idprovincia as Provincia,
	   g.idlocalidad as Localidad,
	   g.idconsorcio as Consorcio,
	   tg.descripcion as TipoGasto,
	   sum(g.importe) as Total
	   from gasto g
	   join tipogasto tg on g.idtipogasto = tg.idtipogasto
	   where g.idprovincia=@id_provincia and g.idlocalidad=@id_localidad and g.idconsorcio=@id_consorcio and year(g.fechapago)=@anio
	   group by g.idprovincia,g.idlocalidad,g.idconsorcio, tg.descripcion
);
go

/*
	Función que calcula el gasto total en un determinado consorcio entre 2 fechas
*/

CREATE FUNCTION TotalConsorcioEntreFechas
(
	@id_provincia int,
	@id_localidad int,
	@id_consorcio int,
	@desde date,
	@hasta date
) RETURNS table
AS 
RETURN 
(
	   select distinct g.idprovincia as Provincia,
	   g.idlocalidad as Localidad,
	   g.idconsorcio as Consorcio,
	   sum(importe) as Total
	   from gasto g
	   where g.idprovincia=@id_provincia and g.idlocalidad=@id_localidad and g.idconsorcio=@id_consorcio and g.fechapago between @desde and @hasta
	   group by g.idprovincia,g.idlocalidad,g.idconsorcio
);

go

/*
	Función que calcula la edad de un concerje
*/

create function FuncionCalcularEdad
(
	@idconserje int
)returns int
as
begin
	declare @edad int
	select @edad=datediff(year,c.fechnac,GETDATE()) from conserje c
	where c.idconserje=@idconserje
	return @edad
end
go

/*
	Procedimiento que calcula la edad de la tabla concerje
*/

CREATE PROCEDURE sp_CalcularEdadConBucle
(
    @idconserje INT 
)
AS
BEGIN
    --Tabla temporal
    DECLARE @Edades TABLE
    (
		nombre varchar(100),
        edad INT
    );

   
    DECLARE @id INT;
    DECLARE @edad INT;
	DECLARE @nombre varchar(100);

    -- Cursor
    DECLARE cur CURSOR FOR
    SELECT c.idconserje
    FROM conserje c
    WHERE c.idconserje >= @idconserje 
    ORDER BY c.idconserje; 


    OPEN cur;
    FETCH NEXT FROM cur INTO @id;

    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        
        SELECT @edad = DATEDIFF(YEAR, c.fechnac, GETDATE()),@nombre=c.apeynom
        FROM conserje c
        WHERE c.idconserje = @id;

        INSERT INTO @Edades (nombre, edad)
        VALUES (@nombre, @edad);

        FETCH NEXT FROM cur INTO @id;
    END
 
    CLOSE cur;
    DEALLOCATE cur;

    SELECT * FROM @Edades;
END
GO
------------------------------------------------------------------------------------------------------------------------------------------

--Prueba de insert
-- Insert con sentencia SQL
INSERT INTO gasto (idprovincia,idlocalidad,idconsorcio,periodo,fechapago,idtipogasto,importe) VALUES (24,14,5,8,'20170814',3,51399.37);
-- Insert pro procedimiento
Exec dbo.InsertGasto 24,14,5,8,'20170814',3,51399.37;

select * from gasto order by idgasto desc
-- Update pro procedimiento
Exec dbo.UpdateGasto 8002,8,'20170814',4,10000.00;
-- Delete pro procedimiento
Exec dbo.DeleteGasto 8002;

--Prueba de funciones
select * from  dbo.TotalConsorcioPorAnio(1,2,2,2013);

select * from  dbo.TotalConsorcioPorAnioTipoGasto(1,2,2,2013);

select * from dbo.TotalConsorcioEntreFechas(1,2,2,'2013-01-01','2017-12-31')


---Procedimientos vs funciones
--Procedimiento 
exec dbo.sp_CalcularEdadConBucle @idconserje=1
--Funcion
select c.apeynom ,dbo.FuncionCalcularEdad(c.idconserje) as edad  from conserje c
