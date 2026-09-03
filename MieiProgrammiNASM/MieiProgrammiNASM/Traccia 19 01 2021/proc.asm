section .data
	c equ 16
	V equ 12
	n equ 8
	
section. bss
	c resw 1
	
section .text
global proc
proc:
	push ebp
	mov ebp, esp
	pushad
	mov eax, [ebp+V]
	mov edi, [ebp+n]
	shr edi, 1			;in edi ci sarà n/2
	mov bx, [eax+edi*2]
	mov ecx, eax
	add ecx, edi
	add ecx,2			;indirizzo di partenza della seconda metà
	xor esi, esi			;indice
ciclo:
	cmp esi, edi
	jge fine				;i>=n/2
	mov dc, [eax+esi*2]	;in dx ci sarà V[i]
	sub dx, [ecx+esi*2]	; in dx ci sarà V[i]-V[i+n/2+1]
	rol dx, 1
	jnc continua
	ror dx,1
	neg dx
	jmp continua_2
continua:
	ror dx,1
continua_2:
	cmp dx, bx
	jle continua_ciclo
	add [c], 1
continua_ciclo:
	inc esi
	jmp ciclo
fine:
	mov eax, [ebp+c]
	mov bx, [cont]
	mov [eax] , bx
	popad
	mov esp, ebp
	pop ebp
	ret 12
	
	
	
	