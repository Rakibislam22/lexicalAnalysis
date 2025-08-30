%{
#include <stdio.h>
%}

%%

[/]{1}[/]{1}[a-z A-Z0-9]*          { printf("Single-line comment\n"); }
[/]{1}[*]{1}[a-z A-Z0-9]*[*]{1}[/]{1}   { printf("Multi-line comment\n"); }
.*                          { printf("This is NOT a comment.\n"); }

%%

int yywrap() { return 1; }

int main() {
    printf("Enter code (Ctrl+D to stop):\n");
    yylex();
    return 0;
}