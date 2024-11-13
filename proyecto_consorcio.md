# Proyecto de Estudio
    

# PRESENTACIÓN (Proyecto Consorcio)

**Asignatura**: Bases de Datos I (FaCENA-UNNE)

**Integrantes**:
 * Dusicka, Marisol 
 * Miltos, Sonia
 * Morales, Alan Gaston
 * Mordacini Gianella

**Año**: 2024

## CAPÍTULO I: INTRODUCCIÓN

### Caso de estudio

El objetivo principal es explorar en profundidad ciertos temas como el manejo de permisos a nivel de usuarios de base de datos, procedimientos y funciones almacenadas y optimización de consultas a través de índices.
Estas herramientas desempeñan un papel esencial en la administración eficiente de datos
y la mejora del rendimiento de las consultas, lo que las convierte en un área de
interés fundamental para los profesionales y estudiantes de bases de datos.

### Definición o planteamiento del problema

Dado nuestro proyecto poder aplicar filtros o permisos para el acceso a la base de datos, realizar procedimientos y funciones dentro del motor y no en el codigo o aplicacion y verificar la efectividad de las consultas a traves de indices para base de datos con un amplio volumen de datos.

## CAPITULO II: MARCO CONCEPTUAL O REFERENCIAL

### **TEMA 1 Procedimientos y Funciones** 

+ **Procedimientos** 
Un procedimiento almacenado es un grupo de una o varias instrucciones, en nuestro caso Transact-SQL para SQL server, que se ejecutan secuencialmente algunas de sus caracteristicas son:

1. Aceptan parámetros de entrada y pueden devolver varios valores en forma de parámetros de salida al programa que realiza la llamada.

2. Contener instrucciones de programación que realicen operaciones en la base de datos, como también pueden contener llamadas a otros procedimientos.

3. Devolver un valor de estado a un programa que realiza una llamada para indicar si la operación se ha realizado correctamente o se han producido errores, y el motivo de estos.


**Ventajas de usar procedimientos almacenados**

* Tráfico de red reducido entre el cliente y el servidor: los comandos de un procedimiento se ejecutan en un único lote de código. Esto puede reducir significativamente el tráfico de red entre el servidor y el cliente porque únicamente se envía a través de la red la llamada que va a ejecutar el procedimiento.

* Mayor seguridad: varios usuarios y programas cliente pueden realizar operaciones en los objetos de base de datos subyacentes a través de un procedimiento, aunque los usuarios y los programas no tengan permisos directos sobre esos objetos subyacentes. El procedimiento controla qué procesos y actividades se llevan a cabo y protege los objetos de base de datos subyacentes. Esto elimina la necesidad de conceder permisos en cada nivel de objetos y simplifica los niveles de seguridad.

* Reutilización del código: el código de cualquier operación de base de datos redundante resulta un candidato perfecto para la encapsulación de procedimientos. De este modo, se elimina la necesidad de escribir de nuevo el mismo código, se reducen las inconsistencias de código y se permite que cualquier usuario o aplicación que cuente con los permisos necesarios pueda acceder al código y ejecutarlo.

* Mantenimiento más sencillo: cuando las aplicaciones cliente llaman a procedimientos y mantienen las operaciones de base de datos en la capa de datos, solo deben actualizarse los cambios de los procesos en la base de datos subyacente.

* Rendimiento mejorado: de forma predeterminada, un procedimiento se compila la primera vez que se ejecuta y crea un plan de ejecución que vuelve a usarse en posteriores ejecuciones. Como el procesador de consultas no tiene que crear un nuevo plan, normalmente necesita menos tiempo para procesar el procedimiento.

+ **Funciones** 
Al igual que las funciones de los lenguajes de programación, las funciones definidas por el usuario de SQL Server son rutinas que aceptan parámetros, realizan una acción y devuelven el resultado de esa acción como un valor. El valor devuelto puede ser un valor escalar único o un conjunto de resultados.

**Ventajas de las funciones definidas por el usuario**

* Programación modular: puede crear la función una vez, almacenarla en la base de datos y llamarla desde el programa tantas veces como desee.

* Ejecución más rápida: com pasa con los procedimientos almacenados, las funciones definidas por el usuario de Transact-SQL reducen el costo de compilación del código de Transact-SQL almacenando los planes en la caché y reutilizándolos para ejecuciones repetidas.

* Reducción del tráfico de red: una operación que filtra datos basándose en restricciones complejas que no se puede expresar en una sola expresión escalar se puede expresar como una función.

