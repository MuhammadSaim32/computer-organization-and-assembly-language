[org 0x0100]

xor ax,ax 
mov cx,3
mov bx ,num1

loop:
    add ax,[bx]
    add bx,2

    sub cx,1
    jne loop

mov [result],ax
mov ax,0x4c00
int  0x21

num1:dw 5,10,15
result:dw 0
