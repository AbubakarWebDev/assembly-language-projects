;Useful PROCEDURES For Future Use

PRINT_NEXT_LINE PROC
    MOV dl, 0Ah
    MOV ah, 2
    INT 21H
    
    MOV dl, 0Dh
    MOV ah, 2
    INT 21H  
    
    RET
PRINT_NEXT_LINE ENDP                                                    