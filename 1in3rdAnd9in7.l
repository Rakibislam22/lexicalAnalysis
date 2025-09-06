%{
#include <stdio.h>
%}

%%
^[0-9]{2}1[0-9]{3}9[0-9]*$   { printf("Number has 1 in 3rd pos and 9 in 7th pos\n"); }
[0-9]+                       { printf("Number does not match\n"); }
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}