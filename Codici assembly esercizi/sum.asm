; sum.asm

section .data
    n equ 8
    x equ 12
    res equ 16

section .text
global sum
sum:
    push ebp
    mov ebp, esp
    pushad
    mov ebx, [ebp+x]
    mov edi, [ebp+n]
    mov ax, 0
    mov esi, 0
.ciclo:
    cmp esi, edi
    jge .fine
    add ax, [ebx+2*esi]
    inc esi
    jmp .ciclo
.fine:
    mov [ebp+res], ax
    popad
    mov esp, ebp
    pop ebp
    ret 8