; Dato un vettore v, scrivere un programma che calcoli il numero 
; di terne tali per cui è valida la seguente relazione
;       v[i]>=v[i+1]-v[i+2], i=0,...,N-3


section .data
    x dd 7, 9 ,4, 27, 36, 64
    n equ ($-x)/4-2 

section .bss
    ret resd 1

section .text
    xor esi, esi
    xor eax, eax
    mov edi, x
ciclo:
    cmp esi, n
    jge fine
    mov ebx, [edi+esi*4]
    mov ecx, [edi+esi*4+4]
    sub ecx, [edi+esi*4+8]
    cmp ebx, ecx
    jl no
    inc eax
no:
    inc esi
fine:
    mov [ret], eax
    exit 0