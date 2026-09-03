section .data
	T equ 20
	nt equ 18
	V equ 14
	W equ 10
	n equ 8
	
section .text
global proc
proc:
	push ebp
	mov ebp, esp
	pushad
	mov eax, [ebp+V]		;carichiamo l'indirizzo del primo vettore
	mov ebx, [ebp+W]		;carichiamo l'indirizzo del secondo vettore
	movzx edi, [ebp+n]		;carichiamo n
	mov ecx, [ebp+T]		;carichiamo T
	xor esi, esi
ciclo:
	cmp esi,edi
	jge fine		;i>=n
	ror esi, 1
	jc dispari		;l'indice è dispari
	rol esi, 1
	mov dx, [eax+esi*2]
	mov dx, [ebc+esi*2]	;somma tra i due elementi
	mov [ecx], dx
	jmp continua
dispari:
	mov dx, [eax+esi*2]
	mov [ecx], dx
	mov dx, [ebx+esi*2]
	add ecx, 2
	mov [ecx], dx
continua:
	add ecx,2
	incr esi	
	jmp ciclo
fine:
	popad
	pop ebp
	ret 16