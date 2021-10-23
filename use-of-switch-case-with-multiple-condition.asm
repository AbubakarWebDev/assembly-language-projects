;Program For Use the Concept of Switch-Case With Multiple Conditions In Assembly
  
PRINT_STR MACRO str 
    LEA dx, str
    MOV ah, 9
    INT 21H
ENDM
  
.MODEL small
.STACK 100h
.DATA
    msg1 DB "Your Number is Either 1 OR 13$"
    msg2 DB "Your Number is Either 2 OR 14$" 
    msg3 DB "Please Enter Valid Number$"
.CODE
MAIN PROC
    MOV ax, @DATA
    MOV ds, ax 

;   CASE BX 
;       = 1 or 13 : Print msg2
;       = 2 or 14 : Print msg3
;   END_CASE
    
    MOV bx, 12 
    
; SWITCH (BX)
    CMP bx, 1       
    JE @CASE_1
    CMP bx, 13       
    JE @CASE_1 
    
    CMP bx, 2       
    JE @CASE_2
    CMP bx, 14       
    JE @CASE_2
    
    JMP @DEFAULT
    
; CASE 1
    @CASE_1:
    PRINT_STR msg1
    JMP @END_SWITCH
 
; CASE 2
    @CASE_2:
    PRINT_STR msg2
    JMP @END_SWITCH
    
; DEFAULT CASE
    @DEFAULT:
    PRINT_STR msg3
     
;END SWITCH
    @END_SWITCH:      
    MOV ah, 4CH
    INT 21H      
MAIN ENDP
END MAIN