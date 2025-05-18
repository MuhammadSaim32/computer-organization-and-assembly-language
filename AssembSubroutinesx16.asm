[org 0x0100]

jmp start

data:dw 5,2,3,11
swap:db 0

bubblesort:

    outerloop:

        mov byte[swap],0
        mov bx,0
    
        innerloop:

            mov ax,[data+bx]
            cmp ax,[data+bx+2]
            jbe noswap

                mov  dx,[data+bx+2]
                mov [data+bx+2],ax
                mov [data+bx],dx
                mov byte[swap],1

            noswap:
                add bx,2
                cmp bx,6
                jnz innerloop

        cmp  byte[swap],1
        je outerloop
        
    ret








start:


call bubblesort





mov ax,0x4c00
int  0x21


