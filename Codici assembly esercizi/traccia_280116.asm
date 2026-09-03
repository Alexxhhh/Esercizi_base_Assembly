%include "utils.nasm"

section .data
    V dw 5, 3, 2, 1, 4, 8, 3
    n equ ($-V)/2
    k dw 5

section .bss
    ret resw 1

section .text
global start
extern proc
start:
    push ret
    push V
    push dword n
    push word [k]
    call proc
    printw [ret]
    exit 0