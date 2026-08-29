# Output — Ex.No 10

**Sample input:**
```
Enter number of three-address code lines: 5
t1 = a + b
t2 = t1 - c
t3 = t2 * d
t4 = t3 / e
x = t4
```

**Sample output:**
```
Generated 8086 Assembly Code:

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

**Result:** Thus, the back-end of the compiler was successfully implemented to translate
three-address code into equivalent 8086 assembly language code.
