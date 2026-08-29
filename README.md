# CS4501 — Compiler Design Lab

Chennai Institute of Technology · Department of Computer Science & Engineering
**Course:** CS4501 – Compiler Design | **Semester:** July–December 2026

This repository contains all 10 lab experiments for the Compiler Design course, implemented in C
using **LEX** and **YACC**. Every experiment folder includes:
- Full **source code** (`.l`/`.y`/`.c` files)
- A **README.md** — aim, algorithm/procedure summary, and build/run commands
- An **OUTPUT.md** — the complete program output (with terminal screenshots where available)

## Experiments

| No. | Title | Folder |
|-----|-------|--------|
| 1 | Lexical analyzer to recognize C tokens + symbol table | [`exp1-lexical-analyzer-symbol-table`](./exp1-lexical-analyzer-symbol-table) |
| 2 | Lexical analyzer using LEX tool | [`exp2-lexical-analyzer-lex`](./exp2-lexical-analyzer-lex) |
| 3 | Recognize a valid arithmetic expression (+, -, *, /) | [`exp3-arithmetic-expression`](./exp3-arithmetic-expression) |
| 4 | Recognize a valid variable (letter + letters/digits) | [`exp4-valid-variable`](./exp4-valid-variable) |
| 5 | Recognize valid C control structures | [`exp5-control-structures`](./exp5-control-structures) |
| 6 | Calculator using LEX and YACC | [`exp6-calculator`](./exp6-calculator) |
| 7 | Generate three-address code using LEX and YACC | [`exp7-three-address-code`](./exp7-three-address-code) |
| 8 | Type checking using Lex and Yacc | [`exp8-type-checking`](./exp8-type-checking) |
| 9 | Code optimization (constant folding, strength reduction, algebraic simplification) | [`exp9-code-optimization`](./exp9-code-optimization) |
| 10 | Compiler back-end: TAC → 8086 assembly | [`exp10-8086-backend`](./exp10-8086-backend) |

## Toolchain

Most experiments require `flex`/`lex` and `bison`/`yacc`. On Ubuntu/Debian:
```bash
sudo apt-get install flex bison gcc
```
Each experiment folder has its own `README.md` with exact build/run commands and sample I/O.

## Author
Hariss Kumar K — CSE, Chennai Institute of Technology
