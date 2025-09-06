%{
#include <stdio.h>
%}

%%
^bb.*bb$   { printf("String starts and ends with bb\n"); }
.*         { printf("String does not start and end with bb\n"); }
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}