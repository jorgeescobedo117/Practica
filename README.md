                                                              Practica 1
Auditoría y verificación de seguridad en el manejo de cadenas en C

En esta práctica se realizó una auditoría al código original para poder identificar los diferentes errores y warnings que se generan al momento de compilarlo.

También se revisaron algunos problemas de seguridad que tiene el código y se relacionaron con las reglas de CERT C, para posteriormente realizar una refactorización y corregir los problemas encontrados.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1. Compilación inicial

Para realizar la compilación utilicé:
Compilador: GCC (GNU Compiler Collection)

<img width="718" height="432" alt="image" src="https://github.com/user-attachments/assets/e8d3b37f-f5e6-44e0-bfd8-341f9aac4947" />

Distribuidor: MSYS2 / MinGW-w64

<img width="386" height="211" alt="image" src="https://github.com/user-attachments/assets/cce67a43-34bc-40c8-aaf3-85a9c7313be4" />


Versión: 16.1.0
<img width="921" height="136" alt="image" src="https://github.com/user-attachments/assets/7918a77e-dbae-43db-a8f9-8037fa719a03" />

Estándar de C: C11

Opción utilizada: -std=c11

Al compilar el programa original con GCC se presentan errores debido a que algunas de las sintaxis utilizadas son únicamente para C++.

Opciones de compilación;

Compilar con GCC
GCC Lanzara errores por las sintaxis que son únicamente para c++ y avisos críticos sobre las funciones Get´s ()

<img width="921" height="32" alt="image" src="https://github.com/user-attachments/assets/5727d55e-8426-4234-8898-24e394c5df50" />

En cambio, Compilar con Clang seria :
Mostrar mensajes mas explicados adicionales sobre la las versiones y tipos nulos 

<img width="921" height="33" alt="image" src="https://github.com/user-attachments/assets/ab805159-19ae-4087-9f22-359aaac5388e" />

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                    Errores producidos y warnings producidos.

<img width="585" height="671" alt="image" src="https://github.com/user-attachments/assets/1e5513df-ea7c-4e33-88bb-2ee3f7685928" />

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Opción que permite obtener información adicional dentro del compilador.

<img width="921" height="35" alt="image" src="https://github.com/user-attachments/assets/08dc42ce-de6d-4724-9f8c-edc06aee7c36" />

<img width="921" height="758" alt="image" src="https://github.com/user-attachments/assets/215bdd57-a723-4770-88bc-d9d765bf99e2" />

--------------------------------------------------------

                                                      Reglas/recomendaciones CERT

<img width="611" height="712" alt="image" src="https://github.com/user-attachments/assets/3359d125-733c-40c6-b6f8-3e5367d8cdd7" />

-----------------------------------------------------------

                                                      Solución B — Refactorización

La razón principal en la que elegí la opción B es más para refactorizar y optimizar el código mientras que en la opción A se enfoca únicamente en silenciar las advertencias inmediatas del compilador, 
pero no resuelve los problemas estructurales ni previene vulnerabilidades bajo condiciones no previstas o cambios futuros en el código.

Esta solucion no solo soluciona los warnings del compilador, sino que arregla problemas reales de ejecución y seguridad que tenía el código original por ejemplo : 


1.	Evitar el Crash por FILE
3.	Evitar desbordamientos con fgets y snprintf: 
Quité la función gets() (insegura por definición) y reemplacé los strcpy/strcat por snprintf
4.	Validación de argumentos (argc / argv): Agregué un if (argc >= 3) antes de acceder a argv[1] y argv[2]. 
5.	Capacidad de los arreglos: Ajusté el tamaño de array3 y array4 a 18 bytes para que la cadena "01234567890123456" quepa completa con su \0 sin truncarse, eliminando también la advertencia del compilador.
6.	Tipos correctos: Usé const char* en los literales para evitar intentos de escritura no permitidos y cambié las variables de strlen a size_t para respetar los tipos nativos de C.


La versión corregida deberá compilar sin warnings

