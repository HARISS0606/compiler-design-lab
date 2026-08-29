# Output — Ex.No 5

```
$ lex control.l
$ yacc -d control.y
$ gcc lex.yy.c y.tab.c -o control
$ ./control
Enter a C control structure syntax:
if (x < 5) { y = 10; }
Valid control structure syntax.
```

**Result:** Thus the program to recognize a valid control structure syntax of C language (For loop,
while loop, if-else, if-else-if, switch-case, etc.) using LEX and YACC was executed and verified
successfully.
