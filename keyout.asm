;Program	:	Trying out Keyboard interrupts
;Programmer	:	Sammit Jain | 2014B4A3909G

.model tiny
.486

.code
.startup

	;mov AH,01h			;with echo
	mov AH,08h			;without echo
	
	INT 21h
	
.exit
end