**Tipos de funciones**

* Funciones escalares : las funciones escalares definidas por el usuario devuelven un único valor de datos del tipo definido en la cláusula RETURNS. El tipo devuelto puede ser de cualquier tipo de datos excepto text, ntext, image, cursory timestamp.

* Funciones con valores de tabla: las funciones con valores de tabla definidas por el usuario devuelven un tipo de datos table. La tabla es el conjunto de resultados de una sola instrucción SELECT.

* Funciones del sistema : SQL Server proporciona numerosas funciones del sistema que se pueden usar para realizar diversas operaciones, estas no se pueden modificar.

* Funciones deterministas y no deterministas: las funciones deterministas siempre devuelven el mismo resultado cada vez que se llama con un conjunto específico de valores de entrada y tienen el mismo estado de la base de datos. Las funciones no deterministas pueden devolver resultados diferentes cada vez que se les llama con un conjunto específico de valores de entrada, incluso si el estado de la base de datos al que acceden sigue siendo el mismo.


**Diferencias entre procedimientos y funciones**

1. Tipo de retorno: una función siempre devuelve un valor, mientras que un procedimiento almacenado no es obligatorio que lo haga.

2. Parámetros: un procedimiento almacenado puede tener parámetros de entrada y salida, mientras que una función no puede tener parámetros de salida.

3. Llamadas: una función se puede llamar desde un procedimiento almacenado, pero no al revés.

4. Instrucciones :una función solo permite una instrucción SELECT, mientras que un procedimiento almacenado permite SELECT, INSERT, UPDATE y DELETE.

5. Transacciones: un procedimiento almacenado puede administrar transacciones, pero una función no.

6. Uso en declaraciones SELECT: una función se puede incrustar en una declaración SELECT, pero un procedimiento almacenado no.

### **TEMA 2 Manejo de Permisos a Nivel de Usuarios en Base de Datos**
El manejo de permisos a nivel de usuarios en bases de datos es fundamental para garantizar la seguridad, la integridad de los datos y el control de acceso a los recursos de una base de datos. A continuación, te proporcionaré un marco conceptual o referencial que te ayudará a comprender cómo se gestionan estos permisos.
1. Conceptos Básicos
Permisos:
Son derechos otorgados a los usuarios o roles para realizar acciones sobre objetos dentro de la base de datos (como tablas, vistas, procedimientos almacenados, etc.). Los permisos determinan lo que un usuario puede o no puede hacer dentro de la base de datos.
Usuarios:
En el contexto de bases de datos, un usuario es una entidad que se autentica en el sistema para interactuar con la base de datos. Un usuario puede tener uno o más roles asociados y puede tener permisos sobre varios objetos dentro de la base de datos.
Roles:
Los roles son colecciones de permisos que pueden ser asignadas a los usuarios para facilitar la gestión de permisos. Un rol puede ser asignado a varios usuarios, y a su vez, los roles pueden tener permisos definidos sobre objetos de la base de datos.
Objetos de la Base de Datos:
Son las entidades sobre las cuales se pueden asignar permisos. Los objetos más comunes son:
•	Tablas: Contienen los datos.
•	Vistas: Representan una proyección de datos de una o más tablas.
•	Procedimientos almacenados: Son bloques de código SQL que se ejecutan dentro del servidor de base de datos.
•	Índices: Son estructuras que permiten una búsqueda más eficiente de datos.
•	Secuencias: Son generadores de valores únicos, normalmente usados para generar claves primarias.



2. Tipos de Permisos
Los permisos que pueden asignarse a los usuarios o roles varían según el sistema de gestión de base de datos (SGBD), pero los más comunes incluyen:
•	SELECT: Permite leer datos de una tabla o vista.
•	INSERT: Permite agregar nuevos registros a una tabla.
•	UPDATE: Permite modificar los registros existentes de una tabla.
•	DELETE: Permite eliminar registros de una tabla.
•	EXECUTE: Permite ejecutar un procedimiento almacenado o función.
•	ALTER: Permite modificar la estructura de una tabla (agregar, eliminar columnas).
•	DROP: Permite eliminar objetos de la base de datos como tablas, vistas, procedimientos, etc.
•	GRANT: Permite otorgar permisos a otros usuarios o roles.
•	REVOKE: Permite revocar permisos previamente otorgados.

