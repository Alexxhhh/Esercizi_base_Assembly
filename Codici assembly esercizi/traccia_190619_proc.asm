%include "utils.nasm"

section .data
    max equ 16
    V equ 12
    nv equ 8

section .text
global getMax
getMax:
    push ebp
    mov ebp, esp
    pushad

    mov eax, [ebp+V]
    mov esi, [ebp+nv]
    xor bx, bx                  ; s1 (somma del modulo dei valori pari)
    xor cx, cx                  ; s2 (somma valori in posizione dispari)
    xor edi, edi                ; i=0

ciclo:
    cmp edi, esi
    jge fine                    ; i>=n
    mov dx, [eax+edi*2]
    ; Verifichiamo se la posizione è dispari
    ror edi, 1
    jnc posPari:                ; CF=0
    add cx, dx                  ; s1 += V[i]

posPari:
    rol edi, 1                  ; ripristiniamo edi
    ror dx, 1
    jc salta
    rol dx, 1
    cmp dx, 0
    jge aggingi                 ; dx >= 0
    neg dx

aggingi:
    add bx, dx

salta:
    inc edi                     ; i+=1
    jmp ciclo

fine:
    cmp bx,cx
    jg scriviMax
    ; decidiamo che il massimo lo memorizziamo in bx
    mov bx, cx

scriviMax:
    mov [ebp+max], bx
    popad
    pop ebp
    ret 8