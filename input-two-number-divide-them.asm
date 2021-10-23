;Program to Print Division of Two Numbers when divisor is 8 bit 

printstr MACRO str
    MOV dx, offset str 
    MOV ah, 9  
    INT 21H
ENDM

printchar MACRO char
    MOV dl, char 
    MOV ah, 2  
    INT 21H
ENDM 

.model small
.data
    quotient DB 48
    remainder DB 48
    dividend DB ?
    divisor DB ?
    msg1 DB "Enter Your Dividend: $" 
    msg2 DB "Enter Your Divisor: $"
    msg3 DB "Your Quotient is: $"
    msg4 DB "Your Remainder is: $"
.code   
MAIN PROC     
    
    ;Move Address of Data Segmenent in DS register
    MOV ax, @DATA
    MOV ds, ax
    
    ;Inputting first Number from user
    printstr msg1    
    CALL inputchar
    SUB al, 48
    MOV dividend, al
    CALL newline 
    
    ;Inputting second Number from user
    printstr msg2      
    CALL inputchar
    SUB al, 48
    MOV divisor, al
    CALL newline   
             
    ;Perform Division
    MOV al, dividend
    MOV ah, 0h 
    DIV divisor
    ADD quotient, al
    ADD remainder, ah
    
    ;Print Quotient
    printstr msg3
    printchar quotient
    CALL newline 
                 
    ;Print Division             
    printstr msg4
    printchar remainder
    CALL newline
    
    ;Returning Control to OS
    MOV ah, 4CH
    INT 21H

MAIN ENDP  
inputchar PROC
    MOV ah, 1   
    INT 21H
    RET
inputchar ENDP
newline PROC
    MOV dl, 0DH
    MOV ah, 2
    INT 21H
    
    MOV dl, 0AH
    MOV ah, 2
    INT 21H
    
    RET
newline ENDP    
END MAIN