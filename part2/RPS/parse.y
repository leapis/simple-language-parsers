%{
#include <stdio.h>
int yylex();
void yyerror(char * s);
%}

%token TRUE FALSE LAND LOR NOT XOR

%start program

%left XOR
%left LOR
%left LAND

%%
program : expr '.' {printf("result= %d\n", $1); return 0;}
        ;


expr : expr LAND expr {$$ = $1 && $3;}
     | expr LOR expr {$$ = $1 || $3;}
     | expr XOR expr {$$ = $1 ^ $3;}
     | NOT expr {$$ = !$2;}
     | '(' expr ')' {$$ = $2;}
     | bool {$$ = $1;}
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
