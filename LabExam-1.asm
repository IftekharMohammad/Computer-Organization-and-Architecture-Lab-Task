.MODEL SMALL
.STACK 100H
.DATA
QUES DB "Input 4 characters: $"
QUES2 DB "Input pattern character: $"
STAR DB ?
INITIAL1 DB ?
INITIAL2 DB ?
INITIAL3 DB ?
INITIAL4 DB ?
SUM1 DB 30H
SUM3 DB 30H
SUM5 DB 30H
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,9
    LEA DX,QUES
    INT 21H
    
    MOV AH,1
    INT 21H           
    MOV INITIAL1,AL
    
    INT 21H           
    MOV INITIAL2,AL
    
    INT 21H           
    MOV INITIAL3,AL
    
    INT 21H           
    MOV INITIAL4,AL

    
    MOV AH,2
    
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H 
    
    MOV AH,9
    LEA DX,QUES2
    INT 21H
    
    MOV AH,1
    INT 21H           
    MOV STAR,AL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    
LABEL_LOOP1:

    MOV DL,STAR
    INT 21H
    INC SUM1
    CMP SUM1,35H
    JL LABEL_LOOP1

    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV DL,STAR
    INT 21H
    MOV DL,INITIAL1
    INT 21H
    MOV DL,STAR
    INT 21H
    MOV DL,INITIAL2
    INT 21H
    MOV DL,STAR
    INT 21H
    
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    

LABEL_LOOP3:

    MOV DL,STAR
    INT 21H
    INC SUM3
    CMP SUM3,35H
    JL LABEL_LOOP3


    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H

    
    MOV DL,STAR
    INT 21H
    MOV DL,INITIAL3
    INT 21H
    MOV DL,STAR
    INT 21H
    MOV DL,INITIAL4
    INT 21H
    MOV DL,STAR
    INT 21H
    
    
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
LABEL_LOOP5:

    MOV DL,STAR
    INT 21H
    INC SUM5
    CMP SUM5,35H
    JL LABEL_LOOP5
        
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    
    
    MOV AH,4CH        ;RETURN TO OS
    INT 21H 
    MAIN ENDP
END MAIN