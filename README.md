Practica 1
Auditoría y verificación de seguridad en el manejo de cadenas en C

En esta práctica se realizó una auditoría al código original para poder identificar los diferentes errores y warnings que se generan al momento de compilarlo.

También se revisaron algunos problemas de seguridad que tiene el código y se relacionaron con las reglas de CERT C, para posteriormente realizar una refactorización y corregir los problemas encontrados.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1. Compilación inicial

Para realizar la compilación utilicé:

Compilador: GCC (GNU Compiler Collection)
Distribuidor: MSYS2 / MinGW-w64
Versión: 16.1.0
Estándar de C: C11
Opción utilizada: -std=c11

Al compilar el programa original con GCC se presentan errores debido a que algunas de las sintaxis utilizadas son únicamente para C++.
