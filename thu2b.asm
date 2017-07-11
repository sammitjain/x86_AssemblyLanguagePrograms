.model tiny
.486

.data

	max1	db	16
	len1	db	?
	str1	db	17 dup('$')
	max2	db	16
	len2	db	?
	str2	db	17 dup('$')
	disnl	db	0Dh,0Ah,'$'
	count	dw	7
	
.code
.startup

	lea dx,max1			;take first string
	mov ah,0Ah
	INT 21h
	
	lea dx,disnl		;go to next line
	mov ah,09h
	INT 21h
	
	lea dx,max2			;take second string
	mov ah,0Ah
	INT 21h
	
	lea dx,disnl		;go to next line
	mov ah,09h
	INT 21h	

	lea si,str1
	lea di,str2
	mov cx,count
	
x0:
	mov al,[si]
	mov ah,[di]
	
	xchg al,ah
	mov [si],al
	mov [di],ah
	inc si
	inc si
	inc di
	inc di

	loop x0

	lea dx,str1			;print first string
	mov ah,09h
	INT 21h
	lea dx,disnl		;go to next line
	mov ah,09h
	INT 21h	
	lea dx,str2			;print second string
	mov ah,09h
	INT 21h
	
.exit
end