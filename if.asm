mov bx, 100

cmp bx, 4
ja nextIf
mov al, 'A'
jmp out

nextIf:
cmp bx, 40
jae else
mov al, 'B'
jmp out

else:
mov al, 'C'


out: 
mov ah, 0eh
int 10h

times 510-($-$$) db 0 
dw 0aa55h