<img width="921" height="74" alt="image" src="https://github.com/user-attachments/assets/c86374bf-4684-4ace-9f52-ddda785674a0" />

----------------------------------------------------------
                                                     PARTE II — Tests y verificación

-----------------------------------------------------------

                                ¿Podemos demostrar que el código original presenta realmente el problema identificado?

Asi es, quedo demostrado que el código original presenta problemas identificados a la hora de compilar la prueba se somete a la prueba de gcc la intentar compilar este código , resulta varios errores de sintaxis que no son de C si no que también tienen parte de c++ .
También hay adventencias criticas de seguridad a la hora de implementar los gets , ya que en C es una función obsoleta 

                                ¿Podemos demostrar que nuestra modificación evita dicho problema?
                                              
Asi es , quedo demostrado que a la hora de comprobar la versión modificada esta no tienen ningún error de sintaxis o de exceso de memoria que pueda tronar el programa o vulnerarlo bajo las banderas de Wall , Wextra y Wpedantic , se ejecuta de forma estable.

---------------------------------------------------------------------------
                                          Diseño de pruebas
----------------------------------------------------------------------------                                       
Seleccione al menos cuatro problemas diferentes identificados durante la Parte I.
Para cada uno deberá diseñar una prueba o procedimiento de verificación.

--------------------------------------------------------------------------------
Caso de Prueba 1: Sintaxis y Conformidad con el Estándar C (Raw String Literal)
-------------------------------------------------------------------------------
<img width="544" height="77" alt="image" src="https://github.com/user-attachments/assets/f50ab64c-f1c2-4738-af3b-834a3a31ad9c" />

Problema: Uso de sintaxis propia de C++ (R"foo(...)") en el archivo fuente de C.
Objetivo: Verificar que el código respeta la especificación del estándar C (C11) durante la fase de compilación.
Tipo de análisis:  Análisis estático

<img width="921" height="128" alt="image" src="https://github.com/user-attachments/assets/d36c47c0-4444-42e4-bd67-dde10d78b388" />

Para la verificación de este Error se verifico con el comando: 

<img width="921" height="35" alt="image" src="https://github.com/user-attachments/assets/2083846b-2280-447d-b1c3-9d61b90f0ba4" />

<img width="517" height="98" alt="image" src="https://github.com/user-attachments/assets/34cceea2-f5a3-461b-8cff-c307b23669f1" />

<img width="538" height="45" alt="image" src="https://github.com/user-attachments/assets/aa9c6bd7-8d32-4595-aea1-6297724370ec" />

exampleStrings.c (Código Original)

<img width="921" height="71" alt="image" src="https://github.com/user-attachments/assets/efff49b5-7554-4387-bcd4-653146b56c80" />

exampleStrings_fixed.c (Corregido)

<img width="921" height="62" alt="image" src="https://github.com/user-attachments/assets/1b44a235-3e1f-4494-8d8f-32d900a0451e" />


-----------------------------------------------------------------
Caso de Prueba 2: Validación de Argumentos de Línea de Comandos (argc / argv)
------------------------------------------------------------------
Problema: Acceso directo e incondicional a argv[1] y argv[2] usando strcpy y strcat sin verificar el número de argumentos recibidos ni la capacidad
Objetivo: Comprobar la resiliencia del programa ante la ausencia de argumentos de escenarios nulo y entradas con cadenas excesivamente largas no se desborde
Tipo de Analisis : Análisis Dinámico (Prueba de estrés sin argumentos) 

<img width="590" height="165" alt="image" src="https://github.com/user-attachments/assets/ae16a0d5-9159-47e4-8a35-d84361bc83fe" />

Para la verificación de este Error se verifico con el comando:

 <img width="921" height="35" alt="image" src="https://github.com/user-attachments/assets/008dd644-02ca-437d-86d7-a1970cd02bc8" />

exampleStrings.c (Código Original)
<img width="863" height="173" alt="image" src="https://github.com/user-attachments/assets/82ac0db0-4824-4100-a3b0-539bdf0d2073" />

