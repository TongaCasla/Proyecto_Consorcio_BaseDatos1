-- =============================================
-- Author:		<Marisol Dusicka>
-- Create date: <09/11/2024>
-- Description:	<Tema: Manejo de permisos a nivel de usuarios de base de datos>
-- =============================================

/* aqui soy Usuario Con permiso de Lectura*/

-- Permiso a la base de datos  bd_proyecto_consorcio;

-- USE bd_proyecto_consorcio;
go

SELECT * FROM gasto

/* permisos a la tabla gasto  */

select idgasto from gasto 
ORDER BY idgasto DESC            -- permite mostrar todos los gastos de la tabla        
 GO                          

--- INSERT: Ingreso registros a la tabla gastos que si esta habilitado
INSERT INTO gasto(idprovincia,idlocalidad,idconsorcio,periodo,fechapago,idtipogasto,importe)
VALUES(1,1,1,11,'2024-11-10',5,45000);
GO


-----------------------------------------
select * from  [dbo].[tipogasto]        -- permite mostrar todos los gastos de la tabla
go

--- INSERT utilizando datos a la tabla tipogasto
insert into [dbo].[tipogasto] (idtipogasto, descripcion)
values (6, 'contable');         ----- Se denegó el permiso INSERT en el objeto 'tipogasto', base de datos 'bd_proyecto_consorcio', esquema 'dbo'.

go



select COUNT(*) from gasto  --- PUEDO CONTAR TODOS LOS GASTOS

select [idgasto] AS 'GASTOS',
[idtipogasto] AS 'TIPO GASTO',
[importe] AS 'IMPORTE'
from gasto
go

/* tengo acceso a la tabla tipogasto */

select * from [dbo].[zona] 
go

--- INSERT utilizando datos a la tabla [dbo].[zona] 
insert into [dbo].[zona] ([idzona], [descripcion])  ----- Se denegó el permiso INSERT en el objeto 'zona', base de datos 'bd_proyecto_consorcio', esquema 'dbo'.
Values (7,'costa')
go

---- termine--
