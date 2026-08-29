# Ex.No 3 — Recognize a Valid Arithmetic Expression (+, -, *, /)

**Aim:** Recognize a valid arithmetic expression that uses operators +, -, * and / using the YACC tool.

## Files
- `art_expr.l` — LEX file defining tokens for identifiers, digits, and operators.
- `art_expr.y` — YACC grammar for arithmetic expressions with operator precedence.

## How to run
```bash
lex art_expr.l
yacc -d art_expr.y
gcc lex.yy.c y.tab.c -o art_expr
./art_expr
```

## Sample
```
Enter the Expression
a+b*c-d/e
valid Expression
```

## Result
Thus the program to recognize a valid arithmetic expression that uses operator +, -, * and / using
YACC tool was executed and verified successfully.

**Full output:** see [OUTPUT.md](./OUTPUT.md)
