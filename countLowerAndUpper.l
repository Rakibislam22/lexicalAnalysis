%{
#include <stdio.h>
int up = 0;
int low = 0;
%}

%%
[A-Z]			up++;
[a-z]			low++;
.			;
\n 			return 0;

%%

int yywrap(){}
int main(){

printf("Enter String: ");

yylex();
printf("\nNumber of UpperCase = %d \nNumber of LowerCase = %d \n", up, low);

return 0;
}