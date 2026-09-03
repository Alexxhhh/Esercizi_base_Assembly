section .data
    c equ 16
    V equ 12
    n equ 8

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad
    mov eax, [ebp+V]
    mov edi, [ebp+n]
    xor esi, esi        ; i=0
    xor dx, dx          ; c=0
ciclo:
    cmp esi, edi
    jge fine            ; i>=n
    mov bx, [eax+esi*2] ; Leggiamo V[i]
    mov ecx, esi
    decr ecx            ; j=i-1
ciclo_2:
    cmp ecx, 0
    jl fine_2           ; j<0
    cmp bx, [eax+ecx*2] ; V[i]==V[j]? j<i
    je non_contare
    dec ecx
    jmp ciclo_2
fine_2:
    incr dx
non_contare:
    incr esi
    jmp ciclo
fine:
    mov eax, [ebp+c]
    mov [eax], bx
    popad
    pop ebp
    ret 12
