# Experiment 8: Implement Type Checking using Lex and Yacc

## AIM

To write a C program to implement type checking of variables in a simple expression using a symbol
table.

## ALGORITHM

1. Start the program.
2. Read the variable declarations and expressions.
3. Store the declarations (data type and variable) in a symbol table.
4. For each expression:
   - Parse the result variable, operand 1, and operand 2.
   - Check if all are present in the symbol table.
   - If any variable is undefined, print an error.
   - If all are found, compare their data types.
   - If data types match, print "No type mismatch".
   - If data types mismatch, print "Type mismatch".
5. End the program.

## PROCEDURE

1. **Create Lex File (`typecheck.l`)** — Define patterns for keywords (int, float, etc.), identifiers,
   operators, and delimiters. Return these tokens to Yacc for further processing.
2. **Create Yacc File (`typecheck.y`)** — Define grammar rules for declarations and expressions.
   Insert variable names and types into the symbol table on declaration; parse and verify types in
   expressions during assignment; display whether the expression is valid or has a type mismatch.
3. Compile:
   ```bash
   lex typecheck.l
   yacc -d typecheck.y
   gcc lex.yy.c y.tab.c -o typecheck
   ```
4. Run: `./typecheck` — input variable declarations and expressions (end with `Ctrl+D`). Observe
   output showing the type checking result.
5. Test with various inputs: correct type expressions, mismatched types
   (e.g. `int a; float b; a = b + 1;`), and undeclared variables.
6. End the program.

## CODE IMPLEMENTATION

```c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int count = 0, i = 0, j = 0, l = 0;
char key[4][12] = {"int", "float", "char", "double"};
char dstr[100][100], estr[100][100];
char token[100], resultvardt[100], arg1dt[100], arg2dt[100];

struct table {
    char var[10];
    char dt[10];
} tbl[20];

void entry(char *declaration);
int check(char[]);
int search(char[]);
void typecheck(char *expression);

int main() {
    printf("\nIMPLEMENTATION OF TYPE CHECKING\n");

    printf("\nDECLARATIONS (END to finish):\n");
    while (1) {
        printf("\t");
        gets(dstr[i]);
        if (strcmp(dstr[i], "END") == 0) break;
        entry(dstr[i]);
        i++;
    }

    printf("\nEXPRESSIONS (END to finish):\n");
    while (1) {
        printf("\t");
        gets(estr[l]);
        if (strcmp(estr[l], "END") == 0) break;
        l++;
    }

    printf("\nSEMANTIC ANALYZER (TYPE CHECKING):\n");
    for (i = 0; i < l; i++) {
        typecheck(estr[i]);
    }
    return 0;
}

void entry(char *declaration) {
    char datatype[10], varname[10];
    sscanf(declaration, "%s %[^;];", datatype, varname);

    if (!check(datatype)) {
        printf("Invalid datatype: %s\n", datatype);
        return;
    }
    if (search(varname) != -1) {
        printf("The variable '%s' is already declared\n", varname);
        return;
    }
    strcpy(tbl[count].dt, datatype);
    strcpy(tbl[count].var, varname);
    count++;
}

int check(char t[]) {
    for (int in = 0; in < 4; in++) {
        if (strcmp(key[in], t) == 0) {
            return 1;
        }
    }
    return 0;
}

int search(char variable[]) {
    for (int i = 0; i < count; i++) {
        if (strcmp(tbl[i].var, variable) == 0) {
            return i;
        }
    }
    return -1;
}

void typecheck(char *expression) {
    char result[10], op1[10], op2[10], operator;
    sscanf(expression, "%s = %s %c %[^;];", result, op1, &operator, op2);

    int rIndex = search(result);
    int o1Index = search(op1);
    int o2Index = search(op2);

    if (rIndex == -1) {
        printf("Undefined variable: %s\n", result);
        return;
    }
    if (o1Index == -1) {
        printf("Undefined variable: %s\n", op1);
        return;
    }
    if (o2Index == -1) {
        printf("Undefined variable: %s\n", op2);
        return;
    }

    strcpy(resultvardt, tbl[rIndex].dt);
    strcpy(arg1dt, tbl[o1Index].dt);
    strcpy(arg2dt, tbl[o2Index].dt);

    if (strcmp(arg1dt, arg2dt) == 0) {
        if (strcmp(resultvardt, arg1dt) == 0) {
            printf("No type mismatch in expression: %s\n", expression);
        } else {
            printf("Type mismatch: Lvalue and Rvalue must be same in '%s'\n", expression);
        }
    } else {
        printf("Type mismatch between operands in '%s'\n", expression);
    }
}
```

**How to run:**
```bash
gcc type_checking.c -o type_checking
./type_checking
```
Input declarations first (end with `END`), then expressions (end with `END`).
> `gets()` is deprecated/unsafe in modern compilers — replace with `fgets()` if compiling with a
> modern GCC/Clang toolchain.

## OUTPUT

### Case 1 — No type mismatch
![Output 1](./output1.png)

```
IMPLEMENTATION OF TYPE CHECKING
DECLARATION
    int a;
    int b;
    int c;
    END
EXPRESSION
    a=b*c;
    END
SEMANTIC ANALYZER(TYPE CHECKING):
    There is no type mismatch in the expression a=b*c;
PRESS ENTER TO EXIT FROM TYPE CHECKING
```

### Case 2 — Type mismatch
![Output 2](./output2.png)

```
IMPLEMENTATION OF TYPE CHECKING
DECLARATION
    int a;
    float b;
    int c;
    END
EXPRESSION
    a=b+c;
    END
SEMANTIC ANALYZER(TYPE CHECKING):
    Type Mismatch
PRESS ENTER TO EXIT FROM TYPE CHECKING
```

## RESULT

Thus, the C program for type checking was successfully implemented. The program verifies variable
types from declarations and checks type consistency in given expressions using a symbol table.
