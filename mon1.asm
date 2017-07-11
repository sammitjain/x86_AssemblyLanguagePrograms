;Monday Lab Comprehensive Exam

.model tiny
.486
.data

	dig1	db	?	
	dig2	db	?
	att1	db	?
	var1	db	?
	fname	db	'compre.txt',0
	handle	dw	?
	lim1	db	0

.code
.startup

	mov ah,01h		;Input first character
	INT 21h

	sub al,30h
	mov dig1,al
	
	mov ah,01h		;Input second character
	INT 21h
	
	sub al,30h
	mov dig2,al
	
	mov ah,3dh		;open exisiting file
	mov al,2
	lea dx,fname	
	INT 21h
	mov handle,ax
	
	
	mov ah,42h		;setting file pointer
	mov al,0
	mov bx,handle
	mov cx,0
	mov dx,0
	INT 21h
	
	mov ah,3fh		;reading file
	mov bx,handle	
	mov cx,1
	lea dx,var1
	INT 21h
	
	mov ah,3eh		;close file
	mov bx,handle
	INT 21h
	
	mov al, dig2
	mov att1,al
	mov al,dig1
	rol al,4
	or att1,al
	and att1,01110111b

	mov ah,00h		;set video mode
	mov al,03h
	INT 10h
	
x0:	mov ah,02h		;set cursor position
	mov dl,0		;column 1..80
	mov dh,lim1		;row	1..25
	mov bh,0
	INT 10h
	
	mov ah,09h
	mov al,var1
	mov bh,0
	mov bl,att1
	mov cx,80
	INT 10h
	
	inc lim1
	cmp lim1,26
	jnz x0
	mov	ah,07h		;blocking function
x1: int	21h
    cmp al,'%'
    jnz x1
.exit
end
