%{
#include <stdio.h>
#include <string.h>
FILE *yyin;
%}

%%

"int"|"float"|"char"|"if"|"else"|"while"|"return"  { printf("KEYWORD: %s\n", yytext); }

[0-9]+(\.[0-9]+)?     { printf("NUMBER: %s\n", yytext); }

"=="|"<="|">="|"!="|">"|"<"   { printf("RELATIONAL OPERATOR: %s\n", yytext); }

"="|"+"|"-"|"*"|"/"   { printf("OPERATOR: %s\n", yytext); }

"("                  { printf("DELIMITER: %s\n", yytext); }
")"                  { printf("DELIMITER: %s\n", yytext); }
"{"                  { printf("DELIMITER: %s\n", yytext); }
"}"                  { printf("DELIMITER: %s\n", yytext); }
";"                  { printf("DELIMITER: %s\n", yytext); }
","                  { printf("DELIMITER: %s\n", yytext); }

\"[^\"]*\"           { printf("STRING: %s\n", yytext); }

"//".*               { printf("COMMENT (SINGLE LINE): %s\n", yytext); }

"/*"([^*]|\*+[^*/])*\*+"/"    { printf("COMMENT (MULTI LINE): %s\n", yytext); }

[a-zA-Z_][a-zA-Z0-9_]*  { printf("IDENTIFIER: %s\n", yytext); }

[ \t\n]+              ; // Ignore whitespace

.                     { printf("UNKNOWN: %s\n", yytext); }

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

    fclose(yyin);
    return 0;
}
