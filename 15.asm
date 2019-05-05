.MODEL Tiny
.STACK 100h

.DATA
    a DW 10
    b DW 5
    Message1 DW 'A<B',13,10,'$'

.CODE  
mov ax, a
mov bx, b
    MyMacro    MACRO  p1, p2, p3

     MOV AX, p1
     MOV BX, p2
     MOV CX, p3

ENDM



MyMacro a, b, 0

MyMacro 4, 5, DX

RET
    end:
    mov ax, 4c00h
    int 21h
end 
