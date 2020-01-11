.model small
.data
var db 0ACh
msg db 10,13,"hex value$"
msg1 db 10,13," $"

pri macro msg
mov dx,offset msg
mov ah,09h
int 21h
endm
.code
mov ax,@data
mov ds,ax


mov bh,var
mov cl,04h
rol bh,cl
and bh,0fh ;bh=0A
cmp bh,09h
jc prin

add bh,07h



prin:
add bh,30h  ;bh= 41h
mov ch,bh  ;ch=41h
and ch,0fh
mov cl,04h
rol bh,cl
and bh,0fh  ;bh=04

pri msg
pri msg1

add bh,30h
mov dl,bh
mov ah,02h
int 21h

add ch,30h
mov dl,ch
mov ah,02h
int 21h

mov dl,10
mov ah,02h
int 21h
mov dl,13
mov ah,02h
int 21h

mov bl,00h
mov bl,var ;bl=02
and bl,0fh ;bl=02

cmp bl,09h
jc prin1
add bl,07h

prin1:
add bl,30h  ;bl=32
mov ch,bl  ;ch=32
and ch,0fh  ;ch=02
mov cl,04h
rol bl,cl
and bl,0fh  ;bl=03

add bl,30h
mov dl,bl
mov ah,02h
int 21h

add ch,30h
mov dl,ch
mov ah,02h
int 21h





mov ah,4ch
int 21h
end
