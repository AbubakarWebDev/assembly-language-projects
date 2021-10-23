;Program to input array size and its values from user

PRINT_STR MACRO str 
    LEA dx, str
    MOV ah, 9
    INT 21H
ENDM 

PRINT_ARRAY MACRO arr, size
    LEA si, arr
    MOV cx, size
          
    @label1:     
        MOV dx, [si]
        MOV ah, 2
        INT 21H
        
        INC si
    LOOP @label1
ENDM

INPUT_ARRAY MACRO arr, size 
    LEA si, arr 
    SUB size, 48
    MOV cx, size
          
    @label2: 
        MOV ah, 1
        INT 21H
            
        MOV [si], al
        
        INC si
    LOOP @label2
ENDM

INPUT_VAR MACRO var
    MOV ah, 1  
    INT 21H 
    
    XOR bx, bx
    MOV bl, al 
    MOV var, bx
ENDM

PRINT_VAR MACRO var    
    MOV dx, var
    MOV ah, 2
    INT 21H
ENDM
  
.model small
.stack 100h
.data       
    msg1 DB 'Enter Array Size: $'
    msg2 DB 'Array Size is: $'                
    msg3 DB 'Enter Array Values: $'
    msg4 DB 'Array Values is: $' 
    size DW ?
    arr DB size DUP(?) 
.code

MAIN PROC 
    MOV ax, @DATA
    MOV ds, ax 
                         
    PRINT_STR msg1  
    INPUT_VAR size
    
    CALL PRINT_NEXT_LINE
        
    PRINT_STR msg3
    INPUT_ARRAY arr, size
    
    CALL PRINT_NEXT_LINE
        
    PRINT_STR msg4
    PRINT_ARRAY arr, size
           
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
