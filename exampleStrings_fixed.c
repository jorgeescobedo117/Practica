
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char array1[] = "Foo" "bar";
char array2[] = { 'F', 'o', 'o', 'b', 'a', 'r', '\0' };

enum { BUFFER_MAX_SIZE = 1024 };

// se usaron saltos \n estándar en vez del formato R"..." de C++
const char* s1 = "\nHello\nWorld\n";
const char* s2 = "\nHello\nWorld\n";

// se cambia a int para retornar estado y se limpia el \n de forma segura
int gets_example_func(void) {
    char buf[BUFFER_MAX_SIZE];

    if (fgets(buf, sizeof(buf), stdin) == NULL) {
        return 1;
    }
    
    size_t len = strlen(buf);
    if (len > 0 && buf[len - 1] == '\n') {
        buf[len - 1] = '\0';
    }
    return 0;
}

// recibe un buffer externo para no modificar la constante __FILE__
const char *get_dirname(const char *pathname, char *out_buf, size_t out_size) {
    if (pathname == NULL || out_buf == NULL || out_size == 0) {
        return NULL;
    }

    snprintf(out_buf, out_size, "%s", pathname);
    
    char *slash = strrchr(out_buf, '/');
    if (slash) {
        *slash = '\0';
    }
    return out_buf;
}

// se reemplaza gets por fgets para evitar desbordamiento
void get_y_or_n(void) {  
    char response[8];

    printf("Continue? [y] n: ");  
    if (fgets(response, sizeof(response), stdin) != NULL) {
        if (response[0] == 'n') {
            exit(0);  
        }
    }
}

int main(int argc, char *argv[])
{
    char key[64];
    char response[8];
    // Se ajustan a 18 bytes para que quepa "01234567890123456" + '\0' sin truncamiento
    char array3[18];
    char array4[18];
    char array5[] = "01234567890123456";
    
    // Puntero const para que no deje modificar el literal
    const char *ptr_char = "new string literal"; 
    
    // Cambiado a size_t
    size_t size_array1 = strlen("аналитик");
    size_t size_array2 = 100;
    char analitic3[100] = "аналитик";

    // para evitar advertencias del compilador por variables no usadas
    (void)ptr_char;
    (void)size_array1;
    (void)size_array2;
    (void)analitic3;

    char dir_buffer[1024];
    if (get_dirname(__FILE__, dir_buffer, sizeof(dir_buffer)) != NULL) {
        puts(dir_buffer);
    }

    // validacion de argc antes de leer argv
    if (argc >= 3) {
        snprintf(key, sizeof(key), "%s = %s", argv[1], argv[2]);
    } else {
        snprintf(key, sizeof(key), "default = undefined");
    }

    if (fgets(response, sizeof(response), stdin) == NULL) {
        return 1;
    }
    
    get_y_or_n();

    printf("%s\n", array1);
    printf("%s\n", array2);
    puts(s1);
    puts(s2);

    // copia segura sin truncamiento
    snprintf(array3, sizeof(array3), "%s", array5);
    snprintf(array4, sizeof(array4), "%s", array3);
    
    array5[0] = 'M';

    return 0;
}