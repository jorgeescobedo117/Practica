Practica 1
Auditoría y verificación de seguridad en el manejo de cadenas en C

En esta práctica se realizó una auditoría al código original para poder identificar los diferentes errores y warnings que se generan al momento de compilarlo.

También se revisaron algunos problemas de seguridad que tiene el código y se relacionaron con las reglas de CERT C, para posteriormente realizar una refactorización y corregir los problemas encontrados.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1. Compilación inicial

Para realizar la compilación utilicé:
Compilador: GCC (GNU Compiler Collection)

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

