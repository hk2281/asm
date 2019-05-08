.MODEL Tiny
include emu8086.INC
.STACK 100h
.DATA 
        x dw 10 
        y dw 0fh
.CODE 
        mov ax, @data
        mov ds,ax 
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