Alcance de la Gestión de Permisos
La gestión de permisos tiene un alcance fundamental dentro de cualquier organización que use bases de datos para asegurar el acceso adecuado a la información y protegerla de accesos no autorizados. El alcance de los permisos puede variar dependiendo del tipo de base de datos y del modelo de seguridad que se implemente.
Alcance de los Permisos en la Base de Datos:
•	Seguridad de Datos: La asignación correcta de permisos ayuda a proteger los datos, limitando el acceso solo a usuarios que realmente lo necesiten.
•	Seguridad a Nivel de Aplicación: Al controlar qué usuarios tienen acceso a qué datos o funcionalidades, los permisos protegen la aplicación de cambios no deseados en la base de datos, evitando vulnerabilidades.
•	Control de Integridad: Evitar que los usuarios realicen modificaciones inapropiadas que afecten la integridad de los datos o la estructura de la base de datos.
•	Cumplimiento de Normativas: En muchos sectores, existen regulaciones que exigen mantener registros detallados de los accesos y cambios realizados sobre los datos, lo que hace que la gestión de permisos sea clave en el cumplimiento de normativas.
Alcance de los Permisos a Nivel de Roles:
Los roles son esenciales para simplificar la gestión de permisos cuando hay muchos usuarios. Su alcance incluye:
•	Escalabilidad: Permite gestionar permisos de manera centralizada y escalable, ya que no es necesario otorgar permisos uno por uno.
•	Gestión Eficiente: Los roles agrupan permisos relacionados, lo que facilita la administración cuando se manejan grandes volúmenes de usuarios.
•	Flexibilidad: Permiten personalizar los niveles de acceso según las funciones del usuario en la organización.

### **Tema 3: Teoria sobre Optimizacion y Consulta a traves de indices**
 ¿Que es un indice?
Un indice es una estructura de datos que permite acelerar las operaciones de buqueda y recuperacion en una base de datos. Funciona de manera similar a un indice en un libro, permitiendo encontrar rapidamente las filas en una tabla.

 **Tipos de indices**
indice Primario
Asociado con la clave primaria de una tabla.

No permite valores duplicados ni nulos.

Se utiliza para identificar de manera unica cada fila de la tabla.

 indice unico
Garantiza que todos los valores en la columna sean unicos.

Permite un solo valor nulo.

Se utiliza para evitar la duplicacion de datos en una columna especifica.

 indice Compuesto
Incluye mas de una columna.

util para consultas que filtran y ordenan en varias columnas.

Mejora la eficiencia de las consultas que utilizan multiples columnas en la clausula WHERE.

2indice de Clave Foranea
Se aplica a las claves foraneas.

Mejora las operaciones de union (join) entre tablas relacionadas.

**Ventajas de los indices**
 Mayor Velocidad de Consulta: Aceleran las buquedas y recuperaciones de datos.

 Mejora en las Operaciones de Join: Hacen mas eficientes las consultas que unen varias tablas.

 Reduccion de Tiempo de Ejecucion: Las consultas se ejecutan mas rapidamente debido a la indexacion.

**Desventajas de los indices**
 Consumo de Espacio Adicional: Los indices ocupan espacio extra en la base de datos.

 Actualizaciones Mas Lentas: Insertar, actualizar o borrar registros puede ser mas lento debido a la necesidad de actualizar los indices.

 Complejidad de Mantenimiento: Requieren mantenimiento y monitoreo para asegurar su eficiencia.

**Buenas Practicas para el Uso de indices**
 Seleccionar Columnas Adecuadas: No todas las columnas necesitan un indice. Selecciona las mas consultadas.

 Monitorizar el Rendimiento: Usa herramientas de monitoreo para asegurarte de que los indices estan mejorando las consultas.

 Reindexar Periodicamente: Los indices pueden fragmentarse y necesitan ser reindexados para mantener el rendimiento.


### **TEMA 4 Triggers**

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

## CAPÍTULO III: METODOLOGÍA SEGUIDA 

El proyecto lo llevamos a cabo mediante la búsqueda individual de información respecto al tema asignado a cada miembro del grupo. Realizamos el diagrama de relación-entidad y nos dividimos en partes equitativa la investigación acerca de las diferentes técnicas de trabajo (Manejo de Permisos a Nivel de Usuarios, Procedimientos y funciones almacenadas, Triggers, optimización de consultas) y el desarrollo de las mismas. 
Fuimos proponiendo distintas fechas de reuniones para ir compartiendo lo desarrollado y acoplando las distintas partes del proyecto, eso lo hicimos de manera virtual para tener una mejor visión del código y la búsqueda de información. 
El informe lo realizamos entre todos ya que fuimos aportando ideas y uniendo lo investigado, así como la carga de datos ya que contiene muchas claves foráneas y se hacía imposible ir viendo los errores ya que algunas tablas dependen de otras.

