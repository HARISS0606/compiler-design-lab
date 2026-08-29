# Ex.No 2 — Implement a Lexical Analyzer using LEX Tool

**Aim:** Read a C source code file and identify individual tokens such as identifiers, keywords, constants,
operators, comments, etc.

## Files
- `lexical_analyzer.c` — Scans an input C file and classifies each token (keyword, identifier, number,
  delimiter, operator, header file, preprocessor directive).

## How to run
```bash
gcc lexical_analyzer.c -o lexical_analyzer
./lexical_analyzer
# Enter filename when prompted, e.g. iplex.c
```
> Note: Remove `conio.h`/`clrscr()`/`getch()` for modern GCC/Linux compilation.

## Result
Thus, the C program for implementation of Lexical Analyzer was executed and verified successfully.

**Full output:** see [OUTPUT.md](./OUTPUT.md)
