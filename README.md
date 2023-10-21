# ecobici

## Introducción
El objetivo de esta tarea es que practiquen sus skills en bash, y en R. 

## Instrucciones
Con la base de datos de [ecobici](https://ecobici.cdmx.gob.mx/datos-abiertos/), con los datos de enero a junio de 2023, se requiere que: 

### Bash 
Con bash haremos el pre-procesamiento de la base de datos. 
- Generen un script para descargar los datos, y los ponga en la carpeta `data` (dentro del root del repositorio)
  - Tiene que ser configurable para que se puedan modificar los rangos de fechas, en caso que se quiera modificar a todo el año 2022 por ejemplo.
  - El script tiene que generar la carpeta si no existe.
- Peguen las bases de datos en un solo archivo. (cuidado con los headers)
- Generen conteos totales para verificar que el pegado de todos los meses está hecho correctamente. 
- Calcular estadísticos (en bash) de las variables que tengan sentido, esto es. 
	- En caso de categorías
		- Encontrar todas las categorías (hay outliers?)
		- Calcular los conteos por categoría 
	- En caso de variables numéricas encontrar descriptivos que permitan entender el comportamiento de las variables y si existen outliers.
- Hacer el calculo de la hora de retiro y hora de arribo, esto es, quiero saber la hora (0-23) de cada una de las columnas

### R 
Con `dplyr`, queremos generar nuevas columnas y llegar a graficar cosas interesantes de la base de datos. 
- ¿Cuál es el tiempo promedio de recorrido?
- ¿Cuál es el tiempo promedio de recorrido por sexo?
- ¿Cuál es el tiempo promedio de recorrido por hora? (responder con una gráfica)
- ¿Cómo es la distribución de recorridos por día de la semana? (conteo por día)
- ¿Cuáles son los recorridos más comunes y cómo se distribuye la frecuencia (or-dest)? 
- Escriban 5 preguntas más y respóndanlas.

### Comentarios
- Sus scripts deben de estar en una carpeta correspondiente a cada lenguaje, `R` y `bash`. 
- Recuerden el uso de paths relativos, no absolutos.
- Agreguen un readme a cada lenguaje de programación con instrucciones de cómo correr cada parte del mismo.
