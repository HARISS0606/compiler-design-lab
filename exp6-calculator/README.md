# Ex.No 6 — Implementation of Calculator using LEX and YACC

**Aim:** Implement a calculator supporting +, -, *, / using LEX and YACC.

## Files
- `cal.l` — Tokenizes numeric input.
- `cal.y` — Grammar rules with operator precedence to evaluate expressions.

## How to run
```bash
lex cal.l
yacc cal.y
cc lex.yy.c y.tab.c -o calc
./calc
```

## Sample
```
Enter the expression:
2+2
Answer: 4
```

## Result
Thus the program for implementing calculator using LEX and YACC was executed and verified
successfully.
