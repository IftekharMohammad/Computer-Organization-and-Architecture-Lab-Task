.MODEL SMALL 
.STACK 100H
.DATA
PROMPT DB "REVERSE: $"
.CODE
 MAIN PROC
        
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,1
    
REPEAT:
    INT 21H
    CMP AL,0DH
    JE PRINT
    XOR BX,BX
    MOV BL,AL
    PUSH BX
    JMP REPEAT

PRINT:
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    LEA DX,PROMPT
    MOV AH,9
    INT 21H
    MOV AH,2
PRINT1:    
    CMP SP,100H
    JE EXIT
    POP DX
    INT 21H
    JMP PRINT1    
    
EXIT:    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    