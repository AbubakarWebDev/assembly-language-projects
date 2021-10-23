;Useful MACROS for future use

INPUT_STR MACRO str 
    LEA si, str
   
    @label1: 
        MOV ah, 1
        INT 21H    
        MOV [si], al     
        INC si      
        
        CMP al, 13
        JE @EXIT
    LOOP @label1
    @EXIT:
    
    MOV [si], '$'
ENDM

REVERSE_STR MACRO str
    LEA si, str
    PUSH 0DH
    
    @REVERSE: 
        cmp [si], '$'
        JE @print1
        
        PUSH [si]
        INC si                                                        
    LOOP @REVERSE
    
    @print1:           
    LEA si, str
        
    @PRINT_REVERSE:
        POP dx 
        CMP dx, 0DH
        JE @print2   
        
        MOV [si], dx
        INC si
    LOOP @PRINT_REVERSE
    @print2:
    MOV [si], '$'
    CALL PRINT_NEXT_LINE
ENDM
            
PRINT_STR MACRO str 
    LEA dx, str
    MOV ah, 9
    INT 21H
ENDM

PRINT_ARRAY MACRO arr, size
    LEA si, arr
    MOV cx, size
          
    @label2:     
        MOV dx, [si]
        MOV ah, 2
        INT 21H
        
        INC si
    LOOP @label2
ENDM

REVERSE_ARR MACRO arr, size
    LEA si, arr
    MOV cx, size
    
    @PUSH_OPERATION: 
        PUSH [si]
        INC si                                                        
    LOOP @PUSH_OPERATION
           
    LEA si, arr
    MOV cx, size
        
    @POP_OPERATION:
        POP dx
        MOV [si], dx
        INC si
    LOOP @POP_OPERATION
ENDM

INPUT_ARRAY MACRO arr, size 
    LEA si, arr 
    SUB size, 48
    MOV cx, size
          
    @label3: 
        MOV ah, 1
        INT 21H
            
        MOV [si], al
        
        INC si
    LOOP @label3
ENDM           

INPUT_VAR MACRO var
    MOV ah, 1  
    INT 21H 
    
    XOR bx, bx
    MOV bl, al 
    MOV var, bx
ENDM

PRINT_VAR MACRO var    
    MOV dx, var
    MOV ah, 2
    INT 21H
ENDM 

GOTO_XY MACRO x, y 
    mov ah, 2
    mov bh, 0
    mov dh, x
    mov dl, y
    int 10h
ENDM

GET_CURSOR MACRO

    ;retrieves the coordinates and cursor type of the cursor
    mov ah, 3
    mov bh, 0
    int 10h
    
    ;DH, DL has now the coordinates of the cursor
    ;CH, CL has now the cursor type 
    ;DH, DL = Row, Column of cursor.
    ;CH, CL = Cursor mode/type currently set.
ENDM