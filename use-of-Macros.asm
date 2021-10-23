;Program to demonstrate the use of Macros

print MACRO str
    MOV dx, offset str
    MOV ah, 9
    INT 21H 
ENDM

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

print str1

CALL nextline

print str2

CALL nextline

print str3

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