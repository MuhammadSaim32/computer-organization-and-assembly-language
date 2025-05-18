; -----------------------------------------------
; 📦 Install NASM on Ubuntu: 
; -----------------------------------------------
;   sudo apt install nasm


; -----------------------------------------------
; 🛠️ Assemble the File: 
; -----------------------------------------------
;   nasm -f elf32 -l file.lst -o file.o file.asm 
;   # -f elf32       → 32-bit ELF format (for Linux)
;   # -l file.lst    → Optional listing file for debugging

; 📚 Read more about ELF:
;   https://linux-audit.com/elf-binaries-on-linux-understanding-and-analysis/


; -----------------------------------------------
; 🔗 Link the Object File: 
; -----------------------------------------------
;   ld -m elf_i386 -o file file.o
;   # -m elf_i386 ensures 32-bit linking on 64-bit machines


; -----------------------------------------------
; ▶️ Run the Executable: 
; -----------------------------------------------
;   ./file



; -----------------------------------------------
; 💡 Code Explanation: 
; -----------------------------------------------

; In modern operating systems, programs do not start
; from the first instruction in the file.

; Instead, the loader (ld.so or kernel) looks for a
; special entry point — by default: _start , and
; begins execution from there.

; The `section` directive marks parts of a program
; for the ELF format (or other formats, like PE on Windows).

SECTION .text           ; Code segment (executable instructions)

GLOBAL _start           ; Make _start label globally visible
                        ; This is the entry point of our program
                        ; (you can name it anything but we have to do some work for that, but must mark it global)

_start:
    ; -------------------------------------------
    ; 📤 Write string to console (stdout)
    ; -------------------------------------------
	mov eax, 0x4 				; write syscall is 0x4 
	mov ebx, 1 					; std output should be used 
	mov ecx, message 			; the string to write 
	mov edx, message_length 	; the length of the string 		
	int 0x80 		
    ; -------------------------------------------
    ; 🚪 Exit the program
    ; -------------------------------------------
  	mov eax, 0x1 				; exit system call is 0x1 
	mov ebx, 0 					; exit code is 0 (return 0) 
	int 0x80 					

	; note that int is NOT the right way to do things!   
	; (more on this later)


; -----------------------------------------------
; 🧾 Data Section
; -----------------------------------------------
SECTION .data           ; Data segment (variables)

message: db "Hello! 32bit", 0xA  ; string with newline
message_length: equ $ - message 
                          ; equ = assemble-time constant
                          ; $ is current address, so this computes string length

; 🔄 Equivalent to:
;   message_length equ 7
;   (like a #define in C)


; -----------------------------------------------
; 🕵️ ELF File Inspection (Optional)
; -----------------------------------------------
; readelf -a file.o       → full ELF info
; readelf -h file.o       → ELF header
; readelf -S file.o       → section headers
; readelf -x 2 file.o     → raw hex dump of section #2


; -----------------------------------------------
; 🐞 GDB Debugging Steps
; -----------------------------------------------
; gdb ./file             ; start GDB
; layout regs            ; show registers
; starti                 ; start program instruction-by-instruction
; si                     ; single-step instruction
; info registers         ; view register values manually
; quit                   ; exit GDB
