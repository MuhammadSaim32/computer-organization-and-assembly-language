;shl on lsb and then rotate throught carry left on msb


[org 0x0100]

jmp start

data:dw 4400

src:dw 4000
des:dw 8000

start:

shl byte[data],1
rcl byte [data + 1], 1 

;extended addition

    xor ax,ax

    mov al,[src]
    add byte[des],al
    mov al, [src+1]
    adc byte[des+1],al ;add through carry 


    mov  ax, 0x4c00 
    int  0x21 