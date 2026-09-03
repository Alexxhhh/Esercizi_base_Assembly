; main.asm

; Primo esercizio dispense (esercitazioni assembly)
%include "utils.nasm"

section .data
    x1 dd 2
    x2 dd 5

section .bss
    y resd 1

section .text
global _start
extern proc
_start:
    push dword [x1]
    push y
    call proc
    mov eax, [y]
    push dword [x2]
    push y
    add eax, [y]
    printd eax
    exit 0