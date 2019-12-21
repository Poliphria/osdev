[org 7c00h]
mov ah, 0eh

mov bx, HELLO_MSG
call print_string

mov bx, GOODBYE_MSG
call print_string

jmp $

%include "print_string.asm"

HELLO_MSG:
    db 'Hello, World!', 0

GOODBYE_MSG:
    db 'Goodbye!', 0 

; Padding and magic nmbr
times 510-($-$$) db 0 
dw 0aa55h
