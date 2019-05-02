.model tiny 
.stack 100h
.data 
x dw 5684  
ascii dw 'rawni ',13,10,'$' 
result dw 'ravno: ',?,13,10,'$'
correct dw 'rezultat: ',?,?,?,?,?,13,10,'$'
.code 
mov ax, @data
mov ds,ax
mov ax,0h 
mov bx, x
cmp ax,bx 
je  a1
add ax,bx

mov si, offset correct
add si, 15h 
mov cx,10
 
jmp a2

a1:
mov ah,9h 
mov dx, offset ascii
int 21h
jmp end

a2:
xor dx,dx
div cx 
add dx,30h
mov [si],dl
dec si 
cmp ax,0
jne a2 

mov ah,9h
mov dx,offset correct
int 21h

end:
mov ax, 4c00h
int 21h
end 
