%include "utils.nasm"

SECTION .DATA
STR DB 'roma'
n EQU $-STR

SECTION .TEXT
GLOBAL _START
_START:
    ; inizializzazione 
    XOR ESI, ESI    ; i=0
    MOV EDI, n-1    ; j=n-1
CICLO:
    CMP ESI, EDI
    JGE FINE
    MOV AL, [STR+ESI]
    XCHG AL, [STR+EDI]
    MOV [STR+ESI], AL
    INC ESI
    INC EDI
    JMP CICLO
FINE:
    PRINTB STR, n
    EXIT 0
