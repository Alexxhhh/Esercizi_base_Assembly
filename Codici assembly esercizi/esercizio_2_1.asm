section .data
    v dd 7, 9 ,4, 27, 36, 64
    n equ ($-x)/4 

section .bss
    s resd 1

section .text
global _start
_start:
    xor ebx, ebx    ; s
    xor esi, esi    ; i
    mov ecx, 3
ciclo:
    cmp esi, n
    jge fine
    mov eax, [v+esi*4]
    cdq
    idiv ecx
    cmp edx, 0  ; è multiplo?
    jne no
    add ebx, [v+esi*4]
no:
    incr esi
    jmp ciclo
fine:
    mov [s], ebx
    exit 0
