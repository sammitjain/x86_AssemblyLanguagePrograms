.model tiny
.486
.data
	fname db 'char.txt',0
	handle dw ?
	dat1 db 15 dup('$')
	disnl db 0dh,0ah
	dat2 db 16 dup('$')
.code
.startup
	mov ah,3dh
	mov al,2
	lea dx,fname
	int 21h
	mov handle,ax
	
	mov ah,3fh
	mov bx,handle
	mov cx,15
	lea dx,dat1
	int 21h
	
	mov ah,3fh
	mov bx,handle
	mov cx,15
	lea dx,dat2
	int 21h

	mov 	cx,8
	lea		si,dat1
	lea		di,dat2
x1:	mov		al,[si]
	xchg	al,[di]
	mov		[si],al
	add		di,2
	add		si,2
	loop	x1
	
	lea dx,dat1
	mov ah,09h
	int 21h
	
	mov ah,3eh
	mov bx,handle
	int 21h
.exit
end