;Program	:	Design a Username and Password login page
;				Also, Task2 in Basic Keyboard Exercises				
;Programmer	:	Sammit Jain | 2014B4A3909G

.model tiny
.486

.data
	
	str0	db	'Enter User Name: $'
	max		db	11
	len		db	?	
	str1	db	12 dup('$')		;remember to terminate a string with $
	disnl	db	0Dh,0Ah,'$'
	struser	db	'sammitjain$'
	str2	db	'Enter Password: $'
	strpass	db	'lolololo'
	strgre	db	'Hello $'
	str3	db	9 dup(0)		;Password entry / One extra for carriage
.code
.startup

	lea DX,str0
	mov AH,09h
	INT 21h
	
	lea DX,disnl
	mov AH,09h		;To go to the next line / display return
	INT 21h
		
	lea DX,max
	mov AH,0Ah		;Input a string from the Keyboard
	INT 21h

	lea SI,str1
	lea DI,struser
	mov CX,10
	
x0:	mov al,[si]
	mov bl,[di]
	cmp al,bl
	je x1
	jmp x2
	x1:
	inc SI
	inc DI
	loop x0
	
	cmp CX,0h		;checking to see if it reached the last comparison
	jne x2
	
	lea DX,disnl
	mov AH,09h		;To go to the next line / display return
	INT 21h	

	lea DX,str2		;To display password prompt
	mov AH,09h
	INT 21h
	
	lea DX,disnl
	mov AH,09h		;To go to the next line / display return
	INT 21h	

	lea SI,str3
	mov CX,9h
	
x3:	mov AH,08h
	INT 21h
	
	mov [SI],AL		;Store each character of the password
	mov DL,'*'		;mask each character on display with '*'
	mov AH,02h
	INT 21h
	
	inc SI
	loop x3
	
	lea SI,str3
	lea DI,strpass
	mov CX,8
	
x01:mov al,[si]
	mov bl,[di]
	cmp al,bl
	je x11
	jmp x2
	x11:
	inc SI
	inc DI
	loop x01
	
	cmp CX,0h		;checking to see if it reached the last comparison
	jne x2
	
	lea DX,disnl
	mov AH,09h		;To go to the next line / display return
	INT 21h	
	
	lea DX,strgre
	mov AH,09h
	INT 21h
	
	lea DX,struser
	mov AH,09h
	INT 21h
	
x2:


.exit
end