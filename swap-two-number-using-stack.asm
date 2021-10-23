;Program to Swap two Numbers using stack

.model small
.stack 100h
.data
    msg1 DB "Value of BX is: $"
    msg2 DB "Value of CX is: $"    
.code
MAIN PROC 
    
MOV dx, @DATA
MOV ds, dx

MOV bx, 2
MOV cx, 1

push bx
push cx

pop bx
pop cx 
      
LEA dx, msg1         
MOV ah, 9
INT 21H
         
MOV dx, bx
ADD dx, 48         
MOV ah, 2
INT 21H 

MOV dl, 0DH
MOV ah, 2
INT 21H

MOV dl, 0AH
MOV ah, 2
INT 21H
  
LEA dx, msg2         
MOV ah, 9
INT 21H  
  
MOV dx, cx 
ADD dx, 48        
MOV ah, 2
INT 21H

MOV dl, 0DH
MOV ah, 2
INT 21H

MOV dl, 0AH
MOV ah, 2
INT 21H

MOV ah, 4CH
INT 21H

MAIN ENDP    
END MAIN