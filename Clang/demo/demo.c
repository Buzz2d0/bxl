#include <stdio.h>

int main()
{
    puts("Hello World!\n");
    return 0;
}

// Clang 将其编译成汇编代码
// clang -O2 -S -mllvm --x86-asm-syntax=intel -fno-asynchronous-unwind-tables demo.c
// clang -O2 -S -masm=intel demo.c 