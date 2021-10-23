; Print the Contents of 2D Array In Matrix Form

PRINT MACRO value
    MOV dx, value
    MOV ah, 2
    INT 21H
ENDM

PRINT_NEWLINE MACRO value
    PRINT 0AH
    PRINT 0DH
ENDM

MULTIPLY MACRO value1, value2, result   
   PUSH dx
   PUSH ax
   XOR dx, dx
   MOV ax, value1
   MUL value2
   MOV result, ax
   POP dx
   POP ax
ENDM    

.MODEL SMALL
.STACK 100H
.DATA
    2D DW 1, 2, 3
       DW 4, 5, 6
       
    row DW 2
    col DW 3
    wordArray DW 2
    result DW ?   
.CODE
MAIN PROC 
    MOV ax, @DATA
    MOV ds, ax 
    
    MOV bx, 0
    @REPEAT1:
        MOV cx, 0 
        MULTIPLY bx, col, result
        MULTIPLY result, wordArray, result
        MOV si, result
        
        @REPEAT2:
            MOV di, 2D[si]
            ADD di, 48
            PRINT di
            PRINT ','
            PRINT ' '
            
            ADD si, 2            
            INC cx  
            CMP cx, col
            JE @EXIT1        
        JMP @REPEAT2
        @EXIT1:
        
        PRINT 0DH 
        PRINT 0AH
        INC bx
        CMP bx, row
        JE @EXIT2
    JMP @REPEAT1
    @EXIT2:
    
    MOV ah, 4CH
    INT 21H                 
MAIN ENDP   
END MAIN 