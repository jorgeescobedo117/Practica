# ------------------------------------------------------------------------------
# TEST 4: Modificación de Literal vía Puntero (STR30-C - ptr_char)
# ------------------------------------------------------------------------------
echo -e "\n--- PRUEBA 4: Modificación de literal constante (STR30-C) ---"

if [ -f ./orig.exe ]; then
    ./orig.exe arg1 arg2 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo -e "Código Original:  ${RED}DETECTÓ PROBLEMA (Crash por modificación de .rodata)[${NC}"
    else
        echo -e "Código Original:  ${GREEN}Pasó inesperadamente${NC}"
    fi
fi

./fixed.exe arg1 arg2 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e "Código Corregido: ${GREEN}PASÓ CORRECTAMENTE (Protegido con const char* / Sin accesos inválidos)${NC}"
else
    echo -e "Código Corregido: ${RED}FALLÓ${NC}"
fi

# Limpieza de ejecutables temporales
rm -f ./orig.exe ./fixed.exe