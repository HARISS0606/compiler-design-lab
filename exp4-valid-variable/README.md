# Experiment 4: Recognize a Valid Variable (Letter Followed by Letters/Digits)

## AIM

To write a program to recognize a valid variable which starts with a letter followed by any number of
letters or digits using YACC tool.

## ALGORITHM

**LEX**
1. Declare the required header file and variable declaration within `%{` and `%}`.
2. LEX requires regular expressions or patterns to identify token of lexemes for recognizing a valid
   variable.
3. LEX calls `yywrap()` function after input is over. It should return 1 when work is done or should
   return 0 when more processing is required.

**YACC**
1. Declare the required header file and variable declaration within `%{` and `%}`.
2. Define tokens in the first section and also define the associativity of the operations.
3. Mention the grammar productions and the action for each production.
4. `$$` refers to the top of the stack position while `$1` refers to the first value, `$2` for the second
   value in the stack.
5. Call `yyparse()` to initiate the parsing process.
6. `yyerror()` function is called when none of the productions in the grammar match the input statement.

## PROCEDURE

1. Create the LEX file `valvar.l` using a text editor.
2. Define token patterns for letters and digits, and return them as `LET` and `DIG` tokens.
3. Save and close the file.
4. Create the YACC file `valvar.y`.
5. Define grammar rules that recognize valid variable names (starting with a letter and followed by
   letters or digits).
6. Save and close the YACC file.
7. Compile and run:
   ```bash
   lex valvar.l
   yacc -d valvar.y
   gcc lex.yy.c y.tab.c -o valvar
   ./valvar
   ```
8. Enter test inputs like `abc1`, `var123`, `1abc` to test validation.
9. Observe whether the variable is valid or invalid.

## CODE IMPLEMENTATION

**valvar.l**
```lex
%{
#include "y.tab.h"
%}
%%
[a-zA-Z] {return LET;}
[0-9] {return DIG;}
\n {return 0;}
%%
int yywrap() {
    return 1;
}
```

**valvar.y**
```yacc
%{
#include<stdio.h>
%}
%token LET DIG
%%
variable: var ;
var: var DIG | var LET | LET ;
%%
int main() {
    printf("Enter the variable:\n");
    yyparse();
    printf("Valid variable\n");
    return 0;
}
int yyerror() {
    printf("Invalid variable\n");
    exit(0);
}
```

## OUTPUT

![Output](./output.png)

```
"valvar.y" 25L, 246C written
[gomathy@rhel5 ~]$ lex valvar.l
[gomathy@rhel5 ~]$ yacc -d valvar.y
[gomathy@rhel5 ~]$ gcc lex.yy.c y.tab.c
[gomathy@rhel5 ~]$ ./a.out
Enter the variable:
add
Valid variable
[gomathy@rhel5 ~]$ ./a.out
Enter the variable:
add1
Valid variable
[gomathy@rhel5 ~]$ ./a.out
Enter the variable:
1add
Invalid variable
[gomathy@rhel5 ~]$
```

## RESULT

Thus the program to recognize a valid variable which starts with a letter followed by any number of
letters or digits using YACC tool was executed and verified successfully.
