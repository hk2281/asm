.MODEL Tiny
.STACK 100h
.DATA 
x dw 10 
y dw 0fh
.CODE 
mov ax, @data
mov ds,ax 
GOTOXY  MACRO   col, row
        PUSH    AX
        PUSH    BX
        PUSH    DX
        MOV     AH, 02h
        MOV     DH, row
        MOV     DL, col
        MOV     BH, 0
        INT     10h
        POP     DX
        POP     BX
        POP     AX
ENDM

PRINT   MACRO   sdat
LOCAL   next_char, s_dcl, printed, skip_dcl

PUSH    AX      
PUSH    SI      ;

JMP     skip_dcl      
        s_dcl DB sdat, 0

skip_dcl:
        LEA     SI, s_dcl
        
next_char:      
        MOV     AL, CS:[SI]
        CMP     AL, 0
        JZ      printed
        INC     SI
        MOV     AH, 0Eh 
        INT     10h
        JMP     next_char
printed:

POP     SI      
POP     AX      
ENDM

PRINTN   MACRO   sdat
LOCAL   next_char, s_dcl, printed, skip_dcl

PUSH    AX     
PUSH    SI      

JMP     skip_dcl        
        s_dcl DB sdat, 13, 10, 0

skip_dcl:
        LEA     SI, s_dcl
        
next_char:      
        MOV     AL, CS:[SI]
        CMP     AL, 0
        JZ      printed
        INC     SI
        MOV     AH, 0Eh 
        INT     10h
        JMP     next_char
printed:

POP     SI     
POP     AX      
ENDM  

mov cx, x
line:
PRINT 'o '
loop line 
mov cx, y

gotoxy 0,1    

colonm:
PRINTN 't'
loop colonm


mov ax, 4c00h
int 21h

end 