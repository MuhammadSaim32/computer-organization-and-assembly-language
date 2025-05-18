[org 0x0100]


jmp start

multiplicand: dw 200
multiplier:    db 50
result:        dw 0

start:
mov cl,8
mov al,[multiplier]

loop:

shr al,1
jnc skip

mov bl,[multiplicand]
add byte[result],bl
mov bl,[multiplicand+1]
adc byte[result+1],bl

skip:
shl byte[multiplicand],1,
rcl byte[multiplicand+1],1


dec cl
jnz loop


mov ax, 0x4C00
int 0x21

