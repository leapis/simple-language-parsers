%{
#include <stdio.h>
#include "attr.h"
int yylex();
void yyerror(char * s);
%}

%union {
    RpsType rpsType;
}

%token <rpsType> RPS

%start stmtlist

%%
stmtlist : stmtlist ';' stmt {  }
         | stmt {  }
         ;

stmt : RPS RPS {
    if ($1.r) {
        if ($2.r)
            printf("tie");
        else if ($2.p)
            printf("paper wins");
        else if ($2.s)
            printf("rock wins");
    }
    else if ($1.p) {
        if ($2.r) printf("paper wins");
        else if ($2.s) printf("scissors wins");
        else if ($2.p) printf("tie");
    }
    else if ($1.s) {
        if ($2.r) printf("rock wins");
        else if ($2.s) printf("tie");
        else if ($2.p) printf("scissors wins");
        
    } 
    }
    ;
%%

void yyerror(char* s) {
    fprintf(stderr, "%s\n", s);
}

int main(int argc, char* argv[]) {
    yyparse();
    return 0;
}
