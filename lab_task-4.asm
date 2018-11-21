.MODEL SMALL
.STACK 100H
.DATA
QUES DB "Enter A Lowercase Character: $"
PROMPT  DB "Upparcase Character Is: $"
INITIAL DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,9
    LEA DX,QUES
    INT 21H
    
    MOV AH,1
    INT 21H           ;INPUT IN INITIAL
    MOV INITIAL,AL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    LEA DX,PROMPT
    INT 21H
    
    MOV AH,2
    MOV DL,INITIAL
    SUB DL,20H
    INT 21H
    
    
    
    MOV AH,4CH        ;RETURN TO OS
    INT 21H 
    MAIN ENDP
END MAIN