;Program to demostrate the print array using loop 

.model small
.stack 100h
.data
    arr DB '1', '2', '3', '4' 
.code
MAIN PROC         
    
MOV ax, @DATA
MOV ds, ax
    
;Print Array using Loop

LEA si, arr
MOV cx, 4

@label:
    MOV dl, [si]
    MOV ah, 2
    INT 21H 
    
    MOV dl, 0DH
    MOV ah, 2
    INT 21H
    
    MOV dl, 0AH
    MOV ah, 2
    INT 21H
    
    INC si   
LOOP @label

MOV ah, 4CH
INT 21H
         
MAIN ENDP 
END MAIN