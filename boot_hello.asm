
mov ah, 0Eh
mov bh, 0 

mov al, 'H'
int 10h
mov al, 'e'
int 10h
mov al, 'l'
int 10h
mov al, 'l'
int 10h
mov al, 'o'
int 10h

jmp $

times 510-($-$$) db 0 

dw 0xaa55
