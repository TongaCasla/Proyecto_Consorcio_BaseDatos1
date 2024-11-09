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
	insert into gasto (idprovincia,idlocalidad,idconsorcio,periodo,fechapago,idtipogasto,importe)
	values(@id_provincia,@id_localidad,@id_consorcio,@periodo,@fecha_pago,@id_tipogasto,@importe)
	
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
	update gasto 
	set
        periodo = CASE WHEN @periodo IS NOT NULL THEN @periodo ELSE periodo END,
        fechapago = CASE WHEN @fecha_pago IS NOT NULL THEN @fecha_pago ELSE fechapago END,
        idtipogasto = CASE WHEN @id_tipogasto IS NOT NULL THEN @id_tipoGasto ELSE idtipogasto END,
        importe = CASE WHEN @importe IS NOT NULL THEN @importe ELSE importe END
    WHERE idgasto = @id_gasto;
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
	 DELETE FROM gasto
    WHERE idgasto = @id_gasto;
END
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION TotalConsorcioPorAnio
(
	@id_provincia int,
	@id_localidad int,
	@id_consorcio int,
	@anio int
) RETURNS decimal(8,2) 
AS 
BEGIN
	DECLARE @Total decimal (8,2);
	SELECT @Total = SUM(importe)
    FROM gasto
    WHERE idprovincia=@id_provincia and idlocalidad=@id_localidad and idconsorcio=@id_consorcio and YEAR(fechapago)=@anio;
	RETURN ISNULL(@Total, 0);
END;