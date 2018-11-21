.MODEL SMALL 
.STACK 100H
.DATA
DATA1 DB 30H,31H,32H,33H,34H,35H,36H,37H,38H,39H

PROMPT1 DB "Maximum Value: $"
PROMPT2 DB "Minimum Value: $"

MAX DB 30H
MIN DB 39H
.CODE
 MAIN PROC        
    MOV AX,@DATA
    MOV DS,AX
    CALL FIND
    MOV AH,9
    LEA DX,PROMPT1
    INT 21H
    MOV AH,2
    MOV DL,MAX
    INT 21H
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    LEA DX,PROMPT2
    INT 21H
    MOV AH,2
    MOV DL,MIN
    INT 21H
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H

EXIT:    
    MOV AH,4CH
    INT 21H
   MAIN ENDP
 

FIND PROC
FIND_MAX:
    MOV BL,MAX    
    CMP [DATA1],BL
    JG FIND_MX
    JE EQUAL1
    JMP FIND_MIN 
FIND_MX:
    MOV BL,[DATA1]
    MOV MAX,BL
    INC DATA1   
    JMP FIND_MAX
EQUAL1:
    INC DATA1   
    JMP FIND_MAX

FIND_MN:
    MOV BL,[DATA1]
    MOV MIN,BL
    INC DATA1   
    JMP FIND_MIN

EQUAL2:
    INC DATA1   
    JMP FIND_MIN

FIND_MIN:
    MOV BL,MIN    
    CMP [DATA1],BL
    JL FIND_MN 
    JE EQUAL2 
    RET
  FIND ENDP 


END MAIN
    