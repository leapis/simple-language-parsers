%{
    #include "parse.tab.h"
    #define YY_SKIP_YYWRAP
%}
    extern YYSTYPE yylval;
    extern int yywrap() {return 1;};
    extern int isatty();

%%
\|\| {return LOR;}
&& {return LAND;}
~ {return NOT;}
\^ {return XOR;}
T {return TRUE;}
F {return FALSE;}
[ \t] ;//ignore
.  {return yytext[0]; }
%%
