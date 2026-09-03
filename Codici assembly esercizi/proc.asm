; proc.asm

section .data
    x equ 12
    ris equ 8

section .bss
    xx resd 1

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad
    mov eax, [ebp+x]
    mul eax
    mov [xx], eax
    mov eax, [ebp+x]
    add eax, [xx]
    inc eax
    mov ebx, [ebp+ris]
    mov [ebx], eax
    popad
    mov esp, ebp
    pop ebp
    ret 8