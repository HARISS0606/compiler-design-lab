# Ex.No 7 — Generate Three Address Code using LEX and YACC

**Aim:** Generate three-address code (TAC) for a simple arithmetic expression using LEX and YACC.

## Files
- `tac.l` — Tokenizes identifiers, numbers, and operators.
- `tac.y` — Grammar that generates TAC with temporary variables during parsing.

## How to run
```bash
lex tac.l
yacc -d tac.y
gcc y.tab.c lex.yy.c -o tac
./tac
```

## Sample
```
Enter the expression:
a = b + c * d
t1 = c * d
t2 = b + t1
a = t2
```

## Result
Thus, the program to generate three-address code using LEX and YACC was executed and verified
successfully.

**Full output:** see [OUTPUT.md](./OUTPUT.md)
