%{
#include <stdio.h>
%}

%%

.*aa$   { printf("String ends with aa\n"); }

.*      { printf("String does not end with aa\n"); }

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}