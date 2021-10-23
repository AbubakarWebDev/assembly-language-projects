;Program to Print Pascal's Triangle 
   
.model small
.stack 100h
.data
    i1 DW ?
    i2 DW ?
.code 
MAIN PROC  
    
    MOV i1, 6
    MOV i2, 1
    MOV cx, 6
        
    @outer:
        PUSH cx
        MOV cx, i1
        
        @inner1:
            MOV dl, ' '
            MOV ah, 2
            INT 21H
        LOOP @inner1
        
        MOV cx, i2
        @inner2:    
            MOV dl, ' '
            MOV ah, 2
            INT 21H
            
            MOV dl, '*'
            MOV ah, 2
            INT 21H 
        LOOP @inner2
        
        MOV dl, 0AH
        MOV ah, 2
        INT 21H
        
        MOV dl, 0DH
        MOV ah, 2
        INT 21H
        
        DEC i1
        INC i2
        POP cx 
    LOOP @outer
    
    ;Exit Function
    
    MOV ah, 4CH
    INT 21H
    
MAIN ENDP
END MAIN