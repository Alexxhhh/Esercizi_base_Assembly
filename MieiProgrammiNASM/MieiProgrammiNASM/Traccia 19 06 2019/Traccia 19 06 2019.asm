%include "utils.nasm"

section .data
	V dw -2,3,7,6,2,-10,-3,5
	nV equ ($-V)/2
	
section .bss
	max resw 1
	
section .text
extern getMax
global start
start:
	sub esp, 2
	push V
	push dword nV
	call getMax
	pop word [max]
	printw word [max]
	exit 0