; how to assemble assembly 16bit program => nasm Assemx16_loops.asm -o Assemx16_loops.com 


[org 0x0100]



mov ax,[num2]

mov bx,10


add ax,bx

mov bx,15

add ax,bx

mov ax,0x4c00

int  0x21

num1:dw 1
num2:dw 2
