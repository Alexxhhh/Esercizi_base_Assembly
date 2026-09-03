%include "utils.nasm"

section .data
	nt equ  24
	T equ 20
	n equ 16
	W equ 12
	V equ 8

	
section .data
global createT

createT:
	push ebp
	mov ebp, esp
	pushad
	
	mov eax,[ebp+V] ; indirizzo di V
	mov ebx,[ebp+W]; indirizzo di W
	mov ecx,[ebp+T]; indirizzo di T
	mov edi,[ebp+n]
	
	shr edi,1 ; edi  = n/2
	;CF = 0
	jnc ciclo
	
	mov dx,[eax + edi*4]
	add dx,[ebx+edi*4]
	
	mov esi,[ebp+nt]
	; T[nt-1] --> T +(nt-1)*2 = T +nt*2 -2
	mov [ecx +esi*2-2],dx
	
ciclo:
	cmp edi,0 ; edi = n/2 ... 0
	jle fine
	
	mov dx,[eax]
	add dx, [ebx]
	mov [ecx],dx
	
	mov dx,[eax+2]
	mov [ecx+2],dx
	
	mov dx,[ebx+2]
	mov [ecx+4],dx
	
	add eax,4
	add ebx,4
	add ecx,6
	
	dec edi
	jmp ciclo
	
fine:
	popad
	pop ebp
	ret 20

	
	