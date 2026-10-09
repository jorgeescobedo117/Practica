echo "=========================================================="
echo "         EJECUTANDO PRUEBAS DE REGRESIÓN (C11)            "
echo "=========================================================="

# ------------------------------------------------------------------------------
# TEST 1: Sintaxis y Conformidad con C11 (STR30-C - Raw String)
# ------------------------------------------------------------------------------
echo -e "\n--- PRUEBA 1: Sintaxis C11 y Compilación (STR30-C) ---"

gcc -std=c11 -Wall -Wextra -c ../exampleStrings.c -o ./orig.o 2>/dev/null
if [ $? -ne 0 ]; then
    echo -e "Código Original:  ${RED}DETECTÓ PROBLEMA (Error de compilación por R\"...\")[${NC}"
else
    echo -e "Código Original:  ${GREEN}Compiló inesperadamente${NC}"
fi

gcc -std=c11 -Wall -Wextra -Wpedantic -c ../exampleStrings_fixed.c -o ./fixed.o 2>/dev/null
if [ $? -eq 0 ]; then
    echo -e "Código Corregido: ${GREEN}PASÓ CORRECTAMENTE (Compilación limpia C11)${NC}"
else
    echo -e "Código Corregido: ${RED}FALLÓ EN COMPILACIÓN${NC}"
fi
rm -f ./orig.o ./fixed.o

# Compilación de binarios para las pruebas dinámicas
# (Para el código original se compila sin banderas estrictas de C11 para omitir la sintaxis Raw String y poder probar los crashes de memoria)
gcc ../exampleStrings.c -o ./orig.exe 2>/dev/null
gcc -std=c11 -Wall -Wextra ../exampleStrings_fixed.c -o ./fixed.exe 2>/dev/null