**Herramientas Utilizadas**

* SQL Server.
* SQL Server Management Studio (SSMS): Ofrece interfaces gráficas para la gestión de permisos y roles en bases de datos 
* WhatsApp: Fue unos de los medios más utilizado para ir coordinando las reuniones, respondiendo consultas, y pasar información no solo del proyecto si no de la materia en sí. 
* Meet: Fue el medio que utilizamos para llevar a cabo algunas reuniones virtuales e ir compartiendo el proceso en la creación del proyecto ya que es una plataforma gratuita y que no requiere una conexión a internet muy buena.
* GitHub: fue la última herramienta en incorporar, porque fue donde cargamos los códigos para compartirnos y dimos permisos de colaborador a los profesores que desarrollan la materia.


## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 


### Diagrama relacional
![der](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/diagrama%20de%20entidad-relacion.png)

### Diccionario de datos

Acceso al documento [PDF](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/diccionario%20de%20datos.pdf) del diccionario de datos.


### **Desarrollo TEMA 1 Procedimientos y Funciones** 

Para el desarrollo de este tema se realizaron en primer lugar 3 procedimientos, uno que realiza un insert sobre la tabla gasto de nuestra base de dados del proyecto, otro que realiza un update sobre la tabla gasto y por último uno que realiza un delete sobre la tabla gasto.
Luego se pasa a las funciones que se realizaron 3 funciones que devuelven una tabla, en la que cada una realiza una operacion sobre la tabla gasto para un determinado consorcio, variando si se busca en un determinado año, si se busca entre un rango de fechas o si se busca discriminar por tipo de gasto.
Para finalizar se realizó un procedimiento y una funcion en la que ambos reciben un mismo tipo de parámetro, un id que refiere a un conserje, y la idea a probar es que ambas devuelvan los mismos resultados y comparando la eficiencia entre ellas.

En el siguiente enlace se encuentra el script sql referido a este tema

[Script Procedimientos y Funciones](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/script/Prodecimiento%20y%20Funciones/Prodecimientos.sql)

**Resultados**
+ Estructura del procedimiento InsertGasto

![Proced-InsertGasto](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/Procedimientos_Funciones/Procedimiento.jpg)

+ Estructura de la función FuncionCalcularEdad

![FuncionCalcularEdad](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/Procedimientos_Funciones/Funcion.jpg)

+ Ubicación de los procedimientos y funciones dentro de la base de datos

![Programabilidad](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/Procedimientos_Funciones/ubicacionProceYFunc.jpg)

+ Comparación de los planes de ejecución de una funcion y de un procedimiento que devuelven el mismo resultado

    * Plan de ejecución de la función FuncionCalcularEdad

    ![Plan-Funcion](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/Procedimientos_Funciones/PlanFuncion.jpg)

    * Plan de ejecución del procedimiento sp_CalcularEdadConBucle

    ![Plan-Procedimiento](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/Procedimientos_Funciones/PlanProcedimiento.jpg)

    * Resultado de ambas querys

        * Querys

        -Procedimiento 

        exec dbo.sp_CalcularEdadConBucle @idconserje=1

        -Funcion

        select c.apeynom ,dbo.FuncionCalcularEdad(c.idconserje) as edad  from conserje c


        ![Resultado](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/Procedimientos_Funciones/Resultado.jpg)


### **Desarrollo TEMA 2 Manejo de Permisos a Nivel de Usuarios en Base de Datos**

![Texto alternativo](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/PermisosUsuariosbd/Crear%20el%20usuario%20con%20permisos%20de%20Administrador.jpg)

![Texto alternativo](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/PermisosUsuariosbd/Crear%20el%20usuario%20con%20permisos%20de%20solo%20lectura.jpg)


![Texto alternativo](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/PermisosUsuariosbd/Crear%20el%20usuario%20con%20permisos%20de%20solo%20lectura_Parte2.jpg)

![Texto alternativo](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/PermisosUsuariosbd/INSERT%20utilizando%20datos%20a%20la%20tabla%20tipogasto.jpg)

![Texto alternativo](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/PermisosUsuariosbd/resultado_INSERT%20utilizando%20datos%20a%20la%20tabla%20tipogasto.jpg)


![Texto alternativo](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/PermisosUsuariosbd/ingreso%20registros%20a%20la%20tabla%20gastos.jpg)


