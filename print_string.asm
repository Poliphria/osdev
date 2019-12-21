; Prints string. Input is in bx (16-bit only)
print_string: 
    mov ah, 0eh
    pusha

body:
    mov al, [bx] ; bx holds address of first character
    cmp al, 0 ; check if al at null character. if zero flag set to 0 jump out of proc
    je done
    int 10h ; print using interrupt
    inc bx ; go to next byte in bx
    jmp body ; repeat procedure


done:
    mov al, 32 ; print space 
    int 10h
    popa
    ret


