
%{
#include "y.tab.h"
%}

%%
"if"                     { return IF; }
"then"                   { return THEN; }
[a-zA-Z][a-zA-Z0-9]*     { return ID; }
[0-9]+                   { return NUM; }
"<"                      { return ROP; }
"="                      { return OP; }
"("                      { return '('; }
")"                      { return ')'; }
[ \t\n]+                 ;
%%

int yywrap()
{
    return 1;
}
