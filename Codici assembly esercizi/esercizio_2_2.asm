; Dato un vettore v, scrivere un programma che restituisca l’indirizzo in 
; corrispondenza del quale è posizionato il massimo del vettore


section .data
    x dd 7, 9 , -7, 4, 27, 36, 64, -2    
    n equ ($-x)/4

section .bss
    ind_max resd 1

section .text
global _start
_start:
    mov eax, [x]    ; massimo
    mox ebx, x      ; indirizzo massimo
    mov esi, 1
ciclo:
    cmp esi, n
    jge fine
    cmp eax, [v+esi*4]
    jge no
    ; Aggiornamento del massimo
    mov eax, [v+esi*4]
    lea ebx, [v+esi*4]
no:
    incr esi
    jmp ciclo
fine:
    mov [ind_max], ebx
    exit 0