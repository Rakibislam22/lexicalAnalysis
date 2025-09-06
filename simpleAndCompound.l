%{
#include <stdio.h>
%}

%%
.*(and|but|or|so|because|although).*   { printf("Compound sentence\n"); }
.*                                     { printf("Simple sentence\n"); }
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}