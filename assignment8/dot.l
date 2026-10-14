
%{
#include "y.tab.h"
%}

%%
"+"          { return plus; }
[0-9]+       { return NUM; }
[ \t\n]+     ;
.            { return yytext[0]; }
%%

int yywrap(void)
{
    return 1;
}
