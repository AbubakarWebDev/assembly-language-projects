; Find Sum of All Array Elements

.MODEL SMALL
.STACK 100H
.DATA 
    arr DW 1, 3, 5, 7, 9
.CODE
MAIN PROC
    MOV ax, @DATA
    MOV ds, ax
    
    XOR ax, ax
    LEA si, arr
    MOV cx, 5
    
    @REPEAT:
        ADD ax, [si]
        ADD si, 2    
    LOOP @REPEAT
        
    MOV ah, 4ch
    INT 21H                 
MAIN ENDP
END MAIN 