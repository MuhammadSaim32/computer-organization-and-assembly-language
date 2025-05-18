
section .data
    hello:     db 'Hello from ASM!', 10
    helloLen:  equ $-hello

section .text
global say_hi

say_hi:
    mov     rax, rdi         ; save parameter
    push    rax              ; store original value

    ; write(1, hello, helloLen)
    mov     rax, 1           ; syscall number for write
    mov     rdi, 1           ; STDOUT
    mov     rsi, hello       ; acutal message
    mov     rdx, helloLen    ; length
    syscall                  ; make syscall

    pop     rax              ; restore original param
    inc     rax              ; increment
    ret
