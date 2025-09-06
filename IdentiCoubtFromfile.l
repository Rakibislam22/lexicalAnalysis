%{
#include <stdio.h>
FILE *yyin;

int id_count=0;
%}

%%
[a-zA-Z_][a-zA-Z0-9_]*   { id_count++; }
.|\n                     ;
%%


int yywrap() {
    return 1;
}

int main(int argc, char **argv) {
    yyin = fopen("input.txt", "r");
    if (!yyin) {
        perror("Failed to open input.txt");
        return 1;
    }
    yylex();
    printf("Total identifiers: %d\n", id_count);
    fclose(yyin);
    return 0;
}