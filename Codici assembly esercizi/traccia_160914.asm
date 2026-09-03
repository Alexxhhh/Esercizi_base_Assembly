section .data
    V dd 1076, 1032, 4600, 3800
    n equ ($-V)/4
    W dw 6, 2, -4, -3

section .bss
    Z resw n

section .text
global start
extern proc
start:
    push Z
    push V
    push W
    push dword n
    call proc
    xor esi, esi
ciclo_stampa:
    cmp esi, n
    jge uscita
    printw [Z+esi*2]
    inc esi
    jmp ciclo_stampa
uscita:
    exit 0
    