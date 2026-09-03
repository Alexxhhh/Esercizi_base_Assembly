%include "utils.nasm"
section .data
	V dw 12,2,4,3,8
	W dw 3,7,5,1,4
	n equ ($-W)/2
	nt equ n/2*3 + (n % 2)

section .bss
	T resw nt
	
section .data
global _start
extern createT

_start:
	push dword nt
	push T
	push dword n
	push W
	push V
	
	call createT
	
	xor esi, esi
ciclo:
	cmp esi, nt
	jge esci
	printw word [T+esi*2]
	inc esi
	jmp ciclo
	
esci:
	exit 0
	

