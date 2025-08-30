%{
int line = 0;
int c = 0;
%}

%%
.     c++;
\n    line++;
^q\n    return 0;

%%

int yywrap(){}
int main(){

printf("Enter String(q for quit): ");

yylex();
printf("\nNumber of line = %d \nNumber of Charecter = %d\n", line,c);

return 0;
}