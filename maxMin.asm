.MODEL SMALL 
.STACK 100H
.DATA
DATA1 DB 31H,32H,33H,34H,35H,36H,37H,38H,39H

PROMPT1 DB "Maximum Value: $"
PROMPT2 DB "Minimum Value: $"

MAX DB 30H
MIN DB 39H

LENGTH DB 39H

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

LEA SI,DATA1

FIND_MAX:
    CMP LENGTH,30H
    JG FINDER_MAX
    JE FINDER_MIN
FINDER_MAX:
    MOV DL, MAX
    CMP [SI],DL
    JG SWAP_MAX
    JE INC_MAX
    JMP FINDER_MIN
    
SWAP_MAX:
    MOV DL,[SI]
    MOV MAX,DL
    INC SI
    DEC LENGTH
    JMP FIND_MAX
INC_MAX:
    INC SI
    DEC LENGTH
    JMP FIND_MAX
    


FIND_MIN:
    CMP LENGTH,30H
    JG FINDER_MIN
    JE RETURN
FINDER_MIN:
    MOV DL, MIN
    LEA SI,DATA1
    CMP [SI],DL
    JL SWAP_MIN
    JE INC_MIN
    JMP FINDER_MIN
    
SWAP_MIN:
    MOV DL,[SI]
    MOV MIN,DL
    INC SI
    DEC LENGTH
    JMP FIND_MIN
INC_MIN:
    INC SI
    DEC LENGTH
    JMP FIND_MIN


    
RETURN:    
    RET
  FIND ENDP 


END MAIN
    