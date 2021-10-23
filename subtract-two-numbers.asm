;Program to Subtract Two Numbers

.model small
.stack 100h
.data

.code
MAIN PROC

MOV bl, 3         ;Move 3 into bl register
MOV cl, 1         ;Move 1 into cl register

SUB bl, cl        ;Subtract 3 from 1 using cl and bl  
ADD bl, 48        ;Add 48 on bl (subtraction result) for ASCII Managment

MOV dl, bl        ;Move subtraction result from bl to dl register
MOV ah, 2         ;Calling 2nd function using ah register 
INT 21H           ;Calling Text Interupt

MOV ah, 4CH       ;Calling Exiting Function From Acumulator Register
INT 21H

MAIN ENDP
END MAIN