# Experiment 7: Generate Three Address Code using LEX and YACC

## AIM

To write a program using LEX and YACC to generate three-address code (TAC) for a simple arithmetic
expression.

## ALGORITHM

**LEX**
1. Include required headers and define tokens for identifiers, numbers, and operators.
2. Use regular expressions to identify identifiers and numeric constants.
3. Return appropriate tokens to YACC for parsing.

**YACC**
1. Declare tokens and define associativity for operators.
2. Use grammar rules to parse arithmetic expressions (e.g., `a = b + c * d`).
3. Generate three-address code during the parsing actions.
4. Maintain a temporary variable counter to represent intermediate results (e.g., `t1 = b * d`).

## PROCEDURE

1. Create the LEX file `tac.l`:
   - Tokenize input using patterns for identifiers, numbers, and operators.
   - Pass tokens to YACC.
2. Create the YACC file `tac.y`:
   - Parse arithmetic expressions.
   - Generate three-address code using temporary variables (`t1`, `t2`, etc.) during parsing.
3. Compile and run:
   ```bash
   lex tac.l
   yacc -d tac.y
   gcc y.tab.c lex.yy.c -o tac
   ./tac
   ```
4. Input an arithmetic expression like: `a = b + c * d`
5. View generated three-address code.

## CODE IMPLEMENTATION

**tac.l**
```lex
%{
#include "y.tab.h"
%}
%%
[a-zA-Z][a-zA-Z0-9]* { yylval.str = strdup(yytext); return ID; }
[0-9]+ { yylval.str = strdup(yytext); return NUM; }
[\t\n ]+ { /* skip spaces */ }
. { return yytext[0]; }
%%
int yywrap() {
    return 1;
}
```

**tac.y**
```yacc
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
```

## OUTPUT

```
$ ./tac
Enter the expression:
a = b + c * d
t1 = c * d
t2 = b + t1
a = t2
```

## RESULT

Thus, the program to generate three-address code using LEX and YACC was executed and verified
successfully.
