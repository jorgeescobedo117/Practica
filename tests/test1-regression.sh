
echo -e "\n--- PRUEBA 1: Sintaxis C11 y Compilación (STR30-C) ---"

gcc -std=c11 -Wall -Wextra -c ../exampleStrings.c -o ./orig.o 2>/dev/null
if [ $? -ne 0 ]; then
    echo -e "Código Original:  DETECTÓ PROBLEMA Error de compilación "
else
    echo -e "Código Original:  Compiló inesperadamente"
fi

gcc -std=c11 -Wall -Wextra -Wpedantic -c ../exampleStrings_fixed.c -o ./fixed.o 2>/dev/null
if [ $? -eq 0 ]; then
    echo -e "Código Corregido: PASÓ CORRECTAMENTE (Compilación limpia C11)"
else
    echo -e "Código Corregido: FALLÓ EN COMPILACIÓN"
fi
rm -f ./orig.o ./fixed.o

# Compilación de binarios para las pruebas dinámicas
# (Para el código original se compila sin banderas estrictas de C11 para omitir la sintaxis Raw String y poder probar los crashes de memoria)
gcc ../exampleStrings.c -o ./orig.exe 2>/dev/null
gcc -std=c11 -Wall -Wextra ../exampleStrings_fixed.c -o ./fixed.exe 2>/dev/null
