;Program to demostrate the use of if statement

.model small
.stack 100h
.data
    CH1 DB ?  
    CH2 DB ?  
    msg1 DB 'Both Number are Same', 0DH, 0AH, '$'
    msg2 DB 'Both Number are Not Same. Please Try Again', 0DH, 0AH, '$'                
.code                        

MAIN PROC     
    
MOV ax, @DATA
MOV ds, ax  

@AGAIN:

;Taking First Chracter from user     
                                     
MOV dl, '?'    ;Moving '?' character on dl register                                     
MOV ah, 2      ;Calling Print Function Using AH register 
INT 21H        ;Calling Text Interupt

MOV ah, 1      ;Taking Input From user 
INT 21H        ;Calling Text Interupt

MOV CH1, al    ;Moving al value in CH1 Variable  

;Creating Next Line On Screen
 
MOV dl, 0DH    ;Moving cursor to the end of screen using dl register 
MOV ah, 2      ;Calling Print Function Using AH register
INT 21H        ;Calling Text Interupt
     
MOV dl, 0AH    ;Moving cursor to the Next Line of screen using dl register
MOV ah, 2      ;Calling Print Function Using AH register
INT 21H        ;Calling Text Interupt 

;Taking Second Chracter from user     
                                     
MOV dl, '?'    ;Moving '?' character on dl register                                     
MOV ah, 2      ;Calling Print Function Using AH register 
INT 21H        ;Calling Text Interupt

MOV ah, 1      ;Taking Input From user 
INT 21H        ;Calling Text Interupt

MOV CH2, al    ;Moving al value in CH2 Variable

;Creating Next Line On Screen
 
MOV dl, 0DH    ;Moving cursor to the end of screen using dl register 
MOV ah, 2      ;Calling Print Function Using AH register
INT 21H        ;Calling Text Interupt
     
MOV dl, 0AH    ;Moving cursor to the Next Line of screen using dl register
MOV ah, 2      ;Calling Print Function Using AH register
INT 21H        ;Calling Text Interupt  

;Check Number is Same or Not
MOV dl, CH1
CMP dl, CH2
JE @EXIT  

LEA dx, msg2 
MOV ah, 9   
INT 21H

JMP @AGAIN 

;Creating Next Line On Screen
 
MOV dl, 0DH    ;Moving cursor to the end of screen using dl register 
MOV ah, 2      ;Calling Print Function Using AH register
INT 21H        ;Calling Text Interupt
     
MOV dl, 0AH    ;Moving cursor to the Next Line of screen using dl register
MOV ah, 2      ;Calling Print Function Using AH register
INT 21H        ;Calling Text Interupt

;Printing Second Character Input

MOV dl, CH2    ;Moving character From CH1 variable to dl register 
MOV ah, 2      ;Calling Print Function Using AH register
INT 21H        ;Calling Text Interupt 
                                  
;Creating Exit Function 

@EXIT:    
LEA dx, msg1 
MOV ah, 9   
INT 21H
       
MOV ah, 4CH     ;Calling Exit Function Using AH register
INT 21H         ;Calling Text Interupt

MAIN ENDP    
END MAIN