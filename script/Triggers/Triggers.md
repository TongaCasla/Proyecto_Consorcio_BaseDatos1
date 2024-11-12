**TEMA 5 Triggers**

Un trigger, también conocido como disparador es un conjunto de sentencias SQL las cuales se ejecutan de forma automática cuando ocurre algún evento que modifique a una tabla, no a una modificación de estructura, no a una modificación en cuando a los datos almacenados, es decir, hablamos de modicicación cuando se ejecute una sentencia INSERT, UPDATE o DELETE. Para agregar, podemos decir que, para definir un trigger de deberá e specificar las condiciones bajo las que el trigger será ejecutado y especificar las acciones que se realizarán cuando el trigger se ejecute.

Podemos programar los triggers de tal manera que se ejecuten antes o después, de dichas sentencias.
**BEFORE INSERT** Acciones a realizar antes de insertar uno más o registros en una tabla.
**AFTER INSERT** Acciones a realizar después de insertar uno más o registros en una tabla.
**BEFORE UPDATE** Acciones a realizar antes de actualizar uno más o registros en una tabla.
**AFTER UPDATE** Acciones a realizar después de actualizar uno más o registros en una tabla.
**BEFORE DELETE** Acciones a realizar antes de eliminar uno más o registros en una tabla.
**AFTER DELETE** Acciones a realizar después de eliminar uno más o registros en una tabla.

Podemos ver esto como una relación uno a muchos, una tabla puede poseer muchos triggers y un trigger le pertenece única y exclusivamente a una tabla.

**Sentencias**
+ Para crear o eliminar un disparador, se emplean las sentencias CREATE TRIGGER y DROP TRIGGER.
Debido a que un disparador está asociado con una tabla en particular, no se pueden tener múltiples disparadores con el mismo nombre dentro de una tabla. También se debería tener en cuenta que el espacio de nombres de los disparadores puede cambiar en el futuro de un nivel de tabla a un nivel de base de datos, es decir, los nombres de disparadores ya no sólo deberían ser únicos para cada tabla sino para toda la base de datos. Para una mejor compatibilidad con desarrollos futuros, se debe intentar emplear nombres de disparadores que no se repitan dentro de la base de datos.

Hay otras limitaciones en los tipos de disparadores que pueden crearse. En particular, no se pueden tener dos disparadores para una misma tabla que sean activados en el mismo momento y por el mismo evento. Por ejemplo, no se pueden definir dos BEFORE INSERT o dos AFTER UPDATE en una misma tabla. Es improbable que esta sea una gran limitación, porque es posible definir un disparador que ejecute múltiples sentencias empleando el constructor de sentencias compuestas BEGIN... END luego de FOR EACH ROW.

**Componetes principales**
+ La estructura básica de un trigger es:
* Llamada de activación: es la sentencia que permite "disparar" el código a ejecutar.
* Restricción: es la condición necesaria para realizar el código. Esta restricción puede ser de tipo condicional o de tipo nulidad.
* Acción a ejecutar:* es la secuencia de instrucciones a ejecutar una vez que se han cumplido las condiciones iniciales.

**Limitaciones**
* El disparador no puede referirse a tablas directamente por su nombre, incluyendo la misma tabla a la que está asociado. Sin embargo, se pueden emplear las palabras clave OLD y NEW. OLD se refiere a un registro existente que va a borrarse o que va a actualizarse antes de que esto ocurra. NEW se refiere a un registro nuevo que se insertará o a un registro modificado luego de que ocurre la modificación.
* El disparador no puede invocar procedimientos almacenados utilizando la sentencia CALL, es decir, que no se puede utilizar un procedimiento almacenado para eludir la prohibición de referirse a tablas por su nombre.

**Tipos de Triggers**
Existen dos tipos de disparadores que se clasifican según la cantidad de ejecuciones a realizar:
* Row Triggers(o Disparadores de fila): son aquellas que se ejecutaran n-veces si se llama n-veces desde la tabla asociada al trigger.
* Statement Triggers (o Disparadores de secuencia): son áquellos que sin importar la cantidad de veces que se cumpla con la condición, su ejecución es única.

**Ventajas de Utilizar triggers**
* Con los triggers podemos validar todos aquellos valores los cuales no pudieron ser validados mediante un constraints, asegurando así la integreidad de los datos.
* Los triggers nos permitirán ejecutar reglas de negocios.
* Utilizando la combinación de eventos nosotros podemos realizar acciones sumamente complejas.
* Además nos permitirán llevar un control de los cambios realizados en una tabla. Para esto nos debemos de apoyar de una segunda tabla.

**Desventajas de Utilizar triggers**
* Los triggers al ejecutarse de forma automática puede dificultar llevar un control sobre qué sentencias SQL fueron ejecutadas.
* También incrementa la sobrecarga del servidor. Un mal uso de triggers puede tornarse en respuestas lentas por parte del servidor.

**Desarrollo TEMA 5 Triggers**
Realizamos un evento que modifique a una tabla llamada gasto, como por ejemplo, en la tabla gastos realizamos una modificicación en el importe de un determinado idgasto, para esto nos apoyamos de una segunda tabla a la que llamamos auditoria_gasto para la inserción de las nuevas modificaciones realizadas; para esto utilizamos la sentencia UPDATE. 

* En el siguiente enlace se encuentra el script sql referido a este tema
[Sql Triggers](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/script/Triggers/Triggers.sql)

**Resultados**
* Estructura del select de la tabla gastos
![Resultados de los gastos](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/Imagenes%20Triggers/Ejecucion%20tabla%20gasto.JPG)

* Estructura de modificacion de la tabla gastos
![Ejecucion de modificaion](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/Imagenes%20Triggers/Ejecucion%20de%20modificacion.JPG)

* Estructura del select de la tabla auditoria_gastos
![Resultados modificados](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/Imagenes%20Triggers/Resultados%20de%20la%20modificacion.JPG)

* Etructura de mensaje de error de eliminación
![Mensaje de error](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/Imagenes%20Triggers/Mensaje%20de%20error%20de%20eliminacion.JPG)

________________________________________________________________________________________________________________________________________
En conclusion,respecto a los trigger, nos permiten automatizar acciones en respuesta a eventos de modificación de datos en una base de datos, utilizamos en nuestro caso, UPDATE para la modificacion de un evento, y DELETE para emitir un mensaje de errror de eliminación, mantenimiento de la integridad y consistencia de los datos. 
________________________________________________________________________________________________________________________________________

**Bibliografía**
https://codigofacilito.com/articulos/triggers_mysql
https://www.ecured.cu/Trigger 