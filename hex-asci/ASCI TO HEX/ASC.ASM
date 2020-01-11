.model small
.data
var db 'A'


.code

mov ax,@data
mov ds,ax

mov bl,var
mov dl,var
mov ah,02h
int 21h

mov dl,10
mov ah,02h
int 21h
mov dl,13
mov ah,02h
int 21h

cmp bl,'9'
jnc down

sub bl,'0'
jmp dow

down:
sub bl,'1'

dow:
mov bh,bl
and bl,0fh ;bl=02

mov cl,04h

rol bh,cl
and bh,0fh
;cmp bh,09h
;jc prin
;add bh,07h

;prin:
add bh,30h
mov dl,bh
mov ah,02h
int 21h

add bl,30h
mov dl,bl
mov ah,02h
int 21h


mov ah,4ch
int 21h
end
