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
    
    MOV ax, 2505
    CALL DECIMAL_OUTPUT
    
    MOV ah, 4ch
    INT 21H                 
MAIN ENDP 
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