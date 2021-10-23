;Program to Input two Numbers from user and Add them
                                                        
.MODEL small
.STACK 100h
.DATA
    CH1 DB ?
    CH2 DB ?
.CODE 
MAIN PROC 
    
;Taking First Number Input From User  

MOV dl, '?'     ;Assign '?' to dl register for printing 
MOV ah, 2       ;Calling Print Function Using AH register
INT 21H         ;Calling Text Interupt 

MOV ah, 1       ;Calling input function using ah and place it into Al
INT 21H         ;Calling Text Interupt
MOV CH1, al     ;Moving Inputted Value from al to CH1 

;Creating Next Line On Screen
 
MOV dl, 0DH    ;Moving cursor to the end of screen using dl register 
MOV ah, 2      ;Calling Print Function Using AH register
INT 21H        ;Calling Text Interupt
     
MOV dl, 0AH    ;Moving cursor to the Next Line of screen using dl register
MOV ah, 2      ;Calling Print Function Using AH register
INT 21H        ;Calling Text Interupt  

;Taking Second Number Input From User  

MOV dl, '?'     ;Assign '?' to dl register for printing 
MOV ah, 2       ;Calling Print Function Using AH register
INT 21H         ;Calling Text Interupt 

MOV ah, 1       ;Calling input function using ah and place it into Al
INT 21H         ;Calling Text Interupt
MOV CH2, al     ;Moving Inputted Value from al to CH1  

;Creating Next Line On Screen
 
MOV dl, 0DH    ;Moving cursor to the end of screen using dl register 
MOV ah, 2      ;Calling Print Function Using AH register
INT 21H        ;Calling Text Interupt
     
MOV dl, 0AH    ;Moving cursor to the Next Line of screen using dl register
MOV ah, 2      ;Calling Print Function Using AH register
INT 21H        ;Calling Text Interupt
                       
;ADD Both Inputted Numbers

MOV bl, CH1    ;Moving value of CH1 variable into bl 
ADD bl, CH2    ;Adding value of CH2 variable and value of bl then place into bl
SUB bl, 48     ;Subtract 48 from the value of bl register for ASCII Management

MOV dl, bl     ;Assign value of bl register to dl
MOV ah, 2      ;Calling Print Function Using AH register
INT 21H        ;Calling Text Interupt
                       
;Creating Exit Function 

MOV ah, 4CH  
INT 21H
    
MAIN ENDP
END MAIN