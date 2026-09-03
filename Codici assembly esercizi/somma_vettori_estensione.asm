%include "utils.nasm"

SECTION .DATA
X DW 12, 4, 2, -6, -5,1
N EQU ($-X)/2

SECTION .TEXT
GLOBAL _START
_START:
    MOV EAX, 0
    MOV ESI, 0
CICLO:
    CMP ESI, N  ; (i<n)?
    JGE FINE
    MOVSX EBX, WORD[X+2*ESI]    ; EBX <--------- estensione della word memorizzata a partire da [X+2*ESI]
    ADD, EAX, EBX
    INCR ESI
    JMP CICLO
FINE:
    PRINTD EAX
    EXIT 0