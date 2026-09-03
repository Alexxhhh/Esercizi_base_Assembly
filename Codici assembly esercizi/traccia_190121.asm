%include "utils.nasm"

section .data
    V dw 11, 1, -8, 5, 4, -3, 2
    n equ ($-V)/2

section .bss
    c resw 1

section .text
global _start
extern proc
_start:
    push c
    push V
    push dword n
    call proc
    printw [c]
    exit 0