exampleStrings_fixed.c (Corregido)

<img width="826" height="336" alt="image" src="https://github.com/user-attachments/assets/40397bb3-c518-4867-a43e-fbd9b7e55b02" />


-----------------------------------------------------------------
Caso de Prueba 3: Inserción Segura de Datos por Entrada en métodos gets vs fgets
------------------------------------------------------------------

Problema: Uso de la función obsoleta e insegura gets(), la cual no limita la cantidad de caracteres leídos desde stdin

<img width="557" height="99" alt="image" src="https://github.com/user-attachments/assets/886cb603-a506-48bd-9d81-6cea8c50b265" />

Objetivo: verificar la protección contra ataques o desbordamientos al ingresar texto por consola hacia un buffer pequeño.

Técnica Aplicada: Análisis Estático (Inseguridad de funciones) y Análisis Dinámico

Para la verificación de este Error se verifico con el comando:

<img width="921" height="35" alt="image" src="https://github.com/user-attachments/assets/c6ee20e4-6b96-4607-9810-a01a65af0865" />

exampleStrings.c (Código Original)

<img width="807" height="248" alt="image" src="https://github.com/user-attachments/assets/fc3a51e8-1b97-4d40-80ac-74810fa47424" />

exampleStrings_fixed.c (Corregido)

<img width="791" height="363" alt="image" src="https://github.com/user-attachments/assets/8e799ee0-a740-4963-92c0-d0a197d2707a" />

---------------------------------------------------------------
Caso de Prueba 4 : Modificación de Literal de Cadena vía Puntero
---------------------------------------------------------------
Problema: Intentar escribir un carácter dentro de un literal de cadena mediante asignación por puntero
<img width="524" height="118" alt="image" src="https://github.com/user-attachments/assets/3ee2ef74-b3e8-45e6-9f57-fa4accc16ce7" />

Técnica Aplicada: Análisis Estático (const checking) y Análisis Dinámico (Detección de violación en .rodata).

Objetivo : Declarar el puntero como constante (const char *ptr_char) para que el compilador impida modificaciones en tiempo de compilación y eliminar la instrucción de escritura.
Para la verificación de este Error se verifico con el comando:

<img width="921" height="35" alt="image" src="https://github.com/user-attachments/assets/0d6791ed-39d7-41aa-81b7-eb0ecd469417" />

exampleStrings.c (Código Original)

<img width="921" height="68" alt="image" src="https://github.com/user-attachments/assets/b85f64a2-dcc2-4a56-968a-b4226044cc7b" />

exampleStrings_fixed.c (Corregido)

<img width="852" height="106" alt="image" src="https://github.com/user-attachments/assets/6014ed9e-5f92-4090-b5e6-5ca1af7cf57c" />

-------------------------------------------------------------------------------------------------------------
                                                   
                                                    Técnicas de Verificación
                                                   

--------------------------------------------------------------------------------------------------------------
1.- Análisis Estático (GCC -fanalyzer + Banderas de Inspección)
---------------------------------------------------------------
Descripción: Se revisa  el código fuente antes de la ejecución para detectar inconsistencias de tipos, accesos a punteros nulos, funciones obsoletas y violaciones a estándares 

Herramienta

<img width="921" height="38" alt="image" src="https://github.com/user-attachments/assets/851c0b1e-2ab0-4d3d-a768-e3ad9e2a0bf4" />

------------------------------------------------------------------
2.- Análisis Dinámico con Sanitizadores (AddressSanitizer / ASan)
------------------------------------------------------
Descripción: Para monitorear el acceso a la memoria en tiempo real durante la ejecución del programa. Intercepta y reporta caídas como desbordamientos de búfer en pila stack buffer 
Herramienta: 
1.-Se instala la dependencia  principalmente  con el comando :
<img width="502" height="36" alt="image" src="https://github.com/user-attachments/assets/f1677eea-0a12-424c-b141-a1bd5077f138" />

