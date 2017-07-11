;Program	:	Output a string to display
;Programmer	:	Sammit Jain | 2014B4A3909G

.model tiny
.486

.data
	
	str1	db	'HELLO WORLD $'		;remember to terminate a string with $
	
.code
.startup

	lea dx,str1
	mov ah,09h
	INT 21h
	
.exit
end