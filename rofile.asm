;Program:		Open a new read-only file called 'FILE1'
;Programmer:	Sammit Jain | 2014B4A3909G

.model tiny
.486

.data

	FNAME	DB		'FILE1',0
	HANDLE	DW		?

.code
.startup
	
	MOV AH,3Ch		;read-only file
	LEA DX,FNAME
	MOV CL,1
	INT 21h
	MOV HANDLE,AX


.exit
end