# Instrucciones BASH
En este archivo se presentan las intrucciones sobre cómo ejecutar los scripts que cubren lo indicado en la tarea.

## Consideraciones
Debido a las irregularidades de los URL de los archivos de Ecobici, se hicieron distintos scripts para la descarga.

1. El archivo [get_files.sh](get_files.sh) obtiene todos los archivos si los URL fueran regulares.
2. El archivo [get_files_2023.sh](get_files_2023.sh) obtiene los archivos con restricción de usar solamente la carpeta de 2023 como indicó el profesor.
3. Se creó un método que descarga todos los archivos de ecobici. A continuación los pasos:
  1. [get_all_paths.sh](get_all_paths.sh) Busca todos los paths en el código html de la página web usando expresiones regulares.
  2. [file_paths.txt](file_paths.txt) Almacena todos los paths encontrados en la página web.
  3. [download_files.sh](download_files.sh) Descarga todos los archivos desde las URL contenidas en el archivo file_paths.txt.

## Archivos

A continuación se enlistan los archivos del proceso, en orden.

|Archivo|Descripción
|-|-
|[consolidate_files.sh](consolidate_files.sh)|Consolida los archivos que fueron descargados y renombrados
|[run_scripts.sh](run_scripts.sh)|Ejecuta todos los scripts en orden:
|[get_files_2023.sh](get_files_2023.sh)|pregunta al usuario por un rango de año y mes del 2023, con ese rango obtiene los datos desde la página de Ecobici y los pone en la carpeta "data".
|[rename_files.sh](rename_files.sh)|Renombra los archivos descargados para que todos sigan la convención de nombre "AAAA MM.csv".
|[consolidate_files.sh](consolidate_files.sh)|Consolida todos los archivos en uno solo que se encontrará en la carpeta "data_consolidated"
|[statistics_files.sh](statistics_files.sh)|Genera estadísticas de los archivos en conteo de líneas y filas por archivo.
|[statistics_genero.sh](statistics_genero.sh)|Genera estadísticas del género valores únicos y conteo por cada valor.
|[statistics_edad.sh](statistics_edad.sh)|Genera estadísticas por edad, media, mediana, moda, máximo, mínimo, valores distintos.
|[statistics_bici.sh](statistics_bici.sh)|Genera cuántas bicicletas únicas hay y el top de bicicletas con más viajes.
|[statistics_CE_Retiro.sh](statistics_CE_Retiro.sh)|Genera cuántos centros de retiro existen y el top de centros con más retiros. Coinciden con los de arribo en cantidad de valores únicos  y nombres.
|[statistics_CE_Arribo.sh](statistics_CE_Arribo.sh)|Genera cuántos centros de arribo existen y el top de centros con más retiros. Coinciden con los de retiro en cantidad de valores únicos y nombres.


## Otros archivos

A continuación se enlistan otros archivos que se usaron durante la tarea.

|Archivo|Descripción
|-|-
|[get_headers.sh](get_headers.sh)|Lee los archivos en la carpeta "data" para obtener los encabezados y guardarlos en el archivo "headers.txt
