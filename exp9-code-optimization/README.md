# Ex.No 9 — Simple Code Optimization Techniques

**Aim:** Implement simple code optimization techniques — Constant folding, Strength reduction, and
Algebraic transformation.

## Files
- `code_optimization.c` — Reads three-address code lines and applies:
  - **Constant folding** — evaluates constant expressions at compile time.
  - **Strength reduction** — replaces `x*2` with `x+x`.
  - **Algebraic simplification** — simplifies `x*1` / `x/1` to `x`.

## How to run
```bash
gcc code_optimization.c -o code_optimization
./code_optimization
```
Enter TAC lines, then press `Ctrl+D` (Linux) or `Ctrl+Z` (Windows) to end input.

## Sample Input
```
a=2+4;
b=d*1;
c=s*2;
```

## Sample Output
```
Optimized Code:
a=6;    // Constant Folding
b=d;    // Algebraic Simplification (X*1 or X/1)
c=s+s;  // Strength Reduction (X*2 to X+X)
```

## Result
Thus, the C program for simple code optimization techniques like constant folding, strength
reduction, and algebraic simplification was successfully implemented and tested with various inputs.
