;Program to Addition of Two Number

.model small
.stack 100h
.data

.code
MAIN PROC

MOV bl, 3       ;Assign 3 to bl register
MOV cl, 1       ;Assign 1 to cl register

ADD bl, cl      ;Adding the value of bl and cl then assign to bl  
ADD bl, 48      ;Adding 48 into the addition result For ASCII Management

MOV dl, bl      ;Moving the value of bl into dl for performing output
MOV ah, 2       ;Calling print Function for print value in dl register
INT 21H         ;Calling text Interupt

MOV ah, 4CH     ;Calling Exit Function
INT 21H         ;Calling text Interupt
 
MAIN ENDP
END MAIN