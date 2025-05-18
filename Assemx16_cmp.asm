[org 0x0100]

mov ax,0
mov bx,0

loop:
    add ax,[num+bx]
    add bx,2

    cmp bx,20
    jne loop

mov [result],ax

mov ax,0x4c00

int  0x21


num:dw 1,2,3,4,5,6,7,8,1,10
result:dw 0