---------------------------------------Se crea la tabla auditoria-------------------------------------------------
Create table auditoria_gasto	(
						id_auditoria int identity (1,1),
						id_gasto int,
						id_consorcio int,
						id_localidad int,
						id_provincia int,
					    fechapago datetime,					     
						importe decimal (8,2),
						usuario varchar (50),
						tipo varchar (50),
					    Constraint PK_idauditoria PRIMARY KEY (id_auditoria),
					)
-------------------------Modificamos los datos de la tabla gasto-------------------------------------------------
create TRIGGER TR_Gasto_cosorcio
	ON gasto FOR UPDATE
AS
BEGIN
	SET NOCOUNT ON 
	DECLARE @id_gasto INT = (SELECT idgasto FROM inserted)
	DECLARE @id_consorcio INT = (SELECT idconsorcio FROM inserted)
	DECLARE @id_localidad INT = (SELECT idlocalidad FROM inserted)
	DECLARE @id_provincia INT = (SELECT idprovincia FROM inserted)
	DECLARE @precio_nuevo DECIMAL (8,2) = (SELECT importe FROM inserted)
	DECLARE @precio_viejo DECIMAL (8,2) = (SELECT importe FROM deleted)
	
INSERT INTO auditoria_gasto (id_gasto, id_consorcio, id_localidad, id_provincia, fechapago, importe, usuario, tipo)
SELECT 
        i.idgasto,           -- Nuevo idgasto de la tabla 'inserted'
        i.idconsorcio,                   -- Suponiendo valores fijos para id_consorcio, id_localidad, id_provincia
        i.idlocalidad,
        i.idprovincia,
        GETDATE(),           -- Fecha y hora actual
        i.importe,           -- Nuevo importe de la tabla 'inserted'
        SYSTEM_USER,         -- Usuario actual
        'Modificacion de los datos'
    FROM 
        inserted i
    INNER JOIN 
        deleted d ON i.idgasto = d.idgasto  -- Unir 'inserted' y 'deleted' en el campo idgasto
END;
DROP TRIGGER TR_Gasto_cosorcio;
-------------------------Muestra mensaje de que no se puede realizar la eliminacion-------------------------------
CREATE TRIGGER TRG_Prevent_Delete 
ON gasto
INSTEAD OF DELETE
AS
BEGIN
    RAISERROR ('No se permite la eliminación de registros en esta tabla.', 1, 1);
    ROLLBACK TRANSACTION;
END;

------------------------------------------------------------------------------------------------------------------
----Prueba de datos con triggers----
UPDATE gasto
SET importe = 1000
WHERE idgasto = 1000;
select * from auditoria_gasto

select * from gasto
order by idgasto desc;

DELETE FROM gasto where idgasto = 1000;