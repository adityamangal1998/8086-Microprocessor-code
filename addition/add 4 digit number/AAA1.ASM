.model small

.data

var dw 6783h
var1 dw 3234h

.code
mov ax,@data
mov ds,ax

mov ax,var
add ax,var1

mov cx,ax

mov ah,4ch
int 21h
end

















