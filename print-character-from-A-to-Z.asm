;Program to Print A to Z characters using Loop

.model small
.stack 100h
.data

.code
MAIN PROC
         
MOV cx, 26
MOV bl, 'A'          

@label1:
         
MOV dl, bl 
MOV ah, 2
INT 21H 
ADD bl, 1

MOV dl, ','
MOV ah, 2
INT 21H

MOV dl, ' '
MOV ah, 2
INT 21H

DEC cx  
   
cmp cx, 0   
JNZ @label1

MOV ah, 4CH
INT 21H
    
MAIN ENDP
END MAIN