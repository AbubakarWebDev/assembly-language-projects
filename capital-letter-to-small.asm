;Program to convert capital letter into small letter

.model small
.stack 100h
.data   
.code
MAIN PROC
    
;Input Character from user  

MOV ah, 1       ;Calling Input Function and place input on al register
INT 21H         ;Calling text interupt
MOV bl, al      ;Moving Value of al to bl register 

;Printing next line on console screen

MOV dl, 0DH    ;Moving cursor to the end of screen using Carriage return character 
MOV ah, 2      ;Calling Print Function Using AH register
INT 21H        ;Calling Text Interupt
     
MOV dl, 0AH    ;Moving cursor to the Next Line of screen using using Line Feed character
MOV ah, 2      ;Calling Print Function Using ah register
INT 21H        ;Calling Text Interupt 
         
;Printing Character on console screen
         
MOV dl, bl     ;Moving value of bl to dl register for printing output
ADD dl, 32     ;Adding 32 to the value of dl register for coverting it into small letter
MOV ah, 2      ;Calling Print Function using ah register
INT 21H        ;Calling text interupt

;Calling Exit Function

MOV ah, 4CH   ;Exit From Accumulator
INT 21H       ;Calling Text Interupt
    
MAIN ENDP
END MAIN