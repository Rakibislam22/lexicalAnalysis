%{
#include <stdio.h>
#include <string.h>
FILE *yyin;
int key=0,num=0,rop=0,op=0,de=0,s=0,mc=0,sc=0,id=0,un=0;
%}

%%

"int"|"float"|"char"|"if"|"else"|"while"|"return"|"printf"|"double"  { key++; }

[0-9]+(\.[0-9]+)?     num++;

"=="|"<="|">="|"!="|">"|"<"   rop++;

"="|"+"|"-"|"*"|"/"   op++;

"("|")"|"{"|"}"|";"|","      de++;

\"[^\"]*\"           s++;

"//".*               sc++;

"/*"([^*]|\*+[^*/])*"*/"     mc++;

[a-zA-Z_][a-zA-Z0-9_]*  	id++;

[ \t\n]+              ; 

.                     un++;

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

    printf("KEYWORD: %d\n", key);
    printf("NUMBER: %d\n", num);
    printf("RELATIONAL OPERATOR: %d\n", rop);
    printf("OPERATOR: %d\n", op);
    printf("DELIMITER: %d\n", de);
    printf("STRING: %d\n", s);
    printf("COMMENT (SINGLE LINE): %d\n", sc);
    printf("COMMENT (MULTI LINE): %d\n", mc);
    printf("IDENTIFIER: %d\n", id);
    printf("UNKNOWN: %d\n", un);

    fclose(yyin);
    return 0;
}
