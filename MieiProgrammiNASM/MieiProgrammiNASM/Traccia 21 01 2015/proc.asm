section .data
	c equ 16
	V equ 12
	n equ 8
	
section .text
global proc
proc:
	push ebp
	mov ebp, esp
	pushad
	mov eax, [ebp+V]	;Indirizzo vettore
	mov edi, [ebp+n]	;lunghezza vettore
	xor esi, esi	;i=0
	xor dx, dx

ciclo:
	cmp esi, edi
	jge fine
	mov bx, [eax+esi*2]	;Leggiamo il valore V[i]
	mov ecx, esi
	dec ecx;	

ciclo_2:
	cmp ecx, 0
	jl fine_2		;j<0
	cmp bx, [eax+ecx*2]	;verifichiamo se V[i]==V[j]	j<i
	je non_contare
	dec ecx
	jmp ciclo_2

fine_2:
	incr dx

non_contare:
	incr esi
	jmp ciclo

fine:
	mov eax, [ebp+c]
	mov [eax], bx
	popad
	pop ebp
	ret 8
	
	
	
	
	