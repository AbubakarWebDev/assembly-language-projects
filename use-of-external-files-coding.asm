;Program to input array size and its values from user
 
include "macros.asm"

.model small
.stack 100h
.data       
    msg1 DB 'Enter Array Size: $'                
    msg2 DB 'Enter Array Values: $'
    msg3 DB 'Reverse Array Values are: $' 
    msg4 DB 'Enter String: $'
    msg5 DB 'Reverse String is: $' 
    size DW ?
    arr DB size DUP(?)
    str DB 100 DUP('$') 
.code

MAIN PROC 
    MOV ax, @DATA
    MOV ds, ax 
                         
    PRINT_STR msg1  
    INPUT_VAR size
    
    CALL PRINT_NEXT_LINE
        
    PRINT_STR msg2
    INPUT_ARRAY arr, size
    
    CALL PRINT_NEXT_LINE
        
    PRINT_STR msg3
    REVERSE_ARR arr, size
    PRINT_ARRAY arr, size
    
    CALL PRINT_NEXT_LINE
    
    PRINT_STR msg4
    INPUT_STR str
    
    CALL PRINT_NEXT_LINE 
    
    PRINT_STR msg5
    REVERSE_STR str
    PRINT_STR str
           
    MOV ah, 4CH
    INT 21H 
MAIN ENDP
include "procedures.asm"
END MAIN
