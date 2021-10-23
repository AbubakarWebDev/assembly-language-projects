;Program to Print Reverse Triangular Star Pyramid 

.model small
.stack 100h
.data
.code 
MAIN PROC
MOV bx, 5
MOV cx, 5

@outer:
    PUSH cx
    MOV cx, bx
    
    @inner:
        MOV dl, '*'
        MOV ah, 2
        INT 21H  
        
        MOV dl, ' '
        MOV ah, 2
        INT 21H
    LOOP @inner
    
    MOV dl, 0AH
    MOV ah, 2
    INT 21H
    
    MOV dl, 0DH
    MOV ah, 2
    INT 21H
    
    DEC bx
    POP cx 
LOOP @outer

MOV ah, 4CH
INT 21H
    
MAIN ENDP
END MAIN