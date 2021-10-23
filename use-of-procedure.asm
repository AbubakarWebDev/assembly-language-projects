;Program to demonstrate the use of Procedure

.model small
.stack 100h
.data      
    str1 DB "Hello! Man$"
    str2 DB "How Are You$"
    str3 DB "Nice to See You$"
.code                         
MAIN PROC

MOV ax, @DATA
MOV ds, ax

MOV dx, offset str1
MOV ah, 9
INT 21H 

CALL nextline

MOV dx, offset str2
MOV ah, 9
INT 21H 

CALL nextline

MOV dx, offset str3
MOV ah, 9
INT 21H 

CALL nextline

MOV ah, 4CH
INT 21H  

MAIN ENDP

nextline PROC
MOV dl, 13
MOV ah, 2
INT 21H 

MOV dl, 10
MOV ah, 2
INT 21H 
 
RET    
nextline ENDP

END MAIN 