;Program to input array and print it using loop 

.model small
.stack 100h
.data
    arr DB 100 DUP('$')
    msg1 DB "Please Enter Your Name: $"
    msg2 DB "Your Name is: $" 
.code
MAIN PROC         
    
MOV ax, @DATA
MOV ds, ax
    
;Input Array using Loop
  
LEA dx, msg1
MOV ah, 9
INT 21H  
  
LEA si, arr

@label:

MOV ah, 1
INT 21H     

MOV [si], al
INC si 

CMP al, 13
JE @print  

LOOP @label 

;Print Array using Loop

@print:

MOV dl, 0DH
MOV ah, 2
INT 21H

MOV dl, 0AH
MOV ah, 2
INT 21H 

LEA dx, msg2         
MOV ah, 9
INT 21H
         
LEA dx, arr         
MOV ah, 9
INT 21H

MOV ah, 4CH
INT 21H
         
MAIN ENDP 
END MAIN