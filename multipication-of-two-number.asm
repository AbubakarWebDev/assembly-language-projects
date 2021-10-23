;Program to demonstrate the multipication of two number

.model small
.data

.code
MAIN PROC

MOV al, 5
MOV bl, 2

MUL bl
AAM      

; ASCII adjust for Multiplication. This instruction is useful when the result of multiplication
; contains two digits (In this case result is 10) and we cannot print two digits directly on screen
; with the help ax. So AAM adjust 1 on upper four bits and 0 on Lower Four Bits. So we easily print both 
; of them

ADD ah, 48
MOV bh, ah 

ADD al, 48
MOV bl, al
 
MOV dl, bh
MOV ah, 2
INT 21H
 
MOV dl, bl
MOV ah, 2
INT 21H

MOV ah, 4CH
INT 21H    

MAIN ENDP
END MAIN