// gcc -O3 -march=native -funroll-loops -Ofast c_strbld.c -o ..\exe\c_strbld.exe
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

typedef struct StringBuilder {
    char* str;
    size_t len;
    size_t cap;
} StringBuilder;

StringBuilder* newStringBuilder() {
    StringBuilder* sb = (StringBuilder*)malloc(sizeof(StringBuilder));
    sb->len = 0;
    sb->cap = 100;
    sb->str = (char*)malloc(sb->cap);
    sb->str[0] = '\0';
    return sb;
}

void append(StringBuilder* sb, const char* newStr) {
    size_t newLen = strlen(newStr);
    while (sb->len + newLen >= sb->cap) {
        sb->cap *= 2;
        sb->str = (char*)realloc(sb->str, sb->cap);
    }
    strcpy(sb->str + sb->len, newStr);
    sb->len += newLen;
}

void deleteStringBuilder(StringBuilder* sb) {
    free(sb->str);
    free(sb);
}

void Test(size_t num) {
    StringBuilder* sb = newStringBuilder();
    append(sb, "");
    size_t i = 0L;
    printf("  C");

    clock_t startTime = clock();
    
    for (i = 1L; i <= num; i++) {
        char buffer[20];
        sprintf(buffer, " C %d", i);
        append(sb, buffer);
    }

    clock_t elapsedTime = clock() - startTime;
    int minutes = (int)(elapsedTime / (CLOCKS_PER_SEC * 60));
    int seconds = (int)((elapsedTime / CLOCKS_PER_SEC) % 60);
    int milliseconds = (int)((elapsedTime * 1000) / CLOCKS_PER_SEC);


	size_t length = strlen(sb->str);
    printf("  %d:%d:%d Iter %ld: Len %d\n", minutes, seconds, milliseconds, i-1, length);

    FILE* file = fopen("out/c_output.txt", "w");
    if (file != NULL) {
        fputs(sb->str, file);
        fclose(file);
    } else {
        printf("Error saving string to file.\n");
    }


   /*
    FILE *file = fopen("out/c_output.txt", "w");
    if (file != NULL)
    {
		const size_t len = strlen(sb->str);
		const size_t chunk_size = 1024 * 20; 
		for (size_t i = 0; i < len; i += chunk_size)
		{
			size_t remaining_chars = len - i;
			size_t chars_to_write = remaining_chars < chunk_size ? remaining_chars : chunk_size;
			if (fwrite(sb->str + i, sizeof(char), chars_to_write, file) != chars_to_write)
			{
				printf("Error writing string to file.\n");
				break;
			}
			//printf("%zu ", i);
		}
		fclose(file);
    }
    else
    {
        printf("Error opening file.\n");
    }
  */  
    deleteStringBuilder(sb);
}

int main(int argc, char* argv[]) {
    if (argc != 2) {
        printf("Usage: %s <num>\n", argv[0]);
        return 1;
    }

    size_t num = atol(argv[1]);
    Test(num);
    return 0;
}