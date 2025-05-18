[org 0x0100]

mov ax, 0xb800         
mov es,ax    ;we can  not load value directly in es , some reasons so we  use ax 
mov di,0        ; will treated as index on that fixed location 0xb800


nextpos:
    mov word[es:di],0x0720 ; here lsb is x20 that coresponds to space in assci
add di,2                    ;0x07 is black background      
cmp di,4000
jne nextpos

mov ax,0x4c00

int  0x21
