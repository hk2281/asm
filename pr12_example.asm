.MODEL Tiny
.STACK 100h

.DATA
Message1 DB 'Hello',13,10,'$'
Message2 DB 'How are you?',13,10,'$'
Message3 DB 'Comment ca va?',13,10,'$'

.CODE
    ProgramStart PROC
    mov ax, @Data
    mov ds, ax
    mov dx, OFFSET Message1
    call PrintString ; вывести строку Hello
    mov dx, OFFSET Message2
    call PrintString ; вывести строку How are you
    mov dx, OFFSET Message3
    call PrintString ; вывести строку Comment ca va
    mov ax, 4C00h ; функция DOS завершения программы
    int 21h ; завершить программу
    ProgramStart ENDP
    ; подпрограмма вывода на экран строки
    ; входные данные:
    ; DX - указатель на выводимую строку.
    ; нарушаемые регистры: AH
    PrintString PROC
    mov ah, 9
    int 21h
    EndPrintString:
    ret ; возврат в вызывающую программу
    PrintString ENDP
END ProgramStart