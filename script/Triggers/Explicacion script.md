**Explicación del script del tema 5: Triggers**

**Creación del trigger de UPDATE**
+ Creamos el trigger **TR_Gasto_consorcio**, en la cual modificamos en la tabla **gastos**, estas modificaiones se registranen una segunda tabla llamada **auditoria_gastos**. Para realizar dicha modificación itilizamos la sentencia UPDATE en la tabla **gasto**; además dentro de este trigger declaramos las variables en donde almacenaremos valores de las columas afectadas, tanto antes como después de la modificación.

+ Urilizamos un **JOIN** en **idgastos** para obtener datos de ambas versiones del registro. Para aclarar, **i** representa **inserted** en la que nos permite acceder a los datos de las columnas en su versión nueva (idgastos, idconsorcio, idlocalidad, idprovincia e importe). En cuanto a la fecha, devuelve la fecha en la que se hace la modificación, y con respecto a usuario devuelve el usuario que se encuentra loguado al momento de realizar las modificaciones.

**Creación del trigger de DELETE**
+ Creamos un trigger **TRG_Prevent_Delete** en la tabla **gastos** para evitar que se eliminen registros en la tabla; además, el **INSTEAD OF DELETE** intercepta cualquier operación de eliinación en la tabla **gastos** antes de que ocurra la eliminacióon; sumado a eso, **REISERROR** nos genera el mensaje de error que se muestra al usuario, teniendo como primer parámetro el *mensaje de error de eliminación*, como segundo parámetro tenemos *la severidad del error* siendo esta baja, y como último parámetro, nos indica el *estado del error*; con **ROLL TRANSACTION** cancelamos la transacción de la eliminación que activó el trigger asegurando que el registro no sea eliminado en la tabla **gastos**.
