section .data
	v dd 7,9,4,27,36,64
	n equ ($-x)/4
	k dd 3
	
section .bss
	s resd 1
	
section .text
global start
start:
	mov ebx, 0		
	mov esi, 0
	mov ecx, [k]	
ciclo:
	cmp esi, n
	jge fine
	mov eax, [v+esi*4]
	cdq					;eax-->edx:eax
	idiv ecx				; eax/ecx
	cmp edx, 0			;il resto è 0?
	jne no
	add ebx, [v+esi*4]
no:
	inc esi
	jmp ciclo
fine:
	mov [s], ebx
	exit 0