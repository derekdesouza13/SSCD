
%{
#include <stdio.h>
int yylex(void);
void yyerror(const char *s);
%}

%token NUM plus

%%
ED : E
     {
         puts("Valid expression");
     }
   ;

E  : NUM plus NUM
   ;
%%

void yyerror(const char *s)
{
    puts("Invalid expression");
}
