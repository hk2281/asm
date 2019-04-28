.MODEL Tiny 

.STACK 100h

.DATA 
	Msg  DB 'enter string',13,10,'$' 
	Msg1 DB 'enter',13,10,'$'   
	buf  DB 80 DUP(?)

.CODE                            ;directive start sigment of code 
    
	mov ax, @Data                ;install registr DS on sigment with data
	mov ds, ax
	
	mov ah, 9             ; output inwite enter data  with help 9 function DOS
	mov dx, OFFSET Msg
	int 21h
;+++++++++++++++++++++++++++++++++
; input string with help 3f DOS function
	mov ah, 3fh            
	mov bx, 0                        ;descriptor 
	mov dx, OFFSET buf 
	mov cx, 80 
	int 21h                    ;!!!! error write (interrupt cannot use now  ) 
	
	push ax                    ; move data in stack
;+++++++++++++++++++++++++++++++++	
	mov ah, 9                 ;output massege about enter data 
	mov dx, OFFSET Msg1
	int 21h
;+++++++++++++++++++++++++++++++++
; output u string 	
	mov ah, 40h 
	mov bx, 1 
	mov dx, OFFSET buf 
	pop cx 
	int 21h
	
	mov ax, 4c00h
	int 21h
	
	END  

