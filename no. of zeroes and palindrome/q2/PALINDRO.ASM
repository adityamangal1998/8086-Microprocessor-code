.MODEL SMALL

.DATA
X DB 33h
MS DB "NUMBER IS ->>>>$"
MSG DB 10,13, "pallindrome$"
MSG1 DB 10,13, "not palindrome$"

PRINT MACRO MSG
MOV DX,OFFSET MSG
MOV AH,09H
INT 21H
ENDM

.CODE
MOV AX,@DATA
MOV DS,AX

PRINT MS
MOV AL,X
MOV CL,04H
ROR AL,CL
MOV DL,AL
MOV AH,02H
INT 21H

MOV DL,X
MOV AH,02H
INT 21H


 MOV AL,X
 AND AL,0F0H
 MOV BL,X
         AND BL,0FH
         MOV CL,04H
         MOV DX,0

         UP:ROL AL,1
         JC DOW
         ROR BL,1
         JC DOW1
         CMP DL,DH
         JNZ DOWN
        LOOP UP
        JMP DOW2


      DOW:INC DL
          JMP UP
      DOW1: INC DH
            JMP UP

     DOW2:        
       LEA DX,MSG      
       MOV AH,09H
       INT 21H
       JMP EXIT         
  DOWN: LEA DX,MSG1     
        MOV AH,09H
        INT 21H
  EXIT:MOV AH,4CH
       INT 21H

END
