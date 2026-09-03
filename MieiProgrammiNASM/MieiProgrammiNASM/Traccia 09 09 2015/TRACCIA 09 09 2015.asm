%include "utils.nasm"

section .data
	A dw 2,3,1
	nA equ ($-A)/2
	B dw 3,4,-1,2
	nB equ ($-B)/2
	
section .bss
	ris resb 1
	
section .text
global start
extern verifica

start:
	push ris
	push  word nB
	push B 
	push word nA
	push A
	call verifica
	printb byte [ris]
	exit 0