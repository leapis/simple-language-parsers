%{
#include "attr.h"
#include "parse.tab.h"
#define YY_SKIP_YYWRAP
%}
    extern YYSTYPE yylval;
    extern int yywrap() {return 1;};
    extern int isatty();

%%
rock    {yylval.rpsType.r = 1; yylval.rpsType.p = 0; yylval.rpsType.s = 0; return RPS;}
paper   {yylval.rpsType.r = 0; yylval.rpsType.p = 1; yylval.rpsType.s = 0; return RPS;}
scissors {yylval.rpsType.r = 0; yylval.rpsType.p = 0; yylval.rpsType.s = 1; return RPS;}
[ \t]   ; //ignore whitespace
.       {return yytext[0];}
%%
