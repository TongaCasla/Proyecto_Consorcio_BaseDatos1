-- =============================================
-- Author:		<Marisol Dusicka>
-- Create date: <09/11/2024>
-- Description:	<Tema: Manejo de permisos a nivel de usuarios de base de datos>
-- =============================================

-----------------------------------------------------------
------- Crear el usuario con permisos de Administrador
-------------------------------------------------------------


-- USE bd_proyecto_consorcio;
go

 /* 1. Crea dos usuarios en la base de datos
  Primero, creamos un Login para conectarnos a nuestro servidor (bd) */

 CREATE LOGIN admin WITH PASSWORD = '1234';

/* 2. Crear un usuario para ese login en la base de datos específica
 */
CREATE USER Marisol FOR LOGIN admin;
go


/* 3.  Asignar rol de administrador (sysadmin) al usuario */

ALTER SERVER ROLE sysadmin ADD MEMBER admin;  ---- ALTER SERVER ROLE: modifico el rol del servidor y se agrego un nuevo miembro a ese rol
go

-----------------------------------------------------------
------- Crear el usuario con permisos de solo lectura
-------------------------------------------------------------


-- USE bd_proyecto_consorcio;
go

/* 4. Crear un inicio de sesión (login)*/

CREATE LOGIN analista  WITH PASSWORD = '1234'; --- CREATE LOGIN NombreDelUsuarioConLectura WITH PASSWORD = 'ContraseñaSegura';
go

/* 5. Crear el usuario en la base de datos deseada */ 

CREATE USER desarrollador FOR LOGIN analista;
go

/* 6. Asignar el rol de solo lectura (db_datareader) al usuario */

--EXEC sp_addrolemember 'db_datareader', 'desarrollador';

 alter role db_datareader add member desarrollador  --- asignar el rol de solo lectura al usuario

 
/*7.  Grant: otorga permisos a un usuario o rol para utilizar operaciones especificas en objetos de la base de datos*/
--- conceder permiso para ingresar registros a la tabla ..

Grant select, Update, Insert, Delete ON [dbo].[gasto] to desarrollador
go


/* 7.  Usuario Solo Lectura: Otórgale permisos de lectura y ejecución sobre la tabla gasto al usuario desarrollador */

GRANT SELECT ON [dbo].[gasto] TO desarrollador; -- Reemplaza "NombreDeTabla" con el nombre real de tu tabla y 
go                                         --  Reemplaza nombre UsuarioLectura por el usaurio real


-- 8. Asignar permisos de ejecución del procedimiento al usuario
GRANT EXECUTE ON dbo.InsertGasto TO desarrollador; -- Reemplaza "NombreProcedimiento" con el nombre real de tu procedimiento
GO

---- 9. Probar el INSERT utilizando el procedimiento almacenado

-- 10. Volver al contexto original
REVERT;

go
--- 11. revoke: revoca los permisos otorgados previamente a un usuario o rol .
revoke select, Update, Insert, Delete ON [dbo].[tipogasto] to desarrollador
go
