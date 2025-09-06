%{
#include <stdio.h>
int comments=0;
%}

%%
"//".*           { comments++; }
"/*"([^*]|\*+[^*/])*\*+"/"   { comments++; }
.|\n             ;
%%

int yywrap() {
    return 1;
}


int main() {
    yylex();
    printf("Number of comment lines: %d\n", comments);
    return 0;
}