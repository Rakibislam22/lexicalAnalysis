%{
#include <stdio.h>
%}
%%
0[xX][0-9a-fA-F]+        { printf("Hexadecimal: %s\n", yytext); }
0[bB][01]+               { printf("Binary: %s\n", yytext); }
0[0-7]+                  { printf("Octal: %s\n", yytext); }
0?[1-9][0-9]*              { printf("Decimal: %s\n", yytext); }
[ \t\n]+                 { /* Skip whitespace */ }
.                        { printf("Invalid Input: %s\n", yytext); }
%%
int yywrap() {
    return 1;
}
int main() {
    printf("Enter numbers separated by space or newline:\n");
    yylex();
    return 0;
}
