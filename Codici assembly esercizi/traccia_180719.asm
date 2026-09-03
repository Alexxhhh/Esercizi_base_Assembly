%include "utils.nasm"

section .data
    V dw 1, 3, 5, -2, 1, 7, -3, -7
    n equ ($-V)/2
    k db 4

section .bss
    c resw 1

section .text
global _start
extern proc
_start:
    push c
    push V
    push word n
    push byte [k]
    call proc
    pintw [c]
    exit 0