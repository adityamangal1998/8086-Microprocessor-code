.model small

.data
block1 dw 4564h,2154h,8798h,4456h,4413h,7431h,1246h,7431h,4621h,7431h
block2 dw 3543h,4214h,1234h,5661h,1274h,7141h,1456h,4451h,3241h,4512h

.code
mov ax,@data
mov ds,ax

mov si,offset block1
mov di,offset block2
mov cl,10

up:
mov bx,[si]
mov dx,[di]
mov [si],dx
mov [di],bx
inc si
inc si
inc di
inc di
dec cl
cmp cl,0
jne up

mov ah,4ch
int 21h
end