![Texto alternativo](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/PermisosUsuariosbd/resultado_Ingreso%20registros%20a%20la%20tabla%20gastos.jpg)

[Script](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/script/Permiso%20de%20Usuarios/ScriptCompletoADMIN.sql)

### **Desarrollo TEMA 3: OptimizaciOn y Consultas con Indices**
Para el desarrollo de este tema, se implementaron varias estrategias de optimizaciOn utilizando Indices en nuestra base de datos del proyecto. A continuaciOn, se describen los procedimientos y consultas optimizadas que se realizaron:
En el siguiente enlace se encuentra el script sql referido a este tema

CreaciOn de una Copia de la Tabla sin Indices
Para demostrar la importancia de los Indices, primero crearemos una copia de la tabla gasto sin índices.

sql
-- Crear una copia de la tabla 'gasto' en una nueva tabla 'gasto_sin_indices'
SELECT *
INTO gasto_sin_indices
FROM 
 **Comparación de Consultas**
A continuaciOn, compararemos el rendimiento de una consulta en la tabla original con Indices y en la nueva tabla sin Indices.

Consulta en la Tabla Original
sql
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT *
FROM gasto
WHERE fechapago BETWEEN '2023-01-01' AND '2023-02-28';

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
AnAlisis de Resultados

plaintext
SQL Server Execution Times:
CPU time = 125 ms, elapsed time = 2899 ms.
Consulta en la Tabla sin Indices
sql
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT *
FROM gasto_sin_indices
WHERE fechapago BETWEEN '2023-01-01' AND '2023-02-28';

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
AnAlisis de Resultados

plaintext
SQL Server Execution Times:
CPU time = 125 ms, elapsed time = 2899 ms.
Consulta con Indice
sql
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT *
FROM gasto
WHERE fechapago BETWEEN '2023-01-01' AND '2023-02-28';

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
AnAlisis de Resultados

plaintext
CPU time: 125 ms (Sin Indice), 281 ms (Con Indice)
Elapsed time: 2899 ms (Sin Indice), 2619 ms (Con indice)

**Comparacion de Tiempos de Acceso con indice Agrupado y No Agrupado**
Consulta en la Tabla con indice Agrupado
sql
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT *
FROM gasto
WHERE fechapago BETWEEN '2023-01-01' AND '2023-02-28';

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
Análisis de Resultados

plaintext
SQL Server Execution Times:
CPU time = 250 ms, elapsed time = 2881 ms.
Consulta en la Tabla con Índice No Agrupado
sql
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT *
FROM gasto_sin_indices
WHERE fechapago BETWEEN '2023-01-01' AND '2023-02-28';

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
Analisis de Resultados

plaintext
CPU time: 110 ms, elapsed time = 2635 ms.


**Eliminar el indice no agrupado en la tabla 'gasto_sin_indices'**
DROP INDEX IDX_gasto_sin_indices_fechapago ON gasto_sin_indices;************
 Crear indice agrupado en la tabla 'gasto_sin_indices'
