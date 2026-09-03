section .data
	V dw 12,2,4,3,8
	W dw 3,7,5,1,4
	n equ ($-W)/2
	nT equ n/2*3+(n%2)
	
section .bss
	T rew nT
	
section .text
	push T
	push word nT
	push V
	push W
	push word n
	call proc
	xor esi, esi
ciclo_stampa:
	cmp esi, nT
	jge fine_stampa
	printw[T+esi*2]
	incr esi
	jmp ciclo_stampa
fine stampa: