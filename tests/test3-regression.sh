echo -e "\n--- PRUEBA 3: Desbordamiento de buffer en stdin (STR35-C) ---"

if [ -f ./orig.exe ]; then
    echo -e "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\ny" | ./exampleStrings.exe > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo -e "Código Original:  ${RED}DETECTÓ PROBLEMA (Crash por Stack Smashing / gets)[${NC}"
    else
        echo -e "Código Original:  ${GREEN}Pasó inesperadamente${NC}"
    fi
fi

echo -e "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\ny" | ./fixed.exe > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e "Código Corregido: ${GREEN}PASÓ CORRECTAMENTE (fgets trunca entrada sin colapsar)${NC}"
else
    echo -e "Código Corregido: ${RED}FALLÓ${NC}"
fi