[org 0x0100]

mov cl, 4

mov al, [multiplicand]
mov bl, [multiplier]

checkbit:
    shr bl, 1
    jnc skip
    add [result], al

skip:
    shl al, 1
    dec cl
    jnz checkbit

mov ax, 0x4C00
int 0x21

multiplicand: db 13
multiplier:    db 5
result:        db 0


; simple notes
;shr multiplier
;if(carry){
; add result   
;}
;multiplicand shl