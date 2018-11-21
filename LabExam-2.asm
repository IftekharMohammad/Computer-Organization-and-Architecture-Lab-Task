.MODEL SMALL
.STACK 100H
.DATA
PROMPT DB "Input The Character: $"
FIRST DB "HEX $"
SECOND DB "NONE $"
INPUT DB ?

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,9
    LEA DX,PROMPT
    INT 21H
    
    MOV AH,1
    INT 21H           
    MOV INPUT,AL
    
    CMP INPUT,30H  
    JGE LOGIC2   
    JMP NONE  


LOGIC2:
      CMP INPUT,46H  
      JLE PRINT   
      JMP NONE
NONE: 
      MOV AH,2
      MOV DL,0AH
      INT 21H
      MOV DL,0DH
      INT 21H
      
      MOV AH,9   
      LEA DX,SECOND    
      INT 21H
      JMP EXIT
      
PRINT:

      MOV AH,2
      MOV DL,0AH
      INT 21H
      MOV DL,0DH
      INT 21H
      
      MOV AH,9
      LEA DX,FIRST    
      INT 21H 
 
EXIT:        
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    MAIN ENDP

END MAIN


