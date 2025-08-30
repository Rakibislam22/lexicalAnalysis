%{
#include <stdio.h>
%}

%%
^abb$         { printf("Matched: abb\n"); }
^a*b+$        { printf("Matched: a*b+\n"); }
^a$           { printf("Matched: a\n"); }
^[^\n]+$      { printf("Invalid: %s\n", yytext); }
\n            { /* ignore empty lines */ }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter input: ");
    yylex();
    return 0;
}
