section .data
	x dw 12,4,2,-6,-5,1
	n equ ($-x)/2
	
section .text
global start
start:
	mov eax, 0
	mov ebx, 0
	mov esi,  0
ciclo:
	cmp esi, n
	jge fine
	mov eax, [esi+n*2]
	add ebx, eax
	jmp ciclo
fine:
	printd ebx
	exit 0
	
	