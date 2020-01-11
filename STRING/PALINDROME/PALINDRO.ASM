dosseg
model small
.8086
.data
cr equ 0dh
lf equ 0ah
co db ?
msg1 db 100 dup ('$')
msg2 db 100 dup ('$')
msg3 db "Enter a String  $"
mssg db cr,lf,"Your String is $"
msg4 db cr,lf,"Reverse of Your String is $"
msg5 db cr,lf,"String is Palindrome $"
msg6 db cr,lf,"String is NOT Palindrome $"

print macro msg                                                                         
mov ah,09h
mov dx,offset msg
int 21h
endm

.code
mov ax,@data
mov ds,ax
mov si,offset msg1
mov cx,0000h
print msg3

up:
mov ah,01h
int 21h
cmp al,0dh
jz nxt
mov [si],al
inc si
inc cl
jmp up
nxt:

mov co,cl
print mssg
print msg1
dec si
mov di,offset msg2
up1:
mov al,[si]
mov [di],al
dec si
inc di                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
dec cl
jnz up1

print msg4
print msg2

mov di,offset msg2
mov si,offset msg1
mov cl,co
up2:
mov al,[si]
cmp al,[di]
jnz stp
dec cl
jnz up2
print msg5
jmp stp2

stp:
print msg6

stp2:
mov ah,4ch
int 21h
end

