;program to print a single character

.model small
.stack 100h
.data        

.code

MAIN PROC

MOV dl, 'A'     ;Assign value 'A' to data register DL     

MOV ah, 2       ;calling function 2 using accumulator register
INT 21H         ;calling text interupt

MOV ah, 4CH     ;calling exit function using accumulator register
INT 21H         ;calling text interupt

MAIN ENDP
END MAIN