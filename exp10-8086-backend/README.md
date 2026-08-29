# Ex.No 10 — Compiler Back-End: TAC to 8086 Assembly

**Aim:** Implement the back-end of a compiler which takes three-address code (TAC) as input and
generates equivalent 8086 assembly language code.

## Files
- `backend_8086.c` — Parses TAC lines and emits corresponding `MOV`/`ADD`/`SUB`/`MUL`/`DIV`
  8086 assembly instructions.

## How to run
```bash
gcc backend_8086.c -o backend_8086
./backend_8086
```

## Sample Input
```
Enter number of three-address code lines: 5
t1 = a + b
t2 = t1 - c
t3 = t2 * d
t4 = t3 / e
x = t4
```

## Sample Output
```
MOV AX, a
ADD AX, b
MOV t1, AX

MOV AX, t1
SUB AX, c
MOV t2, AX

MOV AX, t2
MUL d
MOV t3, AX

MOV AX, t3
MOV DX, 0
MOV BX, e
DIV BX
MOV t4, AX

MOV AX, t4
MOV x, AX
```

## Result
Thus, the back-end of the compiler was successfully implemented to translate three-address code into
equivalent 8086 assembly language code.

**Full output:** see [OUTPUT.md](./OUTPUT.md)
