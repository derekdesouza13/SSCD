
%{
#include <stdio.h>
int yylex(void);
void yyerror(const char *s);
%}

%token IF THEN OP CP ROP AOP NUM ID

%%

stmt:
    IF OP expr ROP expr CP THEN ID AOP expr
    ;

expr:
    ID
    | NUM
    ;

%%

void yyerror(const char *s)
{
    printf("Syntax error: %s\n", s);
}

int main(void)
{
    printf("Enter an if statement:\n");

    if (yyparse() == 0)
        printf("Success: Valid statement\n");
    else
        printf("Failure: Invalid statement\n");

    return 0;
}
