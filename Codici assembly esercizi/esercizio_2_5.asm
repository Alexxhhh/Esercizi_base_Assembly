; Dato un vettore v, scrivere un programma che calcoli 
; la media dei valori pari contenuti al suo interno.

section .data
    x dd 7, 9 ,4, 27, 36, 64
    n equ ($-x)/4

section .bss
    m resd 1

section .text
global _start
_start:
    xor eax, eax        ; s=0
    xor ebx, ebx        ; c=0
    xor esi, esi        ; i=0
ciclo:
    cmp esi, n
    jge fine
    mov ecx, [x+esi*4]
    ror ecx, 1
    jc no
    rol ecx, 1
    add eax, ecx
    inc ebx
no:
    inc esi
    jmp ciclo
fine
    cdq
    idiv ebx
    mov [m], eax
    exit 0