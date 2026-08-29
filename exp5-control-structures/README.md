# Ex.No 5 — Recognize Valid C Control Structures

**Aim:** Recognize a valid control structure syntax of C language (for loop, while loop, if-else,
if-else-if, switch-case, etc.) using LEX and YACC.

## Files
- `control.l` — Tokenizes control-structure keywords and operators.
- `control.y` — Grammar rules for if/if-else, while, for, and switch-case statements.

## How to run
```bash
lex control.l
yacc -d control.y
gcc lex.yy.c y.tab.c -o control
./control
```

## Sample
```
Enter a C control structure syntax:
if (x < 5) { y = 10; }
Valid control structure syntax.
```

## Result
Thus the program to recognize a valid control structure syntax of C language (for loop, while loop,
if-else, if-else-if, switch-case, etc.) using LEX and YACC was executed and verified successfully.
