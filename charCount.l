%{
#include <stdio.h>
int v = 0;
%}

%%
.					v++;
\n 					return 0;

%%

int yywrap(){}
int main(){

printf("Enter String: ");

yylex();
printf("\nNumber of Char = %d ", v);

return 0;
}