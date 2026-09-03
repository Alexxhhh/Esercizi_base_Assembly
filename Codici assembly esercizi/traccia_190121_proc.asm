section .data
    c equ 16
    V equ 12
    n equ 8

section .bss
    cont resw 1

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad
    mov eax, [ebp+V]
    mov edi, [ebp+n]
    shr edi, 1              ; edi <--- n/2
    mov bx, [eax+edi*2]
    mov ecx, eax
    add ecx, edi
    add ecx, 2              ; indirizzo di partenza della seconda metà del vettore 
    xor esi, esi            ; i=0
    mov [c], 0
ciclo:
    cmp esi, edi
    jge fine                ; i>=n/2
    mov dx, [eax+esi*2]     ; dx <--- V[i]
    sub dx, [ecx+esi*2]     ; dx <--- V[i]- V[i+n/2+1]
    rol dx, 1
    jnc continua
    ror dx, 1
    neg dx
    rol dx, 1
continua:
    ror dx, 1
    cmp dx, bx
    jle continua_ciclo
    add [cont], 1
continua_ciclo:
    incr esi
    jmp ciclo
fine:
    mov eax, [ebp+c]
    mov bx, [cont]
    mov [eax], bx
    popad
    mov esp, ebp
    pop ebp
    ret 12