%include "utils.nasm"

section .data
    V dw -2, 3, 7, 6, 2, -10, -3, 5
    nv equ ($-V)/2

section .bss
    max resw 1

section .text
global _start
extern getMax
_start:
    sub esp, 2
    push V
    pust dword nv
    call getMax
    pop word [max]
    printw word [max]
    exit 0