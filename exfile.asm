;Program:		Open an existing file called 'FILE1'
;Programmer:	Sammit Jain | 2014B4A3909G

.model tiny
.486

.data

	FNAME	DB		'FILE1',0		;Assuming that this file already exists
	HANDLE	DW		?

.code
.startup
	
	MOV AH,3Dh		;existing file
	LEA DX,FNAME
	MOV AL,2		;open file for read/write
	INT 21h
	MOV HANDLE,AX


.exit
end