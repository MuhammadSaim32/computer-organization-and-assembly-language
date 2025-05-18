[org 0x0100]

jmp start

func:

push bp
mov bp,sp
pop bp
ret 4

start:

    mov ax,1
    mov bx,2
 

    push ax
    push bx
    call func

mov ax,0x4c00

int  0x21
