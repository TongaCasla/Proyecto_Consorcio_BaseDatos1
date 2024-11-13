
+ **Procedimientos**

    * **InsetGasto**: recibe como parámetro la clave compuesta de consorcio (idprovincia,idlocalidad e idconsorcio), el periodo, la fecha del gasto, el id del tipo de gasto y el importe. Realiza el insert sobre la tabla gasto.

    * **UpdateGasto**: recibe como parámetro el id del gasto y los datos que se desean modificar sobre algun registro de consorcio, como el periodo, la fecha del gasto, el id del tipo de gasto o el importe, puede recibir nulos. Realiza el update sobre el registro que coincide con el id de gasto, modificando solo los datos ingresados como parámetro no nulos.

    * **DeleteGasto**: recibe como parámetro el id del gasto que se desea eliminar y luego ejecuta la sentencia eliminando el registro de gasto que coincide con el id ingresado por parámetro.

+ **Funciones**

    * **TotalConsorcioPorAnio**: recibe como parámetro la clave compuesta de consorcio (idprovincia,idlocalidad e idconsorcio) y el año en el que se quiere calcula el total de gasto. Devuelve como resultado una tabla con un registro

    * **TotalConsorcioPorAnioTipoGasto**: recibe como parámetro la clave compuesta de consorcio (idprovincia,idlocalidad e idconsorcio) y el año en el que se quiere calcula el total de gasto por tipo de gasto. Devuelve como resultado una tabla con la cantidad de registros como tipos de gastos se hayen registrados en la consulta.

    * **TotalConsorcioEntreFechas**: recibe como parámetro la clave compuesta de consorcio (idprovincia,idlocalidad e idconsorcio), una fecha desde y una fecha hasta que determina los limites a buscar sobre la tabla gasto. Devuelve como resultado una tabla con un registro.

+ **Procedimiento vs Función**

    * **FuncionCalcularEdad**: recibe como parámetro el id del conserje, y luego busca el registro del conserje que coincide con el id de parámetro y procede a calcular la edad y devuelve dicho resultado.

    * **sp_CalcularEdadConBucle**: recime como parámetro el id de un conserje con el que se empieza a trabajar.

        * Se define una tabla temporal edades que tiene como columnas un varchar que representaria un nombre y un otra columna que de entero que representa la edad.

        * Se declaran 3 variables id(int), edad(int) y nombre(varchar)

        * Se declara un cursor para seleccionar un conjunto de registros específicos en la tabla conserje donde el idconserje coincide con el valor del parámetro ingresado.

        * Se abre el cursor y se empieza la busqueda por la variable id.

        * Se ejecuta un bucle (while) que recorre hasta que el estado de busqueda sea igual a 0.

        * Las sentencias que se repiten en el bucle son:

            * Un select que sobre conserje bucando por la variable id que guarda en la variable edad el resultado de calcular la edad y en la variable nombre el nombre y apellido del conserje con dicho id.

            * Un insert sobre la tabla temporal edades con los valores actuales de las variables nombre y edad.

            * La sentencia que indica la busqueda del siguiente valor para la variable id.

        * Se cierra y se desasigna el cursor.

        * Devuelve como resultado la tabla temporal edades mediante una sentencia select.