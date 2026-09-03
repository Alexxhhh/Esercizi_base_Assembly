section .data
    ret equ 18
    V equ 14
    n equ 10
    k equ 8

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad
    mov eax, [ebp+V]
    mov edi, [ebp+n]
    sub edi, 2
    mov bx, [ebp+k]
    xor esi, esi
ciclo:
    cmp esi, edi
    jge fine
    mov cx, [eax+esi*2]
    shr cx, 1
    ; Controlliamo che la tera sia composta da numeri pari
    jc continua
    mov cx, [eax+esi*2+2]
    shr cx, 1
    jc continua
    mov cx, [eax+esi*2+4]
    shr cx, 1
    jc continua
    mov dx, [eax+esi*2]
    add dx, [eax+esi*2+2]
    add dx, [eax+esi*2+4]
    cmp dx, bx
    jle continua
    mov cx, 1
    jmp terminazione
continua:
    inc esi
    jmp ciclo
fine:
    mov cx, 0
terminazione:
    mov eax, [ebp+ret]
    mov [eax], cx
    popad
    pop ebp
    ret 14