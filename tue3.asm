.model tiny
.486

.data

	vow		db		'aeiou'
	disnl	db		0Dh,0Ah,'$'
	maxlen	db		11
	len		db		?
	str1	db		12 dup('$')
	
.code
.startup

	lea DX,maxlen	;taking string from the user
	mov AH,0Ah
	INT 21h

	lea DX,disnl	;going to the next line
	mov AH,09h
	INT 21h
	
	movzx cx,len	;sign extending count to CX
	mov dl,5h		;keeping track of vow array
	lea di,vow
	
	x00:mov al,[di]
		movzx cx,len
		lea si,str1
		
		x0:	mov bl,[si]
			cmp al,bl
			jne x1
			mov dh,'@'
			mov [si],dh
		x1:
			inc si
		loop x0

		inc di
		cmp dl,0h
		dec dl
	jnz x00
	
	lea dx,str1		;printing the output
	mov ah,09h
	INT 21h

.exit
end