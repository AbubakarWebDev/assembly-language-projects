;Program to Input String and Print reverse string 

.model small
.stack 100h
.data
    msg1 DB "Please Enter Your String that You want to Reverse: $"
    msg2 DB 0DH, 0AH, "Your Reversed String is: $"
.code
MAIN PROC

MOV ax, @DATA
MOV ds, ax

;Input String From User

LEA dx, msg1
MOV ah, 9
INT 21H
PUSH '$' 
 
@label3:
    MOV ah, 1 
    CMP al, 13
    JE @print 
    
    mov dl, al  ; copy high bits to low
    xor dh, dh  ; clear high-bits
    INT 21H
    PUSH dx
LOOP @label3

@print:
LEA dx, msg2
MOV ah, 9
INT 21H

@label4:
    POP dx 
    CMP dx, '$'
    JE @Exit
    MOV ah, 2
    INT 21H
LOOP @label4 

@Exit:   
MOV ah, 4CH
INT 21H    
    
MAIN ENDP
END MAIN