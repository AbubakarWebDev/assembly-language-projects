; Reverse Array With Swapping

.MODEL SMALL
.STACK 100H
.DATA 
    arr DW 1, 3, 5, 7, 9
.CODE
MAIN PROC 
    MOV ax, @DATA
    MOV ds, ax
   
    LEA si, arr
    MOV BX, 5
    
    CALL REVERSE_ARRAY
    
    LEA si, arr
    MOV cx, 5
    
    CALL PRINT_ARRAY
        
    MOV ah, 4ch
    INT 21H                 
MAIN ENDP
PRINT_ARRAY PROC
    ; This Procedure is used to Print Word Array
    ; Input: SI contains Address of Word Array
    ;        CX Contains Size of Word Array
    ; Output: None
    
    MOV ah, 2
    @PRINT_ARRAY:
        MOV dx, [si]
        ADD dl, 48 
        INT 21H
        ADD si, 2
    LOOP @PRINT_ARRAY
    
    RET
PRINT_ARRAY ENDP
REVERSE_ARRAY PROC
    ; This Procedure is used to Reverse Word Array
    ; Input: SI contains Address of Word Array
    ;        BX Contains Size of Word Array
    ; Output: Reversed Array
    
    PUSH ax
    PUSH cx
    PUSH di
    
    MOV si, di      ; DI contains address of 1st element of Word Array
    MOV cx, bx      ; CX Contains Size of Word Array 
    DEC bx          ; BX = BX - 1
    SHL bx, 1       ; BX = 2 x BX = 2 x (size - 1)
    ADD di, bx      ; DI contains address of last element of Word Array
    SHR cx, 1       ; For odd numbers, A right shift halves It and rounds down
    
    @REPEAT:
        MOV ax, [si]
        XCHG ax, [di]
        MOV [si], ax
        
        ADD si, 2
        SUB di, 2
    LOOP @REPEAT
    
    POP ax
    POP cx
    POP di
    
    RET
REVERSE_ARRAY ENDP    
END MAIN 