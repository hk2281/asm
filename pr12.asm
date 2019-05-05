.MODEL Tiny
.STACK 100h

.DATA
x DW 10
Message1 DW 'Hello i am Bill Gates too',13,10,'$'
Message2 DW 'Hello i am Bill Gates too','$'

.CODE 
call ini_data

mov cx, x
line:
call  string_in_line
loop line

mov cx, x
add cx, 5
colmn:
call  string_in_colmn
loop colmn

mov ax, 4c00h
int 21h

string_in_colmn PROC 
mov dx, offset Message1
mov ah, 9h
int 21h
ret
string_in_colmn endp 

string_in_line PROC
mov dx, offset Message2
mov ah, 9h
int 21h
ret
string_in_line endp

ini_data PROC
mov ax, @DATA
mov ds, ax
ret 
ini_data endp 

end 
