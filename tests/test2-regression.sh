echo -e "\n--- PRUEBA 2: Manejo de argv sin argumentos (ARR30-C) ---"

if [ -f ./orig.exe ]; then
    ./orig.exe > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo -e "Código Original:  ${RED}DETECTÓ PROBLEMA (Crash / Segmentation Fault por NULL pointer)[${NC}"
    else
        echo -e "Código Original:  ${GREEN}Pasó inesperadamente${NC}"
    fi
else
    echo -e "Código Original:  ${RED}No se pudo generar el ejecutable para la prueba${NC}"
fi

./fixed.exe > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e "Código Corregido: ${GREEN}PASÓ CORRECTAMENTE (Manejo seguro de argc < 3)${NC}"
else
    echo -e "Código Corregido: ${RED}FALLÓ${NC}"
fi