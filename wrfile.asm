;Program:		Open an existing file called 'FILE1'
;Programmer:	Sammit Jain | 2014B4A3909G

.model tiny
.486

.data

	TEXT	DB		'SammitJain$'
	FNAME	DB		'FILE1',0		;Assuming that this file already exists
	HANDLE	DW		?

.code
.startup
	
	MOV AH,40h		;existing file
	LEA DX,TEXT	
	lea BX,fname
	MOV CX,11h		;open file for read/write
	INT 21h
	;MOV HANDLE,AX


.exit
end