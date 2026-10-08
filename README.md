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
