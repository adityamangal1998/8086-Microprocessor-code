.model small

.data
X dW 3345H
VAR DB ?
Z DW ?
O DW ?


.code
mov ax,@data
mov ds,ax
MOV AX, X
MOV BX, 00H
MOV CX, 10H
MOV DX, 00H
 
UP:
ROL AX,1
JC ONE
INC BX
JMP NXT
 
ONE:
INC DX
 
NXT:
DEC CX
JNZ UP
 
MOV Z, BX
MOV O, DX
 
JMP EXIT



  EXIT:MOV AH,4CH
       INT 21H

END
