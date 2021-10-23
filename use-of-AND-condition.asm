;Program For Use the Concept of 'AND' Condition in Assembly
  
PRINT_STR MACRO str 
    LEA dx, str
    MOV ah, 9
    INT 21H
ENDM
  
.MODEL small
.STACK 100h
.DATA
    msg1 DB "Enter Your Character: $"                                          
    msg2 DB "Your Entered Character is Valid$"
    msg3 DB "Your Chracter is Not Valid Please Enter Alphabatic Character Again $"
    character DB ?
.CODE
MAIN PROC
    MOV ax, @DATA
    MOV ds, ax

    @AGAIN:              
    PRINT_STR msg1
    MOV ah, 1
    INT 21H
    MOV character, al
    CALL PRINT_NEXT_LINE

; IF (character >= 'A' && character <= 'Z')          
    CMP character, 'A'
    JNAE @ELSE 
    CMP character, 'Z'
    JNBE @ELSE

; THEN
    PRINT_STR msg2
    JMP @END_IF

; ELSE
    @ELSE: 
    PRINT_STR msg3
    CALL PRINT_NEXT_LINE
    JMP @AGAIN
     
;END IF
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