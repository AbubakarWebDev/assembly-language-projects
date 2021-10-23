.MODEL SMALL
.STACK 100H
.DATA
    
.CODE
MAIN PROC                                                            
         
    MOV cx, 5 
    MOV ax, 1
    
    @TOP:
        MUL cx     
    LOOP @TOP   
                  
MAIN ENDP
END MAIN 