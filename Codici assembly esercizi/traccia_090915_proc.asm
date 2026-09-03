%include "utils.nasm"

section .data
    a equ 8
    na equ 12
    b equ 14
    nb equ 18
    ris equ 20

section .text
global verifica
verifica:
    push ebp
    mov ebp, esp
    pushad

    ; Carichiamo gli indirizzi
    mov eax, [ebp+a]        ;indirizzo partenza di A
    mov ebx, [ebp+b]        ;indirizzo partenza di B
    mov dx, [eax]           ;dx = 2
    movzx edx, dx           ;estendiamo con degli zeri per poter utilizzare il valore per l'indirizzamento
    ; movzx edx, word [eax]     ---> equivalente alle prime due
    mov cx, [ebx+edx*2]     ; cx = -1
    mov di, [ebp+na]        ; di = nA
    dec di
    add eax, 2              ; puntiamo al prossimo elemento
ciclo:
    cmp di, 0
    jle end_true            ; di <=0 ?
    movzx edx, word [eax]
    mov si, [ebx+edx*2]
    ; Verifichiamo se B[A[i+1]] < B[A[i]]
    cmp si, cx
    jl end_false
    mov cx, si
    dec di
    add eax, 2
    jmp ciclo

end_true:
    mov al, 1
    jmp esci

end_false:
    mov al, 0

esci:
    mov ebx, [ebp+ris]      ;carichiamo l'indirizzo del risultato
    mov [ebx], al
    popad
    pop ebp
    ret 16