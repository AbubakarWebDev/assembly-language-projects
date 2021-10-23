; Inputing A Binary Number From User and Store it then Print It 

PRINT_STR MACRO str 
    LEA dx, str
    MOV ah, 9
    INT 21H
ENDM

PRINT_CONTENTS MACRO register 
    MOV dl, register
    MOV ah, 2
    INT 21H
ENDM

.MODEL SMALL
.STACK 100H
.DATA
    msg1 DB "Enter Your 16-Bit Binary Number: $"
    msg2 DB "Your Binary Number is: $"
.CODE
MAIN PROC
    MOV ax, @DATA
    MOV ds, ax
    
    XOR bx, bx
    XOR cx, cx

    PRINT_STR msg1
    
    @WHILE:
        CMP cx, 16
        JE @END_WHILE
        
        MOV ah, 1
        INT 21H
               
        CMP al, 13
        JE @END_WHILE   ; 0 = 0011 0000b and 1 = 0011 0001b
    
        AND al, 0FH  ;Convert Character to Number by Removing Upper 4 Bit's   
        SHL bx, 1    ;Left Shift BX register for creating space on right most bit for entering new bit  
        OR bl, al    ;put inputted bit on right most position of bx register   bx = 0000 0011
        INC cx 
    JMP @WHILE
    
    @END_WHILE:
    CALL PRINT_NEXT_LINE
    PRINT_STR msg2
    
    XOR cx, cx
    @FOR:
        CMP cx, 16
        JE @END_FOR 
        
        ROL bx, 1
        JNC @ELSE
        
        PRINT_CONTENTS 49
        JMP @END_IF
        
        @ELSE:
        PRINT_CONTENTS 48
        
        @END_IF:
        INC cx
    JMP @FOR
    
    @END_FOR:
    MOV ah, 4CH
    INT 21H        
MAIN ENDP
PRINT_NEXT_LINE PROC
    MOV dl, 0Ah
    MOV ah, 2
    INT 21H
    
    MOV dl, 0Dh
    MOV ah, 2
    INT 21H  
    
    RET
PRINT_NEXT_LINE ENDP
END MAIN