;Program to demonstrate the Division of two number

.model small
.data
    quotient DW ?
    reminder DW ?
.code
MAIN PROC

; In word division, the dividend Is in DX:AX even if the actual dividend will fit in AX. In this case DX should be prepared as follows:
; 1) For DIV: DX should be cleared.
; 2) For IDIV: DX should be made the sign extension of AX. The instruction CWD (convert word to doubleword) will do the extension. 

MOV ax, 20       ;Dividend
CWD                 ;For DX made be the sign extension of AX
MOV bx, 3           ;Divisor
IDIV bx             ;AX gets Quotient and DX gets reminder


ADD ax, 48
ADD dx, 48

MOV quotient, ax
MOV reminder, dx
        
MOV dx, quotient
MOV ah, 2
INT 21H

MOV dx, ' '
MOV ah, 2
INT 21H

MOV dx, reminder
MOV ah, 2
INT 21H

MOV ah, 4CH
INT 21H    

MAIN ENDP
END MAIN