.MODEL Tiny
.STACK 100h
.DATA
Msg dw 'Lab#9 ',13,10,'$'
ASCIIstroka dw 'Rezultat: ',?,?,?,?,?,13,10,'$'
.CODE
mov ax, @Data
mov ds, ax
mov ah, 9
mov dx, OFFSET Msg
int 21h
mov ax, 65535 ;������������ 16-������ ����� ��� ������
mov si, OFFSET ASCIIstroka ;������������� ������� si � ������� ������
add si, 15 ;15-�� ������ � ������ ASCIIstroka
;����� ��������� ����������� �������������� �����
;� ASCII ������������������
;��� ������ �� �����
mov cx, 10 ; ����� ������ �� 10 �����, ���������� � AX ��� ���� �����
; �������� ��� ������� ������ ������
metka: ; ������������� ����� "metka"
xor dx, dx ; �������� dx
div cx
add dx, 30h ; ��������� 30h ��� ����������� ������ �� �����
mov [si], dl ; �������� ��������������� ����� � ASCIIstroka
dec si ; ��������� si �� �������, �.�. ������������ �� ������ ����� ��
; 15 �������, ��� ������� ���������� �������� ������ ������
; �.�. �� ������ ��� �� �������� ������� �� ������� �� 10
cmp ax, 0 ; ���������� ax c �����, �.�. ���������, ������������� �� ���
; �������?
jne metka ; ���� ax �� ����� ���� ��������� �� metku
mov ah, 9
mov dx, OFFSET ASCIIstroka
int 21h
mov ax, 4C00h
int 21h
END