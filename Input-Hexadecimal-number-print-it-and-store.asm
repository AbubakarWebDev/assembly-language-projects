; Inputing A HexaDecimal Number From User and Store it then Print It 

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
    msg1 DB "Enter Your 4-Digit HexaDecimal Number: $"
    msg2 DB "Your HexaDecimal Number is: $"
    var DD 15
.CODE
MAIN PROC                                                            
    MOV ax, @DATA
    MOV ds, ax

    PRINT_STR msg1
    
    XOR ax, ax
    XOR bx, bx
    XOR cx, cx
    
    @WHILE:
        CMP cx, 4
        JE @END_WHILE
        
        MOV ah, 1
        INT 21H
               
        CMP al, 13
        JE @END_WHILE
        
    ;IF (al > 39h)    
        CMP al, 39h       
        JG @LETTER
                     
    ;THEN                 
        AND al, 0Fh  ;Convert Character to Number by Removing Upper 4 Bit's  
        JMP @SHIFT
    
    ;ELSE    
        @LETTER:
        SUB al, 37h  ;Convert (A,B,C,D,E,F) To (10,11,12,13,14,15)
        
        @SHIFT:
        SHL bx, 4    ;4 Left Shift bx register for creating 4-bit's space on right most side
        OR bl, al    ;put new 4-bit's on right most bit of bx register
          
        INC cx 
    JMP @WHILE
    
    @END_WHILE:
    CALL PRINT_NEXT_LINE
    PRINT_STR msg2
    
    XOR cx, cx
    XOR dx, dx
    @FOR:
        CMP cx, 4
        JE @END_FOR
        
        MOV dl, bh
        SHR dl, 4 
        CMP dl, 9
        JG @LETTER1
        
        AND dl, 0Fh 
        OR dl, 30h
        JMP @ROTATE
        
        @LETTER1:
        ADD dl, 37h
        
        @ROTATE:
        MOV ah, 2
        INT 21H
        
        ROL bx, 4
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