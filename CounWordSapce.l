%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

FILE *yyin;
int lc=0,sc=0,ch=0,wc=0;
%}

%%

[\n] { lc++; ch+=yyleng;}
[  \t] { sc++; ch+=yyleng;}
[^\t] { ch+=yyleng;}
[^\t\n ]+ { wc++;  ch+=yyleng;}                           
%%

int yywrap() {
    return 1;
}

int main(int argc, char **argv) {
    yyin = fopen("input.txt", "r");
    if (!yyin) {
        perror("Failed to open input.txt");
        return 1;
    }

    yylex();

    printf("Number of lines : %d\n",lc+1);
    printf("Number of spaces : %d\n",sc);
    printf("Number of words: %d\nNumber of charc :, %d\n",wc,ch);

    fclose(yyin);
    return 0;
}