<img width="921" height="463" alt="image" src="https://github.com/user-attachments/assets/2d057ae9-5a3d-422e-8bf6-36038159d731" />

2.- En exampleStrings.c Ejecutamos el comando en la terminal para la capturacion del fallo crítico en tiempo de ejecución al ejecutar sin argumentos.

<img width="921" height="234" alt="image" src="https://github.com/user-attachments/assets/fc2c2ac1-7fca-4b63-a257-481e6e80ff12" />

3.- En exampleStrings_fixed.c: Al ejecutar el programa con y sin argumentos, e ingresar cadenas largas por entrada estándar, ASan confirmó que no existió ninguna fuga ni corrupción de memoria (salida 0).

----------------------------------------------------------------------------------------------------------------------

                                                         Evidencias

-----------------------------------------------------------------------------------------------------------------------


<img width="688" height="657" alt="image" src="https://github.com/user-attachments/assets/31d22451-c59c-42e0-a7d1-27bc46264760" />


-----------------------------------------------------------------------------------------------------------------------------

Muestras de Evidencias (Salidas de Consola)
--------------------------------------------------------------------------------------------------------

Evidencia 1: Error de Sintaxis Raw String (STR30-C)
Al intentar compilar exampleStrings.c bajo el estándar C11, el analizador estático aborta el proceso:

<img width="707" height="161" alt="image" src="https://github.com/user-attachments/assets/a2b29c96-a169-498f-af71-a9692f4f7d1d" />

-----------------------------------------------------------------------------------------------------------

Evidencia 2: Violación de Puntero Nulo en argv (ARR30-C)
Al ejecutar el binario del código original (sin parámetros) instrumentado con AddressSanitizer, el análisis dinámico detiene la ejecución e informa un fallo catastrófico por lectura de puntero NULL:

<img width="875" height="62" alt="image" src="https://github.com/user-attachments/assets/56e0cb6a-0e71-47c1-8dc3-ccf4ebcff56d" />

-------------------------------------------------------------------------------------------------------------

Evidencia 3: Desbordamiento de Búfer por gets() (STR35-C)
Al enviar una cadena de 30 caracteres hacia un arreglo de 8 bytes en exampleStrings.c, AddressSanitizer detecta corrupción del marco de pila (Stack Buffer Overflow):

<img width="990" height="391" alt="image" src="https://github.com/user-attachments/assets/90d3a783-17b6-4318-b144-4d1f9753c892" />

-------------------------------------------------------------------------------------------------------------------------

Evidencia 4: Modificación Ilegal de Memoria Protegida (STR30-C)
Al intentar escribir sobre un literal constante (ptr_char[0] = 'N'), el sistema operativo y ASan capturan la violación de la sección .rodata:

<img width="1465" height="108" alt="image" src="https://github.com/user-attachments/assets/325dad8c-f97b-4b56-9c99-6a9f73210fc2" />


------------------------------------------------------------------------------------------------------------------------------

                                                                      Tests de regresión


---------------------------------------------------------------------------------------------------------------------------------

Caso de Prueba 1: Sintaxis y Conformidad C11 (Raw String Literal)
------------------------------------------------------------------

Localización: s1 (Línea 22)

Regla CERT: STR30-C

Test 1: Verificación de Compilación

<img width="823" height="256" alt="image" src="https://github.com/user-attachments/assets/94f068e0-421c-417c-88b2-286d68f74c17" />


<img width="576" height="138" alt="image" src="https://github.com/user-attachments/assets/bc8ce96f-376d-453e-9a63-e67b793adcef" />

---------------------------------------------------------------------


Caso de Prueba 2: Validación de Argumentos argc / argv
----------------------------------------------------------
Localización: main() – argv (Línea 77)

Regla CERT: ARR30-C

Test 2: Ejecución sin Argumentos

<img width="924" height="195" alt="image" src="https://github.com/user-attachments/assets/9db34afc-4cca-4afa-9326-035a4972d904" />


