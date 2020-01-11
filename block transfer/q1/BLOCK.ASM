.model small

.data
source dw 4562h,8145h,7210h,4515h,4877h,4452h,8178h,7474h,4787h,4524h
destination dw 0
.code
mov ax,@data
mov ds,ax

mov si,offset source
mov di,offset destination
mov cl,10

up:
mov bx,[si]
mov [di],bx
inc si
inc si
inc di
inc di
loop up

mov ah,4ch
int 21h
end

