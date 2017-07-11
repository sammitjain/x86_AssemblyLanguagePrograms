;Program:		Lab5 : Keyboard Interrupts
;				Swap alternating characters of strings
;				Displaying output on the screen (2 separate lines)

.model tiny
.486

.data

	dat1	db	'abcdefghijklmno$'
	disnl1	db	0Dh,0Ah
	dat2	db	'ABCDEFGHIJKLMNO$'
	
	disnl	db	0Dh,0Ah,'$'
	count	dw	7
	FNAME	DB		'THU3',0
	HANDLE	DW		?
	
.code
.startup


	
	lea si,dat1
	lea di,dat2
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

	lea dx,dat1			;print first string
	mov ah,09h
	INT 21h
	lea dx,disnl		;go to next line
	mov ah,09h
	INT 21h	
	lea dx,dat2			;print second string
	mov ah,09h
	INT 21h
	
	MOV AH,3Ch		;create read-only file
	LEA DX,FNAME
	MOV CL,1
	INT 21h
	MOV HANDLE,AX

	MOV AH,3Dh		;open the existing file
	LEA DX,FNAME
	MOV AL,2h
	INT 21h
	MOV HANDLE,AX
	
	MOV AH,40h		;start the writing process
	MOV BX,HANDLE
	MOV CX,15
	LEA DX,dat1
	INT 21h	
	
	MOV AH,42h		;set the pointer to beginning
	MOV AL,1
	MOV BX,HANDLE
	MOV CX,0		;NOT SURE IF REQUIRED
	MOV DX,1		;SET POINTER to BEGINNING
	INT 21h
	
	MOV AH,40h		;start the writing process
	MOV BX,HANDLE
	MOV CX,17
	LEA DX,disnl1
	INT 21h	
	
	MOV AH,3Eh		;closing the file
	MOV BX,HANDLE
	INT 21h
.exit
end