; Reverse A Bit Pattern using shift and rotate  

.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC

; An easy way to do this' Is to we SHL to shift the bits out the left end
; of DL Into CF (Carry Flag) and then use RCR to move them Into the left end
; of another register BL. If this is done eight times, BL will contain the
; reversed bit pattern and it can be copied back Into DL.
    
    MOV dl, 10110101b
    XOR bx, bx
    MOV cx, 8
    
    @REVERSE:
        SHL dl, 1   
        RCR bl, 1  
    LOOP @REVERSE
    
    MOV dl, bl
    
    MOV ah, 4CH
    INT 21H        
MAIN ENDP
END MAIN