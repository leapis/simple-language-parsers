%{
#include "attr.h"
#include "parse.tab.h"
#define YY_SKIP_YYWRAP
%}
    extern YYSTYPE yylval;
    extern int yywrap() {return 1;};
    extern int isatty();

%%
F {return FALSE;}
T {return TRUE;}
[ \t]   ; //ignore whitespace
.       {return yytext[0];}
%%
