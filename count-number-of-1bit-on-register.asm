;Count Number of 1's Bit On Register

.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
    XOR ax, ax
    MOV cx, 16
    MOV bx,  1345h  ;0001 0011 0100 0101 
    
    @TOP:
        ROL bx, 1
        JNC @NEXT
        INC ax
    @NEXT:            
    LOOP @TOP 
    
    MOV dx, ax
    ADD dx, 48
    MOV ah, 2
    INT 21H
    
    MOV ah, 4CH
    INT 21H        
MAIN ENDP
END MAIN