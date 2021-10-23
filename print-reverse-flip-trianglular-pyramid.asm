;Program to Print reverse Flip Triangular Star Pyramid 

.model small
.stack 100h
.data
    i1 DW ?
    i2 DW ?
.code 
MAIN PROC  
    
MOV i1, 1
MOV i2, 6  

MOV cx, 6
    
@outer1:
PUSH cx
MOV cx, i1

@inner1:
MOV dl, ' '
MOV ah, 2
INT 21H
LOOP @inner1
          
MOV cx, i2
@inner2:
MOV dl, '*'
MOV ah, 2
INT 21H
LOOP @inner2

MOV dl, 0AH
MOV ah, 2
INT 21H

MOV dl, 0DH
MOV ah, 2
INT 21H

INC i1
DEC i2
POP cx 
LOOP @outer1

;Exit Function

MOV ah, 4CH
INT 21H
    
MAIN ENDP
END MAIN