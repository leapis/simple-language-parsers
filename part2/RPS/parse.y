%{
#include <stdio.h>
int yylex();
void yyerror(char * s);
%}

%token ROCK PAPER SCISSORS TRUE FALSE

%start stmtlist

%%
program : expr. {printf("result= %d", $1);};


expr : ROCK ROCK         { printf("tie"); $$ = 1;}
    | ROCK PAPER        { printf("paper wins"); $$=2;}
    | ROCK SCISSORS     { printf("rock wins"); }
    | PAPER ROCK        { printf("paper wins"); }
    | PAPER PAPER       { printf("tie"); }
    | PAPER SCISSORS    { printf("scissors win"); }
    | SCISSORS ROCK     { printf("rock wins"); }
    | SCISSORS PAPER    { printf("scissors wins"); }
    | SCISSORS SCISSORS { printf("tie"); }
    ;
%%

void yyerror(char* s) {
    fprintf(stderr, "%s\n", s);
}

int main(int argc, char* argv[]) {
    yyparse();
    return 0;
}