CREATE CLUSTERED INDEX IDX_Clustered_gasto_sin_indices_fechapago ON gasto_sin_indices(fechapago;

-SE VUELVE A COMPARAR LOS TIEMPOS DE ACCESOS AHORA CON EL INDICE AGRUPADO CREADO*

SET STATISTICS TIME ON;
SET STATISTICS IO ON;
-- Ejecutar la consulta en la tabla original con el indice existente
SELECT * FROM gasto WHERE fechapago BETWEEN '2023-01-01' AND '2023-02-28';
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

SET STATISTICS TIME ON;
Analisis de Resultados
CPU time:
Tabla Original con indice Existente: 328 ms
Tabla con indice Agrupado: 109 ms
Elapsed time:
Tabla Original con indice Existente: 2794 ms
Tabla con indice Agrupado: 2865 ms
Interpretacion
Tabla Original con indice Existente

 **Comparacion de los planos de ejecucion para los distintos tipos de indices**
    A continuacion, compararemos el rendimiento de una consulta en la tabla original con indices y en la nueva tabla sin indices.
    ![Texto alternativo]( https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/OPTIMIZACION%20_PLAN_EJECUCION/RESULTADOSSININDICES.jpg)
 

  se compara los tiempos de acceso con indices agrupaso y sin agrupar

   ![Texto alternativo](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/OPTIMIZACION%20_PLAN_EJECUCION/RESULTADOSCONINDICESINAGRUPAR.jpg)

 
     Eliminar el índice no agrupado en la tabla 'gasto_sin_indices'
DROP INDEX IDX_gasto_sin_indices_fechapago ON gasto_sin_indices;
Crear índice agrupado en la tabla 'gasto_sin_indices'
CREATE CLUSTERED INDEX IDX_Clustered_gasto_sin_indices_fechapago ON gasto_sin_indices(fechapago)
       se vuelve a comparar los tiempos de accesos ahora con el indice agrupado

  ![Texto alternativo](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/doc/OPTIMIZACION%20_PLAN_EJECUCION/RESULTADOSCONINDICESAGRUPADOS.jpg)

[Script](https://github.com/TongaCasla/Proyecto_Consorcio_BaseDatos1/blob/main/script/Optimizaci%C3%B3n%20de%20consultas%20a%20trav%C3%A9s%20de%20%C3%ADndices/SQLQueryIndices.sql)


### **Desarrollo TEMA 4 Triggers**
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

## CAPÍTULO V: CONCLUSIONES

Respecto al tema de **procedimientos y funciones** se puede concluir que ambos reducen el tráfico de red , favorecen la reutilización de código y por ende una reducción en el costo de procesamiento al ejecutar las sentencias.
Ahora bien también tienen sus diferencias y el uso de uno u otro va a depender de la necesidad o de lo que se deba realizar. Por ejemplo en el desarrollo se vio que se puede hacer que un procedimiento simule la ejecución de una función, pero como se pudo observar el costo de ejecución es mucho mayor que el de la función y eso se traduce también en la cantidad y complejidad de las sentencias de código, en la que ejecutando la función se obtiene un resultado igual con menos costo de procesamiento y un grado de complejidad mucho menor en su estrucura.
El manejo adecuado de **permisos a nivel de usuarios** es fundamental para la seguridad y la integridad de los datos en cualquier sistema de gestión de bases de datos. A través del uso de roles y permisos, es posible controlar el acceso a los objetos y funcionalidades de la base de datos de manera eficiente.
Quedó demostrado en estos resultados que el uso de **índices** mejora significativamente el rendimiento de las consultas en bases de datos. Los índices reducen el tiempo total necesario para acceder a los datos, lo que se traduce en una mayor eficiencia y rapidez en las operaciones. Aunque el uso de índices puede incrementar el tiempo de CPU debido al procesamiento adicional, el beneficio general en términos de tiempos de respuesta y accesibilidad es evidente. Implementar buenas prácticas en la creación y mantenimiento de índices, como la selección de columnas adecuadas y la reindexación periódica, es crucial para maximizar estos beneficios y asegurar un rendimiento óptimo de la base de datos.
En conclusion,respecto a los **triggers**, nos permiten automatizar acciones en respuesta a eventos de modificación de datos en una base de datos, utilizamos en nuestro caso, UPDATE para la modificacion de un evento, y DELETE para emitir un mensaje de errror de eliminación, mantenimiento de la integridad y consistencia de los datos. 


## BIBLIOGRAFÍA DE CONSULTA

* [Procedimientos-Microsoft](https://learn.microsoft.com/es-es/sql/relational-databases/stored-procedures/stored-procedures-database-engine?view=sql-server-ver16)

* [Funciones-Microsoft](https://learn.microsoft.com/es-es/sql/relational-databases/user-defined-functions/user-defined-functions?view=sql-server-ver16)

* [Creación de Usuario y Permisos con Procedimiento Almacenado en SQL Server](https://www.youtube.com/watch?v=cxfDphKYeIw)

* [Gestión de Usuarios - SQL Server (Con permisos LECTURA y ESCRITURA)](https://www.youtube.com/watch?v=9_7EoSa_4SMw)

* [Cómo crear usuarios y otorgar permisos con GRANT - REVOKE en SQL Server)](https://www.youtube.com/watch?v=B7RVdd0y1kA)

* Elmasri, R. y Navathe, S. B. (2010). Fundamentals of Database Systems. Addison-Wesley.

* Garcia-Molina, H., Ullman, J. D. y Widom, J. (2008). Database Systems: The Complete Book. Prentice Hall.

* Silberschatz, A., Korth, H. F., y Sudarshan, S. (2011). Database System Concepts. McGraw-Hill.

* Gates, B., Myhrvold, N., & Rinearson, P. (1996). The Road Ahead. Viking Penguin.

* [Trigger-mysql](https://codigofacilito.com/articulos/triggers_mysql)

* [Trigger](https://www.ecured.cu/Trigger )

