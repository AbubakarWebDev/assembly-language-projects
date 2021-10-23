;Program to demonstrate the Division of two number

.model small
.data

.code
MAIN PROC
    MOV ax, 10
    MOV bl, 5
    
    DIV bl
            
    ADD al, 48
    ADD ah, 48
    
    PUSH ax        
    MOV dl, al   ; moving quotient
    MOV ah, 2
    INT 21H
    POP ax
    
    MOV dl, ah   ; moving reminder
    MOV ah, 2
    INT 21H
    
    MOV ah, 4CH
    INT 21H    
MAIN ENDP
END MAIN