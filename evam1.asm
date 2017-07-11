.model	tiny
.486
.data
mod1	db	?
rno		db	10
shiv	db	?
.code
.startup
		mov     ah,0Fh		;getting video mode
		int		10h
		mov		mod1,al
        mov		ah,0
		mov		al,03
		int		10h
		
x1:		mov		dh,rno
		cmp		dh,25
		je		x2
		mov		ah,02h
		mov		bh,0
		mov		dl,0
		int 	10h		;set cursor position
		inc		rno
		mov		ah,09h
		mov		al,'@'
		mov		bl,00001010b
		mov		bh,0
		mov		cx,40
		int		10h		;printing
		mov		dh,rno
		cmp		dh,25
		jz		x2
		mov		ah,02h
		mov		bh,0
		mov		dl,0
		int 	10h
		inc		rno
		mov		ah,09h
		mov		al,'@'
		mov		bl,10001001b
		mov		bh,0
		mov		cx,40
		int		10h
		jmp		x1
		mov		shiv,'x'
		x2:		mov		ah,07h
		int		21h
		cmp		al,'?'
		jne		x2
		mov		ah,0
		mov		al,mod1
		int		10h

.exit
end