;Program	:	Taking a string from the user
;Programmer	:	Sammit Jain | 2014B4A3909G

.model tiny
.486

.data
	max1	db	32
	act1	db	?
	inp1	db	32 dup(0)

.code
.startup

	lea dx,max1
	mov ah,0Ah
	INT 21h
	
.exit
end