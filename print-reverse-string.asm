;Program to reverse a string 

.model small
.stack 100h
.data
    arr DB "hellO"
.code
MAIN PROC

MOV ax, @DATA
MOV ds, ax

MOV si, offset arr

MOV CX, 5

@label1:
PUSH [si]
INC si
LOOP @label1

MOV CX, 5

@label2:
POP dx
MOV ah, 2
INT 21H
LOOP @label2    

MOV ah, 4CH
INT 21H    
    
MAIN ENDP
END MAIN
