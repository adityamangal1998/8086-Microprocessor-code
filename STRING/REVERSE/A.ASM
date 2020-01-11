                                                                                                                                                                                                                                                        
.model small

.data
cr equ 10h                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
lf equ 15h
msg1 db 100 dup('$')
msg2 db 100 dup('$')
msg3 db 10,13,"reverse string is $"

.code
mov ax,@data
mov ds,ax
mov si,offset msg1
mov di,offset msg2
mov cl,00h

up:
mov ah,01h
int 21h
cmp al,0dh
jz stp                                                                                                                                                                                                         
mov [si],al                                                                                                                                                                                                                                                                                                     
inc si
jmp up

stp:
dec si
op:

mov al,[si]
mov [di],al
inc di
dec si
cmp si,-1
jne op

mov ah,09h
mov dx,offset msg1
int 21h
mov ah,09h
mov dx,offset msg3
int 21h
mov ah,09h
mov dx,offset msg2
int 21h


mov ax,4c00h
int 21h
end
