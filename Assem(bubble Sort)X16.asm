[org 0x0100]

jmp start

data:dw 4,3,2,1

start:
        mov cx,3
  
outerloop:
       
            mov bx,0
        
        innerloop:

            mov ax,[data+bx]
            cmp ax,[data+bx+2]
        
            jbe noswap ; if first value is less  or equal then no swap

                mov dx ,[data+bx+2]
                mov [data+bx+2],ax
                mov [data+bx],dx

            noswap:

                add bx,2
                cmp bx,6
                jnz innerloop

    sub cx,1
    jnz outerloop


mov ax,0x4c00
int  0x21

;je => (jum if equal )
;byte[memeory] get only one byte from memeory