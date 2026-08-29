# Experiment 9: Simple Code Optimization Techniques

## AIM

To write a C program to implement Simple Code Optimization Techniques such as:
- Constant folding
- Strength reduction
- Algebraic simplification

## ALGORITHM

1. Read the input block of three-address code.
2. For each statement, identify optimization opportunities:
   - Replace constant expressions with their results (constant folding).
   - Replace expensive operations with cheaper equivalents (strength reduction).
   - Eliminate redundant calculations (algebraic simplification).
3. Apply the optimization if possible.
4. Print the optimized code.
5. Repeat for different inputs to verify.

## PROCEDURE

1. **Start the Program** — initialize variables and read the block of three-address code (TAC) from
   the user.
2. **Input the TAC Statements** — accept each line of TAC from the user, storing it in an array. Use a
   sentinel value like `END` or `Ctrl+Z` to indicate the end of input.
3. **Parse Each TAC Statement** — extract the result variable, the two operands, and the operator
   (if any).
4. **Apply Optimization Rules**:
   - *Constant Folding*: if both operands are constants, evaluate the expression at compile time.
   - *Strength Reduction*: replace multiplication/division by 2 with equivalent addition/subtraction.
   - *Algebraic Simplification*: `x*1 → x`, `x+0 → x`, `x-0 → x`, `x/1 → x`.
5. **Output Optimized Code** — print the optimized code, replacing the original TAC where a rule
   matched.
6. **Test with Multiple Inputs** — repeat with different TAC inputs to validate the optimization logic.
7. **End the Program**.

## CODE IMPLEMENTATION

```c
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>

char code[100][100];

int main() {
    FILE *fp;
    int i = 0;

    printf("Enter Three Address Code (end with CTRL+Z on Windows or CTRL+D on Linux):\n");

    // Write input to a file
    fp = fopen("infile.txt", "w");
    char ch;
    while ((ch = getchar()) != EOF) {
        fputc(ch, fp);
    }
    fclose(fp);

    // Read from file and store each line
    fp = fopen("infile.txt", "r");
    printf("\nUnoptimized Code:\n");
    while (fgets(code[i], sizeof(code[i]), fp)) {
        printf("%s", code[i]);
        i++;
    }
    fclose(fp);
    int lines = i;

    printf("\nOptimized Code:\n");
    for (i = 0; i < lines; i++) {
        char lhs, op1, op2, opr;
        int val1, val2, res;

        if (sscanf(code[i], "%c=%c%c%c;", &lhs, &op1, &opr, &op2) == 4) {
            if (isdigit(op1) && isdigit(op2)) {
                val1 = op1 - '0';
                val2 = op2 - '0';
                switch (opr) {
                    case '+': res = val1 + val2; break;
                    case '-': res = val1 - val2; break;
                    case '*': res = val1 * val2; break;
                    case '/': res = val2 != 0 ? val1 / val2 : 0; break;
                    default: res = 0; break;
                }
                printf("%c=%d;\t// Constant Folding\n", lhs, res);
            } else if ((opr == '*' && op2 == '1') || (opr == '/' && op2 == '1')) {
                printf("%c=%c;\t// Algebraic Simplification (X*1 or X/1)\n", lhs, op1);
            } else if (opr == '*' && op2 == '2') {
                printf("%c=%c+%c;\t// Strength Reduction (X*2 to X+X)\n", lhs, op1, op1);
            } else {
                printf("%s", code[i]); // No optimization
            }
        } else {
            printf("%s", code[i]); // Invalid or unoptimized format
        }
    }
    return 0;
}
```

**How to run:**
```bash
gcc code_optimization.c -o code_optimization
./code_optimization
```
Enter TAC lines, then press `Ctrl+D` (Linux) or `Ctrl+Z` (Windows) to end input.

## OUTPUT

![Output](./output.png)

```
Enter three address code
Enter the ctrl-z to complete:
a=d/1;b=2+4;c=s**2;

Unoptimized input block
a=d/1
b=2+4
c=s**2

Optimized three address code

type3 algebraic expression elimation: a=d

type2 constant floding: b=6

type 1 reduction in strength: c=s*s
```

> Note: this screenshot is from an earlier reference version of the program (different variable
> ordering/messages). Running `code_optimization.c` in this repo on the sample input below produces
> equivalent optimizations with slightly different message wording:
>
> **Sample input:**
> ```
> a=2+4;
> b=d*1;
> c=s*2;
> ```
> **Sample output:**
> ```
> a=6;    // Constant Folding
> b=d;    // Algebraic Simplification (X*1 or X/1)
> c=s+s;  // Strength Reduction (X*2 to X+X)
> ```

## RESULT

Thus, the C program for simple code optimization techniques like constant folding, strength
reduction, and algebraic simplification was successfully implemented and tested with various inputs.
