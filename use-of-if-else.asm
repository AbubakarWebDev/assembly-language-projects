;Program For Use the Concept of If and Else In Assembly
  
PRINT_STR MACRO str 
    LEA dx, str
    MOV ah, 9
    INT 21H
ENDM

INPUT_NUMBER MACRO num 
    MOV ah, 1  
    INT 21H 
    
    MOV num, al
    SUB num, 48
ENDM
  
.MODEL small
.STACK 100h
.DATA
    msg1 DB "Enter Your First Number: $"
    msg2 DB "Enter Your Second Number: $"
    msg3 DB "First Number is Greater $"
    msg4 DB "First Number is Not Greater $"
    number_1 DB ?
    number_2 DB ?
.CODE
MAIN PROC
    MOV ax, @DATA
    MOV ds, ax
              
    PRINT_STR msg1
    INPUT_NUMBER number_1 
    
    CALL PRINT_NEXT_LINE
    
    PRINT_STR msg2
    INPUT_NUMBER number_2
    
    CALL PRINT_NEXT_LINE

; IF (number_1 > number_2)    
    MOV dl, number_1
    CMP dl, number_2       
    JNA @ELSE
                 
; THEN                 
    PRINT_STR msg3
    JMP @END_IF

; ELSE    
    @ELSE:
    PRINT_STR msg4
    
    @END_IF:      
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