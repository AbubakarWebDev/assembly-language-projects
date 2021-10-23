;program to print a Multiple character

.model small
.stack 100h
.data        

.code

MAIN PROC

;Print Character 'A' on Console Screen

MOV dl, 'A'     ;Assign value 'A' to data register DL     
MOV ah, 2       ;calling function 2 using accumulator register
INT 21H         ;calling text interupt

;Print Character 'L' on Console Screen

MOV dl, 'L'     ;Assign value 'L' to data register DL     
MOV ah, 2       ;calling function 2 using accumulator register
INT 21H         ;calling text interupt

;Print Character 'I' on Console Screen  

MOV dl, 'I'     ;Assign value 'I' to data register DL     
MOV ah, 2       ;calling function 2 using accumulator register
INT 21H         ;calling text interupt

MOV ah, 4CH     ;calling exit function using accumulator register
INT 21H         ;calling text interupt

MAIN ENDP
END MAIN