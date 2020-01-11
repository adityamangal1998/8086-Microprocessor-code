.model small

.data
var db 32h
var1 db 87h

.code
mov ax,@data
mov ds,ax

mov al,var
add al,var1

mov ch,0
mov cl,al

mov ah,4ch
int 21h
end
