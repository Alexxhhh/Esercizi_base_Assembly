section .data
	x dw 10,-3,-7,11,-2
	n equ ($-x)/2
	
section .text
global start
start:	
	mov esi,0	;i=0
ciclo:
	cmp esi, n-1
	jge fine
	mov ax, [x+2*esi]		; v[i]
	mov bx, [x+2-esi+2]	;Prendiamo l'elemento in posizione x+1 v[i+1]
	cmp ax,bx
	jle no
	sub ax,bx	;ax = v[i]-v[i+1]
	mov [x+2*esi], ax	;v[i]=v[i]-v[i+1];
no:
	inc esi
	jmp ciclo
exit:
	exit 0