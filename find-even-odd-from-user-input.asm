;Program to check input Number is Even or Odd

PRINT_STR MACRO str 
    LEA dx, str
    MOV ah, 9
    INT 21H
ENDM
 
INPUT_NUM MACRO num 
    MOV ah, 1
    INT 21H
    
    SUB al, 48
    MOV num, al
ENDM

      
.MODEL small
.STACK 100h
.DATA       
    msg1 DB "Enter Number: $"
    msg2 DB "Number is Even$"
    msg3 DB "Number is Odd$"
    number DB ?
.CODE 
MAIN PROC 
    MOV ax, @DATA
    MOV ds, ax
                    
    PRINT_STR msg1                
    INPUT_NUM number
    CALL PRINT_NEXT_LINE
    
; IF (number is Even)
    TEST number, 01h
    JNZ @ELSE
    
; THEN
    PRINT_STR msg2
    JMP @END_IF  
    
; ELSE
    @ELSE: 
    PRINT_STR msg3
    
    @END_IF:                             
    CALL EXIT
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
EXIT PROC
    MOV ah, 4CH
    INT 21H  
  
    RET
EXIT ENDP
END MAIN
