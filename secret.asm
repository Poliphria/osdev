[org 7c00h]

mov ah, 0eh

mov al, [the_secret]
int 10h

jmp $

the_secret: 
db "Hello, world!"

; Padding and magic BIOS number

times 510-($-$$) db 0 
dw 0aa55h
