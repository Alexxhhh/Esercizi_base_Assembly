%include "utils.nasm"

section .data
    V dw -1,3,-2,-5,10,-6,2,-1
    n equ ($-V)/2

section .bss
    c resw 1

section .text
global _start
_start:
    push c
    push dword n
    push V
    call check
    printw word [c]
    exit 0
