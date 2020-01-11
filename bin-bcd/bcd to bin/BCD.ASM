.MODEL SMALL
.DATA
BCD DW 6748H
TEMP DB ?
.CODE
    MOV AX,@DATA
    MOV DS,AX

    MOV AX,BCD
    MOV BL,AL
     
    AND AL,0F0H ;AL=48---->>AL=40
    AND BL,0FH
     
    MOV CL,04H
    ROL AL,CL
     
    MOV CL,10
    MUL CL
     
    ADD AL,BL
    MOV TEMP,AL
   
    MOV AX,BCD
    MOV AL,AH
    MOV AH,0
    MOV BL,AL
     
    AND AL,0F0H
    AND BL,0FH
     
    MOV CL,04H
    ROL AL,CL
     
    MOV CL,10
    MUL CL
     
    ADD AL,BL
   
    MOV CL,100
    MUL CL
   
    MOV BL,TEMP
    MOV BH,0
    ADD AX,BX

    MOV AH,4CH
    INT 21H
    END
