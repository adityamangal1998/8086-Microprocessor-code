.model small

.data
var dw ?
var1 dw ?
result dw ?
msg db 10,13,"enter first number->>>$"
msg1 db 10,13,"enter second number->>$"
msg2 db 10,13,"result->>$"

prins macro msg
mov dx,offset msg
mov ah,09h
int 21h
endm

prin macro var
mov dx,var
mov ah,02h
int 21h
endm

.code
mov ax,@data
mov ds,ax

prins msg

mov ah,01h
int 21h
mov bh,al
sub bh,30h
cmp bh,09h
jc up
sub bh,07h

up:
mov cl,04
and bh,0fh
rol bh,cl

mov ah,01h
int 21h
sub al,30h
cmp al,09h
jc down
sub al,07h

down:
add bh,al

mov ah,01h
int 21h
mov bl,al
sub bl,30h
cmp bl,09h
jc up1
sub bl,07h

up1:
mov cl,04
and bl,0fh
rol bl,cl

mov ah,01h
int 21h
sub al,30h
cmp al,09h
jc down1
sub al,07h

down1:
add bl,al
mov var,bx

prins msg1

mov ah,01h
int 21h
mov bh,al
sub bh,30h
cmp bh,09h
jc u1p
sub bh,07h

u1p:
mov cl,04
and bh,0fh
rol bh,cl

mov ah,01h
int 21h
sub al,30h
cmp al,09h
jc do1wn
sub al,07h

do1wn:
add bh,al

mov ah,01h
int 21h
mov bl,al
sub bl,30h
cmp bl,09h
jc u1p1
sub bl,07h

u1p1:
mov cl,04
and bl,0fh
rol bl,cl

mov ah,01h
int 21h
sub al,30h
cmp al,09h
jc dow1n1
sub al,07h

dow1n1:
add bl,al
mov var1,bx

add bx,var
mov result,bx
prins msg2

mov dx,bx
mov cl,04
ror dh,cl
and dh,0fh
cmp dh,09h
jc l11
add dh,37h
jmp l1

l11:
add dh,30h

l1:
mov cl,dh
prin cx 
mov dx,bx
and dh,0fh
cmp dh,09h
jc l22
add dh,37h
jmp l2
l22:
add dh,30h
l2:
mov cl,dh
prin cx

mov dx,bx

mov cl,04
ror dl,cl
and dl,0fh
cmp dl,09h
jc l33
add dl,37h
jmp l3
l33:
add dl,30h

l3:
mov ah,02h
int 21h
mov dx,bx
and dl,0fh
cmp dl,09h
jc l44
add dl,37h
jmp l4
l44:
add dl,30h
l4:
prin dx

jmp exit

exit:
mov ah,4ch
int 21h
end



