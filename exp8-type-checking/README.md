# Ex.No 8 — Implement Type Checking using Lex and Yacc

**Aim:** Implement type checking of variables in a simple expression using a symbol table.

## Files
- `type_checking.c` — Reads variable declarations and expressions, builds a symbol table, and
  checks type consistency of each assignment expression.

## How to run
```bash
gcc type_checking.c -o type_checking
./type_checking
```
Input declarations first (end with `END`), then expressions (end with `END`).

> Note: `gets()` is deprecated/unsafe in modern compilers — replace with `fgets()` if compiling
> with a modern GCC/Clang toolchain.

## Sample
```
DECLARATIONS (END to finish):
    int a;
    int b;
    int c;
    END

EXPRESSIONS (END to finish):
    a=b*c;
    END

SEMANTIC ANALYZER (TYPE CHECKING):
    No type mismatch in expression: a=b*c;
```

## Result
Thus, the C program for type checking was successfully implemented. The program verifies variable
types from declarations and checks type consistency in given expressions using a symbol table.

**Full output:** see [OUTPUT.md](./OUTPUT.md)
