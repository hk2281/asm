.MODEL Tiny
.STACK 100h

.DATA
    a DW 10
    b DW 5
    Message1 DW 'A<B',13,10,'$'

.CODE 
MyMacro    MACRO  p1, p2
        mov cx, 5
        MOV AX, p1
        MOV BX, p2
        a1:
        add ax,bx
        loop a1
        shl ax, 1
ENDM
    mov ax, a
    mov bx, b
    cmp ax, bx 
    jb outt2
    MyMacro ax, bx 
    ret
    outt2:
    call string_in_colmn
    string_in_colmn PROC 
        mov dx, offset Message1
        mov ah, 9h
        int 21h
        jmp end 
        ret 
    string_in_colmn endp
    
        
    end:
    mov ax, 4c00h
    int 21h
end 
