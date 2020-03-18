%{
#include <stdio.h>
int yylex();
void yyerror(char * s);
%}

%token ROCK PAPER SCISSORS

%start stmtlist

%%
stmtlist : stmtlist ';' stmtw {  }
         | stmtw {  }
         ;

stmtw : stmt {printf ("starting");}

stmt : ROCK ROCK         { printf("tie"); }
    | ROCK PAPER        { printf("paper wins"); }
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
