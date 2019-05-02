.model tiny 
.stack 100h
.data 
x dw 7h  
ascii dw 'rawni ',13,10,'$' 
result dw 'ravno: ',?,13,10,'$'
.code 
mov ax, @data
mov ds,ax
mov ax,7h 
mov bx, x
cmp ax,bx 
je  a1
add ax,bx 
jmp a2
a1:
mov ah,9h 
mov dx, offset ascii
int 21h
jmp end
a2: 
add ax,30h
mov result[8],ax
mov ah,9h
mov dx, offset result 
int 21h

end:
mov ax, 4c00h
int 21h
end 



