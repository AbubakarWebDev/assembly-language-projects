;Program to demostrate the use of if statement

.model small
.stack 100h
.data
    CH1 DB ?  
    CH2 DB ?                 
.code                        

MAIN PROC

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

;Printing First Character Input

MOV dl, CH1    ;Moving character From CH1 variable to dl register 
MOV ah, 2      ;Calling Print Function Using AH register
INT 21H        ;Calling Text Interupt  

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
       
MOV ah, 4CH     ;Calling Exit Function Using AH register
INT 21H         ;Calling Text Interupt

MAIN ENDP    
END MAIN