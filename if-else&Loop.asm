.MODEL SMALL
.STACK 100H
.DATA
INITIAL DB 76
SUM DB 30H
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
        
;    MOV BL,INITIAL
    
    ;CMP BL,90
    ;JGE LABELA
    ;CMP BL,80
    ;JGE LABELB
    ;CMP BL,70
    ;JGE LABELC
    ;JMP LABELF
;    CMP SUM,9
;    JLE LABEL_LOOP
    
    
;LABELA:
;    MOV AH,2
;    MOV DL,'A'
;    INT 21H
;    JMP EXIT
            
            
;LABELB:
;    MOV AH,2
;    MOV DL,'B'
;    INT 21H
;    JMP EXIT
    
;LABELC:
;    MOV AH,2
;    MOV DL,'C'
;    INT 21H
;    JMP EXIT
    
;LABELF:
;    MOV AH,2
;    MOV DL,'F'
;    INT 21H
;    JMP EXIT
    
LABEL_LOOP:
    MOV AH,2
    MOV DL,SUM
    INT 21H
    INC SUM
    CMP SUM,39H
    JLE LABEL_LOOP

    
EXIT:
    MOV AH,4CH
    INT 21H 
    MAIN ENDP
END MAIN