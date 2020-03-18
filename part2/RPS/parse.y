%{
#include <stdio.h>
int yylex();
void yyerror(char * s);
%}

%token ROCK PAPER SCISSORS TRUE FALSE

%start program

%%
program : expr {printf("result= %d", $1);};


expr : ROCK ROCK         { printf("tie"); $$ = 1;}
    | ROCK PAPER        { printf("paper wins"); $$=2;}
    | bool bool {$$ = $1 + $2;}
    ;

bool : TRUE {$$ = 1;}
    | FALSE {$$ = 0;}
    ;
%%

void yyerror(char* s) {
    fprintf(stderr, "%s\n", s);
}

int main(int argc, char* argv[]) {
    yyparse();
    return 0;
}
