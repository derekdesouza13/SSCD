
%{
#include <stdio.h>
#include <string.h>

char symbols[100][50];
int symbol_count = 0;
%}

%%
"int"|"float"|"char"|"if"|"else"|"while"|"for"|"return"|"void" {
    printf("%s\tKEYWORD\n", yytext);
}

[0-9]+ {
    printf("%s\tCONSTANT\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("%s\tIDENTIFIER\n", yytext);

    int found = 0;

    for (int i = 0; i < symbol_count; i++) {
        if (strcmp(symbols[i], yytext) == 0) {
            found = 1;
            break;
        }
    }

    if (found == 0 && symbol_count < 100) {
        strcpy(symbols[symbol_count], yytext);
        symbol_count++;
    }
}

"=="|"!="|"<="|">="|"="|"+"|"-"|"*"|"/"|"<"|">" {
    printf("%s\tOPERATOR\n", yytext);
}

";"|","|"("|")"|"{"|"}" {
    printf("%s\tSPECIAL SYMBOL\n", yytext);
}

[ \t\n]+    ;

. {
    printf("%s\tUNKNOWN\n", yytext);
}
%%

int main(void)
{
    printf("TOKENS\n");
    printf("-------------------------\n");

    yylex();

    printf("\nSYMBOL TABLE\n");
    printf("-------------------------\n");
    printf("Index\tIdentifier\n");

    for (int i = 0; i < symbol_count; i++) {
        printf("%d\t%s\n", i + 1, symbols[i]);
    }

    return 0;
}

int yywrap(void)
{
    return 1;
}
