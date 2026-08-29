%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int tempCount = 1;
char temp[10];

typedef struct {
    char* str;
} YYSTYPE;
#define YYSTYPE YYSTYPE

void printTAC(char* result, char* op1, char* operator, char* op2) {
    printf("%s = %s %s %s\n", result, op1, operator, op2);
}

void printAssign(char* var, char* val) {
    printf("%s = %s\n", var, val);
}
%}
%token ID NUM
%left '+' '-'
%left '*' '/'
%%
stmt: ID '=' expr { printAssign($1.str, $3.str); }
    ;

expr: expr '+' expr {
        sprintf(temp, "t%d", tempCount++);
        printTAC(temp, $1.str, "+", $3.str);
        $$ = strdup(temp);
    }
    | expr '-' expr {
        sprintf(temp, "t%d", tempCount++);
        printTAC(temp, $1.str, "-", $3.str);
        $$ = strdup(temp);
    }
    | expr '*' expr {
        sprintf(temp, "t%d", tempCount++);
        printTAC(temp, $1.str, "*", $3.str);
        $$ = strdup(temp);
    }
    | expr '/' expr {
        sprintf(temp, "t%d", tempCount++);
        printTAC(temp, $1.str, "/", $3.str);
        $$ = strdup(temp);
    }
    | ID { $$ = $1; }
    | NUM { $$ = $1; }
    ;
%%
int main() {
    printf("Enter the expression:\n");
    yyparse();
    return 0;
}
int yyerror(char* s) {
    printf("Error: %s\n", s);
    return 0;
}
