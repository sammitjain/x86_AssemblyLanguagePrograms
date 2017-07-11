;Program	:	Display a string entered by the user in the next line
;				Also, Task1 in Basic Keyboard Exercises				
;Programmer	:	Sammit Jain | 2014B4A3909G

.model tiny
.486

.data
	
	max		db	21
	len		db	?	
	str1	db	22 dup('$')		;remember to terminate a string with $
	disnl	db	0Dh,0Ah,'$'
	
.code
.startup

	lea DX,max
	mov AH,0Ah		;Input a string from the Keyboard
	INT 21h
	
	lea DX,disnl
	mov AH,09h		;To go to the next line / display return
	INT 21h
	
	lea DX,str1
	mov AH,09h		;To display the string
	INT 21h
	
.exit
end