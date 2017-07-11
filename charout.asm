;Program	:	Echoing a character to display
;Programmer	:	Sammit Jain | 2014B4A3909G

.model tiny
.486

.code
.startup

	mov dl,'A'	;The character to be echoed
	mov ah,02h
	INT 21h
	
.exit
end