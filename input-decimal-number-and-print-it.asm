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
    
    PUSH AX
    PRINT 0DH
    PRINT 0AH
    POP AX
    
    CALL DECIMAL_OUTPUT
    
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
DECIMAL_OUTPUT PROC
    ; this procedure will print contents of AX in decimal form    
    ; input : Input the Contents of AX
    ; output : None
    ; uses : MAIN
    
    PUSH bx                        ; push BX onto the STACK
    PUSH cx                        ; push CX onto the STACK
    PUSH dx                        ; push DX onto the STACK
    
    CMP ax, 0                      ; if ax less than zero
    JGE @END_IF                    ; if greater than or equal to
    
    PUSH ax                        ; Save Ax
    PRINT '-'                      ; Print Minus Sign '-'
    POP ax                         ; Retrieve Number
    NEG ax                         ; Ax = -Ax
    
    @END_IF:
    XOR cx, cx                     ; CX counts total number of digits
    MOV bx, 10                     ; BX is Divisor
    
    @REPEAT2:
        XOR dx, dx                 ; Prepare High Word of Dividend
        DIV bx                     ; AX = Quotient and BX = Remainder
        PUSH dx                    ; Save Reminder On stack
        INC cx                     ; count = count + 1
        CMP ax, 0                  ; if Quiotent is Zero
    JNE @REPEAT2                   ; if Quiotent is Not Zero
    
    @PRINT:
        POP dx                     ; Retrive Digit From Stack
        ADD dl, 48                 ; Convert Digit To Character
        PRINT dl                   ; Print The Character
    LOOP @PRINT
            
    POP dx                         ; pop a value from STACK into DX
    POP cx                         ; pop a value from STACK into CX
    POP bx                         ; pop a value from STACK into BX
    RET                            ; return control to the calling procedure
DECIMAL_OUTPUT ENDP
END MAIN 