<img width="543" height="122" alt="image" src="https://github.com/user-attachments/assets/1cb47a92-065e-4e71-9aa6-7ae1cfa7f911" />

-------------------------------------------------------------------------


Caso de Prueba 3: Entrada Segura de Datos por Consola (gets vs fgets)
----------------------------------------------------------------------
Localización: get_y_or_n() (Línea 49)

Regla CERT: STR35-C

Test 3: Inyección de Cadena Larga en stdin

<img width="1171" height="294" alt="image" src="https://github.com/user-attachments/assets/5af79765-5e96-406f-97c3-7c2ecb3a0c01" />


<img width="536" height="85" alt="image" src="https://github.com/user-attachments/assets/f1fde4b2-e105-4d21-aa79-d5d6889ead98" />

--------------------------------------------------------------------------

Caso de Prueba 4: Proteccion de Memoria de Solo Lectura (ptr_char)
--------------------------------------------------------------------------

Localización: main() – ptr_char (Línea 93)

Regla CERT: STR30-C

Test 4: Modificación de Puntero Constante

<img width="1020" height="304" alt="image" src="https://github.com/user-attachments/assets/29bd298b-f5eb-465d-94ab-fec4a9c900d1" />

<img width="499" height="73" alt="image" src="https://github.com/user-attachments/assets/1d9eb865-361f-4e96-b066-d2a589bbb4fd" />

------------------------------------------------------------------------------------------------------

                                                      Uso de Inteligencia Artificial  12 y 13 

--------------------------------------------------------------------------------------------------------

Herramientas Utilizadas
Herramientas de IA: Gemini / ChatGPT.

Se estuvo preguntando por cada opción que pueda parecer mas directa 

<img width="950" height="576" alt="image" src="https://github.com/user-attachments/assets/7c757d8c-dd2b-4497-abcf-cf84a39cf65f" />

Tareas en las que se utilizó
1. Identificación Inicial de Vulnerabilidades: Revisión del código original exampleStrings.c para mapear los fallos

2 .sugerencia de Pruebas de Regresión: Generación de estructuras de prueba en Bash y propuesta de escenarios límite

3. Diagnóstico de Errores del Entorno: Interpretación de mensajes emitidos por el compilador gcc y por el linker

----------------------------------------------------------------------------------------------------------------
Cada regla CERT sugerida por la IA fue verificada directamente en la documentación oficial de la SEI CERT C Coding Standard.
----------------------------------------------------------
Pruebas de Compilacion
---------------------------------------------------------------
código compilando con el estándar estricto C11 (-std=c11) y el nivel máximo de advertencias (-Wall -Wextra -Wpedantic) usando GCC 13/16 en el entorno UCRT64.

Ejemplo Relevante de Propuesta Incorrecta 
-----------------------------------------------------------------
Durante el refactorizado para corregir el desbordamiento de búfer y las copias de cadenas, la IA sugirió la función strncpy:

// Propuesta insegura generada inicialmente por la IA:
strncpy(array3, array5, sizeof(array3));

----------------------------------------------------
Problema Identificado: Al revisar la norma CERT STR32-C y la documentación de C11, se detectó que si array5 es igual o más grande que el tamaño del destino (sizeof(array3)), strncpy no escribe el carácter nulo terminal (\0). Esto dejaba la cadena desprotegida ante subsecuentes operaciones de lectura de cadenas.
--------------------------------------------------------------------
Solución Corregida Aplicada: Se descartó la sugerencia de la IA y se reemplazó por snprintf, el cual garantiza que la cadena siempre quede terminada en \0:
---------------------------------------------------------------------------------

                                                                Tiempo Necesario para Realizar el Ejercicio

--------------------------------------------------------------------------------------------
Tiempo Total Estimado: ~6 horas  (divididos entre el análisis del código fuente original, la refactorización conforme a CERT C, la configuración de la suite de regresión en Bash y la redacción de evidencias de auditoría).

