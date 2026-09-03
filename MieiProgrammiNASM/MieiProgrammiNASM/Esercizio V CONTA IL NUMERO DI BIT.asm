section .data
	x dd 7, 9, 27, 36, 64
	n ($-x)/4
	k dd 5

section .bss
	ret resd 1
	
section .text
global start
start:
	mov esi, 0	;i=0
	mov eax, 0	;somma=0
ciclo:
	cmp esi, n
	jge fine
	mov ebx, [x+esi*4]
	xor edi, edi	;j=0
	xor ecx, ecx	;contatore=0
ciclo_2:
	cmp edi, 32
	jge fine_2
	shr ebx, 1
	jnc no_uno
	inc ecx
no_uno:
	inc edi
	jmp ciclo_2
fine_2:
	cmp ecx, [k]
	jne no
	inc eax
no:
	inc esi
	jmp ciclo
fine:
	mov [ret], eax
	exit 0

	
	