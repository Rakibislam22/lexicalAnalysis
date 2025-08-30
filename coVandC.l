%{
#include <stdio.h>
int v = 0;
int c = 0;
%}

%%
[aeiouAEIOU]    			v++;
[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]   	c++;
.					;
\n 					return 0;

%%

int yywrap(){}
int main(){

printf("Enter Letter: ");

yylex();
printf("\nNumber of Vowel = %d \nNumber of Consonant = %d\n", v,c);

return 0;
}