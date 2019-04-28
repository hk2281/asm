.model tiny    
.stack 100h
.data 
first dw  11011001b
adt dw 'chislo: ',?,10,13,'$'
.code 
mov ax, @data
mov ds, ax 
;=====================
//
mov ax, first  
and ax, 10101010b 
mov bx, ax 
shr bx,1
and bx,00000001b 
shr ax,2
and ax,00000010b
or  ax,bx 
push ax
;=========================
mov ax, first 
and ax, 10101010b 
mov bx, ax 
shr bx,3 
and bx, 00000100b
shr ax,4
and ax, 00001000b
or ax,bx 
pop dx
or ax, dx
push ax 
;=========================
mov ax, first
and ax, 01010101b
mov bx,ax 
and bx, 00000001b 
shr ax,1
and ax, 00000010b
or ax,bx 
push ax 
;=========================
mov ax, first
and ax, 01010101b
mov bx,ax 
shr bx,2 
and bx, 00000100b
shr ax,3
and ax, 00001000b
or ax,bx 
pop bx
or ax,bx
;=========================
push cx 
and ax,cx
mov bx,22h
mul bx
mov ax, 4c00h
int 21h
end  

 