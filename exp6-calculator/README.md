# Experiment 6: Implementation of Calculator using LEX and YACC

## AIM

To write a program to implement Calculator using LEX and YACC.

## ALGORITHM

1. Start the program.
2. In the declaration part of lex, include declaration of regular definitions as digit.
3. In the translation rules part of lex, specify the pattern and its action that is to be executed
   whenever a lexeme matched by pattern is found in the input in the `cal.l`.
4. By use of YACC program, all the arithmetic operations are done such as +, -, *, /.
5. Display error if it persists.
6. Provide the input.
7. Verify the output.
8. End.

## PROCEDURE

1. Create a file named `cal.l` and define patterns to identify numbers using regular expressions.
2. For matched digits, return the token `NUM` and store the number using `yylval`.
3. Create another file named `cal.y` to define grammar rules for arithmetic expressions using YACC.
4. Include operator precedence and associativity using `%left` and `%right`.
5. Add rules to evaluate expressions like `E + E`, `E - E`, `E * E`, and `E / E`.
6. Compile both files using:
   ```bash
   lex cal.l
   yacc -d cal.y
   gcc lex.yy.c y.tab.c -o calc
   ```
7. Run the compiled program: `./calc`
8. Enter arithmetic expressions and view the result.
9. Test with multiple expressions to verify both valid and invalid cases.

## CODE IMPLEMENTATION

**cal.l**
```lex
DIGIT [0-9]+
%option noyywrap
%%
{DIGIT} { yylval = atof(yytext); return NUM; }
\n|. { return yytext[0]; }
%%
```

**cal.y**
```yacc
%{
#include <ctype.h>
#include <stdio.h>
#define YYSTYPE double
%}
%token NUM
%left '+' '-'
%left '*' '/'
%right UMINUS
%%
Statment: E { printf("Answer: %g \n", $$); }
    | Statment '\n'
    ;

E : E '+' E { $$ = $1 + $3; }
    | E '-' E { $$ = $1 - $3; }
    | E '*' E { $$ = $1 * $3; }
    | E '/' E { $$ = $1 / $3; }
    | NUM
    ;
%%
```

## OUTPUT

```
$ lex cal.l
$ yacc cal.y
$ cc lex.yy.c y.tab.c -o calc
$ ./calc
Enter the expression:
2+2
Answer: 4
```

## RESULT

Thus the program for implementing calculator using LEX and YACC was executed and verified
successfully.
