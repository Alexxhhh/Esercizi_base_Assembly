%include "utils.nasm"

section .data
    c equ 16
    n equ 12
    V equ 8

setion .text
global check
check:
    push ebp
    mov ebp, esp
    pushad

    mov eax, [ebp+V]
    mov edi, [ebp+n]

    sub edi, 2              ; edi <--- n-2
    xor esi, esi            ; esi <--- 0
    xor bx, bx              ; bx  <--- 0

ciclo:
    cmp esi, edi
    jge ultimoElemento      ; esi >= esi
    mov cx, [eax+esi*2]
    cmp cx, 0
    jl condizione2
    mov dx, [eax+esi*2+4]   ; dx <--- V[i+2]
    cmp dx, 0
    jge avanti
    sub cx, dx              ; cx <--- V[i]-V[i-2]
    cmp cx, 4
    jle avanti

update:
    inc bx
    jmp avanti

; else
condizione2:
    mov dx, [eax+esi*2+2]   ; dx <--- V[i+1]
    cmp dx, 0
    jl avanti
    sub cx, dx              ; cx <--- cx-dx (V[i]-V[i+1])
    neg cx                  ; imul cx, -1
    cmp cx, 2
    jg update

avanti:
    inc esi
    jmp ciclo

ultimoElemento:
; esi n-2
    mov cx, [eax+esi*2]     ; V[n-2]
    cmp cx, 0
    jge fine                ; cx >= 0
    mov dx, [eax+esi*2+2]   ; V[n-1]
    cmp dx, 0
    jle fine
    sub cx, dx              ; cx <--- cx-dx (V[i]-V[i+1])
    neg cx                  ; cx <--- -cx
    cmp cx, 2   
    jle fine                ; cx < 2
    inc bx

fine:
    mov edx, [ebp+c]
    mov [edx], bx
    popad
    pop ebp
    ret 12

