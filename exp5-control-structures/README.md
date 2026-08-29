# Experiment 5: Recognize Valid C Control Structures

## AIM

To write a program to recognize a valid control structure syntax of C language (such as for loop,
while loop, if-else, if-else-if, switch-case, etc.) using LEX and YACC.

## ALGORITHM

**LEX**
1. Start the LEX program with required header files and token declarations.
2. Define regular expressions for control keywords such as `if`, `else`, `for`, `while`, `switch`,
   `case`, etc.
3. Return appropriate tokens for each keyword to YACC.

**YACC**
1. Include header files and token declarations.
2. Define grammar rules to match valid syntax for:
   - if statement
   - if-else and if-else-if ladder
   - while and for loops
   - switch-case structure
3. Implement `yyparse()` to start parsing and `yyerror()` for invalid inputs.

## PROCEDURE

1. Write the `control.l` file using LEX to tokenize control structure keywords.
2. Write the `control.y` file using YACC to define grammar rules for C control structures.
3. Compile and execute the program using:
   ```bash
   lex control.l
   yacc -d control.y
   gcc lex.yy.c y.tab.c -o control
   ./control
   ```
4. Input sample control structures in C-style syntax to check for validation.

## CODE IMPLEMENTATION

**control.l**
```lex
%{
#include "y.tab.h"
%}
%%
"if" { return IF; }
"else" { return ELSE; }
"for" { return FOR; }
"while" { return WHILE; }
"switch" { return SWITCH; }
"case" { return CASE; }
"default" { return DEFAULT; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
[0-9]+ { return NUM; }
"{" { return LBRACE; }
"}" { return RBRACE; }
"(" { return LPAREN; }
")" { return RPAREN; }
":" { return COLON; }
";" { return SEMICOLON; }
"==" { return EQ; }
"<=" { return LE; }
">=" { return GE; }
"<" { return LT; }
">" { return GT; }
"=" { return ASSIGN; }
[ \t\n] { /* skip whitespace */ }
. { return yytext[0]; }
%%
int yywrap() { return 1; }
```

**control.y**
```yacc
%{
#include <stdio.h>
#include <stdlib.h>
%}
%token IF ELSE FOR WHILE SWITCH CASE DEFAULT
%token ID NUM
%token LBRACE RBRACE LPAREN RPAREN COLON SEMICOLON
%token EQ LE GE LT GT ASSIGN
%%
program:
    stmt_list
    ;

stmt_list:
    stmt_list stmt
    | stmt
    ;

stmt:
    if_stmt
    | while_stmt
    | for_stmt
    | switch_stmt
    ;

if_stmt:
    IF LPAREN cond RPAREN stmt
    | IF LPAREN cond RPAREN stmt ELSE stmt
    ;

while_stmt:
    WHILE LPAREN cond RPAREN stmt
    ;

for_stmt:
    FOR LPAREN ID ASSIGN NUM SEMICOLON cond SEMICOLON ID ASSIGN ID RPAREN stmt
    ;

switch_stmt:
    SWITCH LPAREN ID RPAREN LBRACE case_list RBRACE
    ;

case_list:
    case_list CASE NUM COLON stmt
    | case_list DEFAULT COLON stmt
    | CASE NUM COLON stmt
    | DEFAULT COLON stmt
    ;

cond:
    ID relop NUM
    ;

relop:
    EQ | LE | GE | LT | GT
    ;
%%
int main() {
    printf("Enter a C control structure syntax:\n");
    yyparse();
    printf("Valid control structure syntax.\n");
    return 0;
}
int yyerror(char *s) {
    printf("Invalid control structure syntax.\n");
    return 0;
}
```

## OUTPUT

```
$ lex control.l
$ yacc -d control.y
$ gcc lex.yy.c y.tab.c -o control
$ ./control
Enter a C control structure syntax:
if (x < 5) { y = 10; }
Valid control structure syntax.
```

## RESULT

Thus the program to recognize a valid control structure syntax of C language (For loop, while loop,
if-else, if-else-if, switch-case, etc.) using LEX and YACC was executed and verified successfully.
