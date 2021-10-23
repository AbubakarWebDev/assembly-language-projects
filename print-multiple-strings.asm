;Program to print a multiple string on a screen

.model small
.stack 100h
.data
    str1 db "Assalamulaikum!", 0DH, 0AH, '$'  ;str contains line feed and carriage return characters.
    str2 db "I am Muhammad Abubakar$" 
.code
MAIN PROC      
    
    MOV dx, @DATA  ;Moving main memory location (16 bits address) of data segment into dx register  
    MOV ds, dx     ;Moving the value of dx to ds register
    
    ;MOV AX, @DATA is the first line of code that gets run. I believe @DATA is a variable that holds the value of the location in memory where the data segment lives. It moves the memory location of @DATA into the AX register (16 bit register). One thing to note here is the @ in front of the word DATA. I believe this is because @DATA is evaluated during the linking process and it will be replaced by its actual value. Notice how the other examples to not have the @ in front because they are referring to an actual memory location to begin with.

    ;MOV DS, AX will then set that memory location as the variable DS which is a standard variable (or register in this case) for 8086 assembly. It should always point to the location of your storage where you want to keep values (the heap if you're familiar with C++ terminology).

    ;The AX register is simply a temporarily place holder that you can load with values and perform execute commands against.

    MOV dx, offset str1  ;offset is the address of the first charater of the str and then go to next chracter from the offset address. it is 16 bit address so we use dx for moving it
    ;Alternative command: LEA dx, str
    
    MOV ah, 9    ;Calling function # 09 for printing String on screen
    INT 21H      ;Calling Text Interupt
    
    LEA dx, str2  ;LEA (Load Effective Address): It is same as Offset. It's loads the address of first character of the string
    ;Alternative command: MOV dx, offset str2
    
    MOV ah, 9    ;Calling function # 09 for printing String on screen
    INT 21H      ;Calling Text Interupt
    
    MOV ah, 4ch  ;Calling exit function for pull out from ah register
    INT 21H      ;Calling Text Interupt

MAIN ENDP    
END MAIN