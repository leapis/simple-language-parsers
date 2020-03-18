%{
    #include "parse.tab.h"
    #define YY_SKIP_YYWRAP
%}
    extern YYSTYPE yylval;
    extern int yywrap() {return 1;};
    extern int isatty();

%%
rock {return ROCK;}
paper {return PAPER;}
scissors {return SCISSORS;}
T {return TRUE;}
F {return FALSE;}
[ \t] ;//ignore
.  {return yytext[0]; }
%%