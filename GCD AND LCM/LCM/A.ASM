.MODEL SMALL

.DATA
  NUM1 DB 08H
  NUM2 DB 04H
  GCD DB ?
  LCM DB ? 
.CODE
MOV AX,@DATA 
MOV DS,AX

MOV AL,NUM1   
MOV BL,NUM2

MOV AH,0

UP: 
CMP AL,BL        
JE EXIT          
JB EXCG          
  
UP1: 
MOV AH,0H      
DIV BL          
CMP AH,0        
JE EXIT        
MOV AL,AH       
JMP UP          
  
EXCG:
XCHG AL,BL     
JMP UP1        
  
EXIT:
MOV GCD,BL
MOV AL,NUM1
MUL NUM2
DIV GCD
MOV LCM,AL
MOV DL,LCM

MOV AH,4CH
INT 21H

END
