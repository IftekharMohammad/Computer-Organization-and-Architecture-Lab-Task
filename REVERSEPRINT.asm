.MODEL SMALL 
.STACK 100H
.DATA
CAR DB 0DH
.CODE
 MAIN PROC
        
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,1
    
REPEAT:
    INT 21H
    CMP AL,CAR
    JE PRINT
    XOR BX,BX
    MOV BL,AL
    PUSH BX
    JMP REPEAT

PRINT:
    CMP SP,100H
    JE EXIT
    MOV AH,2
    POP DX
    INT 21H
    JMP PRINT    
    
EXIT:    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    