.MODEL SMALL
.STACK 100H
.DATA
QUES DB "ENTER THREE INITIALS: $"
INITIAL1 DB ?
INITIAL2 DB ?
INITIAL3 DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,9
    LEA DX,QUES
    INT 21H
    
    MOV AH,1
    
    INT 21H           ;INPUT IN INITIAL1
    MOV INITIAL1,AL
    
    INT 21H
    MOV INITIAL2,AL   ;INPUT IN INITIAL2
    
    INT 21H
    MOV INITIAL3,AL   ;INPUT IN INITIAL3
    
    
    MOV AH,2
    
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV DL,INITIAL1    ;INITIAL1 OUTPUT
    INT 21H
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV DL,INITIAL2    ;INITIAL2 OUTPUT
    INT 21H
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV DL,INITIAL3    ;INITIAL3 OUTPUT
    INT 21H
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    
    MOV AH,2           ;RETURN TO OS
    INT 21H
    MOV AH,4CH
    INT 21H 
    MAIN ENDP
END MAIN