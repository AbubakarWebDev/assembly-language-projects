;Program to reverse a string 

.model small
.stack 100h
.data
    msg1 DB "Please Enter Your String that You want to Reverse: $"
    msg2 DB 0DH, 0AH, "Your Reversed String is: $"
    arr DB 100 DUP('$')
.code
MAIN PROC

MOV ax, @DATA
MOV ds, ax

;Input String From User

MOV dx, offset msg1
MOV ah, 9
INT 21H

MOV si, offset arr
MOV cx, 100

@label1:
MOV ah, 1
INT 21H     

MOV [si], al
INC si 

CMP al, 13
JE @print  
LOOP @label1

@print:

MOV bx, 0
MOV si, offset arr

@label2:
MOV al, [si]

CMP al, '$'
JE @print2

INC si
INC bx
LOOP @label2 

@print2:

;Print Reversed String

MOV dx, offset msg2
MOV ah, 9
INT 21H

MOV si, offset arr
MOV cx, bx

@label3:
PUSH [si]
INC si
LOOP @label3

MOV dl, 0DH
MOV ah, 2
INT 21H 

MOV dl, 0AH
MOV ah, 2
INT 21H

MOV cx, bx

@label4:
POP dx
MOV ah, 2
INT 21H
LOOP @label4    

MOV ah, 4CH
INT 21H    
    
MAIN ENDP
END MAIN