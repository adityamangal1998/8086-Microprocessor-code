.model small                                                                                                                                                                                                  

.data
msg1 db 100 dup('$')

.code
mov ax,@data
mov ds,ax
mov si,offset msg1
mov cl,00h

up:
mov ah,01h
int 21h
cmp al,0dh
jz stp                                                                                                                                                                                                         
mov [si],al                                                                                                                                                                                                                                                                                                     
inc si
inc cl
jmp up

stp:
mov ah,09h
mov dx,offset msg1
int 21h

mov ax,4c00h
int 21h
end
