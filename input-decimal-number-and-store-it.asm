PRINT MACRO value
    MOV dl, value
    MOV ah, 2
    INT 21H    
ENDM

.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
        
    CALL DECIMAL_INPUT
    
    MOV ah, 4ch
    INT 21H                 
MAIN ENDP 
INPUT PROC
    MOV ah, 1
    INT 21H
    
    RET 
INPUT ENDP
DECIMAL_INPUT PROC
    ; this procedure will read a number in decimal form    
    ; input : none
    ; output : store binary number in AX
    ; uses : MAIN
    
    PUSH bx                        ; push BX onto the STACK
    PUSH cx                        ; push CX onto the STACK
    PUSH dx                        ; push DX onto the STACK
   
    @BEGIN:
        PRINT '?'                      ; Print '?' on screen
        XOR bx, bx                     ; Total = 0
        XOR cx, cx                     ; Negative = False
        CALL INPUT
                                       
        CMP al, '-'                    ; Minus Sign
        JE @MINUS                      ; Yes Set Sign
        
        CMP al, '+'                    ; Plus Sign
        JE @PLUS                       ; Yes get Another Character
        
        JMP @REPEAT1                   ; Start Processing Character
        
        @MINUS:                        
            MOV cx, 1                  ; Negative = true
        @PLUS:                         
            CALL INPUT                 ; Read a Character
        @REPEAT1:
            CMP al, '0'                ; Character >= 0
            JNGE @NON_DIGIT            ; illegal Character
            CMP al, '9'                ; Character <= 9
            JNLE @NON_DIGIT            ; illegal Character
            
            AND ax, 000Fh              ; Convert to Digit
            PUSH ax                    ; Save in Stack
            
            MOV ax, 10                 ; Get 10
            MUL bx                     ; Ax = total x 10
            POP bx                     ; Retrieve Digit
            ADD bx, ax                 ; Total = Total x 10 + Digit
            
            CALL INPUT                 ; Read a Character
            CMP al, 0DH                ; check if char is Carriage return
        JNE @REPEAT1
        
        MOV ax, bx                     ; After Finding Total MOV it into Ax
        CMP cx, 0                      ; If the Number is Negative
        JE @EXIT                       ; If the Number is Positive
        
        NEG ax                         ; Ax = -Ax
        @EXIT:
            
        POP dx                         ; pop a value from STACK into DX
        POP cx                         ; pop a value from STACK into CX
        POP bx                         ; pop a value from STACK into BX
        RET                            ; return control to the calling procedure
        
        @NON_DIGIT:   
        PRINT 0DH
        PRINT 0AH
    JMP @BEGIN
DECIMAL_INPUT ENDP
END MAIN 