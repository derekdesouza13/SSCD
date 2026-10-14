
%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%token IF THEN ID NUM ROP OP

%%
stmt : IF '(' condition ')' THEN ID OP NUM
       {
           printf("Valid statement\n");
       }
     ;

condition : ID ROP ID
          | ID ROP NUM
          | NUM ROP ID
          | NUM ROP NUM
          ;
%%

void yyerror(char *s)
{
    printf("Invalid statement\n");
}

int main()
{
    printf("Enter an if statement:\n");
    yyparse();
    return 0;
}
