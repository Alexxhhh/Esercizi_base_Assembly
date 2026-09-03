section .data
	x dw 10,-3,-7,11,-2
	y dw 7,-2,4,3,6
	n equ ($-y)/2
	
section.bss
	p resd 1

section .text
global start
start:
	mov esi,0
	mov edi, 0	;ricorda il prodotto
ciclo:
	cmp esi, n
	mov ax, [x+2*esi]
	imul word[y+2*esi]		;dobbiamo specificare word
	mov cx, dx
	shl ecx, 16
	mob cx, ax
	add edi, ecx
	inc esi
	jmp ciclo
fine:
	mov [p], edi
	exit 0