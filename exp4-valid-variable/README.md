# Ex.No 4 — Recognize a Valid Variable (letter followed by letters/digits)

**Aim:** Recognize a valid variable which starts with a letter followed by any number of letters or digits
using the YACC tool.

## Files
- `valvar.l` — LEX file returning `LET` for letters and `DIG` for digits.
- `valvar.y` — YACC grammar requiring the first token to be a letter.

## How to run
```bash
lex valvar.l
yacc -d valvar.y
gcc lex.yy.c y.tab.c -o valvar
./valvar
```

## Sample
```
Enter the variable:
add1
Valid variable

Enter the variable:
1add
Invalid variable
```

## Result
Thus the program to recognize a valid variable which starts with a letter followed by any number of
letters or digits using YACC tool was executed and verified successfully.
