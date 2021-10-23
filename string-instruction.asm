; String Instructions

PRINT MACRO value
    MOV dl, value
    MOV ah, 2
    INT 21H
ENDM

.MODEL SMALL
.STACK 100H
.DATA
    str1 DW 'Hello'
    str2 DW 5 DUP('?') 
.CODE 

;----------------------------------------------------------------------------------------                                                                                         
;                               DIRECTION FLAG INSTRUCTIONS                                                            
;----------------------------------------------------------------------------------------
; Instruction              Opcode           Working
; Set Direction Flag       STD              both SI and DI are automatically Decremented
; Clear Direction Flag     CLD              both SI and DI are automatically Incremented
;----------------------------------------------------------------------------------------


;----------------------------------------------------------------------------------------                                                                                         
;                                  STRING INSTRUCTIONS                                                            
;----------------------------------------------------------------------------------------
; Instruction	        Destination         Source          Byte form       Word form	
; Move string	        ES:DI	            DS:SI	        MOVSB	        MOVSW
; Store string	        ES:DI	            AL or AX	    STOSB	        STOSW	
; Load string	        AL or AX	        DS:SI	        LODSB	        LODSW	
; Scan string	        ES:DI	            AL or AX        SCASB	        SCASW 
; Compare string	    ES:DI	            DS:SI	        CMPSB	        CMPSW	
;----------------------------------------------------------------------------------------
	
 
;----------------------------------------------------------------------------------------                                                                                         
;                                  REPEATED INSTRUCTIONS                                                            
;----------------------------------------------------------------------------------------
; Instruction                                                       Opcode           
; Repeat String Instructions to be executed CX times                 REP
; Repeat String Instructions While (ZF=1 AND CX != 0)                REPE or REPZ
; Repeat String Instructions While (ZF=0 AND CX != 0)                REPNE or REPNZ
;---------------------------------------------------------------------------------------- 

MAIN PROC 
    MOV ax, @DATA
    MOV ds, ax
    MOV es, ax
    
    LEA si, str1 
    MOV cx, 5
    
    @REPEAT1:
        PRINT [si]
        INC si 
    LOOP @REPEAT1 
    
    PRINT 0AH
    PRINT 0DH
    
    LEA di, str2
    MOV cx, 5
    @REPEAT2:
        PRINT [di]
        INC di 
    LOOP @REPEAT2
    
    PRINT 0AH
    PRINT 0DH
    
    LEA si, str1
    LEA di, str2 
    MOV cx, 5
    
    CLD   
    REP MOVSW            
 
    LEA si, str1 
    MOV cx, 5    
    @REPEAT3:
        PRINT [si]
        INC si 
    LOOP @REPEAT3 
    
    PRINT 0AH
    PRINT 0DH
    
    LEA di, str2
    MOV cx, 5
    @REPEAT4:
        PRINT [di]
        INC di 
    LOOP @REPEAT4
    
    MOV ah, 4CH
    INT 21H                     
MAIN ENDP   
END MAIN 