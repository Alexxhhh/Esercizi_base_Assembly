section .data
	c equ 15
	V equ 11
	n equ 9
	k equ 8
	
section .bss
	cont resw 1	;perchè non abbiamo più registri
	
section .text
global proc
proc:
	push ebp
	mov ebp, esp
	pushad
	;calcoliamo "2^K"
	mov cl, [ebp+k]
	mov bc, 2
	shl bx, cl		;dentro bx ci sarà 2^K
	mov ecx, [epb+V]
	mov [cont], word 0
	xor esi, esi		;i=0
	mov ax, [ecx]		;dentro ax ci sarà  V[0]
	movzx edi, [ebp+n]	;estendiamo con movzx
	dec edi
	add ax,  [ecx+edi*2]
	cwd
	idiv bx
	cmp dx, 0
	je ciclo
	add [cont], word 1
ciclo:
	cmp esi, edi
	jge fine			;i>=n-1
	mov ax, [ecx+esi*2]	;leggiamo il primo valore
	add ax, [ecx+esi*2+2]	;ci spostiamoi di +2 perchè vogliamo il valore avanti e stiamo considerando una word
						;in pratica stiamo faceno V[x]+V[x+1]
	cwd
	idiv bx
	cmp dx, 0	;verifichiamo se il resto è zero
	je continua
	add [cont], 1
continua:
	inc esi		;incrementiamo l'indice
	jmp ciclo;
fine:
	mov eax, [ebp+c]
	mov bx, [cont]
	mov [eax], bx
	popad
	mov esp, ebp
	pop ebp
	ret 11

	
	
	
	
	