;Program For Use the Concept of Switch-Case In Assembly
  
PRINT_STR MACRO str 
    LEA dx, str
    MOV ah, 9
    INT 21H
ENDM
  
.MODEL small
.STACK 100h
.DATA
    msg1 DB "Number is Positive$"
    msg2 DB "Number is Negative$" 
    msg3 DB "Number is Zero$"
    msg4 DB "Please Enter Valid Number$"
.CODE
MAIN PROC
    MOV ax, @DATA
    MOV ds, ax 

;   CASE BX 
;       < 0 :  Print msg2
;       = 0 :  Print msg3
;       > 0 :  Print msg1
;   END_CASE
    
    MOV bx, -1 
    
; SWITCH (number)
    CMP bx, 0       
    JG @POSITIVE
    JL @NEGATIVE
    JE @EQUAL
    JMP @DEFAULT
    
; CASE 1
    @POSITIVE:
    PRINT_STR msg1
    JMP @END_SWITCH
 
; CASE 2
    @NEGATIVE:
    PRINT_STR msg2
    JMP @END_SWITCH
        
; CASE 3
    @EQUAL:
    PRINT_STR msg3
    JMP @END_SWITCH
    
; DEFAULT CASE
    @DEFAULT:
    PRINT_STR msg4
     
;END SWITCH
    @END_SWITCH:      
    MOV ah, 4CH
    INT 21H      
MAIN ENDP
END MAIN