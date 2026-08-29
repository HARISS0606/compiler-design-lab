# Experiment 10: Compiler Back-End — Three Address Code to 8086 Assembly

## AIM

To write a C program to implement the back-end of a compiler which takes three-address code (TAC)
as input and generates equivalent 8086 assembly language code.

## ALGORITHM

1. Start the program.
2. Read each line of three-address code from input.
3. Parse the left-hand side, operator, and operands.
4. Map each operation to its 8086 assembly equivalent:
   - Assignment (`a = b`) → `MOV`
   - Arithmetic (`a = b + c`) → `ADD`, `SUB`, `MUL`, `DIV`
5. Generate appropriate `MOV` and arithmetic instructions.
6. Print the 8086 assembly code.
7. Repeat for all TAC lines and end.

## PROCEDURE

1. Begin the C program and prompt the user to enter the number of TAC lines.
2. Use a loop to read each TAC line and store it in an array.
3. For each line, use `sscanf()` to extract the components (result, op1, operator, op2).
4. Translate the TAC into corresponding 8086 assembly instructions.
5. Output the translated instructions.
6. Run with sample inputs to test correctness.
7. Exit the program.

## CODE IMPLEMENTATION

```c
#include <stdio.h>
#include <string.h>
#include <ctype.h>

void generateAssembly(char line[]) {
    char result[10], op1[10], op2[10], operator;
    int matched = sscanf(line, "%s = %s %c %s", result, op1, &operator, op2);

    if (matched == 4) {
        // It's an arithmetic operation
        printf("MOV AX, %s\n", op1);
        switch (operator) {
            case '+':
                printf("ADD AX, %s\n", op2);
                break;
            case '-':
                printf("SUB AX, %s\n", op2);
                break;
            case '*':
                printf("MUL %s\n", op2); // Unsigned multiplication
                break;
            case '/':
                printf("MOV DX, 0\n"); // Clear DX before DIV
                printf("MOV BX, %s\n", op2);
                printf("DIV BX\n");
                break;
        }
        printf("MOV %s, AX\n", result);
    } else {
        // It's a simple assignment: x = y
        sscanf(line, "%s = %s", result, op1);
        printf("MOV AX, %s\n", op1);
        printf("MOV %s, AX\n", result);
    }
    printf("\n");
}

int main() {
    char tac[100][100];
    int n, i;

    printf("Enter number of three-address code lines: ");
    scanf("%d", &n);
    getchar(); // clear newline

    printf("Enter the three-address code:\n");
    for (i = 0; i < n; i++) {
        fgets(tac[i], sizeof(tac[i]), stdin);
        tac[i][strcspn(tac[i], "\n")] = '\0'; // remove newline
    }

    printf("\nGenerated 8086 Assembly Code:\n\n");
    for (i = 0; i < n; i++) {
        generateAssembly(tac[i]);
    }

    return 0;
}
```

**How to run:**
```bash
gcc backend_8086.c -o backend_8086
./backend_8086
```

## OUTPUT

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

## RESULT

Thus, the back-end of the compiler was successfully implemented to translate three-address code into
equivalent 8086 assembly language code.
