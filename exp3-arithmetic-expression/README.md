# Experiment 3: Recognize a Valid Arithmetic Expression (+, -, *, /)

## AIM

To write a program to recognize a valid arithmetic expression that uses operator +, -, * and / using
YACC tool.

## ALGORITHM

**LEX**
1. Declare the required header file and variable declaration within `%{` and `%}`.
2. LEX requires regular expressions to identify valid arithmetic expression token of lexemes.
3. LEX calls `yywrap()` function after input is over. It should return 1 when work is done or should
   return 0 when more processing is required.

**YACC**
1. Declare the required header file and variable declaration within `%{` and `%}`.
2. Define tokens in the first section and also define the associativity of the operations.
3. Mention the grammar productions and the action for each production.
4. `$$` refers to the top of the stack position while `$1`, `$2` refer to respective values in the stack.
5. Call `yyparse()` to initiate the parsing process.
6. `yyerror()` function is called when no productions in the grammar match the input statement.

## PROCEDURE

1. Open a text editor and write the LEX source file `art_expr.l`.
2. Define regular expressions for identifiers, digits, operators, and ignore whitespaces.
3. Save and close the LEX file.
4. Open another text file and write the YACC source file `art_expr.y`.
5. Define tokens and grammar rules to parse arithmetic expressions using +, -, *, and /.
6. Save and close the YACC file.
7. Compile and run:
   ```bash
   lex art_expr.l
   yacc -d art_expr.y
   gcc lex.yy.c y.tab.c -o art_expr
   ./art_expr
   ```
8. Enter expressions as input. If the expression is valid, it displays "valid Expression", otherwise
   "Invalid Expression".

## CODE IMPLEMENTATION

**art_expr.l**
```lex
%{
#include<stdio.h>
#include "y.tab.h"
%}
%%
[a-zA-Z][0-9a-zA-Z]* {return ID;}
[0-9]+ {return DIG;}
[ \t]+ {;}
. {return yytext[0];}
\n {return 0;}
%%
int yywrap() {
    return 1;
}
```

**art_expr.y**
```yacc
%{
#include<stdio.h>
%}
%token ID DIG
%left '+' '-'
%left '*' '/'
%right UMINUS
%%
stmt: expn ;
expn: expn '+' expn
    | expn '-' expn
    | expn '*' expn
    | expn '/' expn
    | '-' expn %prec UMINUS
    | '(' expn ')'
    | DIG
    | ID
    ;
%%
int main() {
    printf("Enter the Expression\n");
    yyparse();
    printf("valid Expression\n");
    return 0;
}
int yyerror() {
    printf("Invalid Expression");
    exit(0);
}
```

## OUTPUT

![Output](./output.png)

```
"artexp.y" 33L, 372C written
[gomathy@rhel5 ~]$ lex artexp.l
[gomathy@rhel5 ~]$ yacc -d artexp.y
[gomathy@rhel5 ~]$ gcc lex.yy.c y.tab.c
[gomathy@rhel5 ~]$ ./a.out
Enter the Expression
a+b*c-d/e
valid Expression
[gomathy@rhel5 ~]$ ./a.out
Enter the Expression
a=b
Invalid Expression
[gomathy@rhel5 ~]$
```

## RESULT

Thus the program to recognize a valid arithmetic expression that uses operator +, - , * and / using
YACC tool was executed and verified successfully.
