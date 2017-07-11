;Program:		Reversing a string word-by-word
;Programmer:	Sammit Jain | 2014B4A3909G

.model tiny
.486
.data

str1	db		'Together'
disnl	db		0Dh,0Ah,'$'
revstr1	db		100 dup('$')
.code
.startup

	lea dx,str1			;print first string
	mov ah,09h
	INT 21h
	
	mov ax,7
	mov cx,8
	lea si,str1
	add si,ax
	
	lea di,revstr1
x0:	
	mov al,[si]
	mov [di],al
	inc di
	dec si
	loop x0
	
	
	lea dx,revstr1			;print first string
	mov ah,09h
	INT 21h
	
	
.exit
end
